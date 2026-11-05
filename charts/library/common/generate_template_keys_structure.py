#!/usr/bin/env python3

"""
Script to parse all helm template files in common and generate a structural
overview of all keys referenced in the templates.

Uses "objectName" for objects/arrays with variable names (like service, workload, etc.)
Uses "variableName" for non-object/non-array variable keys
"""

import argparse
import re
import sys
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


# {{/* ... */}} and {{- /* ... */ -}}
TEMPLATE_COMMENT = re.compile(r"\{\{-?\s*/\*.*?\*/\s*-?\}\}", re.DOTALL)


# The templates in class/ and lib/ get the object they render as `$objectData`, and have no range over
# .Values to tell which object that is. So the object follows from the place of the file (relative to templates/).
# A path ending in `/` is a directory.
OBJECT_DATA_OWNERS = {
    "class/_service.tpl": "service.objectName",
    "lib/service/": "service.objectName",
    "class/_route.tpl": "route.objectName",
    "lib/route/": "route.objectName",
    "class/_ingress.tpl": "ingress.objectName",
    "lib/ingress/": "ingress.objectName",
    "class/_configmap.tpl": "configmap.objectName",
    "lib/configmap/": "configmap.objectName",
    "class/_secret.tpl": "secret.objectName",
    "lib/secret/": "secret.objectName",
    "class/_rbac.tpl": "rbac.objectName",
    "lib/rbac/": "rbac.objectName",
    "class/_serviceAccount.tpl": "serviceAccount.objectName",
    "lib/serviceAccount/": "serviceAccount.objectName",
    "class/_horizontalPodAutoscaler.tpl": "hpa.objectName",
    "lib/hpa/": "hpa.objectName",
    "class/_verticalPodAutoscaler.tpl": "vpa.objectName",
    "lib/vpa/": "vpa.objectName",
    "class/_pvc.tpl": "persistence.objectName",
    # lib/storage/ serves several kinds of objects, so only the files of one kind are listed
    "lib/storage/_validation.tpl": "persistence.objectName",
    "lib/storage/_accessModes.tpl": "persistence.objectName",
    # Here `$objectData` is the workload the volume claim templates are rendered for ($vct is the persistence item)
    "lib/storage/_volumeClaimTemplates.tpl": "workload.objectName",
    "lib/storage/_storageClassValidation.tpl": "storageClass.objectName",
    "lib/storage/_validationVolumeSnapshot.tpl": "volumeSnapshots.objectName",
    "lib/storage/_validationVolumeSnapshotClass.tpl": "volumeSnapshotClass.objectName",
    "class/_volumeSnapshot.tpl": "volumeSnapshots.objectName",
    "class/_networkPolicy.tpl": "networkpolicy.objectName",
    "lib/networkpolicy/": "networkpolicy.objectName",
    "class/_podDisruptionBudget.tpl": "podDisruptionBudget.objectName",
    "lib/podDistruptionBudget/": "podDisruptionBudget.objectName",
    "class/_priorityClass.tpl": "priorityClass.objectName",
    "lib/priorityClass/": "priorityClass.objectName",
    "class/_storageClass.tpl": "storageClass.objectName",
    "class/_gateway.tpl": "gateway.objectName",
    "lib/gateway/": "gateway.objectName",
    "class/_gatewayclass.tpl": "gatewayClass.objectName",
    "class/_listenerSet.tpl": "listenerSet.objectName",
    "lib/listenerSet/": "listenerSet.objectName",
    "class/_externalSecret.tpl": "externalSecret.objectName",
    "lib/externalSecret/": "externalSecret.objectName",
    # The probe and lifecycle actions get the probe or hook, not the container
    "lib/container/probe-lifecycle-actions/": "",
    "lib/container/": "workload.objectName.podSpec.containers.objectName",
    "lib/workload/": "workload.objectName",
}


def object_data_owner(rel_path: str) -> str:
    """The Values path of the object that `$objectData` is in this template, or an empty string when unknown."""
    for prefix, owner in OBJECT_DATA_OWNERS.items():
        if rel_path == prefix or (prefix.endswith("/") and rel_path.startswith(prefix)):
            return owner
    return ""


# Keys of `$objectData` that the spawners compute themselves (set $objectData "key" ...), so they are not user input
INTERNAL_OBJECT_KEYS = {
    "name",
    "shortName",
    "workload",
    "containerNames",
    "hpaName",
    "vpaName",
    "selectedService",
    "podPrimary",
    "podType",
    "podShortName",
    "calculatedFSGroup",
    "podSpec",
}

# Files where a function gets another object than the owner as `$objectData`, with the keys it reads from it
# (lib/container/_probes.tpl: probeTimeouts gets the probe, so its `spec` is not a key of the container)
INTERNAL_OBJECT_KEYS_BY_FILE = {
    "lib/container/_probes.tpl": {"spec"},
}

# Keys that a template reads only to fail when they are set, so they are not accepted by the schema
REJECTED_PATHS = {
    "secret.objectName.stringData",
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


def extract_variable_property_accesses(
    content: str,
    var_map: Dict[str, str],
    seeded_vars: Set[str] = frozenset(),
    skip_keys: Set[str] = frozenset(),
) -> Set[str]:
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
            if var_name in seeded_vars and property_path.split(".")[0] in (INTERNAL_OBJECT_KEYS | skip_keys):
                continue
            # A key the template sets itself (set $var "prop" <value>) is internal, not user input,
            # unless the value defaults to/derives from the same user key or is just an empty dict
            first_segment = property_path.split(".")[0]
            set_matches = list(re.finditer(
                r'set\s+\$' + re.escape(var_name) + r'\s+"' + re.escape(first_segment) + r'"\s+(.*?)\s*-?\}\}',
                content,
            ))
            own_ref = f"${var_name}.{first_segment}"
            # Only when the template sets it before it first reads it (a read before the set is user input)
            first_read = re.search(r'\$' + re.escape(var_name) + r'\.' + re.escape(first_segment) + r'\b', content)
            if (
                set_matches
                and all(own_ref not in m.group(1) and m.group(1).strip() != "dict" for m in set_matches)
                and first_read
                and set_matches[0].start() < first_read.start()
            ):
                continue
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


def extract_all_paths_from_content(content: str, rel_path: str = "") -> Set[str]:
    """
    Extract all paths from template content, including:
    1. Direct .Values.* references
    2. Variable assignments and their origins
    3. Property accesses on tracked variables
    """
    # Comments are not template code, so a key that is only mentioned in one is not read
    content = TEMPLATE_COMMENT.sub("", content)

    # First extract direct Values paths
    direct_paths = extract_values_paths(content)
    
    # Track variable assignments to understand what each variable represents
    var_map = extract_variable_assignments(content)

    # In class/ and lib/ the object follows from the place of the file
    owner = object_data_owner(rel_path)
    seeded_vars: Set[str] = set()
    if owner and "objectData" not in var_map:
        var_map["objectData"] = owner
        seeded_vars.add("objectData")

    # Extract property accesses on variables
    variable_paths = extract_variable_property_accesses(
        content, var_map, seeded_vars, INTERNAL_OBJECT_KEYS_BY_FILE.get(rel_path, set())
    )
    
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

    # Only a root key has name-keyed children. The same word deeper down (for example
    # global.fallbackDefaults.cnpg) is a fixed key. Middlewares are one level deeper: ingressMiddlewares.<type>.<name>
    name_index = 2 if parts[0] == "ingressMiddlewares" else 1

    for i, part in enumerate(parts):
        if i == name_index and parts[0] in PARENT_KEYS_WITH_VARIABLE_CHILDREN:
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
                if i == 0 and part in PARENT_KEYS_WITH_VARIABLE_CHILDREN:
                    # It's a root key that will have variable children
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
    parser = argparse.ArgumentParser(description="Generate template-keys-structure.yaml from the templates")
    parser.add_argument("--check", action="store_true", help="Fail when the committed file is not up to date, write nothing")
    args = parser.parse_args()

    print(f"Scanning templates in {TEMPLATES_DIR}...")
    
    template_files = find_template_files(TEMPLATES_DIR)
    print(f"Found {len(template_files)} template files")
    
    all_paths = set()
    
    for template_file in template_files:
        try:
            content = template_file.read_text(encoding="utf-8")
            paths = extract_all_paths_from_content(content, template_file.relative_to(TEMPLATES_DIR).as_posix())
            
            if paths:
                print(f"  {template_file.relative_to(BASE_DIR)}: {len(paths)} paths")
                all_paths.update(paths)
        except Exception as e:
            print(f"  ERROR reading {template_file}: {e}")
    
    print(f"\nTotal unique paths found: {len(all_paths)}")
    
    # Normalize paths with placeholders
    normalized_paths = {normalize_path_with_placeholders(p) for p in all_paths} - REJECTED_PATHS
    print(f"After normalization: {len(normalized_paths)} unique paths")
    
    # Build nested structure
    structure = build_nested_structure(normalized_paths)
    
    header = (
        "# This file is auto-generated by generate_template_keys_structure.py\n"
        "# It contains a structural overview of all keys referenced in helm templates\n"
        "# 'objectName' indicates variable-named objects/arrays\n"
        "# 'variableName' indicates leaf values or variable keys\n"
        "\n"
    )
    rendered = header + yaml.safe_dump(structure, default_flow_style=False, sort_keys=True, allow_unicode=True)

    if args.check:
        current = OUTPUT_FILE.read_text(encoding="utf-8") if OUTPUT_FILE.is_file() else ""
        if current != rendered:
            print(f"{OUTPUT_FILE.name} is not up to date, run generate_template_keys_structure.py", file=sys.stderr)
            return 1
        print(f"{OUTPUT_FILE.name} is up to date")
        return 0

    print(f"\nWriting structure to {OUTPUT_FILE}...")
    OUTPUT_FILE.write_text(rendered, encoding="utf-8")
    print(f"Done! Structure written to {OUTPUT_FILE}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
