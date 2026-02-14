import json
import subprocess
from pathlib import Path

repo = Path('/Users/kjeld/GIT/trueforge/truecharts')
base = repo / 'charts/library/common/schemas'

targets = [
    'cnpg/cnpg.json',
    'ingress/ingress.json',
    'networkpolicy.json',
    'podDisruptionBudget.json',
    'service/service.json',
    'workload/workload.json',
]

changed = []
for rel in targets:
    current_path = base / rel
    current = json.loads(current_path.read_text())

    head_blob = subprocess.check_output(
        ['git', '-C', str(repo), 'show', f'HEAD:charts/library/common/schemas/{rel}'],
        text=True,
    )
    head_obj = json.loads(head_blob)
    head_main = head_obj.get('properties', {}).get('main')
    if not isinstance(head_main, dict):
        continue

    props = current.get('properties')
    if not isinstance(props, dict):
        current['properties'] = {}
    else:
        props.pop('main', None)

    current['additionalProperties'] = head_main
    current_path.write_text(json.dumps(current, indent=2, ensure_ascii=False) + '\n')
    changed.append(rel)

print('REWIRED', len(changed))
for item in changed:
    print(item)
