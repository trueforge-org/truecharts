---
title: "Labels, Annotations and Namespace"
---

:::note

- See the [Full Examples](/truecharts-common/metadata#full-examples) section for complete examples.

:::

## Appears in

- `.Values.global.labels`
- `.Values.certificate.$name.labels`
- `.Values.cnpg.$name.labels`
- `.Values.configmap.$name.labels`
- `.Values.hpa.$name.labels`
- `.Values.imagePullSecret.$name.labels`
- `.Values.ingress.$name.labels`
- `.Values.metrics.$name.labels`
- and 152 more places

---

## `workload.$name.podSpec.labels`

Common labels object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.podSpec.labels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.labels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.podSpec.annotations`

Common annotations object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.podSpec.annotations.$name`

Value of the annotation

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.annotations.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.annotationsList`

Additional annotations as a list of name and value pairs. Merged into the `annotations` of the object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.annotationsList[]`

| Field | Value |
| --- | --- |
| Key | `workload.$name.annotationsList[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.annotationsList[].name`

Name of the annotation

| Field | Value |
| --- | --- |
| Key | `workload.$name.annotationsList[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.annotationsList[].value`

Value of the annotation

| Field | Value |
| --- | --- |
| Key | `workload.$name.annotationsList[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.labelsList`

Additional labels as a list of name and value pairs. Merged into the `labels` of the object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.labelsList[]`

| Field | Value |
| --- | --- |
| Key | `workload.$name.labelsList[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.labelsList[].name`

Name of the label

| Field | Value |
| --- | --- |
| Key | `workload.$name.labelsList[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `workload.$name.labelsList[].value`

Value of the label

| Field | Value |
| --- | --- |
| Key | `workload.$name.labelsList[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `service.$name.namespace`

Name of a namespace.

| Field | Value |
| --- | --- |
| Key | `service.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Labels and annotations on one object

Labels and annotations are maps. The values support Helm `tpl`:

```yaml
configmap:
  my-config:
    enabled: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    data:
      key: value
```

### labelsList and annotationsList

The lists take a `name` and a `value`, and are merged into `labels` and `annotations`. They are useful when a name is not a plain YAML key, or when a list is easier to extend from several values files. The values support Helm `tpl`:

```yaml
configmap:
  my-config:
    enabled: true
    labelsList:
      - name: example.com/team
        value: "{{ .Values.labelValue }}"
      - name: other-key
        value: other-value
    annotationsList:
      - name: example.com/owner
        value: "{{ .Values.annotationValue }}"
    data:
      key: value
```

### Labels and annotations on all objects

`global` labels and annotations are added to every object of the chart:

```yaml
global:
  labels:
    team: platform
  annotations:
    owner: platform@example.com
```

### Namespace

Objects are created in `namespace`, unless they set their own. `global.namespace` also applies to the dependencies:

```yaml
global:
  namespace: my-namespace

namespace: my-namespace

secret:
  other-namespace-secret:
    enabled: true
    namespace: some-other-namespace
    data:
      key: value
```
