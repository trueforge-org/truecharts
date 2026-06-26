## Full Examples

```yaml
serviceAccount:
  sa-name:
    enabled: true
    primary: true
    namespace: some-namespace
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    targetSelectAll: true

  other-sa-name:
    enabled: true
    namespace: some-namespace
    targetSelector:
      - pod-name
      - other-pod-name
```
