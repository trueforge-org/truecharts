## Full Examples

```yaml
podDisruptionBudget:
  pdb-name:
    enabled: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    minAvailable: 1
    maxUnavailable: 1
    unhealthyPodEvictionPolicy: IfHealthyBudget

  other-pdb-name:
    enabled: true
    namespace: some-namespace
    minAvailable: 1
```
