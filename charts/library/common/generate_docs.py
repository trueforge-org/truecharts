#!/usr/bin/env python3

import argparse
import copy
import json
import os
import re
import shutil
import subprocess
from pathlib import Path
from typing import Any, Iterable


def build_parser() -> argparse.ArgumentParser:
    script_dir = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(
        description=(
            "Generate markdown pages from a JSON schema into charts/library/common/docs."
        )
    )
    parser.add_argument(
        "--schema",
        type=Path,
        default=script_dir / "values.schema.json",
        help="Path to the source JSON schema (default: charts/library/common/values.schema.json)",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=script_dir / "docs",
        help="Path where generated pages should be written",
    )
    parser.add_argument(
        "--base-url",
        default="/truecharts-common",
        help="Base URL used in generated note links",
    )
    parser.add_argument(
        "--max-depth",
        type=int,
        default=4,
        help="Maximum nested property depth rendered per page",
    )
    parser.add_argument(
        "--dynamic-segment",
        default="name",
        help="Folder name to use for dynamic object keys like $name",
    )
    parser.add_argument(
        "--schemas-root",
        type=Path,
        default=script_dir / "schemas",
        help="Path to the schemas root folder used for deriving page paths from $ref targets",
    )
    parser.add_argument(
        "--examples-root",
        type=Path,
        default=script_dir / "examples",
        help="Path to markdown snippets containing Full Examples sections, mirroring generated page paths",
    )
    parser.add_argument(
        "--clean",
        action="store_true",
        help="Remove output directory before generation",
    )
    parser.add_argument(
        "--no-verify-structure",
        action="store_true",
        help="Skip verifying generated page structure against schemas",
    )
    parser.add_argument(
        "--no-verify-formatting",
        action="store_true",
        help="Skip verifying generated markdown formatting",
    )
    return parser


def load_schema(path: Path) -> dict[str, Any]:
    if not path.exists():
        raise FileNotFoundError(f"Schema not found: {path}")
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def ref_to_path(ref: str, current_file: Path | None) -> Path | None:
    if not ref:
        return None

    ref_base = ref.split("#", 1)[0]
    if not ref_base:
        return current_file

    if ref_base.startswith("file://"):
        return Path(ref_base[7:]).resolve()

    candidate = Path(ref_base)
    if candidate.is_absolute():
        return candidate.resolve()

    if current_file is None:
        return None

    return (current_file.parent / candidate).resolve()


def ref_to_doc_segments(ref_path: Path | None, schemas_root: Path) -> tuple[str, ...] | None:
    if ref_path is None:
        return None

    try:
        relative = ref_path.resolve().relative_to(schemas_root.resolve())
    except ValueError:
        return None

    parts = list(relative.parts)
    if not parts:
        return None

    last = Path(parts[-1]).stem
    dir_parts = parts[:-1]

    if last == "index":
        return tuple(dir_parts)
    return tuple([*dir_parts, last])


class SchemaResolver:
    def __init__(self, schemas_root: Path) -> None:
        self.schemas_root = schemas_root.resolve()
        self._cache: dict[Path, dict[str, Any]] = {}

    def _remap_to_local_schema_path(self, path: Path) -> Path:
        if path.exists():
            return path

        normalized = path.as_posix()
        marker = "/charts/library/common/schemas/"
        if marker in normalized:
            tail = normalized.split(marker, 1)[1]
            candidate = self.schemas_root / tail
            if candidate.exists():
                return candidate.resolve()

        marker = "/schemas/"
        if marker in normalized:
            tail = normalized.split(marker, 1)[1]
            candidate = self.schemas_root / tail
            if candidate.exists():
                return candidate.resolve()

        return path

    def _load(self, path: Path) -> dict[str, Any]:
        resolved = self._remap_to_local_schema_path(path).resolve()
        if resolved not in self._cache:
            self._cache[resolved] = load_schema(resolved)
        return self._cache[resolved]

    def resolve_node(
        self,
        node: dict[str, Any],
        current_file: Path | None,
    ) -> tuple[dict[str, Any], Path | None, Path | None]:
        ref = node.get("$ref")
        if not isinstance(ref, str):
            return node, current_file, None

        ref_path = ref_to_path(ref, current_file)
        if ref_path is None:
            return node, current_file, None

        resolved_ref_path = self._remap_to_local_schema_path(ref_path).resolve()

        base_schema = self._load(resolved_ref_path)
        resolved_base, source_path, _ = self.resolve_node(base_schema, resolved_ref_path)

        merged = copy.deepcopy(resolved_base)
        for key, value in node.items():
            if key == "$ref":
                continue
            merged[key] = value
        return merged, source_path or resolved_ref_path, resolved_ref_path


def prettify_segment(segment: str) -> str:
    cleaned = segment.strip()
    if cleaned == "$name":
        return "Name"
    cleaned = cleaned.replace("_", " ").replace("-", " ")
    return " ".join(part.capitalize() for part in cleaned.split()) or "Section"


def sanitize_segment(segment: str, dynamic_segment: str) -> str:
    if segment == "$name":
        return dynamic_segment
    safe = re.sub(r"[^a-zA-Z0-9._-]", "-", segment).strip("-")
    return safe or "section"


def is_object_schema(node: dict[str, Any]) -> bool:
    raw_type = node.get("type")
    if raw_type == "object":
        return True
    if isinstance(raw_type, list) and "object" in raw_type:
        return True
    return any(k in node for k in ("properties", "patternProperties", "additionalProperties"))


def iter_schema_variants(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
    depth: int = 0,
    max_depth: int = 8,
    seen_refs: set[str] | None = None,
) -> Iterable[tuple[dict[str, Any], Path | None]]:
    yield node, current_source

    if depth >= max_depth:
        return

    for union_key in ("allOf", "oneOf", "anyOf"):
        options = node.get(union_key)
        if not isinstance(options, list):
            continue

        for option in options:
            if not isinstance(option, dict):
                continue

            option_node = option
            option_source = current_source
            ref_marker: str | None = None

            if resolver is not None:
                option_node, option_source, option_ref = resolver.resolve_node(option, current_source)
                if option_ref is not None:
                    ref_marker = str(option_ref.resolve())

            next_seen = set(seen_refs or set())
            if ref_marker:
                if ref_marker in next_seen:
                    continue
                next_seen.add(ref_marker)

            yield from iter_schema_variants(
                option_node,
                resolver=resolver,
                current_source=option_source,
                depth=depth + 1,
                max_depth=max_depth,
                seen_refs=next_seen,
            )


def schema_type(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> str:
    def normalize_type_name(type_name: str) -> str:
        if type_name == "object":
            return "map"
        if type_name == "array":
            return "list"
        return type_name

    ordered_types: list[str] = []
    seen_types: set[str] = set()

    def add_type(type_name: str) -> None:
        normalized = normalize_type_name(type_name)
        if normalized not in seen_types:
            seen_types.add(normalized)
            ordered_types.append(normalized)

    def infer_type_from_value(value: Any) -> str:
        if value is None:
            return "null"
        if isinstance(value, bool):
            return "boolean"
        if isinstance(value, int) and not isinstance(value, bool):
            return "integer"
        if isinstance(value, float):
            return "number"
        if isinstance(value, str):
            return "string"
        if isinstance(value, list):
            return "list"
        if isinstance(value, dict):
            return "map"
        return "unknown"

    for variant, variant_source in iter_schema_variants(
        node,
        resolver=resolver,
        current_source=current_source,
    ):
        raw_type = variant.get("type")
        if isinstance(raw_type, list):
            for item in raw_type:
                if isinstance(item, str):
                    add_type(item)
            continue

        if isinstance(raw_type, str):
            if raw_type == "array":
                items = variant.get("items")
                item_type = "unknown"
                if isinstance(items, dict):
                    item_type = schema_type(items, resolver=resolver, current_source=variant_source)
                add_type(f"list of {item_type}")
            else:
                add_type(raw_type)
            continue

        if "const" in variant:
            add_type(infer_type_from_value(variant["const"]))

        enum_values = variant.get("enum")
        if isinstance(enum_values, list) and enum_values:
            for enum_value in enum_values:
                add_type(infer_type_from_value(enum_value))

        if any(k in variant for k in ("properties", "patternProperties", "additionalProperties")):
            add_type("map")

    if ordered_types:
        return ", ".join(ordered_types)

    return "unknown"


def schema_required_keys(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> set[str]:
    required: set[str] = set()

    for variant, _ in iter_schema_variants(node, resolver=resolver, current_source=current_source):
        direct_required = variant.get("required")
        if isinstance(direct_required, list):
            required.update(key for key in direct_required if isinstance(key, str))

    return required


def schema_default_value(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> Any:
    for variant, _ in iter_schema_variants(node, resolver=resolver, current_source=current_source):
        if "default" in variant:
            return variant["default"]

    return None


def schema_enum_values(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> list[Any]:
    values: list[Any] = []
    seen: set[str] = set()

    def collect_enum_items(items: list[Any]) -> None:
        for item in items:
            marker = json.dumps(item, sort_keys=True, ensure_ascii=False)
            if marker in seen:
                continue
            seen.add(marker)
            values.append(item)

    for variant, _ in iter_schema_variants(node, resolver=resolver, current_source=current_source):
        enum_values = variant.get("enum")
        if isinstance(enum_values, list):
            collect_enum_items(enum_values)

    return values


def schema_min_length(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> int | None:
    values: list[int] = []
    for variant, _ in iter_schema_variants(node, resolver=resolver, current_source=current_source):
        value = variant.get("minLength")
        if isinstance(value, int):
            values.append(value)

    if not values:
        return None
    return max(values)


def schema_minimum(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> int | float | None:
    values: list[int | float] = []
    for variant, _ in iter_schema_variants(node, resolver=resolver, current_source=current_source):
        value = variant.get("minimum")
        if isinstance(value, (int, float)) and not isinstance(value, bool):
            values.append(value)

    if not values:
        return None
    return max(values)


def schema_max_length(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> int | None:
    values: list[int] = []
    for variant, _ in iter_schema_variants(node, resolver=resolver, current_source=current_source):
        value = variant.get("maxLength")
        if isinstance(value, int):
            values.append(value)

    if not values:
        return None
    return min(values)


def schema_maximum(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> int | float | None:
    values: list[int | float] = []
    for variant, _ in iter_schema_variants(node, resolver=resolver, current_source=current_source):
        value = variant.get("maximum")
        if isinstance(value, (int, float)) and not isinstance(value, bool):
            values.append(value)

    if not values:
        return None
    return min(values)


def enum_to_inline_text(values: list[Any]) -> str:
    rendered = [f"`{json.dumps(item, ensure_ascii=False).strip('"')}`" for item in values]
    joined = ", ".join(rendered)
    if len(joined) > 160:
        return f"{len(values)} values"
    return joined


def value_to_inline_json(value: Any) -> str:
    if value is None:
        return "unset"
    text = json.dumps(value, ensure_ascii=False)
    if len(text) > 120:
        return "See schema"
    return f"`{text}`"


def find_child_node(node: dict[str, Any], segment: str) -> dict[str, Any] | None:
    properties = node.get("properties")
    if isinstance(properties, dict) and segment in properties and isinstance(properties[segment], dict):
        return properties[segment]

    pattern_properties = node.get("patternProperties")
    if isinstance(pattern_properties, dict) and pattern_properties:
        first_pattern = next(iter(pattern_properties.values()))
        if isinstance(first_pattern, dict):
            return first_pattern

    additional_properties = node.get("additionalProperties")
    if isinstance(additional_properties, dict):
        return additional_properties

    if segment.startswith("$") and isinstance(properties, dict) and len(properties) == 1:
        only = next(iter(properties.values()))
        if isinstance(only, dict):
            return only

    return None


def schema_path(path_segments: list[str]) -> str:
    if not path_segments:
        return ".Values"
    return f".Values.{'.'.join(path_segments)}"


def yaml_scalar(value: Any) -> str:
    if isinstance(value, bool):
        return "true" if value else "false"
    if value is None:
        return "null"
    if isinstance(value, (int, float)):
        return str(value)
    if isinstance(value, str):
        if not value:
            return '""'
        if re.search(r"[:#\-\n\t]|^\s|\s$", value):
            return json.dumps(value)
        return value
    return json.dumps(value, ensure_ascii=False)


def yaml_lines(value: Any, indent: int = 0) -> list[str]:
    prefix = " " * indent
    if isinstance(value, dict):
        if not value:
            return [prefix + "{}"]
        lines: list[str] = []
        for key, item in value.items():
            if isinstance(item, (dict, list)):
                lines.append(f"{prefix}{key}:")
                lines.extend(yaml_lines(item, indent + 2))
            else:
                lines.append(f"{prefix}{key}: {yaml_scalar(item)}")
        return lines

    if isinstance(value, list):
        if not value:
            return [prefix + "[]"]
        lines = []
        for item in value:
            if isinstance(item, (dict, list)):
                lines.append(prefix + "-")
                lines.extend(yaml_lines(item, indent + 2))
            else:
                lines.append(f"{prefix}- {yaml_scalar(item)}")
        return lines

    return [prefix + yaml_scalar(value)]


def explicit_example_value(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> Any:
    examples = node.get("examples")
    if isinstance(examples, list) and examples:
        return examples[0]
    return schema_default_value(node, resolver=resolver, current_source=current_source)


def build_example_block(key_path: str, value: Any) -> str:
    segments = [part for part in key_path.split(".") if part]
    nested: Any = value

    for segment in reversed(segments):
        nested = {segment: nested}

    return "\n".join(yaml_lines(nested))


def helm_tpl_flag(node: dict[str, Any]) -> str:
    value = (
        node.get("x-helm-tpl")
        if "x-helm-tpl" in node
        else node.get("helmTpl", node.get("x-tpl", False))
    )
    return "✅" if value else "❌"


def sanitize_description_markdown(text: str) -> str:
    sanitized = re.sub(
        r"\[(?:here|this|link)\]\(([^)]+)\)",
        r"[documentation](\1)",
        text,
        flags=re.IGNORECASE,
    )
    sanitized = re.sub(r"\[([^\]]+)\]\(#([^)]+)\)", r"\1", sanitized)
    return sanitized


def render_pretty_table(rows: list[tuple[str, str]]) -> list[str]:
    header = ("Field", "Value")
    all_rows = [header, *rows]

    col_widths = [
        max(len(row[0]) for row in all_rows),
        max(len(row[1]) for row in all_rows),
    ]

    def fmt_cell(value: str, width: int) -> str:
        padded = value.ljust(width)
        if value in {"✅", "❌"} and padded.endswith(" "):
            return padded[:-1]
        return padded

    def fmt_row(row: tuple[str, str]) -> str:
        return f"| {fmt_cell(row[0], col_widths[0])} | {fmt_cell(row[1], col_widths[1])} |"

    delimiter = f"| {'-' * max(3, col_widths[0])} | {'-' * max(3, col_widths[1])} |"
    return [fmt_row(header), delimiter, *[fmt_row(row) for row in rows]]


def render_property_section(
    node: dict[str, Any],
    key_path: str,
    heading_level: int,
    required: bool,
    reference_link: tuple[str, str] | None = None,
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> str:
    heading = "#" * max(2, min(6, heading_level))
    raw_description = node.get("description") or "No description provided."
    description = sanitize_description_markdown(raw_description)
    type_text = schema_type(node, resolver=resolver, current_source=current_source)
    default_value = schema_default_value(node, resolver=resolver, current_source=current_source)
    default_text = value_to_inline_json(default_value)
    enum_values = schema_enum_values(node, resolver=resolver, current_source=current_source)
    min_length = schema_min_length(node, resolver=resolver, current_source=current_source)
    minimum = schema_minimum(node, resolver=resolver, current_source=current_source)
    max_length = schema_max_length(node, resolver=resolver, current_source=current_source)
    maximum = schema_maximum(node, resolver=resolver, current_source=current_source)

    table_rows: list[tuple[str, str]] = [
        ("Key", f"`{key_path}`"),
        ("Type", f"`{type_text}`"),
        ("Required", "✅" if required else "❌"),
        ("Helm `tpl`", helm_tpl_flag(node)),
        ("Default", default_text),
    ]

    if enum_values:
        table_rows.append(("Enum", enum_to_inline_text(enum_values)))

    if min_length is not None:
        table_rows.append(("Min Length", f"`{min_length}`"))

    if minimum is not None:
        table_rows.append(("Minimum", f"`{minimum}`"))

    if max_length is not None:
        table_rows.append(("Max Length", f"`{max_length}`"))

    if maximum is not None:
        table_rows.append(("Maximum", f"`{maximum}`"))

    lines = [
        f"{heading} `{key_path}`",
        "",
        description,
        "",
        *render_pretty_table(table_rows),
    ]

    if reference_link:
        ref_label, ref_target = reference_link
        lines.extend(["", f"See [{ref_label}]({ref_target}) for full configuration."])

    example_value = explicit_example_value(node, resolver=resolver, current_source=current_source)
    if example_value is not None:
        lines.extend(
            [
                "",
                "Example",
                "",
                "```yaml",
                build_example_block(key_path, example_value),
                "```",
            ]
        )

    lines.extend(["", "---", ""])

    return "\n".join(lines)


def iter_child_properties(
    node: dict[str, Any],
    resolver: SchemaResolver | None = None,
    current_source: Path | None = None,
) -> Iterable[tuple[str, dict[str, Any], bool, Path | None]]:
    out: list[tuple[str, dict[str, Any], bool, Path | None]] = []
    grouped_children: dict[str, list[tuple[dict[str, Any], Path | None]]] = {}
    grouped_required: dict[str, bool] = {}

    def add_child(name: str, child_schema: dict[str, Any], required: bool, child_source: Path | None) -> None:
        grouped_children.setdefault(name, []).append((child_schema, child_source))
        grouped_required[name] = grouped_required.get(name, False) or required

    for variant, variant_source in iter_schema_variants(
        node,
        resolver=resolver,
        current_source=current_source,
    ):
        variant_required = set()
        direct_required = variant.get("required")
        if isinstance(direct_required, list):
            variant_required = {key for key in direct_required if isinstance(key, str)}

        properties = variant.get("properties")
        if isinstance(properties, dict):
            for key in sorted(properties.keys()):
                child = properties[key]
                if isinstance(child, dict):
                    add_child(key, child, key in variant_required, variant_source)

        additional_properties = variant.get("additionalProperties")
        if isinstance(additional_properties, dict):
            entry_required = set()
            entry_direct_required = additional_properties.get("required")
            if isinstance(entry_direct_required, list):
                entry_required = {key for key in entry_direct_required if isinstance(key, str)}

            entry_properties = additional_properties.get("properties")
            if isinstance(entry_properties, dict):
                for key in sorted(entry_properties.keys()):
                    child = entry_properties[key]
                    if isinstance(child, dict):
                        add_child(f"$name.{key}", child, key in entry_required, variant_source)

    for key in sorted(grouped_children.keys()):
        candidates = grouped_children[key]
        unique: list[tuple[dict[str, Any], Path | None]] = []
        seen: set[str] = set()
        for candidate, candidate_source in candidates:
            source_marker = str(candidate_source.resolve()) if isinstance(candidate_source, Path) else ""
            marker = source_marker + "::" + json.dumps(candidate, sort_keys=True, ensure_ascii=False)
            if marker in seen:
                continue
            seen.add(marker)
            unique.append((candidate, candidate_source))

        if len(unique) == 1:
            merged_child, merged_source = unique[0]
        else:
            first_source = unique[0][1]
            same_source = all(candidate_source == first_source for _, candidate_source in unique)
            if same_source:
                merged_child = {"allOf": [candidate for candidate, _ in unique]}
                merged_source = first_source
            else:
                merged_child, merged_source = unique[0]

        out.append((key, merged_child, grouped_required.get(key, False), merged_source))

    return out


def iter_children_with_resolution(
    node: dict[str, Any],
    current_source: Path | None,
    resolver: SchemaResolver,
) -> list[tuple[str, dict[str, Any], dict[str, Any], bool, Path | None, Path | None]]:
    children: list[tuple[str, dict[str, Any], dict[str, Any], bool, Path | None, Path | None]] = []
    for key, child, required, child_input_source in iter_child_properties(
        node,
        resolver=resolver,
        current_source=current_source,
    ):
        resolved_child, child_source, child_ref = resolver.resolve_node(child, child_input_source or current_source)
        children.append((key, child, resolved_child, required, child_source, child_ref))
    return children


def iter_object_children(
    node: dict[str, Any],
    current_source: Path | None,
    resolver: SchemaResolver,
) -> list[tuple[str, dict[str, Any], bool, Path | None, Path | None]]:
    children: list[tuple[str, dict[str, Any], bool, Path | None, Path | None]] = []

    for key, _, resolved_child, required, child_source, child_ref in iter_children_with_resolution(
        node, current_source, resolver
    ):
        if is_object_schema(resolved_child):
            children.append((key, resolved_child, required, child_source, child_ref))

    pattern_props = node.get("patternProperties")
    if isinstance(pattern_props, dict) and pattern_props:
        first_value = next(iter(pattern_props.values()))
        if isinstance(first_value, dict):
            resolved_child, child_source, child_ref = resolver.resolve_node(first_value, current_source)
            if is_object_schema(resolved_child):
                children.append(("$name", resolved_child, False, child_source, child_ref))

    additional_props = node.get("additionalProperties")
    if isinstance(additional_props, dict):
        resolved_child, child_source, child_ref = resolver.resolve_node(additional_props, current_source)
        if is_object_schema(resolved_child):
            if not any(name == "$name" for name, _, _, _, _ in children):
                children.append(("$name", resolved_child, False, child_source, child_ref))

    deduped: list[tuple[str, dict[str, Any], bool, Path | None, Path | None]] = []
    seen: set[str] = set()
    for key, child, required, child_source, child_ref in children:
        if key in seen:
            continue
        seen.add(key)
        deduped.append((key, child, required, child_source, child_ref))
    return deduped


def iter_page_children(
    node: dict[str, Any],
    current_source: Path | None,
    resolver: SchemaResolver,
) -> list[tuple[str, dict[str, Any], bool, Path | None, Path | None]]:
    result: list[tuple[str, dict[str, Any], bool, Path | None, Path | None]] = []
    for key, _, resolved_child, required, child_source, child_ref in iter_children_with_resolution(
        node, current_source, resolver
    ):
        result.append((key, resolved_child, required, child_source, child_ref))
    return result


def render_node_sections(
    node: dict[str, Any],
    node_source: Path | None,
    resolver: SchemaResolver,
    ref_links_by_file: dict[Path, str],
    base_key: str,
    heading_level: int,
    current_depth: int,
    max_depth: int,
    required: bool,
) -> str:
    parts = [
        render_property_section(
            node,
            base_key,
            heading_level,
            required,
            resolver=resolver,
            current_source=node_source,
        )
    ]
    if current_depth >= max_depth:
        return "".join(parts)

    for key, _, child, child_required, _, child_ref in iter_children_with_resolution(node, node_source, resolver):
        child_key = f"{base_key}.{key}" if base_key else key
        if child_ref is not None:
            ref_link = ref_links_by_file.get(child_ref.resolve())
            reference = (prettify_segment(key), ref_link) if ref_link else None
            parts.append(
                render_property_section(
                    child,
                    child_key,
                    min(6, heading_level + 1),
                    child_required,
                    reference_link=reference,
                    resolver=resolver,
                    current_source=child_source,
                )
            )
            continue

        if not is_object_schema(child):
            parts.append(
                render_property_section(
                    child,
                    child_key,
                    min(6, heading_level + 1),
                    child_required,
                    resolver=resolver,
                    current_source=child_source,
                )
            )
            continue

        parts.append(
            render_node_sections(
                node=child,
                node_source=node_source,
                resolver=resolver,
                ref_links_by_file=ref_links_by_file,
                base_key=child_key,
                heading_level=min(6, heading_level + 1),
                current_depth=current_depth + 1,
                max_depth=max_depth,
                required=child_required,
            )
        )

    return "".join(parts)


def render_page(
    key_path_segments: list[str],
    schema_node: dict[str, Any],
    schema_source: Path | None,
    resolver: SchemaResolver,
    base_url: str,
    max_depth: int,
    child_links: list[tuple[str, str, str]],
    ref_links_by_file: dict[Path, str],
    dynamic_segment: str,
    full_examples_markdown: str | None,
) -> str:
    title = "Common Chart Documentation" if not key_path_segments else prettify_segment(key_path_segments[-1])
    appears_in = schema_path(key_path_segments)
    key_path = ".".join(key_path_segments)

    lines = ["---", f"title: {title}", "---", ""]

    short_page = "/".join(sanitize_segment(p, dynamic_segment) for p in key_path_segments)
    page_slug = f"{base_url}/{short_page}".rstrip("/") or base_url

    lines.extend(
        [
            ":::note",
            "",
            "- This page is generated from JSON schema.",
            f"- See the [Full Examples]({page_slug}#full-examples) section for complete examples.",
            "",
            ":::",
            "",
        ]
    )

    lines.extend(["## Appears in", "", f"- `{appears_in}`", "", "---", ""])

    if key_path_segments:
        lines.append(
            render_property_section(
                schema_node,
                key_path,
                2,
                required=False,
                resolver=resolver,
                current_source=schema_source,
            )
        )

    page_children = iter_page_children(schema_node, schema_source, resolver)
    for key, child, required, child_source, child_ref in page_children:
        full_key = f"{key_path}.{key}" if key_path else key
        if child_ref is not None:
            ref_link = ref_links_by_file.get(child_ref.resolve())
            reference = (prettify_segment(key), ref_link) if ref_link else None
            lines.append(
                render_property_section(
                    child,
                    full_key,
                    3 if key_path_segments else 2,
                    required,
                    reference_link=reference,
                    resolver=resolver,
                    current_source=child_source,
                )
            )
            continue

        lines.append(
            render_property_section(
                child,
                full_key,
                3 if key_path_segments else 2,
                required,
                resolver=resolver,
                current_source=child_source,
            )
        )

    if child_links:
        lines.extend(["## Child Pages", ""])
        for name, rel_link, description in child_links:
            label = prettify_segment(name)
            if description:
                lines.append(f"- [{label}]({rel_link}) - {description}")
            else:
                lines.append(f"- [{label}]({rel_link})")
        lines.extend(["", "---", ""])

    normalized_examples = normalize_full_examples_markdown(full_examples_markdown)
    if normalized_examples:
        lines.extend(normalized_examples.splitlines())
        lines.append("")
    else:
        page_example = explicit_example_value(schema_node, resolver=resolver, current_source=schema_source)
        if page_example is None:
            return "\n".join(lines).rstrip() + "\n"
        lines.extend(["## Full Examples", "", "```yaml"])
        if key_path_segments:
            lines.append(build_example_block(key_path, page_example))
        else:
            lines.extend(yaml_lines(page_example))
        lines.extend(["```", ""])

    return "\n".join(lines).rstrip() + "\n"


def normalize_full_examples_markdown(markdown: str | None) -> str | None:
    if not markdown:
        return None

    cleaned = markdown.strip()
    if not cleaned:
        return None

    header = re.search(r"^##\s+Full Examples\s*$", cleaned, flags=re.MULTILINE)
    if header:
        cleaned = cleaned[header.start() :].strip()
    else:
        cleaned = f"## Full Examples\n\n{cleaned}"

    return cleaned


def collect_object_pages(
    root_schema: dict[str, Any],
    root_schema_path: Path,
    schemas_root: Path,
    resolver: SchemaResolver,
) -> dict[tuple[str, ...], dict[str, Any]]:
    pages: dict[tuple[str, ...], dict[str, Any]] = {}
    visited_key_paths: set[tuple[str, ...]] = set()

    def walk(
        node: dict[str, Any],
        key_path: list[str],
        doc_path: list[str],
        current_source: Path | None,
    ) -> tuple[str, ...]:
        key_tuple = tuple(key_path)
        if key_tuple in visited_key_paths:
            for existing_doc_path, entry in pages.items():
                if entry["key_path"] == key_tuple:
                    return existing_doc_path
            return tuple(doc_path)

        visited_key_paths.add(key_tuple)

        resolved_node, resolved_source, _ = resolver.resolve_node(node, current_source)
        doc_tuple = tuple(doc_path)
        existing_page = pages.get(doc_tuple)
        if existing_page and existing_page["key_path"] != key_tuple:
            doc_tuple = key_tuple

        pages[doc_tuple] = {
            "node": resolved_node,
            "key_path": key_tuple,
            "source": resolved_source,
            "children": [],
        }

        child_links: list[tuple[str, tuple[str, ...], str]] = []
        for child_name, child_node, _, child_source, child_ref in iter_object_children(
            resolved_node, resolved_source, resolver
        ):
            if child_ref is None:
                continue

            child_key_path = [*key_path, child_name]
            ref_doc_path = ref_to_doc_segments(child_ref, schemas_root)
            desired_doc = list(ref_doc_path) if ref_doc_path else [*doc_tuple, child_name]

            existing = pages.get(tuple(desired_doc))
            if existing and existing["key_path"] != tuple(child_key_path):
                desired_doc = child_key_path

            actual_child_doc = walk(child_node, child_key_path, desired_doc, child_source)
            child_desc = child_node.get("description") if isinstance(child_node.get("description"), str) else ""
            child_links.append((child_name, actual_child_doc, child_desc))

        pages[doc_tuple]["children"] = child_links
        return doc_tuple

    walk(root_schema, [], [], root_schema_path)
    return pages


def relative_markdown_path(path_segments: tuple[str, ...], dynamic_segment: str) -> Path:
    if not path_segments:
        return Path("index.md")
    return Path(*[sanitize_segment(p, dynamic_segment) for p in path_segments]) / "index.md"


def compute_markdown_paths(
    page_paths: Iterable[tuple[str, ...]],
    dynamic_segment: str,
) -> dict[tuple[str, ...], Path]:
    tuples = list(page_paths)
    mapping: dict[tuple[str, ...], Path] = {}

    for doc_path in tuples:
        if not doc_path:
            mapping[doc_path] = Path("index.md")
            continue

        has_descendants = any(
            other != doc_path and len(other) > len(doc_path) and other[: len(doc_path)] == doc_path
            for other in tuples
        )

        sanitized = [sanitize_segment(part, dynamic_segment) for part in doc_path]
        if has_descendants:
            mapping[doc_path] = Path(*sanitized) / "index.md"
        else:
            mapping[doc_path] = Path(*sanitized[:-1]) / f"{sanitized[-1]}.md"

    return mapping


def collect_schema_file_pages(
    schemas_root: Path,
    resolver: SchemaResolver,
) -> dict[tuple[str, ...], dict[str, Any]]:
    pages: dict[tuple[str, ...], dict[str, Any]] = {}

    def merge_pages_into_target(source_key: tuple[str, ...], target_key: tuple[str, ...]) -> None:
        source_page = pages.get(source_key)
        target_page = pages.get(target_key)
        if not source_page or not target_page:
            return

        source_schema_file = source_page.get("schema_file")
        target_schema_file = target_page.get("schema_file")
        if not isinstance(source_schema_file, Path) or not isinstance(target_schema_file, Path):
            return

        source_ref = f"file://{source_schema_file.resolve().as_posix()}"
        target_ref = f"file://{target_schema_file.resolve().as_posix()}"
        merged_node = {
            "allOf": [
                {"$ref": source_ref},
                {"$ref": target_ref},
            ]
        }
        resolved_merged, resolved_source, _ = resolver.resolve_node(merged_node, target_schema_file)

        target_page["node"] = resolved_merged
        target_page["source"] = resolved_source
        aliases = target_page.get("alias_schema_files")
        if not isinstance(aliases, list):
            aliases = []
            target_page["alias_schema_files"] = aliases
        aliases.append(source_schema_file.resolve())

        del pages[source_key]

    for schema_file in sorted(schemas_root.rglob("*.json")):
        rel = schema_file.relative_to(schemas_root)
        rel_parts = list(rel.parts)
        rel_parts[-1] = Path(rel_parts[-1]).stem
        page_key = tuple(rel_parts)

        node = load_schema(schema_file)
        resolved_node, resolved_source, _ = resolver.resolve_node(node, schema_file)

        key_path = tuple(rel_parts[:-1]) if rel_parts and rel_parts[-1] == "index" else tuple(rel_parts)
        if len(key_path) >= 2 and key_path[-1] == key_path[-2]:
            key_path = key_path[:-1]

        pages[page_key] = {
            "node": resolved_node,
            "key_path": key_path,
            "source": resolved_source,
            "schema_file": schema_file.resolve(),
            "alias_schema_files": [],
            "children": [],
        }

    same_name_keys = [
        key
        for key in pages
        if len(key) >= 2 and key[-1] == key[-2]
    ]
    for source_key in same_name_keys:
        target_key = (*source_key[:-1], "index")
        if target_key in pages:
            merge_pages_into_target(source_key, target_key)
            continue

        source_page = pages.get(source_key)
        if not source_page:
            continue

        pages[target_key] = source_page
        del pages[source_key]

    merge_pairs = [
        (key[:-1], key)
        for key in pages
        if key and key[-1] == "index" and key[:-1] in pages
    ]
    for sibling_key, index_key in merge_pairs:
        merge_pages_into_target(sibling_key, index_key)

    def node_for_dir_index(dir_key: tuple[str, ...]) -> tuple[dict[str, Any], tuple[str, ...], Path | None]:
        parent_key = dir_key[:-1]
        segment = dir_key[-1]

        parent_candidates = [(*parent_key, "index"), parent_key]
        for candidate in parent_candidates:
            parent_page = pages.get(candidate)
            if not parent_page:
                continue

            parent_node = parent_page["node"]
            parent_source = parent_page["source"]
            properties = parent_node.get("properties") if isinstance(parent_node.get("properties"), dict) else {}
            child = properties.get(segment)
            if isinstance(child, dict):
                resolved_child, child_source, _ = resolver.resolve_node(child, parent_source)
                return resolved_child, dir_key, child_source

        return (
            {
                "type": "object",
                "properties": {},
                "additionalProperties": True,
                "description": f"Configuration for `{'.'.join(dir_key)}`.",
            },
            dir_key,
            None,
        )

    schema_dirs = sorted(
        [
            tuple(path.relative_to(schemas_root).parts)
            for path in schemas_root.rglob("*")
            if path.is_dir() and path != schemas_root
        ],
        key=lambda parts: (len(parts), parts),
    )

    for dir_key in schema_dirs:
        if dir_key in pages or (*dir_key, "index") in pages:
            continue

        node, key_path, source = node_for_dir_index(dir_key)
        pages[(*dir_key, "index")] = {
            "node": node,
            "key_path": key_path,
            "source": source,
            "schema_file": None,
            "children": [],
        }

    return pages


def compute_schema_style_markdown_paths(
    page_keys: Iterable[tuple[str, ...]],
    dynamic_segment: str,
) -> dict[tuple[str, ...], Path]:
    keys = list(page_keys)
    mapping: dict[tuple[str, ...], Path] = {}

    def folder_has_other_pages(folder_parts: tuple[str, ...], this_key: tuple[str, ...]) -> bool:
        for other in keys:
            if other == this_key:
                continue
            if len(other) >= len(folder_parts) and other[: len(folder_parts)] == folder_parts:
                return True
        return False

    for key in keys:
        if not key:
            mapping[key] = Path("index.md")
            continue

        if key == ("index",):
            mapping[key] = Path("index.md")
            continue

        if key[-1] == "index":
            folder_parts = key[:-1]
            sanitized_folder = tuple(sanitize_segment(part, dynamic_segment) for part in folder_parts)

            if not folder_parts:
                mapping[key] = Path("index.md")
                continue

            if folder_has_other_pages(folder_parts, key):
                mapping[key] = Path(*sanitized_folder) / "index.md"
            else:
                mapping[key] = Path(*sanitized_folder[:-1]) / f"{sanitized_folder[-1]}.md"
            continue

        has_same_name_folder = any(
            len(other) > len(key) and other[: len(key)] == key for other in keys
        )

        sanitized = [sanitize_segment(part, dynamic_segment) for part in key]
        if has_same_name_folder:
            mapping[key] = Path(*sanitized) / "index.md"
        else:
            mapping[key] = Path(*sanitized[:-1]) / f"{sanitized[-1]}.md"

    return mapping


def relative_link(from_page: Path, to_page: Path) -> str:
    rel = Path(os.path.relpath(to_page, start=from_page.parent)).as_posix()
    if rel == "index.md":
        return "./"
    if rel.endswith("/index.md"):
        return rel[: -len("index.md")]
    return rel


def generate_docs(
    schema: dict[str, Any],
    schema_path: Path,
    output: Path,
    base_url: str,
    max_depth: int,
    clean: bool,
    dynamic_segment: str,
    schemas_root: Path,
    examples_root: Path,
) -> None:
    resolver = SchemaResolver(schemas_root=schemas_root)
    pages = collect_schema_file_pages(schemas_root=schemas_root, resolver=resolver)

    if clean and output.exists():
        shutil.rmtree(output)

    output.mkdir(parents=True, exist_ok=True)

    doc_paths = list(pages.keys())
    markdown_paths = compute_schema_style_markdown_paths(doc_paths, dynamic_segment)
    page_key_paths = {doc_key: tuple(pages[doc_key]["key_path"]) for doc_key in pages}

    schema_file_to_doc_key: dict[Path, tuple[str, ...]] = {}
    for doc_key, page in pages.items():
        schema_file = page.get("schema_file")
        if isinstance(schema_file, Path):
            schema_file_to_doc_key[schema_file.resolve()] = doc_key
        aliases = page.get("alias_schema_files")
        if isinstance(aliases, list):
            for alias_path in aliases:
                if isinstance(alias_path, Path):
                    schema_file_to_doc_key[alias_path.resolve()] = doc_key

    ref_target_map = dict(schema_file_to_doc_key)

    for doc_path_tuple, page in sorted(pages.items(), key=lambda item: (len(item[0]), item[0])):
        rel_page = markdown_paths[doc_path_tuple]
        target = output / rel_page
        target.parent.mkdir(parents=True, exist_ok=True)

        child_links: list[tuple[str, str, str]] = []
        parent_key_path = page_key_paths[doc_path_tuple]

        for child_doc_path_tuple, child_key_path in page_key_paths.items():
            if child_doc_path_tuple == doc_path_tuple:
                continue

            if len(child_key_path) != len(parent_key_path) + 1:
                continue

            if child_key_path[: len(parent_key_path)] != parent_key_path:
                continue

            rel_child = markdown_paths[child_doc_path_tuple]
            rel_link = relative_link(rel_page, rel_child)
            child_name = child_key_path[-1]
            child_node = pages[child_doc_path_tuple]["node"]
            child_desc = child_node.get("description") if isinstance(child_node.get("description"), str) else ""
            if child_desc:
                child_desc = sanitize_description_markdown(child_desc)
            child_links.append((child_name, rel_link, child_desc))

        child_links.sort(key=lambda item: item[0])

        ref_links_by_file: dict[Path, str] = {}
        for ref_file, ref_doc_key in ref_target_map.items():
            ref_rel_page = markdown_paths.get(ref_doc_key)
            if ref_rel_page is None:
                continue
            ref_links_by_file[ref_file] = relative_link(rel_page, ref_rel_page)

        full_examples_markdown: str | None = None
        example_file = examples_root / rel_page
        if example_file.exists():
            full_examples_markdown = example_file.read_text(encoding="utf-8")

        generated = render_page(
            key_path_segments=list(page["key_path"]),
            schema_node=page["node"],
            schema_source=page["source"],
            resolver=resolver,
            base_url=base_url,
            max_depth=max_depth,
            child_links=child_links,
            ref_links_by_file=ref_links_by_file,
            dynamic_segment=dynamic_segment,
            full_examples_markdown=full_examples_markdown,
        )
        target.write_text(generated, encoding="utf-8")


def verify_generated_structure(
    schemas_root: Path,
    output: Path,
    dynamic_segment: str,
) -> tuple[bool, str]:
    resolver = SchemaResolver(schemas_root=schemas_root)
    pages = collect_schema_file_pages(schemas_root=schemas_root, resolver=resolver)
    expected_paths = set(compute_schema_style_markdown_paths(pages.keys(), dynamic_segment).values())
    actual_paths = set(path.relative_to(output) for path in output.rglob("*.md"))

    missing_paths = sorted(expected_paths - actual_paths)
    extra_paths = sorted(actual_paths - expected_paths)

    if missing_paths or extra_paths:
        details: list[str] = []
        if missing_paths:
            details.append(f"missing={len(missing_paths)}")
            details.extend([f"  - {path.as_posix()}" for path in missing_paths[:20]])
        if extra_paths:
            details.append(f"extra={len(extra_paths)}")
            details.extend([f"  - {path.as_posix()}" for path in extra_paths[:20]])
        if len(missing_paths) > 20:
            details.append(f"  ... and {len(missing_paths) - 20} more missing")
        if len(extra_paths) > 20:
            details.append(f"  ... and {len(extra_paths) - 20} more extra")
        return False, "\n".join(details)

    return True, f"verified {len(actual_paths)} generated pages"


def verify_generated_markdown_formatting(output: Path) -> tuple[bool, str]:
    md_files = sorted(output.rglob("*.md"))
    if not md_files:
        return True, "no markdown files found to lint"

    markdownlint_bin = shutil.which("markdownlint")
    if markdownlint_bin is None:
        return False, "markdownlint executable not found in PATH"

    config_path: Path | None = None
    for parent in output.resolve().parents:
        candidate = parent / ".markdownlint.yaml"
        if candidate.exists():
            config_path = candidate
            break

    cmd = [markdownlint_bin]
    if config_path is not None:
        cmd.extend(["--config", str(config_path)])
    cmd.extend(str(path) for path in md_files)

    result = subprocess.run(cmd, capture_output=True, text=True)
    if result.returncode != 0:
        stdout = result.stdout.strip()
        stderr = result.stderr.strip()
        parts = [p for p in (stdout, stderr) if p]
        detail = "\n".join(parts) if parts else "markdownlint reported formatting violations"
        return False, detail

    return True, f"markdownlint passed for {len(md_files)} generated files"


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()

    schema_path = args.schema.resolve()
    schema = load_schema(schema_path)

    generate_docs(
        schema=schema,
        schema_path=schema_path,
        output=args.output.resolve(),
        base_url=args.base_url.rstrip("/"),
        max_depth=max(0, args.max_depth),
        clean=args.clean,
        dynamic_segment=args.dynamic_segment,
        schemas_root=args.schemas_root.resolve(),
        examples_root=args.examples_root.resolve(),
    )

    if not args.no_verify_structure:
        ok, report = verify_generated_structure(
            schemas_root=args.schemas_root.resolve(),
            output=args.output.resolve(),
            dynamic_segment=args.dynamic_segment,
        )
        if not ok:
            print("Structure verification failed:")
            print(report)
            return 1
        print(f"Structure verification passed: {report}")

    if not args.no_verify_formatting:
        ok, report = verify_generated_markdown_formatting(output=args.output.resolve())
        if not ok:
            print("Markdown formatting verification failed:")
            print(report)
            return 1
        print(f"Markdown formatting verification passed: {report}")

    print(f"Generated pages in: {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
