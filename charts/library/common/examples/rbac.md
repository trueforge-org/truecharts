## Full Examples

```yaml
rbac:
  rbac-name:
    enabled: true
    primary: true
    clusterWide: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    allServiceAccounts: true
    rules:
      - apiGroups:
          - ""
        resources:
          - "{{ .Values.some.value }}"
        resourceNames:
          - "{{ .Values.some.value }}"
        verbs:
          - get
          - "{{ .Values.some.value }}"
          - watch
    subjects:
      - kind: my-kind
        name: "{{ .Values.some.value }}"
        apiGroup: my-api-group

  other-rbac-name:
    enabled: true
    namespace: some-namespace
    serviceAccounts:
      - service-account-name
    rules:
      - apiGroups:
          - ""
        resources:
          - pods
        verbs:
          - get
          - list
          - watch
    subjects:
      - kind: my-kind
        name: my-name
        apiGroup: my-api-group
```
