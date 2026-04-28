#!/usr/bin/env python3
"""
Script to improve schema files based on documentation.

This script analyzes documentation files and updates JSON schemas to include:
- type information
- enum values
- default values
- required fields
- minimum values (for integers when required)
- minLength values (for strings when required)
- pattern for Helm templates when enum is also allowed
"""

import json
import os
import re
import yaml
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


def load_yaml_file(filepath: str) -> Dict[str, Any]:
    """Load a YAML file."""
    with open(filepath, 'r') as f:
        return yaml.safe_load(f) or {}


def load_json_file(filepath: str) -> Dict[str, Any]:
    """Load a JSON file."""
    with open(filepath, 'r') as f:
        return json.load(f)


def save_json_file(filepath: str, data: Dict[str, Any]):
    """Save a JSON file with proper formatting."""
    with open(filepath, 'w') as f:
        json.dump(data, f, indent=2)
        f.write('\n')


def parse_doc_file(filepath: str) -> Dict[str, Dict[str, Any]]:
    """
    Parse a documentation markdown file to extract field information.
    
    Returns a dict mapping field paths to their properties:
    {
        "field.path": {
            "type": "string",
            "required": True,
            "default": "value",
            "enum": ["a", "b"],
            "helm_tpl": True
        }
    }
    """
    fields = {}
    
    if not os.path.exists(filepath):
        return fields
    
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Split by heading markers to get individual field sections
    sections = re.split(r'\n---\n', content)
    
    for section in sections:
        # Look for key name in header like ### `addons.$addon.enabled`
        key_match = re.search(r'#{2,}\s+`([^`]+)`', section)
        if not key_match:
            continue
        
        key_path = key_match.group(1)
        field_info = {}
        
        # Extract table information
        # Look for | Key | ... | pattern
        table_match = re.search(r'\|\s*Key\s*\|[^\n]+\n\|[^\n]+\n((?:\|[^\n]+\n)+)', section)
        if table_match:
            table_content = table_match.group(0)
            
            # Extract Type
            type_match = re.search(r'\|\s*Type\s*\|\s*`([^`]+)`', table_content)
            if type_match:
                doc_type = type_match.group(1)
                field_info['doc_type'] = doc_type
                
                # Map doc types to JSON schema types
                type_map = {
                    'string': 'string',
                    'int': 'integer',
                    'bool': 'boolean',
                    'list': 'array',
                    'map': 'object',
                    'list of string': 'array',
                    'list of strings': 'array',
                    'list of map': 'array',
                }
                
                for doc_pattern, json_type in type_map.items():
                    if doc_pattern in doc_type.lower():
                        field_info['type'] = json_type
                        break
            
            # Extract Required
            required_match = re.search(r'\|\s*Required\s*\|\s*([✅❌])', table_content)
            if required_match:
                field_info['required'] = required_match.group(1) == '✅'
            
            # Extract Default
            default_match = re.search(r'\|\s*Default\s*\|\s*`([^`]+)`', table_content)
            if default_match:
                default_val = default_match.group(1)
                if default_val not in ['', 'See default']:
                    field_info['default'] = default_val
            
            # Extract Helm tpl
            helm_match = re.search(r'\|\s*Helm\s+`tpl`\s*\|\s*([✅❌])', table_content)
            if helm_match:
                field_info['helm_tpl'] = helm_match.group(1) == '✅'
        
        # Look for enum values in the text
        # Pattern: Valid values: `value1`, `value2`, etc.
        enum_patterns = [
            r'Valid values?:\s*(?:`([^`]+)`(?:,\s*`([^`]+)`)*)',
            r'Options?:\s*(?:`([^`]+)`(?:,\s*`([^`]+)`)*)',
            r'Accepted values?:\s*(?:`([^`]+)`(?:,\s*`([^`]+)`)*)',
        ]
        
        for pattern in enum_patterns:
            enum_match = re.search(pattern, section)
            if enum_match:
                # Extract all enum values
                enum_values = re.findall(r'`([^`]+)`', enum_match.group(0))
                if enum_values:
                    field_info['enum'] = enum_values
                    break
        
        # Look for enum values in lists like "- `value`"
        if 'enum' not in field_info:
            list_items = re.findall(r'^\s*-\s+`([^`]+)`', section, re.MULTILINE)
            if len(list_items) >= 2 and len(list_items) <= 20:  # Reasonable enum size
                # Check if these look like enum values
                if all(len(item) < 50 for item in list_items):
                    field_info['enum'] = list_items
        
        if field_info:
            fields[key_path] = field_info
    
    return fields


def get_schema_path_from_doc_path(doc_path: str, mapping: Dict[str, Any]) -> List[str]:
    """Get schema file paths that correspond to a documentation file."""
    # Normalize the doc path
    doc_path = doc_path.replace('/home/runner/work/truecharts/truecharts/charts/library/common/', '')
    doc_path = doc_path.replace('charts/library/common/', '')
    
    if doc_path in mapping:
        schemas = mapping[doc_path]
        if isinstance(schemas, list):
            return schemas
        return [schemas]
    
    return []


def update_schema_property(prop: Dict[str, Any], field_info: Dict[str, Any]) -> Dict[str, Any]:
    """
    Update a schema property based on field information from documentation.
    
    Args:
        prop: The schema property definition
        field_info: Information extracted from documentation
    
    Returns:
        Updated property definition
    """
    updated = False
    
    # Handle type
    if 'type' in field_info:
        json_type = field_info['type']
        
        # Check if helm_tpl is allowed
        helm_tpl_allowed = field_info.get('helm_tpl', False)
        
        if helm_tpl_allowed:
            # Allow both the type and string (for Helm templates)
            if json_type != 'string':
                if 'type' not in prop or not isinstance(prop['type'], list):
                    prop['type'] = [json_type, 'string']
                    updated = True
        else:
            # Just set the type
            if 'type' not in prop or prop['type'] != json_type:
                prop['type'] = json_type
                updated = True
    
    # Handle enum
    if 'enum' in field_info:
        enum_values = field_info['enum']
        
        # Check if helm templates are also allowed
        helm_tpl_allowed = field_info.get('helm_tpl', False)
        
        if helm_tpl_allowed:
            # Don't set enum directly, but add a pattern for helm templates
            # We'll use oneOf to allow either enum or template pattern
            if 'oneOf' not in prop:
                prop['oneOf'] = [
                    {'enum': enum_values},
                    {'type': 'string', 'pattern': r'^\{\{.*\}\}$'}
                ]
                updated = True
        else:
            # Just set enum
            if 'enum' not in prop or prop['enum'] != enum_values:
                prop['enum'] = enum_values
                updated = True
    
    # Handle default
    if 'default' in field_info:
        default_val = field_info['default']
        
        # Try to parse the default value to correct type
        if 'type' in field_info:
            try:
                if field_info['type'] == 'boolean':
                    if default_val.lower() in ['true', 'false']:
                        default_val = default_val.lower() == 'true'
                elif field_info['type'] == 'integer':
                    default_val = int(default_val)
                elif field_info['type'] == 'array':
                    if default_val == '[]':
                        default_val = []
                elif field_info['type'] == 'object':
                    if default_val == '{}':
                        default_val = {}
            except (ValueError, AttributeError):
                pass
        
        if 'default' not in prop or prop['default'] != default_val:
            prop['default'] = default_val
            updated = True
    
    # Handle required with minimum/minLength
    if field_info.get('required', False):
        # For integer types, add minimum: 1
        if field_info.get('type') == 'integer':
            if 'minimum' not in prop or prop['minimum'] != 1:
                prop['minimum'] = 1
                updated = True
        
        # For string types, add minLength: 1
        if field_info.get('type') == 'string':
            # Only add minLength if there's no pattern or enum
            if 'pattern' not in prop and 'enum' not in prop and 'oneOf' not in prop:
                if 'minLength' not in prop or prop['minLength'] != 1:
                    prop['minLength'] = 1
                    updated = True
    
    return prop, updated


def find_field_in_schema(schema: Dict[str, Any], field_path: str, base_path: str = '') -> Optional[Tuple[Dict[str, Any], str]]:
    """
    Find a field in a schema by its path.
    
    Returns a tuple of (parent_dict, field_key) if found, None otherwise.
    """
    # Handle simple paths first
    parts = field_path.split('.')
    
    # Try to navigate the schema
    current = schema
    path_so_far = []
    
    for i, part in enumerate(parts):
        path_so_far.append(part)
        
        # Handle variable names like $addon, $name, etc.
        if part.startswith('$'):
            # This is a variable, look in additionalProperties
            if 'additionalProperties' in current:
                if i == len(parts) - 1:
                    # This is the last part, we're looking for this in additionalProperties
                    return current, 'additionalProperties'
                else:
                    # Continue navigation in additionalProperties
                    if isinstance(current['additionalProperties'], dict):
                        current = current['additionalProperties']
                        if 'properties' in current:
                            current = current['properties']
                    continue
            return None
        
        # Try properties
        if 'properties' in current and part in current['properties']:
            if i == len(parts) - 1:
                # Found it
                return current['properties'], part
            else:
                # Continue navigation
                current = current['properties'][part]
                continue
        
        # Try additionalProperties
        if 'additionalProperties' in current:
            if isinstance(current['additionalProperties'], dict):
                if 'properties' in current['additionalProperties']:
                    if part in current['additionalProperties']['properties']:
                        if i == len(parts) - 1:
                            return current['additionalProperties']['properties'], part
                        else:
                            current = current['additionalProperties']['properties'][part]
                            continue
        
        # Not found
        return None
    
    return None


def process_schema_file(schema_path: str, doc_fields: Dict[str, Dict[str, Any]]) -> int:
    """
    Process a schema file and update it based on documentation fields.
    
    Returns the number of updates made.
    """
    if not os.path.exists(schema_path):
        print(f"  Schema file not found: {schema_path}")
        return 0
    
    schema = load_json_file(schema_path)
    updates_made = 0
    
    # For each field in the documentation
    for field_path, field_info in doc_fields.items():
        # Try to find this field in the schema
        result = find_field_in_schema(schema, field_path)
        
        if result:
            parent_dict, field_key = result
            if field_key in parent_dict:
                prop = parent_dict[field_key]
                
                # Skip if prop is not a dict (e.g., boolean, string)
                if not isinstance(prop, dict):
                    continue
                
                # Update the property
                updated_prop, was_updated = update_schema_property(prop.copy(), field_info)
                
                if was_updated:
                    parent_dict[field_key] = updated_prop
                    updates_made += 1
                    print(f"    Updated {field_path}")
    
    if updates_made > 0:
        save_json_file(schema_path, schema)
        print(f"  Saved {schema_path} with {updates_made} updates")
    
    return updates_made


def main():
    """Main function to improve all schemas based on documentation."""
    base_dir = Path(__file__).parent
    docs_dir = base_dir / 'docs'
    schemas_dir = base_dir / 'schemas'
    mapping_file = base_dir / 'docs-schema-mapping.yaml'
    
    print("Loading documentation-schema mapping...")
    mapping = load_yaml_file(mapping_file)
    
    print("\nProcessing documentation files...")
    
    total_updates = 0
    
    # Process each documentation file
    for doc_file_key in mapping.keys():
        doc_path = base_dir / doc_file_key
        
        if not doc_path.exists():
            print(f"\nSkipping {doc_file_key} (not found)")
            continue
        
        print(f"\nProcessing {doc_file_key}...")
        
        # Parse the documentation file
        doc_fields = parse_doc_file(str(doc_path))
        
        if not doc_fields:
            print(f"  No fields extracted from {doc_file_key}")
            continue
        
        print(f"  Extracted {len(doc_fields)} fields")
        
        # Get corresponding schema files
        schema_files = mapping[doc_file_key]
        if isinstance(schema_files, str):
            schema_files = [schema_files]
        
        if not isinstance(schema_files, list):
            print(f"  Invalid schema mapping for {doc_file_key}")
            continue
        
        # Process each schema file
        for schema_file in schema_files:
            schema_path = base_dir / schema_file
            updates = process_schema_file(str(schema_path), doc_fields)
            total_updates += updates
    
    print(f"\n{'='*60}")
    print(f"Total updates made: {total_updates}")
    print(f"{'='*60}")


if __name__ == '__main__':
    main()
