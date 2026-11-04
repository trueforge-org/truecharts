#!/usr/bin/env python3

"""
Script to parse all helm template files in common and generate a structural
overview of all keys referenced in the templates.

Uses "objectName" for objects/arrays with variable names (like service, workload, etc.)
Uses "variableName" for non-object/non-array variable keys
"""

import re
from pathlib import Path
from typing import Any, Dict, Set

import yaml


BASE_DIR = Path(__file__).resolve().parent
TEMPLATES_DIR = BASE_DIR / "templates"
OUTPUT_FILE = BASE_DIR / "template-keys-structure.yaml"

# Keys that contain variable-named children (like service.main, workload.web, etc.)
# These are keys that are ranged over in templates: range $name, $value := .Values.keyName
PARENT_KEYS_WITH_VARIABLE_CHILDREN = {
    "certificate",
    "cnpg",
    "configmap",
    "dependencies",
    "hpa",
    "imagePullSecret",
    "ingress",
    "ingressMiddlewares",
    "metrics",
    "networkpolicy",
    "persistence",
    "podDisruptionBudget",
    "priorityClass",
    "rbac",
    "resources",
    "route",
    "secret",
    "service",
    "serviceAccount",
    "storageClass",
    "volumeSnapshotClass",
    "volumeSnapshots",
    "vpa",
    "webhook",
    "workload",
}


def find_template_files(directory: Path) -> list[Path]:
    """Find all .tpl and .yaml files in the templates directory."""
    templates = []
    for pattern in ["**/*.tpl", "**/*.yaml"]:
        templates.extend(directory.glob(pattern))
    return sorted(templates)


def extract_variable_assignments(content: str) -> Dict[str, str]:
    """
    Extract variable assignments from templates to track variable origins.
    
    Patterns:
    - range $name, $service := .Values.service -> $service maps to "service.objectName"
    - range $name, $persistence := $rootCtx.Values.persistence -> $persistence maps to "persistence.objectName"
    - $objectData := $service -> inherit from $service
    
    Returns dict mapping variable names to their Values path prefixes.
    """
    var_map = {}
    
    # Pattern 1: range $name, $varName := [.]Values.keyName
    # Regex breakdown:
    #   range\s+ - 'range' keyword followed by whitespace
    #   \$[a-zA-Z_][a-zA-Z0-9_]*,\s+ - first variable (usually name/key), comma, whitespace
    #   \$([a-zA-Z_][a-zA-Z0-9_]*) - second variable (captured, the value)
    #   \s+:=\s+ - assignment operator with whitespace
    #   (?:[\$\.](?:[a-zA-Z_][a-zA-Z0-9_]*\.)?Values\.) - various .Values contexts ($., ., $rootCtx.)
    #   ([a-zA-Z_][a-zA-Z0-9_]*(?:\.[a-zA-Z_][a-zA-Z0-9_]*)*) - captured path (key.subkey.etc)
    range_pattern = r'range\s+\$[a-zA-Z_][a-zA-Z0-9_]*,\s+\$([a-zA-Z_][a-zA-Z0-9_]*)\s+:=\s+(?:[\$\.](?:[a-zA-Z_][a-zA-Z0-9_]*\.)?Values\.)([a-zA-Z_][a-zA-Z0-9_]*(?:\.[a-zA-Z_][a-zA-Z0-9_]*)*)'
    
    for match in re.finditer(range_pattern, content):
        var_name = match.group(1)
        values_path = match.group(2)
        
        # If this is a parent key with variable children, the variable represents objectName
        root_key = values_path.split(".")[0]
        if root_key in PARENT_KEYS_WITH_VARIABLE_CHILDREN:
            var_map[var_name] = f"{values_path}.objectName"
        else:
            var_map[var_name] = values_path
    
    # Pattern 2: range $varName := $otherVar.property
    # This iterates over a property of another variable
    # Regex breakdown:
    #   range\s+ - 'range' keyword
    #   (?:\$[a-zA-Z_][a-zA-Z0-9_]*,\s+)? - optional first variable (key/name)
    #   \$([a-zA-Z_][a-zA-Z0-9_]*) - captured variable being assigned
    #   \s+:=\s+ - assignment operator
    #   \$([a-zA-Z_][a-zA-Z0-9_]*) - captured source variable
    #   \.([a-zA-Z_][a-zA-Z0-9_]*(?:\.[a-zA-Z_][a-zA-Z0-9_]*)*) - captured property path
    range_var_pattern = r'range\s+(?:\$[a-zA-Z_][a-zA-Z0-9_]*,\s+)?\$([a-zA-Z_][a-zA-Z0-9_]*)\s+:=\s+\$([a-zA-Z_][a-zA-Z0-9_]*)\.([a-zA-Z_][a-zA-Z0-9_]*(?:\.[a-zA-Z_][a-zA-Z0-9_]*)*)'
    
    for match in re.finditer(range_var_pattern, content):
        var_name = match.group(1)
        source_var = match.group(2)
        property_path = match.group(3)
        
        if source_var in var_map:
            # When we range over a property, the items typically have variable names
            # For example: range $port := $service.ports means each $port is a variable-named port
            # So we add .objectName to represent the variable-named items in the collection
            # This handles multi-layer nesting: service.objectName.ports.objectName
            var_map[var_name] = f"{var_map[source_var]}.{property_path}.objectName"
    
    # Pattern 3: $varName := (func) $otherVar
    # Assignment with function call like mustDeepCopy, tpl, etc.
    # Regex breakdown:
    #   \$([a-zA-Z_][a-zA-Z0-9_]*) - captured variable being assigned
    #   \s+:=\s+ - assignment operator
    #   \([a-zA-Z]+ - opening paren and function name
    #   \s+\$([a-zA-Z_][a-zA-Z0-9_]*)\) - whitespace, source variable, closing paren
    func_assign_pattern = r'\$([a-zA-Z_][a-zA-Z0-9_]*)\s+:=\s+\([a-zA-Z]+\s+\$([a-zA-Z_][a-zA-Z0-9_]*)\)'
    
    for match in re.finditer(func_assign_pattern, content):
        var_name = match.group(1)
        source_var = match.group(2)
        
        if source_var in var_map and var_name not in var_map:
            # Inherit the mapping from source variable (e.g., mustDeepCopy preserves structure)
            var_map[var_name] = var_map[source_var]
    
    return var_map


def extract_variable_property_accesses(content: str, var_map: Dict[str, str]) -> Set[str]:
    """
    Extract property accesses on variables that have known origins.
    
    If $service maps to "service.objectName", then:
    - $service.ports -> service.objectName.ports
    - $service.enabled -> service.objectName.enabled
    """
    paths = set()
    
    # Pattern: $varName.property.path
    var_access_pattern = r'\$([a-zA-Z_][a-zA-Z0-9_]*)\.([a-zA-Z_][a-zA-Z0-9_]*(?:\.[a-zA-Z_][a-zA-Z0-9_]*)*)'
    
    for match in re.finditer(var_access_pattern, content):
        var_name = match.group(1)
        property_path = match.group(2)
        
        if var_name in var_map:
            # Construct full path from variable origin + property access
            full_path = f"{var_map[var_name]}.{property_path}"
            paths.add(full_path)
    
    return paths


def extract_values_paths(content: str) -> Set[str]:
    """
    Extract all .Values.* paths from template content.
    
    Handles various context patterns:
    - $.Values.key (root context)
    - .Values.key (current context)
    - $rootCtx.Values.key (explicit root context variable)
    - Any other variable context like $ctx.Values.key
    
    Examples of paths extracted:
    - .Values.service.main.enabled -> service.main.enabled
    - $rootCtx.Values.global.namespace -> global.namespace
    """
    paths = set()
    
    # Match .Values.something with proper word boundaries
    # This captures: .Values.key.subkey.etc
    pattern = r'(?:[\$\.](?:rootCtx\.)?Values\.)([a-zA-Z_][a-zA-Z0-9_]*(?:\.[a-zA-Z_][a-zA-Z0-9_]*)*)'
    
    for match in re.finditer(pattern, content):
        path = match.group(1)
        paths.add(path)
    
    return paths


def extract_all_paths_from_content(content: str) -> Set[str]:
    """
    Extract all paths from template content, including:
    1. Direct .Values.* references
    2. Variable assignments and their origins
    3. Property accesses on tracked variables
    """
    # First extract direct Values paths
    direct_paths = extract_values_paths(content)
    
    # Track variable assignments to understand what each variable represents
    var_map = extract_variable_assignments(content)
    
    # Extract property accesses on variables
    variable_paths = extract_variable_property_accesses(content, var_map)
    
    # Combine all paths
    all_paths = direct_paths | variable_paths
    
    return all_paths


def normalize_path_with_placeholders(path: str) -> str:
    """
    Convert paths with variable names to use placeholders.
    
    Examples:
    - service.main -> service.objectName (main is a variable name)
    - service.main.ports -> service.objectName.ports
    - global.namespace -> global.namespace (namespace is a fixed key)
    - workload.web.enabled -> workload.objectName.enabled
    """
    parts = path.split(".")
    if not parts:
        return path
    
    normalized = []
    
    for i, part in enumerate(parts):
        # Check if this part is a parent key with variable children
        if i > 0 and parts[i-1] in PARENT_KEYS_WITH_VARIABLE_CHILDREN:
            # This is a variable name under a parent with variable children
            normalized.append("objectName")
        else:
            normalized.append(part)
    
    return ".".join(normalized)


def build_nested_structure(paths: Set[str]) -> Dict[str, Any]:
    """
    Build a nested dictionary structure from flat paths.
    
    Converts:
    - service.objectName.enabled
    - service.objectName.ports
    
    Into:
    {
        "service": {
            "objectName": {
                "enabled": "variableName",
                "ports": "variableName"
            }
        }
    }
    """
    structure: Dict[str, Any] = {}
    
    for path in sorted(paths):
        parts = path.split(".")
        current = structure
        
        for i, part in enumerate(parts):
            is_last = (i == len(parts) - 1)
            
            if is_last:
                # Leaf node - determine if it's a variable or fixed value
                if part in PARENT_KEYS_WITH_VARIABLE_CHILDREN:
                    # It's a parent key that will have variable children
                    if part not in current:
                        current[part] = {}
                elif part == "objectName":
                    # It's a variable object name placeholder
                    if part not in current:
                        current[part] = {}
                else:
                    # It's a regular key - mark it as needing a value
                    current[part] = "variableName"
            else:
                # Intermediate node
                if part not in current:
                    current[part] = {}
                elif not isinstance(current[part], dict):
                    # Convert leaf to dict if we need to go deeper
                    current[part] = {}
                current = current[part]
    
    return structure


def merge_structures(base: Dict[str, Any], new: Dict[str, Any]) -> Dict[str, Any]:
    """
    Recursively merge two nested structures.
    """
    result = dict(base)
    
    for key, value in new.items():
        if key in result:
            if isinstance(result[key], dict) and isinstance(value, dict):
                result[key] = merge_structures(result[key], value)
            elif result[key] == "variableName" and isinstance(value, dict):
                # Expand variableName to dict if needed
                result[key] = value
            # Otherwise keep existing value
        else:
            result[key] = value
    
    return result


def main() -> int:
    """Main entry point."""
    print(f"Scanning templates in {TEMPLATES_DIR}...")
    
    template_files = find_template_files(TEMPLATES_DIR)
    print(f"Found {len(template_files)} template files")
    
    all_paths = set()
    
    for template_file in template_files:
        try:
            content = template_file.read_text(encoding="utf-8")
            paths = extract_all_paths_from_content(content)
            
            if paths:
                print(f"  {template_file.relative_to(BASE_DIR)}: {len(paths)} paths")
                all_paths.update(paths)
        except Exception as e:
            print(f"  ERROR reading {template_file}: {e}")
    
    print(f"\nTotal unique paths found: {len(all_paths)}")
    
    # Normalize paths with placeholders
    normalized_paths = {normalize_path_with_placeholders(p) for p in all_paths}
    print(f"After normalization: {len(normalized_paths)} unique paths")
    
    # Build nested structure
    structure = build_nested_structure(normalized_paths)
    
    # Write output
    print(f"\nWriting structure to {OUTPUT_FILE}...")
    
    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        f.write("# This file is auto-generated by generate_template_keys_structure.py\n")
        f.write("# It contains a structural overview of all keys referenced in helm templates\n")
        f.write("# 'objectName' indicates variable-named objects/arrays\n")
        f.write("# 'variableName' indicates leaf values or variable keys\n")
        f.write("\n")
        yaml.safe_dump(
            structure,
            f,
            default_flow_style=False,
            sort_keys=True,
            allow_unicode=True,
        )
    
    print(f"Done! Structure written to {OUTPUT_FILE}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
