## Full Examples

### Role bound to all service accounts

With `clusterWide`, a ClusterRole and ClusterRoleBinding are created instead of a Role and RoleBinding:

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
```

### Role bound to a service account

`serviceAccounts` lists the names of `serviceAccount` objects of the chart:

```yaml
serviceAccount:
  service-account-name:
    enabled: true
    primary: true

rbac:
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
```

### Extra subjects

`subjects` are added besides the service accounts. This is how you bind a role to a user or group:

```yaml
rbac:
  subjects-rbac:
    enabled: true
    rules:
      - apiGroups:
          - apps
        resources:
          - deployments
        verbs:
          - get
          - list
    subjects:
      - kind: User
        name: jane
        apiGroup: rbac.authorization.k8s.io
      - kind: Group
        name: developers
        apiGroup: rbac.authorization.k8s.io
```

### Non resource URLs

```yaml
rbac:
  metrics-reader:
    enabled: true
    clusterWide: true
    allServiceAccounts: true
    rules:
      - apiGroups:
          - ""
        resources:
          - nodes/metrics
        verbs:
          - get
      - nonResourceURLs:
          - /metrics
        apiGroups:
          - ""
        resources:
          - nodes
        verbs:
          - get
```
