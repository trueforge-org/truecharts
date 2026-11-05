## Full Examples

### Primary service account for all workloads

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
```

### Selected workloads

```yaml
serviceAccount:
  other-sa-name:
    enabled: true
    namespace: some-namespace
    targetSelector:
      - pod-name
      - other-pod-name
```

### Mount the token

The token of the service account is only mounted when the app needs to talk to the Kubernetes API:

```yaml
serviceAccount:
  api-access:
    enabled: true
    primary: true
    automountServiceAccountToken: true
    annotations:
      eks.amazonaws.com/role-arn: arn:aws:iam::123456789012:role/my-role
```
