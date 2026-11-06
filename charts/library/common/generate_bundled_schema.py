#!/usr/bin/env python3
"""Bundle values.schema.source.json and schemas/ into a single values.schema.json.

Helm only has the schema file itself when it validates a packaged chart, so the
schema it reads can not reference other files. Every referenced file becomes an
entry under "definitions", and every "$ref" points inside the bundled file.
"""

import argparse
import json
import sys
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent
SOURCE_FILE = BASE_DIR / "values.schema.source.json"
OUTPUT_FILE = BASE_DIR / "values.schema.json"
# Only used by the docs generator and the structure of a single file
DROPPED_KEYS = {"$id", "$schema", "x-docs-required", "x-docs-helmTpl", "x-docs-defaultRaw", "x-docs-appliesTo", "x-docs-page", "x-docs-primary", "x-helm-tpl"}


def definition_name(path: Path, source_file: Path) -> str:
    relative = path.relative_to(source_file.parent / "schemas").with_suffix("")
    return ".".join(relative.parts)


def bundle(source_file: Path) -> dict:
    definitions: dict[str, object] = {}

    def resolve_ref(ref: str, current_file: Path) -> str:
        file_part, _, fragment = ref.partition("#")
        target = (current_file.parent / file_part).resolve() if file_part else current_file
        if not target.exists():
            raise FileNotFoundError(f"{current_file}: $ref [{ref}] points to a missing file")
        if target == source_file:
            return f"#{fragment}"
        name = definition_name(target, source_file)
        if name not in definitions:
            definitions[name] = None
            definitions[name] = load(target)
        return f"#/definitions/{name}{fragment}"

    def rewrite(node: object, current_file: Path) -> object:
        if isinstance(node, dict):
            result = {}
            for key, value in node.items():
                if key in DROPPED_KEYS and not isinstance(value, dict):
                    continue
                if key == "$ref" and isinstance(value, str):
                    result[key] = resolve_ref(value, current_file)
                else:
                    result[key] = rewrite(value, current_file)
            return result
        if isinstance(node, list):
            return [rewrite(item, current_file) for item in node]
        return node

    def load(path: Path) -> object:
        return rewrite(json.loads(path.read_text(encoding="utf-8")), path)

    root = load(source_file)
    if "definitions" in root:
        raise ValueError(f"{source_file}: the [definitions] key is reserved for the bundled files")
    bundled = {"$schema": "http://json-schema.org/draft-07/schema#", **root}
    bundled["definitions"] = {name: definitions[name] for name in sorted(definitions)}
    return bundled


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=SOURCE_FILE, help="Path to the source schema")
    parser.add_argument("--output", type=Path, default=OUTPUT_FILE, help="Path to the bundled schema")
    parser.add_argument("--check", action="store_true", help="Fail when the output is not up to date")
    args = parser.parse_args()

    content = json.dumps(bundle(args.source.resolve()), indent=1, ensure_ascii=False) + "\n"

    if args.check:
        if not args.output.exists() or args.output.read_text(encoding="utf-8") != content:
            print(f"{args.output} is not up to date, run {Path(__file__).name}", file=sys.stderr)
            return 1
        print(f"{args.output.name} is up to date")
        return 0

    args.output.write_text(content, encoding="utf-8")
    print(f"Wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
