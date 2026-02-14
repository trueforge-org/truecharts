#!/usr/bin/env python3

import argparse
import copy
import json
import os
import re
import shutil
from pathlib import Path
from typing import Any, Iterable


def build_parser() -> argparse.ArgumentParser:
    script_dir = Path(__file__).resolve().parent
    parser = argparse.ArgumentParser(
        description=(
            "Generate markdown pages from a JSON schema into charts/library/common/newdocs."
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
        default=script_dir / "newdocs",
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
        "--clean",
        action="store_true",
        help="Remove output directory before generation",
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


def schema_type(node: dict[str, Any]) -> str:
    raw_type = node.get("type")
    if isinstance(raw_type, list):
        return " | ".join(raw_type)

    if isinstance(raw_type, str):
        if raw_type == "object":
            return "map"
        if raw_type == "array":
            item_type = "unknown"
            items = node.get("items")
            if isinstance(items, dict):
                item_type = schema_type(items)
            return f"list of {item_type}"
        return raw_type

    for union_key in ("oneOf", "anyOf", "allOf"):
        if union_key in node and isinstance(node[union_key], list):
            union_types = []
            for option in node[union_key]:
                if isinstance(option, dict):
                    union_types.append(schema_type(option))
            if union_types:
                return " | ".join(sorted(set(union_types)))

    if "properties" in node:
        return "map"

    return "unknown"


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


def example_value_for_node(node: dict[str, Any], max_depth: int, current_depth: int = 0) -> Any:
    if "default" in node:
        return node["default"]

    if current_depth >= max_depth:
        node_type = node.get("type")
        if node_type == "array":
            return []
        if node_type == "boolean":
            return False
        if node_type in ("integer", "number"):
            return 0
        if node_type == "string":
            return ""
        return {}

    node_type = node.get("type")
    if node_type == "array":
        items = node.get("items") if isinstance(node.get("items"), dict) else None
        if items:
            return [example_value_for_node(items, max_depth, current_depth + 1)]
        return []

    if node_type == "boolean":
        return False

    if node_type in ("integer", "number"):
        return 0

    if node_type == "string":
        return ""

    if is_object_schema(node):
        result: dict[str, Any] = {}
        properties = node.get("properties") if isinstance(node.get("properties"), dict) else {}
        for key, child in properties.items():
            if not isinstance(child, dict):
                continue
            child_example = example_value_for_node(child, max_depth, current_depth + 1)
            if child_example in ({}, [], "") and "default" not in child:
                continue
            result[key] = child_example
        return result

    return ""


def build_example_block(key_path: str, node: dict[str, Any], default_value: Any = None) -> str:
    segments = [part for part in key_path.split(".") if part]
    nested: Any
    if default_value is not None:
        nested = default_value
    else:
        nested = example_value_for_node(node, max_depth=2)

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


def render_property_section(
    node: dict[str, Any],
    key_path: str,
    heading_level: int,
    required: bool,
) -> str:
    heading = "#" * max(2, min(6, heading_level))
    description = node.get("description") or "No description provided."
    type_text = schema_type(node)
    default_text = value_to_inline_json(node.get("default")) if "default" in node else "unset"

    lines = [
        f"{heading} `{key_path}`",
        "",
        description,
        "",
        "|            |                     |",
        "| ---------- | ------------------- |",
        f"| Key        | `{key_path}` |",
        f"| Type       | `{type_text}` |",
        f"| Required   | {'✅' if required else '❌'} |",
        f"| Helm `tpl` | {helm_tpl_flag(node)} |",
        f"| Default    | {default_text} |",
    ]

    enum_values = node.get("enum")
    if isinstance(enum_values, list) and enum_values:
        lines.extend(
            [
                "",
                "Valid Values:",
                "",
                *[f"- `{json.dumps(item, ensure_ascii=False).strip('"')}`" for item in enum_values],
            ]
        )

    example_value = None
    examples = node.get("examples")
    if isinstance(examples, list) and examples:
        example_value = examples[0]
    elif "default" in node:
        example_value = node["default"]

    lines.extend(
        [
            "",
            "Example",
            "",
            "```yaml",
            build_example_block(key_path, node, example_value),
            "```",
            "",
            "---",
            "",
        ]
    )

    return "\n".join(lines)


def iter_child_properties(node: dict[str, Any]) -> Iterable[tuple[str, dict[str, Any], bool]]:
    properties = node.get("properties")
    if not isinstance(properties, dict):
        return []
    required_keys = node.get("required") if isinstance(node.get("required"), list) else []
    out: list[tuple[str, dict[str, Any], bool]] = []
    for key in sorted(properties.keys()):
        child = properties[key]
        if not isinstance(child, dict):
            continue
        out.append((key, child, key in required_keys))
    return out


def iter_children_with_resolution(
    node: dict[str, Any],
    current_source: Path | None,
    resolver: SchemaResolver,
) -> list[tuple[str, dict[str, Any], dict[str, Any], bool, Path | None, Path | None]]:
    children: list[tuple[str, dict[str, Any], dict[str, Any], bool, Path | None, Path | None]] = []
    for key, child, required in iter_child_properties(node):
        resolved_child, child_source, child_ref = resolver.resolve_node(child, current_source)
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


def iter_scalar_children(
    node: dict[str, Any],
    current_source: Path | None,
    resolver: SchemaResolver,
) -> list[tuple[str, dict[str, Any], bool]]:
    result: list[tuple[str, dict[str, Any], bool]] = []
    for key, _, resolved_child, required, _, _ in iter_children_with_resolution(node, current_source, resolver):
        if not is_object_schema(resolved_child):
            result.append((key, resolved_child, required))
    return result


def render_node_sections(
    node: dict[str, Any],
    base_key: str,
    heading_level: int,
    current_depth: int,
    max_depth: int,
    required: bool,
) -> str:
    parts = [render_property_section(node, base_key, heading_level, required)]
    if current_depth >= max_depth:
        return "".join(parts)

    for key, child, child_required in iter_child_properties(node):
        child_key = f"{base_key}.{key}" if base_key else key
        parts.append(
            render_node_sections(
                node=child,
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
    dynamic_segment: str,
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
        lines.append(render_property_section(schema_node, key_path, 2, required=False).rstrip())

    scalar_children = iter_scalar_children(schema_node, schema_source, resolver)
    for key, child, required in scalar_children:
        full_key = f"{key_path}.{key}" if key_path else key
        lines.append(render_property_section(child, full_key, 3 if key_path_segments else 2, required).rstrip())

    if child_links:
        lines.extend(["## Child Pages", ""])
        for name, rel_link, description in child_links:
            label = prettify_segment(name)
            if description:
                lines.append(f"- [{label}]({rel_link}) - {description}")
            else:
                lines.append(f"- [{label}]({rel_link})")
        lines.extend(["", "---", ""])

    lines.extend(["## Full Examples", "", "```yaml"])
    if key_path_segments:
        lines.append(build_example_block(key_path, schema_node))
    else:
        root_example = example_value_for_node(schema_node, max_depth=max_depth)
        lines.extend(yaml_lines(root_example))
    lines.extend(["```", ""])

    return "\n".join(lines).rstrip() + "\n"


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

    for schema_file in sorted(schemas_root.rglob("*.json")):
        rel = schema_file.relative_to(schemas_root)
        rel_parts = list(rel.parts)
        rel_parts[-1] = Path(rel_parts[-1]).stem
        page_key = tuple(rel_parts)

        node = load_schema(schema_file)
        resolved_node, resolved_source, _ = resolver.resolve_node(node, schema_file)

        key_path = tuple(rel_parts[:-1]) if rel_parts and rel_parts[-1] == "index" else tuple(rel_parts)

        pages[page_key] = {
            "node": resolved_node,
            "key_path": key_path,
            "source": resolved_source,
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

        sanitized = [sanitize_segment(part, dynamic_segment) for part in key]
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
) -> None:
    resolver = SchemaResolver(schemas_root=schemas_root)
    pages = collect_schema_file_pages(schemas_root=schemas_root, resolver=resolver)

    if clean and output.exists():
        shutil.rmtree(output)

    output.mkdir(parents=True, exist_ok=True)

    doc_paths = list(pages.keys())
    markdown_paths = compute_schema_style_markdown_paths(doc_paths, dynamic_segment)

    for doc_path_tuple, page in sorted(pages.items(), key=lambda item: (len(item[0]), item[0])):
        rel_page = markdown_paths[doc_path_tuple]
        target = output / rel_page
        target.parent.mkdir(parents=True, exist_ok=True)

        child_links: list[tuple[str, str, str]] = []

        generated = render_page(
            key_path_segments=list(page["key_path"]),
            schema_node=page["node"],
            schema_source=page["source"],
            resolver=resolver,
            base_url=base_url,
            max_depth=max_depth,
            child_links=child_links,
            dynamic_segment=dynamic_segment,
        )
        target.write_text(generated, encoding="utf-8")


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
    )

    print(f"Generated pages in: {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
