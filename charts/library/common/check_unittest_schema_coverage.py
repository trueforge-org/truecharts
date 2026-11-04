#!/usr/bin/env python3
"""Checks that the common-test unittests cover the common values schema.

Every coverage item comes from the schema files (values.schema.source.json and schemas/**):

- key:           every named property must be set in some test
- type:<t>       every allowed type must be used in a passing test
- enum:<v>       every enum value must be used in a passing test
- oneOf[i]       every oneOf/anyOf branch must be matched by a value in a passing test
- pattern        every pattern must be matched in a passing test ...
- pattern-fail   ... and violated in a failedTemplate test
- <bound>        every minimum, maximum, minLength, ... must be violated in a failedTemplate test
- required:<k>   every required key must be left out in a failedTemplate test
- additionalProperties  every closed object must get an unknown key in a failedTemplate test
- oneOf-none     every oneOf/anyOf must get a value matching no branch in a failedTemplate test

Items are identified by their schema location (file#pointer), so a shared schema part
only needs to be tested once. The test input is the "set" values of the helm-unittest suites
in common-test/tests, the base values files do not count.

Items that a unittest cannot reach can be listed, with a reason, in unittest-coverage-ignore.yaml.
"""

import argparse
import functools
import json
import math
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any

import yaml

import check_complete_values_schema_coverage as schema_tools
from check_complete_values_schema_coverage import STRUCTURE_KEYWORDS, ROOT_SCHEMA_FILE


BASE_DIR = Path(__file__).resolve().parent
TESTS_DIR = BASE_DIR.parent / "common-test" / "tests"
IGNORE_FILE = BASE_DIR / "unittest-coverage-ignore.yaml"
NEGATIVE_ASSERTS = ("failedTemplate", "failedTemplateErrors")

# Keywords that are only checked by a failing test, with how they are broken
BOUND_KEYWORDS = (
    "minimum",
    "maximum",
    "exclusiveMinimum",
    "exclusiveMaximum",
    "minLength",
    "maxLength",
    "minItems",
    "maxItems",
    "uniqueItems",
    "minProperties",
    "maxProperties",
)

CATEGORIES = {
    "key": "keys",
    "type": "types",
    "enum": "enums",
    "branch": "oneOf/anyOf branches",
    "branch-none": "oneOf/anyOf with no matching branch",
    "pattern": "patterns (matched)",
    "pattern-fail": "patterns (violated)",
    "bound": "bounds (min/max/length/items)",
    "required": "required keys",
    "additionalProperties": "closed objects (additionalProperties: false)",
}


# The schema files are read once, resolve_ref of the schema coverage check uses the cache too
@functools.lru_cache(maxsize=None)
def _load_json_cached(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def load_json(path: Path) -> Any:
    return _load_json_cached(path.resolve())


schema_tools.load_json = load_json


@dataclass(frozen=True)
class Node:
    """A schema object and where it is."""

    schema: Any
    file: Path
    pointer: str

    @property
    def location(self) -> str:
        return f"{self.file.relative_to(BASE_DIR).as_posix()}#{self.pointer}"

    def child(self, *parts: Any) -> "Node":
        schema = self.schema
        for part in parts:
            schema = schema[part]
        pointer = self.pointer + "".join("/" + str(p).replace("~", "~0").replace("/", "~1") for p in parts)
        return Node(schema, self.file, pointer)


def resolve(node: Node) -> Node:
    ref = node.schema["$ref"]
    target_file, target_schema = schema_tools.resolve_ref(node.file, ref)
    return Node(target_schema, target_file, ref.partition("#")[2])


def expand(node: Node, seen: frozenset[str] = frozenset()) -> list[Node]:
    """The node and every schema that must also hold for it ($ref and allOf)."""
    if not isinstance(node.schema, dict) or node.location in seen:
        return []
    seen = seen | {node.location}
    nodes = [node]
    if isinstance(node.schema.get("$ref"), str):
        nodes.extend(expand(resolve(node), seen))
    for index, option in enumerate(node.schema.get("allOf") or []):
        if isinstance(option, dict):
            nodes.extend(expand(node.child("allOf", index), seen))
    return nodes


def is_passthrough(node: Node) -> bool:
    """A schema with only a description is passed on as is, so nothing below it is checked."""
    return not any(k in node.schema for k in STRUCTURE_KEYWORDS)


def branch_keyword(schema: dict) -> str | None:
    for keyword in ("oneOf", "anyOf"):
        if isinstance(schema.get(keyword), list):
            return keyword
    return None


def allows_type(schema: dict, wanted: str) -> bool:
    types = schema.get("type")
    if types is None:
        return True
    if isinstance(types, str):
        types = [types]
    return wanted in types


# ---------------------------------------------------------------------------------------------
# Value checks, a minimal JSON schema validator for the keywords the common schemas use
# ---------------------------------------------------------------------------------------------


def value_types(value: Any) -> set[str]:
    if value is None:
        return {"null"}
    if isinstance(value, bool):
        return {"boolean"}
    if isinstance(value, int):
        return {"integer", "number"}
    if isinstance(value, float):
        return {"integer", "number"} if math.isfinite(value) and value.is_integer() else {"number"}
    if isinstance(value, str):
        return {"string"}
    if isinstance(value, list):
        return {"array"}
    if isinstance(value, dict):
        return {"object"}
    return set()


def json_equal(a: Any, b: Any) -> bool:
    if isinstance(a, bool) or isinstance(b, bool):
        return type(a) is type(b) and a == b
    return a == b


@functools.lru_cache(maxsize=None)
def compile_pattern(pattern: str) -> re.Pattern[str] | None:
    try:
        return re.compile(pattern)
    except re.error:
        return None


def pattern_matches(pattern: str, value: str) -> bool:
    compiled = compile_pattern(pattern)
    return compiled is None or compiled.search(value) is not None


def bound_violations(schema: dict, value: Any) -> list[str]:
    """The bound keywords of this schema that the value breaks."""
    broken: list[str] = []
    types = value_types(value)
    if "number" in types:
        if "minimum" in schema and value < schema["minimum"]:
            broken.append("minimum")
        if "maximum" in schema and value > schema["maximum"]:
            broken.append("maximum")
        if "exclusiveMinimum" in schema and value <= schema["exclusiveMinimum"]:
            broken.append("exclusiveMinimum")
        if "exclusiveMaximum" in schema and value >= schema["exclusiveMaximum"]:
            broken.append("exclusiveMaximum")
    if isinstance(value, str):
        if "minLength" in schema and len(value) < schema["minLength"]:
            broken.append("minLength")
        if "maxLength" in schema and len(value) > schema["maxLength"]:
            broken.append("maxLength")
    if isinstance(value, list):
        if "minItems" in schema and len(value) < schema["minItems"]:
            broken.append("minItems")
        if "maxItems" in schema and len(value) > schema["maxItems"]:
            broken.append("maxItems")
        if schema.get("uniqueItems") is True:
            dumped = [json.dumps(item, sort_keys=True, default=str) for item in value]
            if len(set(dumped)) != len(dumped):
                broken.append("uniqueItems")
    if isinstance(value, dict):
        if "minProperties" in schema and len(value) < schema["minProperties"]:
            broken.append("minProperties")
        if "maxProperties" in schema and len(value) > schema["maxProperties"]:
            broken.append("maxProperties")
    return broken


def extra_keys(schema: dict, value: dict) -> list[str]:
    """Keys that additionalProperties applies to on this schema object."""
    props = schema.get("properties") if isinstance(schema.get("properties"), dict) else {}
    patterns = schema.get("patternProperties") if isinstance(schema.get("patternProperties"), dict) else {}
    return [
        key
        for key in value
        if key not in props and not any(pattern_matches(p, str(key)) for p in patterns)
    ]


def own_valid(node: Node, value: Any) -> bool:
    """Checks the keywords of this schema object itself, without $ref and allOf."""
    schema = node.schema
    types = value_types(value)

    if "type" in schema:
        allowed = schema["type"] if isinstance(schema["type"], list) else [schema["type"]]
        if not types & set(allowed):
            return False
    if "enum" in schema and not any(json_equal(value, option) for option in schema["enum"]):
        return False
    if "const" in schema and not json_equal(value, schema["const"]):
        return False
    if isinstance(value, str) and isinstance(schema.get("pattern"), str):
        if not pattern_matches(schema["pattern"], value):
            return False
    if bound_violations(schema, value):
        return False

    if isinstance(value, dict):
        for key in schema.get("required") or []:
            if key not in value:
                return False
        props = schema.get("properties") if isinstance(schema.get("properties"), dict) else {}
        patterns = schema.get("patternProperties") if isinstance(schema.get("patternProperties"), dict) else {}
        for key, child in value.items():
            if key in props:
                if not valid(node.child("properties", key), child):
                    return False
            for pattern in patterns:
                if pattern_matches(pattern, str(key)) and not valid(node.child("patternProperties", pattern), child):
                    return False
        addl = schema.get("additionalProperties")
        for key in extra_keys(schema, value):
            if addl is False:
                return False
            if isinstance(addl, dict) and not valid(node.child("additionalProperties"), value[key]):
                return False

    if isinstance(value, list) and isinstance(schema.get("items"), dict):
        if not all(valid(node.child("items"), item) for item in value):
            return False

    keyword = branch_keyword(schema)
    if keyword:
        matching = sum(valid(node.child(keyword, i), value) for i in range(len(schema[keyword])))
        if matching == 0 or (keyword == "oneOf" and matching > 1):
            return False
    if isinstance(schema.get("not"), dict) and valid(node.child("not"), value):
        return False

    return True


def valid(node: Node, value: Any) -> bool:
    return all(own_valid(part, value) for part in expand(node))


# ---------------------------------------------------------------------------------------------
# Coverage items from the schema
# ---------------------------------------------------------------------------------------------


@dataclass
class Item:
    item_id: str
    category: str
    example_path: str


@dataclass
class Coverage:
    items: dict[str, Item] = field(default_factory=dict)
    covered: dict[str, set[str]] = field(default_factory=dict)

    def add(self, location: str, kind: str, category: str, path: str) -> None:
        item_id = f"{location} {kind}"
        if item_id not in self.items:
            self.items[item_id] = Item(item_id, category, path)

    def mark(self, location: str, kind: str, test: str) -> None:
        self.covered.setdefault(f"{location} {kind}", set()).add(test)


def collect_items(node: Node, path: str, coverage: Coverage, visited: set[str], in_branch: bool = False) -> None:
    for part in expand(node):
        schema = part.schema
        if part.location in visited:
            continue
        visited.add(part.location)
        if is_passthrough(part):
            continue
        location = part.location

        if "type" in schema:
            for type_name in schema["type"] if isinstance(schema["type"], list) else [schema["type"]]:
                coverage.add(location, f"type:{type_name}", "type", path)
        for option in schema.get("enum") or []:
            coverage.add(location, f"enum:{json.dumps(option)}", "enum", path)
        if isinstance(schema.get("pattern"), str):
            coverage.add(location, "pattern", "pattern", path)

        # A branch of oneOf/anyOf only fails as a whole, that is covered by oneOf-none on its parent
        if not in_branch or part is not node:
            if isinstance(schema.get("pattern"), str):
                coverage.add(location, "pattern-fail", "pattern-fail", path)
            for keyword in BOUND_KEYWORDS:
                if keyword in schema and not (keyword == "uniqueItems" and schema[keyword] is not True):
                    coverage.add(location, keyword, "bound", path)
            if allows_type(schema, "object"):
                for key in schema.get("required") or []:
                    coverage.add(location, f"required:{key}", "required", path)
                if schema.get("additionalProperties") is False and isinstance(schema.get("properties"), dict):
                    coverage.add(location, "additionalProperties", "additionalProperties", path)

        props = schema.get("properties")
        if isinstance(props, dict):
            for key, child in props.items():
                if isinstance(child, dict):
                    child_node = part.child("properties", key)
                    coverage.add(child_node.location, "key", "key", f"{path}/{key}")
                    collect_items(child_node, f"{path}/{key}", coverage, visited)
        patterns = schema.get("patternProperties")
        if isinstance(patterns, dict):
            for pattern, child in patterns.items():
                if isinstance(child, dict):
                    collect_items(part.child("patternProperties", pattern), f"{path}/*", coverage, visited)
        if isinstance(schema.get("additionalProperties"), dict):
            collect_items(part.child("additionalProperties"), f"{path}/*", coverage, visited)
        if isinstance(schema.get("items"), dict):
            collect_items(part.child("items"), f"{path}[]", coverage, visited)

        keyword = branch_keyword(schema)
        if keyword:
            coverage.add(location, f"{keyword}-none", "branch-none", path)
            for index, option in enumerate(schema[keyword]):
                if isinstance(option, dict):
                    coverage.add(location, f"{keyword}[{index}]", "branch", path)
                    collect_items(part.child(keyword, index), path, coverage, visited, in_branch=True)


# ---------------------------------------------------------------------------------------------
# Matching the test values to the items
# ---------------------------------------------------------------------------------------------


def walk(nodes: list[Node], value: Any, positive: bool, test: str, coverage: Coverage, in_branch: bool = False) -> None:
    """Marks the items that the value covers, for every schema in nodes (which must all hold)."""
    expanded: list[Node] = []
    seen: set[str] = set()
    for node in nodes:
        for part in expand(node):
            if part.location not in seen:
                seen.add(part.location)
                expanded.append((part, in_branch and part is node))
    if any(is_passthrough(part) for part, _ in expanded):
        return

    types = value_types(value)
    children: dict[Any, list[Node]] = {}
    item_nodes: list[Node] = []

    for part, is_branch_root in expanded:
        schema, location = part.schema, part.location

        if positive:
            if "type" in schema:
                for type_name in schema["type"] if isinstance(schema["type"], list) else [schema["type"]]:
                    if type_name in types:
                        coverage.mark(location, f"type:{type_name}", test)
            for option in schema.get("enum") or []:
                if json_equal(value, option):
                    coverage.mark(location, f"enum:{json.dumps(option)}", test)
            if isinstance(value, str) and isinstance(schema.get("pattern"), str):
                if pattern_matches(schema["pattern"], value):
                    coverage.mark(location, "pattern", test)
        elif not is_branch_root:
            if isinstance(value, str) and isinstance(schema.get("pattern"), str):
                if not pattern_matches(schema["pattern"], value):
                    coverage.mark(location, "pattern-fail", test)
            for keyword in bound_violations(schema, value):
                coverage.mark(location, keyword, test)
            if isinstance(value, dict):
                for key in schema.get("required") or []:
                    if key not in value:
                        coverage.mark(location, f"required:{key}", test)
                if schema.get("additionalProperties") is False and extra_keys(schema, value):
                    coverage.mark(location, "additionalProperties", test)

        if isinstance(value, dict):
            props = schema.get("properties") if isinstance(schema.get("properties"), dict) else {}
            patterns = schema.get("patternProperties") if isinstance(schema.get("patternProperties"), dict) else {}
            for key in value:
                if key in props and isinstance(props[key], dict):
                    child_node = part.child("properties", key)
                    coverage.mark(child_node.location, "key", test)
                    children.setdefault(key, []).append(child_node)
                    continue
                matched = False
                for pattern in patterns:
                    if pattern_matches(pattern, str(key)) and isinstance(patterns[pattern], dict):
                        children.setdefault(key, []).append(part.child("patternProperties", pattern))
                        matched = True
                if not matched and isinstance(schema.get("additionalProperties"), dict):
                    children.setdefault(key, []).append(part.child("additionalProperties"))

        if isinstance(value, list) and isinstance(schema.get("items"), dict):
            item_nodes.append(part.child("items"))

        keyword = branch_keyword(schema)
        if keyword:
            options = [i for i, o in enumerate(schema[keyword]) if isinstance(o, dict)]
            matching = [i for i in options if valid(part.child(keyword, i), value)]
            if positive:
                for index in matching:
                    coverage.mark(location, f"{keyword}[{index}]", test)
            elif not matching:
                coverage.mark(location, f"{keyword}-none", test)
            # Follow the matching branches, or every branch that takes this type when none matches
            follow = matching or [
                i for i in options if any(allows_type(schema[keyword][i], t) for t in types)
            ]
            for index in follow:
                walk([part.child(keyword, index)], value, positive, test, coverage, in_branch=True)

    for key, child_nodes in children.items():
        walk(child_nodes, value[key], positive, test, coverage)
    for item in value if item_nodes else []:
        walk(item_nodes, item, positive, test, coverage)


# ---------------------------------------------------------------------------------------------
# Test inputs
# ---------------------------------------------------------------------------------------------


def split_set_path(key: str) -> list[str]:
    """Splits a helm-unittest set key on dots, a backslash keeps a dot in the key."""
    parts, current, escaped = [], "", False
    for char in key:
        if escaped:
            current += char
            escaped = False
        elif char == "\\":
            escaped = True
        elif char == ".":
            parts.append(current)
            current = ""
        else:
            current += char
    parts.append(current)
    return parts


def deep_merge(target: dict, source: dict) -> dict:
    for key, value in source.items():
        if isinstance(value, dict) and isinstance(target.get(key), dict):
            deep_merge(target[key], value)
        else:
            target[key] = value
    return target


def expand_set(values: Any) -> dict:
    """The top level keys of set are paths, like with helm --set."""
    result: dict = {}
    if not isinstance(values, dict):
        return result
    for key, value in values.items():
        parts = split_set_path(str(key))
        nested: Any = value
        for part in reversed(parts):
            nested = {part: nested}
        deep_merge(result, json.loads(json.dumps(nested, default=str)))
    return result


def load_values_files(files: Any, suite_file: Path) -> dict:
    result: dict = {}
    for entry in files if isinstance(files, list) else []:
        for base in (suite_file.parent, TESTS_DIR.parent):
            candidate = base / str(entry)
            if candidate.is_file():
                deep_merge(result, yaml.safe_load(candidate.read_text(encoding="utf-8")) or {})
                break
    return result


class AnchorReusingLoader(yaml.SafeLoader):
    """Allows an anchor name to be defined again, the later one wins, as in the Go YAML parser."""

    def compose_node(self, parent: Any, index: Any) -> Any:
        event = self.peek_event()
        anchor = getattr(event, "anchor", None)
        if anchor is not None and not isinstance(event, yaml.AliasEvent):
            self.anchors.pop(anchor, None)
        return super().compose_node(parent, index)


def collect_tests() -> list[tuple[str, dict, bool]]:
    """Returns (name, values, positive) for every test of every suite."""
    tests: list[tuple[str, dict, bool]] = []
    for suite_file in sorted(TESTS_DIR.rglob("*.yaml")):
        suite = yaml.load(suite_file.read_text(encoding="utf-8"), Loader=AnchorReusingLoader)
        if not isinstance(suite, dict):
            continue
        suite_values = deep_merge(load_values_files(suite.get("values"), suite_file), expand_set(suite.get("set")))
        for index, test in enumerate(suite.get("tests") or []):
            if not isinstance(test, dict):
                continue
            values = json.loads(json.dumps(suite_values))
            deep_merge(values, load_values_files(test.get("values"), suite_file))
            deep_merge(values, expand_set(test.get("set")))
            asserts = test.get("asserts") or []
            negative = any(isinstance(a, dict) and any(k in a for k in NEGATIVE_ASSERTS) for a in asserts)
            name = f"{suite_file.relative_to(TESTS_DIR).as_posix()}#{index} {test.get('it', '')}"
            tests.append((name, values, not negative))
    return tests


# ---------------------------------------------------------------------------------------------
# Report
# ---------------------------------------------------------------------------------------------


def load_ignores() -> dict[str, str]:
    if not IGNORE_FILE.is_file():
        return {}
    data = yaml.safe_load(IGNORE_FILE.read_text(encoding="utf-8")) or {}
    ignores: dict[str, str] = {}
    for entry in data.get("ignore") or []:
        if not isinstance(entry, dict) or not entry.get("item") or not str(entry.get("reason", "")).strip():
            raise SystemExit(f"❌ {IGNORE_FILE.name}: every entry needs an item and a reason, got {entry!r}")
        ignores[entry["item"]] = entry["reason"]
    return ignores


def main() -> int:
    parser = argparse.ArgumentParser(description="Check that the common-test unittests cover the common values schema")
    parser.add_argument("--all", action="store_true", help="List every uncovered item (default: 50 per category)")
    parser.add_argument("--category", choices=sorted(CATEGORIES), action="append", help="Only report these categories")
    parser.add_argument("--json", type=Path, help="Write a machine-readable report to this file")
    parser.add_argument("--summary-md", type=Path, help="Write a Markdown table with the totals per category to this file")
    args = parser.parse_args()

    root = Node(load_json(ROOT_SCHEMA_FILE), ROOT_SCHEMA_FILE.resolve(), "")
    coverage = Coverage()
    collect_items(root, "$", coverage, set())

    tests = collect_tests()
    for name, values, positive in tests:
        walk([root], values, positive, name, coverage)

    ignores = load_ignores()
    stale = sorted(
        item_id for item_id in ignores if item_id not in coverage.items or item_id in coverage.covered
    )

    categories = args.category or list(CATEGORIES)
    report: dict[str, Any] = {"tests": len(tests), "categories": {}, "staleIgnores": stale}
    failed = bool(stale)

    print(f"Unittests read: {len(tests)} ({sum(1 for _, _, p in tests if not p)} failedTemplate tests)")
    for category in categories:
        items = [item for item in coverage.items.values() if item.category == category]
        missing = sorted(
            (item for item in items if item.item_id not in coverage.covered and item.item_id not in ignores),
            key=lambda item: (item.example_path, item.item_id),
        )
        ignored = sum(1 for item in items if item.item_id in ignores)
        covered = len(items) - len(missing) - ignored
        percent = (covered + ignored) / len(items) * 100.0 if items else 100.0
        failed = failed or bool(missing)
        report["categories"][category] = {
            "total": len(items),
            "covered": covered,
            "ignored": ignored,
            "missing": [{"item": m.item_id, "path": m.example_path} for m in missing],
        }

        print("\n" + "=" * 80)
        print(f"UNITTEST COVERAGE: {CATEGORIES[category]} [{category}]")
        print("=" * 80)
        print(f"TOTAL {len(items)}")
        print(f"COVERED {covered}")
        print(f"IGNORED {ignored}")
        print(f"MISSING {len(missing)}")
        print(f"COVERAGE_PERCENT {percent:.2f}")
        shown = missing if args.all else missing[:50]
        if shown:
            print("\nUNCOVERED")
            for item in shown:
                location, _, kind = item.item_id.rpartition(" ")
                print(f"{item.example_path} [{kind}] ({location})")
            if len(missing) > len(shown):
                print(f"... and {len(missing) - len(shown)} more (use --all)")

    if stale:
        print("\n❌ Stale entries in unittest-coverage-ignore.yaml (unknown or already covered):")
        for item_id in stale:
            print(f"  {item_id}")

    if args.json:
        args.json.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")

    if args.summary_md:
        lines = ["| Category | Covered | Ignored | Missing | Total | Coverage |", "| --- | --- | --- | --- | --- | --- |"]
        for category, data in report["categories"].items():
            missing = len(data["missing"])
            percent = (data["total"] - missing) / data["total"] * 100.0 if data["total"] else 100.0
            mark = "✅" if not missing else "❌"
            lines.append(
                f"| {mark} {CATEGORIES[category]} | {data['covered']} | {data['ignored']} | {missing} | {data['total']} | {percent:.2f}% |"
            )
        if stale:
            lines.append("")
            lines.append(f"❌ {len(stale)} stale entries in `unittest-coverage-ignore.yaml`.")
        args.summary_md.write_text("\n".join(lines) + "\n", encoding="utf-8")

    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
