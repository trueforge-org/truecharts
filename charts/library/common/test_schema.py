#!/usr/bin/env python3

import argparse
import json
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path
from urllib.parse import urlparse


RUNNER_COMMON_PREFIX = "file:///home/runner/work/truecharts/truecharts/charts/library/common"


def build_parser() -> argparse.ArgumentParser:
    common_dir = Path(__file__).resolve().parent
    repo_root = common_dir.parents[2]

    parser = argparse.ArgumentParser(
        description=(
            "Validate charts/stable/*/values.yaml against common values.schema.json using helm lint"
        )
    )
    parser.add_argument(
        "--common-chart",
        type=Path,
        default=common_dir,
        help="Path to the common chart directory (default: charts/library/common)",
    )
    parser.add_argument(
        "--stable-dir",
        type=Path,
        default=repo_root / "charts" / "stable",
        help="Path to the stable charts directory",
    )
    parser.add_argument(
        "--fail-fast",
        action="store_true",
        help="Stop after first chart that fails validation",
    )
    parser.add_argument(
        "--helm-bin",
        default="helm",
        help="Helm binary to execute",
    )
    parser.add_argument(
        "--show-passing",
        action="store_true",
        help="Print passing charts in addition to failures",
    )
    parser.add_argument(
        "--output-file",
        type=Path,
        default=Path("stable_schema_validation.log"),
        help="File path to also write output logs to",
    )
    return parser


def check_helm_available(helm_bin: str) -> bool:
    return shutil.which(helm_bin) is not None


def normalize_ref(ref: str, common_chart_dir: Path, json_file_path: Path) -> str:
    if ref.startswith(RUNNER_COMMON_PREFIX):
        suffix = ref.removeprefix(RUNNER_COMMON_PREFIX).lstrip("/")
        return (common_chart_dir / suffix).resolve().as_uri()

    if ref.startswith("file://"):
        parsed = urlparse(ref)
        ref_path = Path(parsed.path)
        marker = "/charts/library/common/"
        as_posix = ref_path.as_posix()
        if marker in as_posix:
            suffix = as_posix.split(marker, 1)[1].lstrip("/")
            return (common_chart_dir / suffix).resolve().as_uri()
        return ref

    candidate = (json_file_path.parent / ref).resolve()
    if candidate.exists():
        return candidate.as_uri()

    return ref


def rewrite_refs(node: object, common_chart_dir: Path, json_file_path: Path) -> object:
    if isinstance(node, dict):
        rewritten: dict[str, object] = {}
        for key, value in node.items():
            if key == "$ref" and isinstance(value, str):
                rewritten[key] = normalize_ref(value, common_chart_dir, json_file_path)
            else:
                rewritten[key] = rewrite_refs(value, common_chart_dir, json_file_path)
        return rewritten

    if isinstance(node, list):
        return [rewrite_refs(item, common_chart_dir, json_file_path) for item in node]

    return node


def prepare_common_chart_for_local_refs(common_chart_dir: Path, temp_dir: Path) -> Path:
    prepared_chart_dir = temp_dir / "common"
    shutil.copytree(common_chart_dir, prepared_chart_dir)

    json_files = [
        prepared_chart_dir / "values.schema.json",
        *prepared_chart_dir.glob("schemas/**/*.json"),
    ]

    for json_file in json_files:
        if not json_file.exists():
            continue
        with json_file.open("r", encoding="utf-8") as file:
            content = json.load(file)
        rewritten = rewrite_refs(content, prepared_chart_dir, json_file)
        with json_file.open("w", encoding="utf-8") as file:
            json.dump(rewritten, file, indent=2)
            file.write("\n")

    return prepared_chart_dir


def validate_chart_values_with_helm(
    chart_dir: Path,
    prepared_common_chart_dir: Path,
    helm_bin: str,
) -> tuple[bool, list[str]]:
    values_path = chart_dir / "values.yaml"
    if not values_path.exists():
        return False, ["values.yaml missing"]

    command = [
        helm_bin,
        "lint",
        str(prepared_common_chart_dir),
        "-f",
        str(values_path),
        "--quiet",
    ]

    result = subprocess.run(
        command,
        text=True,
        capture_output=True,
        check=False,
    )

    output_lines = [
        line.rstrip()
        for line in (result.stdout.splitlines() + result.stderr.splitlines())
        if line.strip()
    ]

    return result.returncode == 0, output_lines


def emit(message: str, log_file: Path) -> None:
    print(message)
    with log_file.open("a", encoding="utf-8") as file:
        file.write(f"{message}\n")


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()

    common_chart_dir = args.common_chart.resolve()
    stable_dir = args.stable_dir.resolve()
    output_file = args.output_file.resolve()
    output_file.parent.mkdir(parents=True, exist_ok=True)
    output_file.write_text("", encoding="utf-8")

    if not common_chart_dir.exists():
        emit(f"Common chart directory not found: {common_chart_dir}", output_file)
        return 2

    if not stable_dir.exists():
        emit(f"Stable charts directory not found: {stable_dir}", output_file)
        return 2

    if not check_helm_available(args.helm_bin):
        emit(f"Helm binary not found: {args.helm_bin}", output_file)
        emit("Install helm: https://helm.sh/docs/intro/install/", output_file)
        return 2

    if not (common_chart_dir / "values.schema.json").exists():
        emit(f"values.schema.json not found in common chart directory: {common_chart_dir}", output_file)
        return 2

    emit(f"Writing output to: {output_file}", output_file)

    with tempfile.TemporaryDirectory(prefix="common-schema-lint-") as temp_path:
        prepared_common_chart_dir = prepare_common_chart_for_local_refs(
            common_chart_dir,
            Path(temp_path),
        )

        chart_dirs = sorted(path for path in stable_dir.iterdir() if path.is_dir())
        if not chart_dirs:
            emit(f"No chart directories found in: {stable_dir}", output_file)
            return 2

        total = 0
        failed = 0
        failed_charts: list[str] = []

        for chart_dir in chart_dirs:
            total += 1
            valid, output_lines = validate_chart_values_with_helm(
                chart_dir,
                prepared_common_chart_dir,
                args.helm_bin,
            )
            if not valid:
                failed += 1
                failed_charts.append(chart_dir.name)
                emit(f"❌ {chart_dir.name}", output_file)
                for line in output_lines or ["helm lint failed with no output"]:
                    emit(f"   - {line}", output_file)
                if args.fail_fast:
                    break
            elif args.show_passing:
                emit(f"✅ {chart_dir.name}", output_file)

        passed = total - failed
        emit("", output_file)
        emit("Summary", output_file)
        emit(f"- Total charts checked: {total}", output_file)
        emit(f"- Passed: {passed}", output_file)
        emit(f"- Failed: {failed}", output_file)
        if failed_charts:
            emit("- Failed charts:", output_file)
            for chart_name in failed_charts:
                emit(f"  - {chart_name}", output_file)

        return 1 if failed else 0


if __name__ == "__main__":
    raise SystemExit(main())
