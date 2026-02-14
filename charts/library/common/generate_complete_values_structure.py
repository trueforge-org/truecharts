#!/usr/bin/env python3

"""
Generate complete-values-structure.yaml from all chart values files.

This script collects all values.yaml files from:
- All charts under charts/stable/* and charts/incubator/*
- Common-test ci-values from charts/library/common-test/ci/*values.yaml
- Common values.yaml from charts/library/common/values.yaml

It merges them into a comprehensive structure showing all possible keys.
"""

import argparse
import sys
from pathlib import Path
from typing import Any, Dict, List, Set

try:
    import yaml
except ImportError:
    print("Error: PyYAML is required. Install it with: pip install PyYAML", file=sys.stderr)
    sys.exit(1)


def load_yaml_file(file_path: Path) -> Dict[str, Any]:
    """Load a YAML file and return its content."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = yaml.safe_load(f)
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


def normalize_variable_keys(data: Any, known_static_keys: Set[str]) -> Any:
    """
    Replace variable dictionary keys with 'objectname' placeholder.
    
    Known static keys (like 'enabled', 'type', etc.) are preserved.
    Variable keys (user-defined names) are replaced with 'objectname'.
    """
    if not isinstance(data, dict):
        return data
    
    result = {}
    variable_keys = {}
    
    for key, value in data.items():
        # Recursively process the value
        processed_value = normalize_variable_keys(value, known_static_keys)
        
        # Check if this is a known static key
        if key in known_static_keys:
            result[key] = processed_value
        else:
            # This might be a variable key
            # Store it temporarily to check if we should use 'objectname'
            variable_keys[key] = processed_value
    
    # If we have variable keys and they look like user-defined names,
    # replace them with 'objectname'
    if variable_keys:
        # Check if all variable keys have similar structure (indicating they're variable names)
        values_list = list(variable_keys.values())
        # If we have multiple similar keys or keys that look like variable names,
        # use 'objectname' as placeholder
        # Keep the first one's structure but use 'objectname' as key
        first_value = values_list[0]
        if 'objectname' not in result:
            result['objectname'] = first_value
        # Add back any that were actually static keys we missed
        for key, value in variable_keys.items():
            if key in ['main', 'default', 'admin']:  # Common static keys
                result[key] = value
    
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


def generate_complete_structure(repo_root: Path) -> Dict[str, Any]:
    """Generate the complete values structure from all charts."""
    print("Collecting values files...", file=sys.stderr)
    values_files = collect_all_values_files(repo_root)
    print(f"Found {len(values_files)} values files to process", file=sys.stderr)
    
    # Define known static keys that should not be replaced with 'objectname'
    known_static_keys = {
        'enabled', 'type', 'mountPath', 'size', 'storageClass', 'accessModes',
        'name', 'namespace', 'labels', 'annotations', 'image', 'tag', 'pullPolicy',
        'port', 'targetPort', 'protocol', 'service', 'ingress', 'persistence',
        'resources', 'replicas', 'strategy', 'global', 'workload', 'podOptions',
        'configmap', 'secret', 'serviceAccount', 'rbac', 'networkPolicy',
        'metrics', 'addons', 'codeserver', 'netshoot', 'vpn', 'tailscale',
        'gluetun', 'autopermissions', 'promtail', 'operator', 'cnpg', 'mariadb',
        'mongodb', 'redis', 'clickhouse', 'solr', 'route', 'hpa', 'vpa',
        'fallbackDefaults', 'traefik', 'metallb', 'minNodePort', 'stopAll',
        'main', 'default', 'admin', 'primary', 'secondary', 'backup',
        'server', 'client', 'proxy', 'agent', 'worker', 'master', 'replica',
        'frontend', 'backend', 'api', 'web', 'app', 'db', 'cache',
    }
    
    complete_structure = {}
    
    for i, values_file in enumerate(values_files, 1):
        if i % 100 == 0:
            print(f"Processing {i}/{len(values_files)}...", file=sys.stderr)
        
        values_data = load_yaml_file(values_file)
        complete_structure = merge_structures(complete_structure, values_data)
    
    print("Merge complete. Structure generated.", file=sys.stderr)
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
    
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(header)
        yaml.dump(structure, f, default_flow_style=False, 
                  sort_keys=False, allow_unicode=True, width=120, indent=2,
                  default_style=None)
    
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
    
    # Generate structure
    try:
        structure = generate_complete_structure(repo_root)
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
