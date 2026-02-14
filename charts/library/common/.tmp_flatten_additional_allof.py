import copy
import json
from pathlib import Path

files = [
    Path('/Users/kjeld/GIT/trueforge/truecharts/charts/library/common/schemas/service/service.json'),
    Path('/Users/kjeld/GIT/trueforge/truecharts/charts/library/common/schemas/workload/workload.json'),
]


def merge_required(a, b):
    out = []
    seen = set()
    for x in a + b:
        if x not in seen:
            out.append(x)
            seen.add(x)
    return out


def merge_schema_dicts(base_schema, add_schema):
    result = copy.deepcopy(base_schema)
    for key, value in add_schema.items():
        if key not in result:
            result[key] = copy.deepcopy(value)
            continue

        existing = result[key]

        if key == 'properties' and isinstance(existing, dict) and isinstance(value, dict):
            for prop_key, prop_val in value.items():
                if prop_key not in existing:
                    existing[prop_key] = copy.deepcopy(prop_val)
                elif isinstance(existing[prop_key], dict) and isinstance(prop_val, dict):
                    existing[prop_key] = merge_schema_dicts(existing[prop_key], prop_val)
            result[key] = existing
            continue

        if key == 'required' and isinstance(existing, list) and isinstance(value, list):
            result[key] = merge_required(existing, value)
            continue

        if key == 'additionalProperties' and isinstance(existing, dict) and isinstance(value, dict):
            result[key] = merge_schema_dicts(existing, value)
            continue

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
                    merged = merge_schema_dicts(merged, schema)
                node['additionalProperties'] = merged
                changed = True

    elif isinstance(node, list):
        for item in node:
            changed = normalize(item) or changed

    return changed

changed_files = []
for path in files:
    doc = json.loads(path.read_text())
    if normalize(doc):
        path.write_text(json.dumps(doc, indent=2, ensure_ascii=False) + '\n')
        changed_files.append(str(path))

print('NORMALIZED', len(changed_files))
for item in changed_files:
    print(item)
