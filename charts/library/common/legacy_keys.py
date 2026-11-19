#!/usr/bin/env python3
"""Keys that charts under charts/stable and charts/incubator set, but that no template of common reads.

The templates of common are leading. The keys are listed in stable-legacy-keys.yaml, so they are not in
the values schema. The scripts that read the values of the charts (test_schema.py and
generate_complete_values_structure.py) leave them out, so the charts stay valid and the keys do not end up
in the schema.
"""

from pathlib import Path
from typing import Any

import yaml


BLACKLIST_FILE = Path(__file__).resolve().parent / "stable-legacy-keys.yaml"


def load_legacy_paths(blacklist_file: Path = BLACKLIST_FILE) -> list[str]:
    """The dotted key paths of the blacklist. A `*` matches any one key."""
    if not blacklist_file.is_file():
        return []
    data = yaml.safe_load(blacklist_file.read_text(encoding="utf-8")) or {}
    paths: list[str] = []
    for entry in data.get("keys") or []:
        if not isinstance(entry, dict) or not entry.get("path") or not str(entry.get("reason", "")).strip():
            raise SystemExit(f"❌ {blacklist_file.name}: every entry needs a path and a reason, got {entry!r}")
        paths.append(str(entry["path"]))
    return paths


def _remove(node: Any, parts: list[str]) -> bool:
    """Remove the key at parts below node. Returns whether a key was removed."""
    if not isinstance(node, dict) or not parts:
        return False
    head, rest = parts[0], parts[1:]
    keys = list(node) if head == "*" else ([head] if head in node else [])
    removed = False
    for key in keys:
        if rest:
            removed = _remove(node[key], rest) or removed
        else:
            del node[key]
            removed = True
    return removed


def strip_legacy_keys(values: Any, paths: list[str]) -> set[str]:
    """Remove the blacklisted keys from the values of a chart, in place. Returns the paths that matched."""
    matched: set[str] = set()
    for path in paths:
        if _remove(values, path.split(".")):
            matched.add(path)
    return matched


def stale_paths(paths: list[str], used: set[str]) -> list[str]:
    """Blacklist entries that no chart sets anymore, and can be removed."""
    return [path for path in paths if path not in used]
