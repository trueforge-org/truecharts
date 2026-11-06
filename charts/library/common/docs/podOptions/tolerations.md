---
title: tolerations
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/podOptions/tolerations#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions.tolerations`
- `.Values.workload.$name.podSpec.tolerations`

---

## `tolerations`

Taints the pods tolerate (`tolerations`), so they can be scheduled on tainted nodes. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

A toleration of a node taint.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].operator`

How the taint is matched: `Exists` matches any value of the key, `Equal` requires `value` to be equal.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
podOptions:
  tolerations:
    - operator: Equal
```

---

## `[].key`

Key of the taint. Required when `operator` is `Equal`.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].value`

Value of the taint. Required when `operator` is `Equal`, and must be empty when it is `Exists`.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].effect`

Effect of the taint to tolerate: `NoSchedule`, `PreferNoSchedule` or `NoExecute`. All effects match when empty.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].effect` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].tolerationSeconds`

Seconds the pod stays bound to a node with a `NoExecute` taint before it is evicted. Only applies to the `NoExecute` effect.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].tolerationSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
podOptions:
  tolerations:
    - tolerationSeconds: 300
```

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
podOptions:
  tolerations:
    - key: dedicated
      operator: Equal
      value: media
      effect: NoSchedule
    - key: node.kubernetes.io/unreachable
      operator: Exists
      effect: NoExecute
      tolerationSeconds: 300
```
