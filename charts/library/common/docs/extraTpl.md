---
title: Extra Templates
---

:::note

- See the [Full Examples](/truecharts-common/extraTpl#full-examples) section for complete examples.

:::

## Appears in

- `.Values.extraTpl`

---

## `extraTpl`

Extra Kubernetes resources to render, one per list item, as a YAML object or as a string. Helm `tpl` is resolved in each item.

| Field | Value |
| --- | --- |
| Key | `extraTpl` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `[]` |

---

## `[]`

A Kubernetes resource, as a YAML object or as a string with its manifest.

| Field | Value |
| --- | --- |
| Key | `extraTpl[]` |
| Type | `map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].$name`

A field of the resource, passed on as is.

| Field | Value |
| --- | --- |
| Key | `extraTpl[].$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

Every item of `extraTpl` is rendered as an extra Kubernetes object. An item is a YAML object or a string with a manifest, and Helm `tpl` is resolved in both:

```yaml
extraTpl:
  - apiVersion: v1
    kind: ConfigMap
    metadata:
      name: "{{ .Release.Name }}-extra"
    data:
      key: value
  - |
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: {{ .Release.Name }}-extra-string
    data:
      release: {{ .Release.Name }}
```
