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
            paths = extract_values_paths(content)
            
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
