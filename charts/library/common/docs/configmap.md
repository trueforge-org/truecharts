---
title: ConfigMap
---

:::note

- See the [Full Examples](/truecharts-common/configmap#full-examples) section for complete examples.

:::

## Appears in

- `.Values.configmap`

---

## `configmap`

ConfigMaps, keyed by name.

| Field | Value |
| --- | --- |
| Key | `configmap` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

A ConfigMap.

| Field | Value |
| --- | --- |
| Key | `configmap.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.expandObjectName`

Prefix the name of the ConfigMap with the chart fullname.

| Field | Value |
| --- | --- |
| Key | `configmap.$name.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `true` |

---

## `$name.data`

Data entries of the ConfigMap, keyed by file or variable name. Values are Helm `tpl` strings.

| Field | Value |
| --- | --- |
| Key | `configmap.$name.data` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.data.$name`

Content of the entry.

| Field | Value |
| --- | --- |
| Key | `configmap.$name.data.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Create this ConfigMap when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `configmap.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.namespace`

Namespace to create this object in. Overrides the chart-wide `namespace` and `global.namespace`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `configmap.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.labels`

Additional labels for configmap

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `configmap.$name.labels` |
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
| Key | `configmap.$name.annotationsList` |
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
| Key | `configmap.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for configmap

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `configmap.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## Full Examples

### Basic ConfigMap

The name of the ConfigMap is prefixed with the fullname of the chart:

```yaml
configmap:
  configmap-name:
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

### Multi line values and a namespace

```yaml
configmap:
  other-configmap-name:
    enabled: true
    namespace: some-namespace
    data:
      key: |
        multi line
        text value
      config.yaml: |
        server:
          port: 8080
```

### Exact name

With `expandObjectName: false`, the name is not prefixed with the fullname of the chart:

```yaml
configmap:
  exact-name:
    enabled: true
    expandObjectName: false
    data:
      key: value
```

### Use it in a volume

```yaml
configmap:
  app-config:
    enabled: true
    data:
      config.ini: |
        [app]
        debug = false

persistence:
  config:
    enabled: true
    type: configmap
    objectName: app-config
    mountPath: /etc/app
    readOnly: true
```
