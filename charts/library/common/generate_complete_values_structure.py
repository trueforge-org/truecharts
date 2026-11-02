#!/usr/bin/env python3

"""
Generate complete-values-structure.yaml from all chart values files.

This script collects all values.yaml files from:
- All charts under charts/stable/* and charts/incubator/*
- Common-test ci-values from charts/library/common-test/ci/*values.yaml
- Common values.yaml from charts/library/common/values.yaml
- Keys listed under `set:` in common-test unittests (charts/library/common-test/tests/**/*_test.yaml)

It merges them into a comprehensive structure showing all possible keys,
while preserving comments from the existing file where they exist.
"""

import argparse
import copy
import sys
import warnings
from pathlib import Path
from typing import Any, Dict, List

# Try to import ruamel.yaml first (preserves comments), fall back to PyYAML
try:
    from ruamel.yaml import YAML
    HAS_RUAMEL = True
except ImportError:
    import yaml
    HAS_RUAMEL = False
    print("Warning: ruamel.yaml not found. Comments will not be preserved.", file=sys.stderr)
    print("Install with: pip install ruamel.yaml", file=sys.stderr)


def merge_duplicate_pairs(constructor: Any, pairs: List[Any], source: str, line_offset: int = 0) -> List[Any]:
    """
    Merge the repeated keys of one YAML mapping, which loaders reject or silently overwrite.

    Mappings under the same key are merged, keeping the keys of both. For other values the
    last one wins, as in PyYAML. Every repeated key is reported as a warning.
    """
    merged: List[Any] = []
    index_of: Dict[Any, int] = {}
    for key_node, value_node in pairs:
        key = constructor.construct_object(key_node, deep=True)
        try:
            index = index_of.get(key)
        except TypeError:
            merged.append((key_node, value_node))
            continue
        if index is None:
            index_of[key] = len(merged)
            merged.append((key_node, value_node))
            continue

        first_key_node, first_value = merged[index]
        if first_value.id == "mapping" and value_node.id == "mapping":
            combined = copy.copy(first_value)
            combined.value = first_value.value + value_node.value
            merged[index] = (first_key_node, combined)
            action = "merged"
        else:
            merged[index] = (first_key_node, value_node)
            action = "last value kept"
        line = key_node.start_mark.line + 1 + line_offset
        print(f"Warning: {source}: duplicate key '{key}' at line {line} ({action})", file=sys.stderr)
    return merged


def make_yaml_loader(source: str, line_offset: int = 0) -> Any:
    """Return a ruamel round-trip loader that merges repeated mapping keys instead of failing on them."""
    from ruamel.yaml.constructor import RoundTripConstructor

    class DuplicateKeyMergingConstructor(RoundTripConstructor):
        def construct_mapping(self, node, maptyp, deep=False):
            if node.id == "mapping":
                node.value = merge_duplicate_pairs(self, node.value, source, line_offset)
            return super().construct_mapping(node, maptyp, deep)

    yaml_loader = YAML()
    yaml_loader.Constructor = DuplicateKeyMergingConstructor
    yaml_loader.preserve_quotes = True
    yaml_loader.default_flow_style = False
    return yaml_loader


def make_safe_loader(source: str) -> Any:
    """Return a PyYAML loader that merges repeated mapping keys instead of silently overwriting them."""
    import yaml

    class DuplicateKeyMergingLoader(yaml.SafeLoader):
        def construct_mapping(self, node, deep=False):
            if node.id == "mapping":
                node.value = merge_duplicate_pairs(self, node.value, source)
            return super().construct_mapping(node, deep=deep)

    return DuplicateKeyMergingLoader


def load_yaml_file(file_path: Path) -> Dict[str, Any]:
    """Load a YAML file and return its content."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            if HAS_RUAMEL:
                content = make_yaml_loader(str(file_path)).load(f)
            else:
                content = yaml.load(f, Loader=make_safe_loader(str(file_path)))
            return content if isinstance(content, dict) else {}
    except Exception as e:
        print(f"Warning: Failed to load {file_path}: {e}", file=sys.stderr)
        return {}


def merge_structures(base: Any, new: Any, path: str = "") -> Any:
    """
    Recursively merge two structures, preserving all keys.
    
    For dicts: merge keys, use placeholder 'objectname' for variable keys.
    For lists: keep first non-empty list found.
    For primitives: keep base value if it exists, else use new.
    """
    # If base is None or empty, return new
    if base is None or (isinstance(base, dict) and not base):
        return new
    
    # If new is None or empty, return base
    if new is None or (isinstance(new, dict) and not new):
        return base
    
    # Both are dicts - merge them
    if isinstance(base, dict) and isinstance(new, dict):
        result = dict(base)
        for key, value in new.items():
            if key in result:
                result[key] = merge_structures(result[key], value, f"{path}.{key}")
            else:
                result[key] = value
        return result
    
    # Both are lists - prefer base if non-empty, else new
    if isinstance(base, list) and isinstance(new, list):
        if base:
            return base
        return new
    
    # Different types or primitives - keep base
    return base


# Parent keys that contain variable-named child objects
# These are configuration sections where users define their own object names
PARENT_KEYS_WITH_VARIABLE_CHILDREN = {
    'workload',      # workload.main, workload.backup, etc.
    'service',       # service.main, service.api, etc.
    'persistence',   # persistence.config, persistence.data, etc.
    'configmap',     # configmap.myconfig, configmap.settings, etc.
    'secret',        # secret.mysecret, secret.credentials, etc.
    'ingress',       # ingress.main, ingress.api, etc.
    'route',         # route.main, route.api, etc.
    'containers',    # containers.main, containers.sidecar, etc.
    'initContainers',# initContainers.init, initContainers.setup, etc.
    'ports',         # ports.main, ports.http, ports.metrics, etc.
    'hosts',         # hosts.main, hosts.api, etc.
    'middlewares',   # middlewares.auth, middlewares.rate-limit, etc.
    'rules',         # Various rules with variable names
    'backups',       # backups.daily, backups.weekly, etc.
    'pooler',        # pooler.ro, pooler.rw, etc.
}


def normalize_value_to_placeholder(value: Any) -> Any:
    """
    Convert actual values to appropriate placeholders.
    - Strings become ""
    - Numbers become 0 (or keep if likely a config value like port)
    - Booleans stay as-is
    - Lists: keep first element as example (shows structure)
    - Dicts: retain structure with normalized values
    
    Note: List normalization only preserves the first element pattern.
    """
    if value is None:
        return None
    elif isinstance(value, bool):
        return value  # Keep booleans as-is
    elif isinstance(value, str):
        return ""  # Always return empty string for string placeholders
    elif isinstance(value, (int, float)):
        # Keep small numbers that might be config values, zero out large ones
        if isinstance(value, int) and 0 <= value <= 100:
            return value  # Likely a config value
        return 0
    elif isinstance(value, list):
        if not value:
            return []
        # Keep first element as example (preserves structure pattern)
        # Note: This shows the structure but doesn't preserve all list variations
        return [normalize_value_to_placeholder(value[0])]
    elif isinstance(value, dict):
        # Keep structure but normalize all values
        if HAS_RUAMEL:
            from ruamel.yaml.comments import CommentedMap
            result = CommentedMap() if isinstance(value, CommentedMap) else {}
        else:
            result = {}
        for k, v in value.items():
            result[k] = normalize_value_to_placeholder(v)
        return result
    else:
        return value


def normalize_variable_keys(data: Any, parent_key: str = "", in_operator: bool = False) -> Any:
    """
    Replace variable dictionary keys with 'objectname' placeholder for known
    parent keys that contain user-defined object names.
    
    For example:
        workload.main -> workload.objectname
        service.main -> service.objectname
        persistence.config -> persistence.objectname

    The settings under an `operator` key (eg dependencies.valkey.operator or
    dependencies.postgresql.operator) have a fixed structure, so their keys are
    never replaced.
    """
    if not isinstance(data, dict):
        return data
    
    if HAS_RUAMEL:
        from ruamel.yaml.comments import CommentedMap
        is_commented = isinstance(data, CommentedMap)
        result = CommentedMap() if is_commented else {}
    else:
        result = {}
    
    # Check if current parent_key is one that contains variable-named children
    if parent_key in PARENT_KEYS_WITH_VARIABLE_CHILDREN and not in_operator:
        # This dict contains variable-named objects
        # Merge all the child objects into a single 'objectname' entry, so keys that only some children set are kept
        if data:
            template = None
            for child_key, child_value in data.items():
                normalized_child = normalize_variable_keys(child_value, child_key, in_operator)
                template = merge_into_structure(template, normalized_child)
            result['objectname'] = template
            return result
        else:
            return result
    
    # Not a parent with variable children, process each key normally
    for key, value in data.items():
        # Recursively process, passing the current key as parent_key for next level
        result[key] = normalize_variable_keys(value, key, in_operator or key == "operator")
    
    return result


def collect_all_values_files(repo_root: Path) -> List[Path]:
    """Collect all values.yaml files from charts and common-test."""
    values_files = []
    
    # Collect from charts/stable/*
    stable_dir = repo_root / "charts" / "stable"
    if stable_dir.exists():
        for chart_dir in stable_dir.iterdir():
            if chart_dir.is_dir():
                values_file = chart_dir / "values.yaml"
                if values_file.exists():
                    values_files.append(values_file)
    
    # Collect from charts/incubator/*
    incubator_dir = repo_root / "charts" / "incubator"
    if incubator_dir.exists():
        for chart_dir in incubator_dir.iterdir():
            if chart_dir.is_dir():
                values_file = chart_dir / "values.yaml"
                if values_file.exists():
                    values_files.append(values_file)
    
    # Collect from common-test ci-values
    common_test_ci_dir = repo_root / "charts" / "library" / "common-test" / "ci"
    if common_test_ci_dir.exists():
        for values_file in common_test_ci_dir.glob("*values.yaml"):
            if values_file.is_file():
                values_files.append(values_file)
    
    # Add common-test main values files
    common_test_dir = repo_root / "charts" / "library" / "common-test"
    if common_test_dir.exists():
        for name in ["values.yaml", "unit-values.yaml", "default-values.yaml"]:
            values_file = common_test_dir / name
            if values_file.exists():
                values_files.append(values_file)
    
    # Add common values.yaml (this should be processed first/last depending on priority)
    common_values = repo_root / "charts" / "library" / "common" / "values.yaml"
    if common_values.exists():
        values_files.insert(0, common_values)  # Add at beginning for base structure
    
    return values_files


def collect_unittest_files(repo_root: Path) -> List[Path]:
    """Collect the helm-unittest files of common-test, in a stable order."""
    tests_dir = repo_root / "charts" / "library" / "common-test" / "tests"
    if not tests_dir.exists():
        return []
    return sorted(tests_dir.rglob("*_test.yaml"))


def expects_template_failure(test: Dict[str, Any]) -> bool:
    """Return True if a unittest asserts that rendering fails, so its `set:` values are invalid on purpose."""
    return any(isinstance(a, dict) and "failedTemplate" in a for a in test.get("asserts") or [])


def load_unittest_set_values(file_path: Path) -> List[Dict[str, Any]]:
    """
    Return the `set:` blocks of a helm-unittest file.

    `set:` can be on the suite and on each test. Its keys are chart values,
    so they are merged like the keys of the values files. Tests that expect
    a template failure are skipped, as their values are invalid on purpose
    (eg `targetSelector` given as a mapping to check that it is rejected).
    """
    with warnings.catch_warnings():
        # ruamel warns when a unittest file reuses an anchor across its tests
        warnings.simplefilter("ignore")
        suite = load_yaml_file(file_path)

    set_blocks = []
    if isinstance(suite.get("set"), dict):
        set_blocks.append(suite["set"])
    for test in suite.get("tests") or []:
        if isinstance(test, dict) and isinstance(test.get("set"), dict) and not expects_template_failure(test):
            set_blocks.append(test["set"])
    return set_blocks


def merge_into_structure(complete_structure: Any, data: Dict[str, Any]) -> Any:
    """Merge a values dict into the complete structure, keeping comments when possible."""
    if HAS_RUAMEL and complete_structure:
        return merge_preserving_comments(complete_structure, data)
    return merge_structures(complete_structure, data)


def load_existing_with_comments(file_path: Path) -> Any:
    """Load existing file with comments preserved using ruamel.yaml."""
    if not HAS_RUAMEL:
        return {}
    
    if not file_path.exists():
        return None
    
    try:
        # Read file and skip header comments
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Find where the actual YAML content starts (after the header block)
        lines = content.split('\n')
        yaml_start = 0
        in_header = False
        for i, line in enumerate(lines):
            if line.strip().startswith('# ============'):
                in_header = True
            elif in_header and line.strip() and not line.strip().startswith('#'):
                yaml_start = i
                break
            elif in_header and i > 0 and not line.strip():
                # Empty line after header block
                yaml_start = i + 1
        
        # Load only the YAML content part
        yaml_content = '\n'.join(lines[yaml_start:])
        yaml_loader = make_yaml_loader(str(file_path), line_offset=yaml_start)
        yaml_loader.width = 120
        yaml_loader.indent(mapping=2, sequence=2, offset=0)
        return yaml_loader.load(yaml_content)
    except Exception as e:
        print(f"Warning: Failed to load existing file with comments: {e}", file=sys.stderr)
        return None


def merge_preserving_comments(base: Any, new: Any) -> Any:
    """
    Merge new data into base while preserving comments in base.
    Only works with ruamel.yaml CommentedMap/CommentedSeq objects.
    """
    if not HAS_RUAMEL:
        return merge_structures(base, new)
    
    from ruamel.yaml.comments import CommentedMap, CommentedSeq
    
    # If base doesn't exist, return new (no comments to preserve)
    if base is None:
        return new
    
    # If new doesn't exist, return base (preserve everything)
    if new is None:
        return base
    
    # Both are dicts - merge keys while preserving comments
    if isinstance(base, (dict, CommentedMap)) and isinstance(new, dict):
        # Work with base to preserve its comments
        for key, new_value in new.items():
            if key in base:
                # Recursively merge
                base[key] = merge_preserving_comments(base[key], new_value)
            else:
                # Add new key
                base[key] = new_value
        return base
    
    # Both are lists - use base to preserve comments
    if isinstance(base, (list, CommentedSeq)) and isinstance(new, list):
        # If base has content, keep it; otherwise use new
        return base if base else new
    
    # For primitives, prefer base to keep context, unless it's empty/None
    if base or base == 0 or base is False:
        return base
    return new


def generate_complete_structure(repo_root: Path, existing_file: Path = None) -> Dict[str, Any]:
    """Generate the complete values structure from all charts."""
    print("Collecting values files...", file=sys.stderr)
    values_files = collect_all_values_files(repo_root)
    print(f"Found {len(values_files)} values files to process", file=sys.stderr)
    
    # Try to load existing file with comments first
    if existing_file and existing_file.exists() and HAS_RUAMEL:
        print(f"Loading existing file to preserve comments: {existing_file}", file=sys.stderr)
        complete_structure = load_existing_with_comments(existing_file)
        if complete_structure is None:
            complete_structure = {}
    else:
        complete_structure = {}
    
    for i, values_file in enumerate(values_files, 1):
        if i % 100 == 0:
            print(f"Processing {i}/{len(values_files)}...", file=sys.stderr)
        
        values_data = load_yaml_file(values_file)
        complete_structure = merge_into_structure(complete_structure, values_data)

    unittest_files = collect_unittest_files(repo_root)
    print(f"Found {len(unittest_files)} common-test unittest files", file=sys.stderr)
    for unittest_file in unittest_files:
        for set_values in load_unittest_set_values(unittest_file):
            complete_structure = merge_into_structure(complete_structure, set_values)
    
    print("Merge complete. Normalizing structure...", file=sys.stderr)
    
    # Apply normalization: replace variable keys with 'objectname' and values with placeholders
    complete_structure = normalize_variable_keys(complete_structure)
    complete_structure = normalize_value_to_placeholder(complete_structure)
    
    print("Structure generated and normalized.", file=sys.stderr)
    return complete_structure


def write_complete_structure(output_path: Path, structure: Dict[str, Any]) -> None:
    """Write the complete structure to a YAML file with header comments."""
    header = """# =============================================================================
# TRUECHARTS COMMON LIBRARY - COMPLETE VALUES STRUCTURE
# =============================================================================
# This file showcases ALL possible configuration keys available in the
# TrueCharts Common Library Chart. Use this as a reference when creating
# chart values.yaml files.
#
# This file is AUTOMATICALLY GENERATED by generate_complete_values_structure.py
# Do not edit manually - run the script to regenerate.
#
# Notes:
# - "objectname" is used as a placeholder for variable-named objects
# - Values shown are placeholders (actual values don't matter)
# - Focus is on showing structure: objects, arrays, and all possible keys
# - ALL documented features are included, not just defaults
# =============================================================================

"""
    
    if HAS_RUAMEL:
        yaml_writer = YAML()
        yaml_writer.preserve_quotes = True
        yaml_writer.default_flow_style = False
        yaml_writer.width = 120
        yaml_writer.indent(mapping=2, sequence=2, offset=0)
        
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(header)
            yaml_writer.dump(structure, f)
    else:
        import yaml
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(header)
            yaml.dump(structure, f, default_flow_style=False, 
                      sort_keys=False, allow_unicode=True, width=120, indent=2)
    
    print(f"Complete structure written to: {output_path}", file=sys.stderr)


def main() -> int:
    """Main entry point."""
    parser = argparse.ArgumentParser(
        description="Generate complete-values-structure.yaml from all chart values files"
    )
    parser.add_argument(
        "--repo-root",
        type=Path,
        default=None,
        help="Repository root directory (default: auto-detect from script location)"
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help="Output file path (default: charts/library/common/complete-values-structure.yaml)"
    )
    
    args = parser.parse_args()
    
    # Determine repo root
    if args.repo_root:
        repo_root = args.repo_root.resolve()
    else:
        # Script is in charts/library/common/
        script_dir = Path(__file__).resolve().parent
        repo_root = script_dir.parents[2]
    
    # Determine output path
    if args.output:
        output_path = args.output.resolve()
    else:
        output_path = repo_root / "charts" / "library" / "common" / "complete-values-structure.yaml"
    
    print(f"Repository root: {repo_root}", file=sys.stderr)
    print(f"Output file: {output_path}", file=sys.stderr)
    
    if HAS_RUAMEL:
        print("Using ruamel.yaml - comments will be preserved", file=sys.stderr)
    else:
        print("Using PyYAML - comments will NOT be preserved", file=sys.stderr)
    
    # Generate structure
    try:
        structure = generate_complete_structure(repo_root, existing_file=output_path)
        write_complete_structure(output_path, structure)
        print("Success!", file=sys.stderr)
        return 0
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        import traceback
        traceback.print_exc()
        return 1


if __name__ == "__main__":
    sys.exit(main())
