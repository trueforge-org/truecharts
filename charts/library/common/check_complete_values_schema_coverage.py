#!/usr/bin/env python3

import json
from pathlib import Path
from typing import Any

import yaml


BASE_DIR = Path(__file__).resolve().parent
VALUES_FILE = BASE_DIR / "complete-values-structure.yaml"
TEMPLATE_KEYS_FILE = BASE_DIR / "template-keys-structure.yaml"
ROOT_SCHEMA_FILE = BASE_DIR / "values.schema.source.json"


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


# A schema that applies to a values node: (schema, file, required). Branches of allOf and $refs are
# required, so a key they reject is not allowed. Branches of oneOf and anyOf are not.
Branch = tuple[Any, Path, bool]


def gather_branch_schemas(
    schema: Any,
    schema_file: Path,
    required: bool = True,
    seen_refs: frozenset[tuple[Path, str]] = frozenset(),
) -> list[Branch]:
    if not isinstance(schema, dict):
        return []

    branches: list[Branch] = []

    if "$ref" in schema and isinstance(schema["$ref"], str):
        ref_file, ref_schema = resolve_ref(schema_file, schema["$ref"])
        ref_key = (ref_file, schema["$ref"].partition("#")[2])
        # The referenced schema can combine others with allOf, so it is expanded too (once, to not loop on cyclic refs)
        if ref_key in seen_refs:
            branches.append((ref_schema, ref_file, required))
        else:
            branches.extend(gather_branch_schemas(ref_schema, ref_file, required, seen_refs | {ref_key}))

    branches.append((schema, schema_file, required))

    for key in ("allOf", "oneOf", "anyOf"):
        options = schema.get(key)
        if isinstance(options, list):
            for option in options:
                if isinstance(option, dict):
                    branches.extend(
                        gather_branch_schemas(option, schema_file, required and key == "allOf", seen_refs)
                    )

    return branches


def find_child_schema(schemas: list[Branch], key: str) -> tuple[list[Branch], bool]:
    """Returns the schemas that describe the key, and whether a required schema rejects it."""
    candidates: list[Branch] = []
    rejected = False

    for schema, schema_file, required in schemas:
        for branch_schema, branch_file, branch_required in gather_branch_schemas(schema, schema_file, required):
            if not isinstance(branch_schema, dict):
                continue

            props = branch_schema.get("properties")
            if isinstance(props, dict) and key in props:
                if isinstance(props[key], dict):
                    candidates.append((props[key], branch_file, branch_required))
                # additionalProperties only applies to the keys that are not in properties
                continue

            addl = branch_schema.get("additionalProperties")
            if isinstance(addl, dict):
                candidates.append((addl, branch_file, branch_required))
            elif addl is True:
                candidates.append(({"type": "object", "additionalProperties": True}, branch_file, branch_required))
            elif addl is False and branch_required:
                rejected = True

    return candidates, rejected


def find_dynamic_child_schemas(schemas: list[Branch]) -> list[Branch]:
    """Returns the schemas of all keys of an object, for a key that a template computes."""
    candidates: list[Branch] = []

    for schema, schema_file, required in schemas:
        for branch_schema, branch_file, branch_required in gather_branch_schemas(schema, schema_file, required):
            if not isinstance(branch_schema, dict):
                continue
            props = branch_schema.get("properties")
            if isinstance(props, dict):
                candidates.extend((child, branch_file, False) for child in props.values() if isinstance(child, dict))
            addl = branch_schema.get("additionalProperties")
            if isinstance(addl, dict):
                candidates.append((addl, branch_file, False))
            elif addl is True:
                candidates.append(({"type": "object", "additionalProperties": True}, branch_file, False))

    return candidates


# Keys that common sets itself on its copies of the values, which the template key extraction cannot tell apart from values keys
INTERNAL_TEMPLATE_PATHS = {
    "$/ingress/objectName/name",
    "$/service/objectName/ports/objectName/containerPort",
    "$/service/objectName/ports/objectName/serviceName",
    "$/rbac/objectName/dependency",
    "$/serviceAccount/objectName/dependency",
    "$/workload/objectName/dependency",
}

STRUCTURE_KEYWORDS = ("type", "properties", "additionalProperties", "patternProperties", "items", "$ref", "allOf", "oneOf", "anyOf")


def validate_node(
    yaml_node: Any,
    schemas: list[Branch],
    path: str,
    missing: list[str],
    dynamic_key: str | None = None,
) -> None:
    # A schema without any structure (only a description) is a setting that is passed on as is, so anything below it is allowed
    if any(isinstance(schema, dict) and not any(k in schema for k in STRUCTURE_KEYWORDS) for schema, _, _ in schemas):
        return

    if isinstance(yaml_node, dict):
        for key, value in yaml_node.items():
            if not isinstance(key, str):
                continue
            if key == dynamic_key:
                candidates, rejected = find_dynamic_child_schemas(schemas), False
            else:
                candidates, rejected = find_child_schema(schemas, key)
            if rejected or not candidates:
                missing.append(f"{path}/{key}")
                continue
            validate_node(value, candidates, f"{path}/{key}", missing, dynamic_key)
        return

    if isinstance(yaml_node, list):
        item_candidates: list[Branch] = []
        for schema, schema_file, required in schemas:
            for branch_schema, branch_file, branch_required in gather_branch_schemas(schema, schema_file, required):
                if not isinstance(branch_schema, dict):
                    continue
                items = branch_schema.get("items")
                if isinstance(items, dict):
                    item_candidates.append((items, branch_file, branch_required))

        for index, item in enumerate(yaml_node):
            validate_node(item, item_candidates or schemas, f"{path}[{index}]", missing, dynamic_key)


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
    template_keys_data = load_yaml(TEMPLATE_KEYS_FILE)
    root_schema = load_json(ROOT_SCHEMA_FILE)
    missing: list[str] = []
    template_missing: list[str] = []
    key_paths: set[str] = set()
    template_key_paths: set[str] = set()

    # Collect paths from complete-values-structure.yaml
    collect_yaml_key_paths(values_data, "$", key_paths)

    # Collect paths from template-keys-structure.yaml
    collect_yaml_key_paths(template_keys_data, "$", template_key_paths)

    # Validate complete-values-structure against schema
    validate_node(values_data, [(root_schema, ROOT_SCHEMA_FILE, True)], "$", missing)

    # Validate template-keys-structure against schema
    # In template-keys-structure.yaml, objectName stands for a key that a template computes (eg with get)
    validate_node(template_keys_data, [(root_schema, ROOT_SCHEMA_FILE, True)], "$", template_missing, "objectName")
    template_missing = [p for p in template_missing if p not in INTERNAL_TEMPLATE_PATHS]

    # Calculate coverage for complete-values-structure
    unique_missing = sorted(set(missing))
    total_paths = len(key_paths)
    missing_count = len(unique_missing)
    covered_count = total_paths - missing_count
    coverage_percent = (covered_count / total_paths * 100.0) if total_paths else 100.0

    # Calculate coverage for template-keys-structure
    unique_template_missing = sorted(set(template_missing))
    total_template_paths = len(template_key_paths)
    missing_template_count = len(unique_template_missing)
    covered_template_count = total_template_paths - missing_template_count
    template_coverage_percent = (
        (covered_template_count / total_template_paths * 100.0) if total_template_paths else 100.0
    )

    print("=" * 80)
    print("COVERAGE: complete-values-structure.yaml")
    print("=" * 80)
    print(f"TOTAL_PATHS {total_paths}")
    print(f"COVERED_PATHS {covered_count}")
    print(f"MISSING_PATHS {len(unique_missing)}")
    print(f"COVERAGE_PERCENT {coverage_percent:.2f}")

    if unique_missing:
        print("\nUNCOVERED_PATHS")
        for item in unique_missing[:50]:  # Limit to first 50
            print(item)
        if len(unique_missing) > 50:
            print(f"... and {len(unique_missing) - 50} more")

    print("\n" + "=" * 80)
    print("COVERAGE: template-keys-structure.yaml (keys used by templates)")
    print("=" * 80)
    print(f"TOTAL_PATHS {total_template_paths}")
    print(f"COVERED_PATHS {covered_template_count}")
    print(f"MISSING_PATHS {len(unique_template_missing)}")
    print(f"COVERAGE_PERCENT {template_coverage_percent:.2f}")

    if unique_template_missing:
        print("\nUNCOVERED_TEMPLATE_PATHS")
        for item in unique_template_missing[:50]:  # Limit to first 50
            print(item)
        if len(unique_template_missing) > 50:
            print(f"... and {len(unique_template_missing) - 50} more")

    # Return 1 if either validation found missing paths
    return 1 if (unique_missing or unique_template_missing) else 0


if __name__ == "__main__":
    raise SystemExit(main())
