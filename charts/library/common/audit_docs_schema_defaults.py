import argparse
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import yaml


KEY_ROW_RE = re.compile(r"^\|\s*Key\s*\|\s*`([^`]+)`\s*\|", re.IGNORECASE)
DEFAULT_ROW_RE = re.compile(r"^\|\s*Default\s*\|\s*(.*?)\s*\|", re.IGNORECASE)
VALUES_PREFIX_RE = re.compile(r"^\.Values\.")


@dataclass
class Candidate:
    key_path: str
    value: Any
    source: str


@dataclass
class Located:
    schema_file: Path
    node: dict


def normalize_key(raw_key: str) -> str:
    key = VALUES_PREFIX_RE.sub("", raw_key.strip())
    segments = [segment for segment in key.split(".") if segment]
    segments = [segment for segment in segments if not segment.startswith("$")]
    return ".".join(segments)


def candidate_paths(key: str) -> list[str]:
    out: list[str] = [key]

    if key.startswith("podOptions."):
        out.append(key[len("podOptions.") :])

    if key == "securityContext.container":
        out.append("securityContext")
    if key.startswith("securityContext.container."):
        out.append(f"securityContext.{key[len('securityContext.container.'):]}")

    if key == "securityContext.pod":
        out.append("workload.objectname.podSpec.securityContext")
    if key.startswith("securityContext.pod."):
        out.append(f"workload.objectname.podSpec.securityContext.{key[len('securityContext.pod.'):]}")

    dedup: list[str] = []
    seen: set[str] = set()
    for item in out:
        normalized = normalize_key(item)
        if not normalized or normalized in seen:
            continue
        seen.add(normalized)
        dedup.append(normalized)
    return dedup


def parse_default_cell(raw: str) -> tuple[bool, Any]:
    value = raw.strip()
    if not value:
        return False, None

    lower = value.lower()
    if lower in {"-", "unset", "none"}:
        return False, None
    if "see [here]" in lower:
        return False, None

    if value.startswith("`") and value.endswith("`") and len(value) >= 2:
        value = value[1:-1].strip()

    if value.lower() in {"", "none", "unset"}:
        return False, None

    try:
        parsed = yaml.safe_load(value)
    except Exception:
        return True, value

    return True, parsed


def iter_defaults_yaml_blocks(markdown: str) -> list[dict]:
    blocks: list[dict] = []
    lines = markdown.splitlines()
    i = 0
    while i < len(lines):
        if lines[i].strip().lower() in {"## defaults", "### defaults"}:
            j = i + 1
            while j < len(lines) and not lines[j].strip().startswith("```"):
                j += 1
            if j >= len(lines) or not lines[j].strip().startswith("```yaml"):
                i += 1
                continue
            k = j + 1
            payload: list[str] = []
            while k < len(lines) and not lines[k].strip().startswith("```"):
                payload.append(lines[k])
                k += 1
            if payload:
                try:
                    obj = yaml.safe_load("\n".join(payload))
                except Exception:
                    obj = None
                if isinstance(obj, dict):
                    blocks.append(obj)
            i = k + 1
            continue
        i += 1
    return blocks


def flatten(node: Any, prefix: str = "") -> list[tuple[str, Any]]:
    out: list[tuple[str, Any]] = []
    if isinstance(node, dict):
        if prefix:
            out.append((prefix, node))
        for key, value in node.items():
            if not isinstance(key, str):
                continue
            next_prefix = f"{prefix}.{key}" if prefix else key
            out.extend(flatten(value, next_prefix))
    elif isinstance(node, list):
        if prefix:
            out.append((prefix, node))
    else:
        if prefix:
            out.append((prefix, node))
    return out


def collect_candidates_from_markdown(path: Path) -> list[Candidate]:
    text = path.read_text(encoding="utf-8")
    lines = text.splitlines()
    candidates: list[Candidate] = []

    for i, line in enumerate(lines):
        key_match = KEY_ROW_RE.match(line.strip())
        if not key_match:
            continue
        raw_key = key_match.group(1)
        if "$" in raw_key:
            continue
        key = normalize_key(raw_key)
        window = lines[i + 1 : i + 25]
        for wline in window:
            default_match = DEFAULT_ROW_RE.match(wline.strip())
            if not default_match:
                continue
            ok, value = parse_default_cell(default_match.group(1))
            if ok:
                candidates.append(Candidate(key_path=key, value=value, source=f"{path.name}:table"))
            break

    for block in iter_defaults_yaml_blocks(text):
        for key, value in flatten(block):
            candidates.append(Candidate(key_path=normalize_key(key), value=value, source=f"{path.name}:defaults-block"))

    dedup: dict[str, Candidate] = {}
    for candidate in candidates:
        dedup[candidate.key_path] = candidate

    return list(dedup.values())


def load_schema(path: Path, cache: dict[Path, dict]) -> dict:
    resolved = path.resolve()
    if resolved not in cache:
        cache[resolved] = json.loads(resolved.read_text())
    return cache[resolved]


def first_ref_target(node: dict, current_file: Path) -> Path | None:
    if isinstance(node, dict) and isinstance(node.get("$ref"), str):
        ref = node["$ref"]
        if not ref.startswith("#") and "://" not in ref:
            ref_path = ref.split("#", 1)[0]
            if ref_path:
                target = (current_file.parent / ref_path).resolve()
                if target.exists():
                    return target

    if isinstance(node, dict) and isinstance(node.get("allOf"), list):
        for entry in node["allOf"]:
            if isinstance(entry, dict) and isinstance(entry.get("$ref"), str):
                ref = entry["$ref"]
                if not ref.startswith("#") and "://" not in ref:
                    ref_path = ref.split("#", 1)[0]
                    if ref_path:
                        target = (current_file.parent / ref_path).resolve()
                        if target.exists():
                            return target
    return None


def locate_property(root_file: Path, key_path: str, cache: dict[Path, dict]) -> Located | None:
    segments = [segment for segment in key_path.split(".") if segment]
    current_file = root_file.resolve()
    current_schema = load_schema(current_file, cache)
    holder: tuple[Path, dict] | None = None

    for index, segment in enumerate(segments):
        props = current_schema.get("properties") if isinstance(current_schema, dict) else None
        if not isinstance(props, dict) or segment not in props:
            return None

        node = props[segment]
        holder = (current_file, node)

        if index < len(segments) - 1:
            if isinstance(node, dict) and isinstance(node.get("properties"), dict):
                current_schema = node
                continue
            target = first_ref_target(node, current_file)
            if target is None:
                return None
            current_file = target
            current_schema = load_schema(current_file, cache)

    if holder is None:
        return None

    return Located(schema_file=holder[0], node=holder[1])


def merge_parent_default(existing: Any, tail_key: str, value: Any) -> Any:
    base = existing if isinstance(existing, dict) else {}
    merged = dict(base)
    merged[tail_key] = value
    return merged


def is_mismatch(existing: Any, expected: Any, node: dict) -> bool:
    if isinstance(expected, dict) and isinstance(node.get("properties"), dict):
        if existing is None:
            return True
        if not isinstance(existing, dict):
            return True
        for key, value in expected.items():
            if existing.get(key) != value:
                return True
        return False
    return existing != expected


def main() -> int:
    parser = argparse.ArgumentParser(description="Audit schema defaults against docs defaults only")
    parser.add_argument("--base", default=str(Path(__file__).resolve().parent), help="Path to charts/library/common")
    parser.add_argument("--apply", action="store_true", help="Apply missing/changed defaults to schema files")
    parser.add_argument("--include-values-schema", action="store_true", help="Also include values.schema.json in updates")
    args = parser.parse_args()

    base = Path(args.base).resolve()
    docs_dir = base / "docs"
    root_schema = base / "values.schema.json"

    all_candidates: dict[str, Candidate] = {}
    for md in sorted(docs_dir.rglob("*.md")):
        for candidate in collect_candidates_from_markdown(md):
            all_candidates[candidate.key_path] = candidate

    schema_cache: dict[Path, dict] = {}
    unresolved: list[str] = []
    updates: list[tuple[Path, str, Any, Any, str, dict]] = []

    for key, candidate in sorted(all_candidates.items()):
        matched = False
        for key_path in candidate_paths(key):
            located = locate_property(root_schema, key_path, schema_cache)

            if located is None and key_path.startswith("fallbackDefaults"):
                alt = f"global.{key_path}"
                located = locate_property(root_schema, alt, schema_cache)
                if located is not None:
                    key_path = alt

            if located is not None:
                if not args.include_values_schema and located.schema_file == root_schema.resolve():
                    matched = True
                    break

                if not str(located.schema_file).startswith(str((base / "schemas").resolve())):
                    matched = True
                    break

                existing = located.node.get("default")
                if is_mismatch(existing, candidate.value, located.node):
                    updates.append((located.schema_file, key_path, existing, candidate.value, candidate.source, located.node))

                matched = True
                break

            segments = [segment for segment in key_path.split(".") if segment]
            for index in range(len(segments) - 1, 0, -1):
                parent = ".".join(segments[:index])
                tail = ".".join(segments[index:])
                parent_located = locate_property(root_schema, parent, schema_cache)
                if parent_located is None:
                    continue
                if not isinstance(parent_located.node, dict):
                    continue
                if not args.include_values_schema and parent_located.schema_file == root_schema.resolve():
                    matched = True
                    break
                if not str(parent_located.schema_file).startswith(str((base / "schemas").resolve())):
                    matched = True
                    break

                merged = merge_parent_default(parent_located.node.get("default"), tail, candidate.value)
                if is_mismatch(parent_located.node.get("default"), merged, parent_located.node):
                    updates.append((parent_located.schema_file, parent, parent_located.node.get("default"), merged, candidate.source, parent_located.node))
                matched = True
                break

            if matched:
                break

        if not matched:
            fallback_schema = (base / "schemas" / f"{key}.json").resolve()
            if "." not in key and fallback_schema.exists():
                doc = load_schema(fallback_schema, schema_cache)
                existing = doc.get("default")
                if is_mismatch(existing, candidate.value, doc):
                    updates.append((fallback_schema, key, existing, candidate.value, candidate.source, doc))
                continue
            unresolved.append(candidate.key_path)

    touched: dict[Path, bool] = {}
    if args.apply:
        for schema_file, _key, _old, new, _source, node in updates:
            _doc = load_schema(schema_file, schema_cache)
            node["default"] = new
            touched[schema_file.resolve()] = True

        for schema_file in sorted(touched):
            doc = schema_cache[schema_file]
            schema_file.write_text(json.dumps(doc, indent=2, ensure_ascii=False) + "\n")

    print(f"DOCS_KEYS_PARSED {len(all_candidates)}")
    print(f"UPDATES_NEEDED {len(updates)}")
    print(f"UNRESOLVED {len(sorted(set(unresolved)))}")

    for schema_file, key, old, new, source, _node in updates:
        rel = schema_file.relative_to(base)
        print(f"UPDATE {rel} | {key} | {old!r} -> {new!r} | source={source}")

    if unresolved:
        print("UNRESOLVED_KEYS")
        for key in sorted(set(unresolved)):
            print(key)

    if args.apply:
        print(f"FILES_TOUCHED {len(touched)}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
