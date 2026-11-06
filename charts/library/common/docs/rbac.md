---
title: RBAC
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/rbac#full-examples) section for complete examples.

:::

## Appears in

- `.Values.rbac`

---

## `rbac`

Roles and RoleBindings (or ClusterRoles and ClusterRoleBindings), keyed by name.

| Field | Value |
| --- | --- |
| Key | `rbac` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

An RBAC object.

| Field | Value |
| --- | --- |
| Key | `rbac.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.subjects`

Extra `subjects` of the (Cluster)RoleBinding, besides the service accounts selected with `serviceAccounts` and `allServiceAccounts`.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.subjects` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.subjects[]`

A subject of the (Cluster)RoleBinding.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.subjects[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.subjects[].apiGroup`

API group of the subject.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.subjects[].apiGroup` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
rbac:
  example:
    subjects:
      - apiGroup: rbac.authorization.k8s.io
```

---

## `$name.subjects[].kind`

Kind of the subject, eg `User`, `Group` or `ServiceAccount`.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.subjects[].kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.subjects[].name`

Name of the subject.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.subjects[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Create this RBAC (Cluster)Role and (Cluster)RoleBinding when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Mark this RBAC object as the primary one.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.namespace`

Namespace to create this object in. Not used when `clusterWide` is true.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.clusterWide`

Create a ClusterRole and ClusterRoleBinding instead of a Role and RoleBinding.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.clusterWide` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.labels`

Additional labels for rbac

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for rbac

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.allServiceAccounts`

Bind the role to all service accounts of the chart.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.allServiceAccounts` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.serviceAccounts`

Names of the `serviceAccount` objects to bind the role to.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.serviceAccounts` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.rules`

Rules of the (Cluster)Role.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.rules` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.rules[]`

A rule of the (Cluster)Role.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.rules[].apiGroups`

API groups the rule applies to.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.rules[].apiGroups` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |

---

## `$name.rules[].resources`

Resources the rule applies to, eg `pods`.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.rules[].resources` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |

---

## `$name.rules[].resourceNames`

Names of resources the rule is limited to.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.rules[].resourceNames` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |

---

## `$name.rules[].verbs`

Verbs the rule allows, eg `get`, `list` or `watch`.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.rules[].verbs` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |

---

## `$name.rules[].nonResourceURLs`

Non-resource URLs the rule applies to, eg `/healthz`. Only for cluster wide RBAC.

| Field | Value |
| --- | --- |
| Key | `rbac.$name.rules[].nonResourceURLs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

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
