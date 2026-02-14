import copy
import json
from pathlib import Path

schemas_root = Path('/Users/kjeld/GIT/trueforge/truecharts/charts/library/common/schemas')


def merge_required(a, b):
    out = []
    seen = set()
    for x in a + b:
        if x not in seen:
            out.append(x)
            seen.add(x)
    return out


def merge_override(base_schema, overlay_schema):
    result = copy.deepcopy(base_schema)

    for key, value in overlay_schema.items():
        if key not in result:
            result[key] = copy.deepcopy(value)
            continue

        existing = result[key]

        if key == 'properties' and isinstance(existing, dict) and isinstance(value, dict):
            for prop_key, prop_val in value.items():
                if prop_key not in existing:
                    existing[prop_key] = copy.deepcopy(prop_val)
                else:
                    if isinstance(existing[prop_key], dict) and isinstance(prop_val, dict):
                        existing[prop_key] = merge_override(existing[prop_key], prop_val)
                    else:
                        existing[prop_key] = copy.deepcopy(prop_val)
            result[key] = existing
            continue

        if key == 'required' and isinstance(existing, list) and isinstance(value, list):
            result[key] = merge_required(existing, value)
            continue

        if key == 'additionalProperties' and isinstance(existing, dict) and isinstance(value, dict):
            result[key] = merge_override(existing, value)
            continue

        result[key] = copy.deepcopy(value)

    return result


def normalize(node):
    changed = False

    if isinstance(node, dict):
        for value in list(node.values()):
            changed = normalize(value) or changed

        ap = node.get('additionalProperties')
        if isinstance(ap, dict) and isinstance(ap.get('allOf'), list):
            schemas = ap['allOf']
            if schemas and all(isinstance(s, dict) for s in schemas):
                merged = copy.deepcopy(schemas[0])
                for schema in schemas[1:]:
                    merged = merge_override(merged, schema)
                node['additionalProperties'] = merged
                changed = True

    elif isinstance(node, list):
        for item in node:
            changed = normalize(item) or changed

    return changed


changed_files = []
for file_path in sorted(schemas_root.rglob('*.json')):
    doc = json.loads(file_path.read_text())
    if normalize(doc):
        file_path.write_text(json.dumps(doc, indent=2, ensure_ascii=False) + '\n')
        changed_files.append(str(file_path.relative_to(schemas_root)))

print('NORMALIZED_FILES', len(changed_files))
for rel in changed_files:
    print(rel)
