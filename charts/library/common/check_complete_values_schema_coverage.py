#!/usr/bin/env python3

import json
from pathlib import Path
from typing import Any

import yaml


BASE_DIR = Path(__file__).resolve().parent
VALUES_FILE = BASE_DIR / "complete-values-structure.yaml"
ROOT_SCHEMA_FILE = BASE_DIR / "values.schema.json"


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def load_yaml(path: Path) -> Any:
    return yaml.safe_load(path.read_text(encoding="utf-8"))


def resolve_ref(current_file: Path, ref: str) -> tuple[Path, Any]:
    file_part, _, pointer = ref.partition("#")
    if file_part:
        target_file = (current_file.parent / file_part).resolve()
    else:
        target_file = current_file.resolve()

    target_schema = load_json(target_file)

    if pointer:
        node: Any = target_schema
        for part in pointer.lstrip("/").split("/"):
            part = part.replace("~1", "/").replace("~0", "~")
            if isinstance(node, list):
                node = node[int(part)]
            else:
                node = node.get(part)
        target_schema = node

    return target_file, target_schema


def gather_branch_schemas(schema: Any, schema_file: Path) -> list[tuple[Any, Path]]:
    if not isinstance(schema, dict):
        return []

    branches: list[tuple[Any, Path]] = []

    if "$ref" in schema and isinstance(schema["$ref"], str):
        ref_file, ref_schema = resolve_ref(schema_file, schema["$ref"])
        branches.append((ref_schema, ref_file))

    branches.append((schema, schema_file))

    for key in ("allOf", "oneOf", "anyOf"):
        options = schema.get(key)
        if isinstance(options, list):
            for option in options:
                if isinstance(option, dict):
                    branches.extend(gather_branch_schemas(option, schema_file))

    return branches


def find_child_schema(
    parent_schema: Any,
    parent_file: Path,
    key: str,
) -> list[tuple[Any, Path]]:
    candidates: list[tuple[Any, Path]] = []

    for branch_schema, branch_file in gather_branch_schemas(parent_schema, parent_file):
        if not isinstance(branch_schema, dict):
            continue

        props = branch_schema.get("properties")
        if isinstance(props, dict) and key in props and isinstance(props[key], dict):
            candidates.append((props[key], branch_file))

        addl = branch_schema.get("additionalProperties")
        if isinstance(addl, dict):
            candidates.append((addl, branch_file))
        elif addl is True:
            candidates.append(({"type": "object", "additionalProperties": True}, branch_file))

    return candidates


def validate_node(
    yaml_node: Any,
    schema: Any,
    schema_file: Path,
    path: str,
    missing: list[str],
) -> None:
    if isinstance(yaml_node, dict):
        for key, value in yaml_node.items():
            if not isinstance(key, str):
                continue
            candidates = find_child_schema(schema, schema_file, key)
            if not candidates:
                missing.append(f"{path}/{key}")
                continue
            for next_schema, next_file in candidates:
                validate_node(value, next_schema, next_file, f"{path}/{key}", missing)
        return

    if isinstance(yaml_node, list):
        item_candidates: list[tuple[Any, Path]] = []
        for branch_schema, branch_file in gather_branch_schemas(schema, schema_file):
            if not isinstance(branch_schema, dict):
                continue
            items = branch_schema.get("items")
            if isinstance(items, dict):
                item_candidates.append((items, branch_file))

        for index, item in enumerate(yaml_node):
            if item_candidates:
                for next_schema, next_file in item_candidates:
                    validate_node(item, next_schema, next_file, f"{path}[{index}]", missing)
            else:
                validate_node(item, schema, schema_file, f"{path}[{index}]", missing)


def collect_yaml_key_paths(yaml_node: Any, path: str, paths: set[str]) -> None:
    if isinstance(yaml_node, dict):
        for key, value in yaml_node.items():
            if not isinstance(key, str):
                continue
            child_path = f"{path}/{key}"
            paths.add(child_path)
            collect_yaml_key_paths(value, child_path, paths)
        return

    if isinstance(yaml_node, list):
        for index, item in enumerate(yaml_node):
            collect_yaml_key_paths(item, f"{path}[{index}]", paths)


def main() -> int:
    values_data = load_yaml(VALUES_FILE)
    root_schema = load_json(ROOT_SCHEMA_FILE)
    missing: list[str] = []
    key_paths: set[str] = set()

    collect_yaml_key_paths(values_data, "$", key_paths)

    validate_node(values_data, root_schema, ROOT_SCHEMA_FILE, "$", missing)

    unique_missing = sorted(set(missing))
    total_paths = len(key_paths)
    missing_count = len(unique_missing)
    covered_count = total_paths - missing_count
    coverage_percent = (covered_count / total_paths * 100.0) if total_paths else 100.0

    print(f"TOTAL_PATHS {total_paths}")
    print(f"COVERED_PATHS {covered_count}")
    print(f"MISSING_PATHS {len(unique_missing)}")
    print(f"COVERAGE_PERCENT {coverage_percent:.2f}")

    print("UNCOVERED_PATHS")
    for item in unique_missing:
        print(item)

    return 1 if unique_missing else 0


if __name__ == "__main__":
    raise SystemExit(main())
