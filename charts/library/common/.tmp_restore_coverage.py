import copy
import json
import subprocess
from pathlib import Path

repo = Path('/Users/kjeld/GIT/trueforge/truecharts')
schemas_root = repo / 'charts/library/common/schemas'


def get_head_json(rel_path: str):
    blob = subprocess.check_output(
        ['git', '-C', str(repo), 'show', f'HEAD:charts/library/common/schemas/{rel_path}'],
        text=True,
    )
    return json.loads(blob)


def get_by_path(node, path):
    cur = node
    for p in path:
        if isinstance(p, int):
            if not isinstance(cur, list) or p >= len(cur):
                return None
            cur = cur[p]
        else:
            if not isinstance(cur, dict) or p not in cur:
                return None
            cur = cur[p]
    return cur


def iter_main_nodes(node, path=()):
    if isinstance(node, dict):
        props = node.get('properties')
        if isinstance(props, dict) and 'main' in props:
            yield path, node
        for k, v in node.items():
            yield from iter_main_nodes(v, path + (k,))
    elif isinstance(node, list):
        for i, v in enumerate(node):
            yield from iter_main_nodes(v, path + (i,))


def resolve_main_schema(head_obj, rel_path):
    main_schema = copy.deepcopy(head_obj.get('properties', {}).get('main'))
    if not isinstance(main_schema, dict):
        return None
    ref = main_schema.get('$ref')
    if isinstance(ref, str) and ref.endswith('main.json') and '/' not in ref.replace('./', ''):
        try:
            main_rel = str((Path(rel_path).parent / ref).as_posix())
            inlined = get_head_json(main_rel)
            return inlined
        except Exception:
            return main_schema
    return main_schema


def merged_additional(old_ap, main_schema):
    if isinstance(old_ap, dict):
        return {'allOf': [old_ap, main_schema]}
    return main_schema


changed = []
for p in sorted(schemas_root.rglob('*.json')):
    rel = str(p.relative_to(schemas_root))
    try:
        head_doc = get_head_json(rel)
    except Exception:
        continue

    head_nodes = list(iter_main_nodes(head_doc))
    if not head_nodes:
        continue

    cur_doc = json.loads(p.read_text())
    file_changed = False

    for path, head_node in head_nodes:
        cur_node = get_by_path(cur_doc, path)
        if not isinstance(cur_node, dict):
            continue

        props = cur_node.get('properties')
        if isinstance(props, dict) and 'main' in props:
            props.pop('main', None)
            file_changed = True

        main_schema = resolve_main_schema(head_node, rel)
        if not isinstance(main_schema, dict):
            continue

        old_ap = head_node.get('additionalProperties', True)
        new_ap = merged_additional(copy.deepcopy(old_ap), main_schema)

        if cur_node.get('additionalProperties') != new_ap:
            cur_node['additionalProperties'] = new_ap
            file_changed = True

    if file_changed:
        p.write_text(json.dumps(cur_doc, indent=2, ensure_ascii=False) + '\n')
        changed.append(rel)

print('REPAIRED_FILES', len(changed))
for item in changed:
    print(item)
