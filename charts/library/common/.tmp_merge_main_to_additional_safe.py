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


def merge_schema_dicts(base_schema, main_schema):
    result = copy.deepcopy(base_schema)

    for key, value in main_schema.items():
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
                        existing[prop_key] = merge_schema_dicts(existing[prop_key], prop_val)
            result[key] = existing
            continue

        if key == 'required' and isinstance(existing, list) and isinstance(value, list):
            result[key] = merge_required(existing, value)
            continue

        if key == 'additionalProperties':
            result[key] = merge_additional(existing, value)
            continue

    return result


def merge_additional(existing_ap, main_schema):
    if isinstance(existing_ap, dict) and isinstance(main_schema, dict):
        return merge_schema_dicts(existing_ap, main_schema)

    if isinstance(existing_ap, bool):
        return copy.deepcopy(main_schema)

    if isinstance(main_schema, dict):
        return copy.deepcopy(main_schema)

    return existing_ap


changed_files = []
changed_nodes = [0]

for file_path in sorted(schemas_root.rglob('*.json')):
    doc = json.loads(file_path.read_text())
    dirty = [False]

    def walk(node):
        if isinstance(node, dict):
            props = node.get('properties')
            if isinstance(props, dict) and 'main' in props:
                main_schema = props.pop('main')
                existing_ap = node.get('additionalProperties', True)
                node['additionalProperties'] = merge_additional(existing_ap, main_schema)
                dirty[0] = True
                changed_nodes[0] += 1

            for value in node.values():
                walk(value)
        elif isinstance(node, list):
            for item in node:
                walk(item)

    walk(doc)

    if dirty[0]:
        file_path.write_text(json.dumps(doc, indent=2, ensure_ascii=False) + '\n')
        changed_files.append(str(file_path.relative_to(schemas_root)))

print('CHANGED_FILES', len(changed_files))
print('CHANGED_NODES', changed_nodes[0])
for rel in changed_files:
    print(rel)
