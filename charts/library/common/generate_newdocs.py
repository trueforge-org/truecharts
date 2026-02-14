#!/usr/bin/env python3

import argparse
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
            "Generate markdown docs from a JSON schema into a docs tree under charts/library/common/newdocs."
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
        help="Path where generated docs should be written",
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


def iter_object_children(node: dict[str, Any]) -> list[tuple[str, dict[str, Any], bool]]:
    children: list[tuple[str, dict[str, Any], bool]] = []

    for key, child, required in iter_child_properties(node):
        if is_object_schema(child):
            children.append((key, child, required))

    pattern_props = node.get("patternProperties")
    if isinstance(pattern_props, dict) and pattern_props:
        first_value = next(iter(pattern_props.values()))
        if isinstance(first_value, dict) and is_object_schema(first_value):
            children.append(("$name", first_value, False))

    additional_props = node.get("additionalProperties")
    if isinstance(additional_props, dict) and is_object_schema(additional_props):
        if not any(name == "$name" for name, _, _ in children):
            children.append(("$name", additional_props, False))

    # dedupe by key order-preserving
    deduped: list[tuple[str, dict[str, Any], bool]] = []
    seen: set[str] = set()
    for key, child, required in children:
        if key in seen:
            continue
        seen.add(key)
        deduped.append((key, child, required))
    return deduped


def iter_scalar_children(node: dict[str, Any]) -> list[tuple[str, dict[str, Any], bool]]:
    result: list[tuple[str, dict[str, Any], bool]] = []
    for key, child, required in iter_child_properties(node):
        if not is_object_schema(child):
            result.append((key, child, required))
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
    path_segments: list[str],
    schema_node: dict[str, Any],
    base_url: str,
    max_depth: int,
    child_links: list[tuple[str, str, str]],
    dynamic_segment: str,
) -> str:
    title = "Common Chart Documentation" if not path_segments else prettify_segment(path_segments[-1])
    appears_in = schema_path(path_segments)
    key_path = ".".join(path_segments)

    lines = ["---", f"title: {title}", "---", ""]

    short_page = "/".join(sanitize_segment(p, dynamic_segment) for p in path_segments)
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

    if path_segments:
        lines.append(render_property_section(schema_node, key_path, 2, required=False).rstrip())

    scalar_children = iter_scalar_children(schema_node)
    for key, child, required in scalar_children:
        full_key = f"{key_path}.{key}" if key_path else key
        lines.append(render_property_section(child, full_key, 3 if path_segments else 2, required).rstrip())

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
    if path_segments:
        lines.append(build_example_block(key_path, schema_node))
    else:
        root_example = example_value_for_node(schema_node, max_depth=max_depth)
        lines.extend(yaml_lines(root_example))
    lines.extend(["```", ""])

    return "\n".join(lines).rstrip() + "\n"


def collect_object_pages(root_schema: dict[str, Any]) -> dict[tuple[str, ...], dict[str, Any]]:
    pages: dict[tuple[str, ...], dict[str, Any]] = {}
    visited: set[tuple[str, ...]] = set()

    def walk(node: dict[str, Any], path: list[str]) -> None:
        page_key = tuple(path)
        if page_key in visited:
            return
        visited.add(page_key)
        pages[page_key] = node

        for key, child, _ in iter_object_children(node):
            walk(child, [*path, key])

    walk(root_schema, [])
    return pages


def relative_markdown_path(path_segments: tuple[str, ...], dynamic_segment: str) -> Path:
    if not path_segments:
        return Path("index.md")
    return Path(*[sanitize_segment(p, dynamic_segment) for p in path_segments]) / "index.md"


def relative_link(from_page: Path, to_page: Path) -> str:
    rel = Path(os.path.relpath(to_page, start=from_page.parent)).as_posix()
    if rel == "index.md":
        return "./"
    if rel.endswith("/index.md"):
        return rel[: -len("index.md")]
    return rel


def generate_docs(
    schema: dict[str, Any],
    output: Path,
    base_url: str,
    max_depth: int,
    clean: bool,
    dynamic_segment: str,
) -> None:
    pages = collect_object_pages(schema)

    if clean and output.exists():
        shutil.rmtree(output)

    output.mkdir(parents=True, exist_ok=True)

    for path_tuple, node in sorted(pages.items(), key=lambda item: (len(item[0]), item[0])):
        rel_page = relative_markdown_path(path_tuple, dynamic_segment)
        target = output / rel_page
        target.parent.mkdir(parents=True, exist_ok=True)

        child_links: list[tuple[str, str, str]] = []
        for child_name, child_node, _ in iter_object_children(node):
            child_path = (*path_tuple, child_name)
            rel_child = relative_markdown_path(child_path, dynamic_segment)
            rel_link = relative_link(rel_page, rel_child)
            child_desc = child_node.get("description") if isinstance(child_node.get("description"), str) else ""
            child_links.append((child_name, rel_link, child_desc))

        generated = render_page(
            path_segments=list(path_tuple),
            schema_node=node,
            base_url=base_url,
            max_depth=max_depth,
            child_links=child_links,
            dynamic_segment=dynamic_segment,
        )
        target.write_text(generated, encoding="utf-8")


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()

    schema = load_schema(args.schema.resolve())

    generate_docs(
        schema=schema,
        output=args.output.resolve(),
        base_url=args.base_url.rstrip("/"),
        max_depth=max(0, args.max_depth),
        clean=args.clean,
        dynamic_segment=args.dynamic_segment,
    )

    print(f"Generated docs in: {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
