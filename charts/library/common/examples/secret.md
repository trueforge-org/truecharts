## Full Examples

```yaml
secret:
  secret-name:
    enabled: true
    type: CustomSecretType
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    data:
      key: value

  other-secret-name:
    enabled: true
    namespace: some-namespace
    data:
      key: |
        multi line
        text value
```
