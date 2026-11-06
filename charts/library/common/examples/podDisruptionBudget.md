## Full Examples

### minAvailable

Keep at least one pod of the primary workload running during a voluntary disruption:

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
    unhealthyPodEvictionPolicy: IfHealthyBudget
```

### maxUnavailable and a percentage

Do not combine `minAvailable` and `maxUnavailable`. Both also accept a percentage:

```yaml
podDisruptionBudget:
  other-pdb-name:
    enabled: true
    namespace: some-namespace
    maxUnavailable: 25%
    unhealthyPodEvictionPolicy: AlwaysAllow
```

### Another workload

`targetSelector` is the name of the workload the budget applies to, and defaults to the primary workload:

```yaml
podDisruptionBudget:
  worker-pdb:
    enabled: true
    targetSelector: worker
    minAvailable: 50%

workload:
  worker:
    enabled: true
    type: Deployment
    podSpec:
      containers:
        worker:
          enabled: true
          primary: true
          imageSelector: image
```

### Custom pod labels

`customLabels` replaces the automatically selected pod labels:

```yaml
podDisruptionBudget:
  custom-pdb:
    enabled: true
    minAvailable: 1
    customLabels:
      app.kubernetes.io/name: my-app
      tier: backend
```
