#!/usr/bin/env python3
"""
Script to improve JSON schemas based on documentation analysis.
Improves: type, enum, default, required, minimum, minLength
"""

import json
import os
import re
import yaml
from pathlib import Path
from typing import Dict, List, Any, Set, Tuple


# Base paths
COMMON_DIR = Path(__file__).parent
DOCS_DIR = COMMON_DIR / "docs"
SCHEMAS_DIR = COMMON_DIR / "schemas"
MAPPING_FILE = COMMON_DIR / "docs-schema-mapping.yaml"


def parse_doc_field(doc_content: str, key_path: str) -> Dict[str, Any]:
    """
    Parse documentation for a specific field to extract metadata.
    Returns: {type, required, default, helm_tpl, description, enum}
    """
    result = {
        "type": None,
        "required": False,
        "default": None,
        "helm_tpl": False,
        "description": None,
        "enum": []
    }
    
    # Escape special regex characters in key_path, but preserve $ if present
    escaped_key = key_path.replace('\\', '\\\\').replace('.', '\\.').replace('[', '\\[').replace(']', '\\]')
    
    # Look for the field definition section
    # Pattern: markdown heading (### or ####) with backticked key, followed by description and table
    section_pattern = rf'(###+ `{escaped_key}`)\s*\n\n(.*?)(?=\n###|$)'
    section_match = re.search(section_pattern, doc_content, re.DOTALL)
    
    if not section_match:
        return result
    
    section_text = section_match.group(2)
    
    # Extract description (text before the table)
    desc_match = re.match(r'(.*?)\n\n\|', section_text, re.DOTALL)
    if desc_match:
        result["description"] = desc_match.group(1).strip()
    
    # Extract the metadata table
    table_match = re.search(r'\|(.*?)\n\n', section_text, re.DOTALL)
    if table_match:
        table_text = table_match.group(1)
        
        # Extract Type
        type_match = re.search(r'\|\s*Type\s*\|\s*`([^`]+)`', table_text, re.IGNORECASE)
        if type_match:
            doc_type = type_match.group(1).strip()
            # Map doc types to JSON schema types
            type_map = {
                'string': 'string',
                'bool': 'boolean',
                'int': 'integer',
                'map': 'object',
                'dict': 'object',
                'list': 'array',
                'array': 'array',
            }
            result["type"] = type_map.get(doc_type, doc_type)
        
        # Extract Required
        required_match = re.search(r'\|\s*Required\s*\|\s*(✅|❌)', table_text, re.IGNORECASE)
        if required_match:
            result["required"] = required_match.group(1) == '✅'
        
        # Extract Default - handle both `value` and plain text
        default_match = re.search(r'\|\s*Default\s*\|\s*`([^`]*)`', table_text, re.IGNORECASE)
        if default_match:
            default_val = default_match.group(1).strip()
            # Ignore empty defaults and special markers
            if default_val and default_val not in ['', '""', "''", '{}', '[]', 'See default', 'See']:
                result["default"] = default_val
        
        # Extract Helm tpl support
        helm_match = re.search(r'\|\s*Helm `tpl`\s*\|\s*(✅|❌)', table_text, re.IGNORECASE)
        if helm_match:
            result["helm_tpl"] = helm_match.group(1) == '✅'
    
    # Look for "Valid Values:" section to extract enum
    valid_values_match = re.search(r'Valid Values:\s*\n\n((?:- `[^`]+`\s*\n)+)', section_text)
    if valid_values_match:
        values_text = valid_values_match.group(1)
        # Extract values from markdown list items with backticks
        enum_values = re.findall(r'- `([^`]+)`', values_text)
        if enum_values:
            result["enum"] = enum_values
    else:
        # Alternative: look for Valid Values with links
        valid_values_match = re.search(r'Valid Values:\s*\n\n((?:- \[`[^`]+`\][^\n]+\n)+)', section_text)
        if valid_values_match:
            values_text = valid_values_match.group(1)
            # Extract values from markdown list items with backticks in links
            enum_values = re.findall(r'- \[`([^`]+)`\]', values_text)
            if enum_values:
                result["enum"] = enum_values
    
    # Also look for enum in description like (value1, value2)
    if not result["enum"] and result["description"]:
        enum_pattern = r'\(([^)]+,\s*[^)]+)\)'
        enum_match = re.search(enum_pattern, result["description"])
        if enum_match:
            values = enum_match.group(1).split(',')
            result["enum"] = [v.strip().strip('`') for v in values if v.strip()]
    
    return result


def load_doc_schema_mapping() -> Dict[str, List[str]]:
    """Load the docs-schema-mapping.yaml file."""
    with open(MAPPING_FILE, 'r') as f:
        mapping = yaml.safe_load(f)
    return mapping


def extract_all_doc_metadata() -> Dict[str, Dict[str, Any]]:
    """
    Extract metadata for all documented fields.
    Returns: {doc_path: {field_path: metadata}}
    """
    all_metadata = {}
    
    for doc_file in DOCS_DIR.rglob("*.md"):
        if doc_file.name.startswith("_"):
            continue
        
        rel_path = doc_file.relative_to(DOCS_DIR)
        doc_key = f"docs/{rel_path.as_posix()}"
        
        with open(doc_file, 'r') as f:
            content = f.read()
        
        # Find all field definitions in the doc
        # Pattern: ### or #### followed by backtick-wrapped key
        field_patterns = re.finditer(r'###+ `([^`]+)`', content)
        
        doc_metadata = {}
        for match in field_patterns:
            field_key = match.group(1)
            metadata = parse_doc_field(content, field_key)
            if metadata["type"] or metadata["required"] or metadata["default"] or metadata["enum"]:
                doc_metadata[field_key] = metadata
        
        if doc_metadata:
            all_metadata[doc_key] = doc_metadata
    
    return all_metadata


def improve_schema_property(prop_schema: Dict[str, Any], metadata: Dict[str, Any]) -> Dict[str, Any]:
    """
    Improve a single property schema based on metadata.
    """
    improved = prop_schema.copy()
    
    # Get current type from schema
    current_type = improved.get("type")
    if isinstance(current_type, list):
        # Schema has multiple types (e.g., ["boolean", "string"])
        schema_type = current_type[0] if current_type else metadata["type"]
    else:
        schema_type = current_type or metadata["type"]
    
    # Set type if not present
    if metadata["type"] and "type" not in improved and "oneOf" not in improved and "allOf" not in improved:
        improved["type"] = metadata["type"]
        schema_type = metadata["type"]
    
    # Handle enum values
    if metadata["enum"] and len(metadata["enum"]) > 0:
        # Check if schema already has enum or oneOf
        if "enum" in improved or "oneOf" in improved:
            # Don't override existing enum/oneOf
            pass
        elif metadata["helm_tpl"]:
            # Both enum and helm template allowed
            improved["oneOf"] = [
                {
                    "type": schema_type or "string",
                    "enum": metadata["enum"]
                },
                {
                    "type": "string",
                    "pattern": "^\\{\\{.*\\}\\}$"
                }
            ]
            # Remove direct type if using oneOf (unless it's a list)
            if "type" in improved and not isinstance(improved["type"], list):
                del improved["type"]
            if "enum" in improved:
                del improved["enum"]
        else:
            # Only enum allowed
            if "enum" not in improved:
                improved["enum"] = metadata["enum"]
    
    # Set default if not present
    if metadata["default"] and "default" not in improved:
        # Try to parse the default value based on type
        default_val = metadata["default"]
        
        if schema_type == "boolean":
            improved["default"] = default_val.lower() in ["true", "yes", "1"]
        elif schema_type == "integer":
            try:
                improved["default"] = int(default_val)
            except ValueError:
                pass
        elif schema_type == "string" and "enum" not in improved:
            # Only set string default if it's not an enum
            improved["default"] = default_val.strip('"\'')
    
    # Set minLength for required strings (when not in an enum or oneOf)
    if metadata["required"] and "enum" not in improved and "oneOf" not in improved:
        if schema_type == "string" and "minLength" not in improved:
            # Only set minLength if type is string (not multi-type)
            if not isinstance(improved.get("type"), list):
                improved["minLength"] = 1
        elif schema_type == "integer" and "minimum" not in improved:
            # Only set minimum if type is integer (not multi-type)
            if not isinstance(improved.get("type"), list):
                improved["minimum"] = 1
    
    return improved


def improve_schema_file(schema_path: Path, doc_metadata: Dict[str, Dict[str, Any]]) -> bool:
    """
    Improve a schema file based on documentation metadata.
    Returns True if changes were made.
    """
    with open(schema_path, 'r') as f:
        schema = json.load(f)
    
    original_schema = json.dumps(schema, indent=2, sort_keys=True)
    
    # Find relevant doc metadata for this schema
    rel_schema_path = schema_path.relative_to(SCHEMAS_DIR)
    
    # Get all docs that map to this schema
    mapping = load_doc_schema_mapping()
    relevant_docs = []
    for doc_path, schema_list in mapping.items():
        if not isinstance(schema_list, list):
            continue
        for schema_ref in schema_list:
            # Match by full path or by filename
            if str(rel_schema_path) == schema_ref or str(rel_schema_path).endswith(schema_ref) or schema_ref.endswith(str(rel_schema_path)):
                relevant_docs.append(doc_path)
    
    def improve_properties(properties_dict: Dict[str, Any], doc_metadata_dict: Dict[str, Any], key_prefix: str = ""):
        """Recursively improve properties in a schema."""
        changes = False
        for prop_name, prop_schema in properties_dict.items():
            # Try various key patterns to find metadata
            key_patterns = [
                prop_name,  # Direct match
                f"$name.{prop_name}",  # Common pattern for nested properties
                f"{key_prefix}{prop_name}",  # With prefix
            ]
            
            for key_pattern in key_patterns:
                if key_pattern in doc_metadata_dict:
                    metadata = doc_metadata_dict[key_pattern]
                    improved = improve_schema_property(prop_schema, metadata)
                    if improved != prop_schema:
                        properties_dict[prop_name] = improved
                        changes = True
                    break
        return changes
    
    changes_made = False
    
    # Improve top-level properties
    if "properties" in schema and isinstance(schema["properties"], dict):
        for doc_path in relevant_docs:
            if doc_path in doc_metadata:
                if improve_properties(schema["properties"], doc_metadata[doc_path]):
                    changes_made = True
    
    # Improve additionalProperties with properties
    if "additionalProperties" in schema and isinstance(schema["additionalProperties"], dict):
        if "properties" in schema["additionalProperties"] and isinstance(schema["additionalProperties"]["properties"], dict):
            for doc_path in relevant_docs:
                if doc_path in doc_metadata:
                    if improve_properties(schema["additionalProperties"]["properties"], doc_metadata[doc_path]):
                        changes_made = True
    
    # Save if changes were made
    if changes_made:
        # Check if actually different
        new_schema = json.dumps(schema, indent=2, sort_keys=True)
        if new_schema != original_schema:
            with open(schema_path, 'w') as f:
                json.dump(schema, f, indent=2)
                f.write('\n')
            return True
    
    return False


def main():
    """Main function to improve all schemas."""
    print("Extracting metadata from documentation...")
    doc_metadata = extract_all_doc_metadata()
    
    print(f"Found metadata for {len(doc_metadata)} documentation files")
    
    # Count fields with different attributes
    total_fields = sum(len(fields) for fields in doc_metadata.values())
    required_fields = sum(1 for fields in doc_metadata.values() for f in fields.values() if f['required'])
    enum_fields = sum(1 for fields in doc_metadata.values() for f in fields.values() if f['enum'])
    default_fields = sum(1 for fields in doc_metadata.values() for f in fields.values() if f['default'])
    
    print(f"Total fields: {total_fields}")
    print(f"  Required: {required_fields}")
    print(f"  With enum: {enum_fields}")
    print(f"  With default: {default_fields}")
    
    print("\nImproving schema files...")
    total_files = 0
    changed_files = 0
    changes_detail = {
        'default_added': 0,
        'enum_added': 0,
        'minLength_added': 0,
        'minimum_added': 0,
        'type_added': 0
    }
    
    for schema_file in SCHEMAS_DIR.rglob("*.json"):
        total_files += 1
        if improve_schema_file(schema_file, doc_metadata):
            changed_files += 1
            print(f"  Updated: {schema_file.relative_to(SCHEMAS_DIR)}")
    
    print(f"\nProcessed {total_files} schema files")
    print(f"Changed {changed_files} schema files")


if __name__ == "__main__":
    main()
