#!/usr/bin/env python3

import argparse
import json
import shutil
import subprocess
import sys
from pathlib import Path
from urllib.parse import urldefrag


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
        "--common-test-ci-dir",
        type=Path,
        default=repo_root / "charts" / "library" / "common-test" / "ci",
        help="Path to common-test CI values files directory",
    )
    parser.add_argument(
        "--fail-fast",
        action="store_true",
        help="Stop after first chart that fails validation",
    )
    parser.add_argument(
        "--max-failures",
        type=int,
        default=0,
        help="Stop after this many failures (0 means no limit)",
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
    parser.add_argument(
        "--no-local-id-override",
        action="store_true",
        help=(
            "Do not temporarily override values.schema.json $id to a local file:// URI "
            "during linting"
        ),
    )
    return parser


def check_helm_available(helm_bin: str) -> bool:
    return shutil.which(helm_bin) is not None


def _collect_self_ref_errors(node: object, json_file: Path, errors: list[str]) -> None:
    if isinstance(node, dict):
        for key, value in node.items():
            if key == "$ref" and isinstance(value, str):
                if value.startswith(("http://", "https://", "file://", "#")):
                    continue
                ref_path, _ = urldefrag(value)
                if not ref_path:
                    continue
                resolved = (json_file.parent / ref_path).resolve()
                if resolved == json_file.resolve():
                    errors.append(f"{json_file}: self-referencing $ref '{value}'")
            else:
                _collect_self_ref_errors(value, json_file, errors)
        return

    if isinstance(node, list):
        for item in node:
            _collect_self_ref_errors(item, json_file, errors)


def find_self_referencing_refs(common_chart_dir: Path) -> list[str]:
    json_files = [
        common_chart_dir / "values.schema.json",
        *common_chart_dir.glob("schemas/**/*.json"),
    ]

    errors: list[str] = []
    for json_file in json_files:
        if not json_file.exists():
            continue
        try:
            content = json_file.read_text(encoding="utf-8")
        except OSError as exc:
            errors.append(f"{json_file}: unable to read file ({exc})")
            continue

        try:
            parsed = json.loads(content)
        except ValueError as exc:
            errors.append(f"{json_file}: invalid JSON ({exc})")
            continue

        _collect_self_ref_errors(parsed, json_file, errors)

    return errors


def override_values_schema_id_for_lint(values_schema_path: Path) -> str:
    original_content = values_schema_path.read_text(encoding="utf-8")
    parsed = json.loads(original_content)
    if not isinstance(parsed, dict):
        raise ValueError(f"Schema root must be an object: {values_schema_path}")

    parsed["$id"] = values_schema_path.resolve().as_uri()
    rewritten_content = json.dumps(parsed, indent=2) + "\n"
    if rewritten_content != original_content:
        values_schema_path.write_text(rewritten_content, encoding="utf-8")

    return original_content


def validate_values_file_with_helm(
    values_path: Path,
    common_chart_dir: Path,
    helm_bin: str,
) -> tuple[bool, list[str]]:
    if not values_path.exists():
        return False, [f"values file missing: {values_path}"]

    command = [
        helm_bin,
        "lint",
        str(common_chart_dir),
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
    common_test_ci_dir = args.common_test_ci_dir.resolve()
    output_file = args.output_file.resolve()
    output_file.parent.mkdir(parents=True, exist_ok=True)
    output_file.write_text("", encoding="utf-8")

    if not common_chart_dir.exists():
        emit(f"Common chart directory not found: {common_chart_dir}", output_file)
        return 2

    if not stable_dir.exists():
        emit(f"Stable charts directory not found: {stable_dir}", output_file)
        return 2

    if not common_test_ci_dir.exists():
        emit(f"Common-test CI directory not found: {common_test_ci_dir}", output_file)
        return 2

    if not check_helm_available(args.helm_bin):
        emit(f"Helm binary not found: {args.helm_bin}", output_file)
        emit("Install helm: https://helm.sh/docs/intro/install/", output_file)
        return 2

    if not (common_chart_dir / "values.schema.json").exists():
        emit(f"values.schema.json not found in common chart directory: {common_chart_dir}", output_file)
        return 2

    self_ref_errors = find_self_referencing_refs(common_chart_dir)
    if self_ref_errors:
        emit("Detected self-referencing $ref entries in common schema files:", output_file)
        for error in self_ref_errors:
            emit(f"- {error}", output_file)
        return 2

    emit(f"Writing output to: {output_file}", output_file)

    values_schema_path = common_chart_dir / "values.schema.json"
    original_schema_content: str | None = None
    if not args.no_local_id_override:
        try:
            original_schema_content = override_values_schema_id_for_lint(values_schema_path)
        except (OSError, ValueError, json.JSONDecodeError) as exc:
            emit(f"Failed to override values.schema.json $id for local linting: {exc}", output_file)
            return 2

    try:
        stable_values_files = sorted(
            chart_dir / "values.yaml"
            for chart_dir in stable_dir.iterdir()
            if chart_dir.is_dir() and (chart_dir / "values.yaml").exists()
        )
        common_test_values_files = sorted(common_test_ci_dir.glob("*values.yaml"))

        if not stable_values_files and not common_test_values_files:
            emit(
                f"No values files found in: {stable_dir} or {common_test_ci_dir}",
                output_file,
            )
            return 2

        emit(
            (
                "Validation targets: "
                f"{len(stable_values_files)} stable values files + "
                f"{len(common_test_values_files)} common-test CI values files"
            ),
            output_file,
        )

        validation_targets: list[tuple[str, Path]] = []
        validation_targets.extend(
            (f"stable/{values_file.parent.name}", values_file)
            for values_file in stable_values_files
        )
        validation_targets.extend(
            (f"common-test/ci/{values_file.name}", values_file)
            for values_file in common_test_values_files
        )

        total = 0
        failed = 0
        failed_targets: list[str] = []
        stopped_early = False

        for target_name, values_file in validation_targets:
            total += 1
            valid, output_lines = validate_values_file_with_helm(
                values_file,
                common_chart_dir,
                args.helm_bin,
            )
            if not valid:
                failed += 1
                failed_targets.append(target_name)
                emit(f"❌ {target_name}", output_file)
                for line in output_lines or ["helm lint failed with no output"]:
                    emit(f"   - {line}", output_file)
                if args.fail_fast:
                    stopped_early = True
                    break
                if args.max_failures > 0 and failed >= args.max_failures:
                    emit(
                        f"Stopping after reaching max failures: {args.max_failures}",
                        output_file,
                    )
                    stopped_early = True
                    break
            elif args.show_passing:
                emit(f"✅ {target_name}", output_file)

        passed = total - failed
        emit("", output_file)
        emit("Summary", output_file)
        emit(f"- Total charts checked: {total}", output_file)
        emit(f"- Passed: {passed}", output_file)
        emit(f"- Failed: {failed}", output_file)
        if stopped_early:
            emit("- Stopped early: yes", output_file)
        if failed_targets:
            emit("- Failed targets:", output_file)
            for target_name in failed_targets:
                emit(f"  - {target_name}", output_file)

        return 1 if failed else 0
    finally:
        if original_schema_content is not None:
            try:
                values_schema_path.write_text(original_schema_content, encoding="utf-8")
            except OSError as exc:
                emit(f"Warning: failed to restore original values.schema.json content: {exc}", output_file)


if __name__ == "__main__":
    raise SystemExit(main())
