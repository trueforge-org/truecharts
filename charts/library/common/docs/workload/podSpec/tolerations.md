---
title: tolerations
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.workload.$name.podSpec.tolerations`

---

## `tolerations`

Taints the pods tolerate (`tolerations`). Overrides `podOptions.tolerations` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A toleration of a node taint.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].operator`

How the taint is matched: `Exists` matches any value of the key, `Equal` requires `value` to be equal.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      tolerations:
        - operator: Equal
```

---

## `[].key`

Key of the taint. Required when `operator` is `Equal`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].value`

Value of the taint. Required when `operator` is `Equal`, and must be empty when it is `Exists`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].effect`

Effect of the taint to tolerate: `NoSchedule`, `PreferNoSchedule` or `NoExecute`. All effects match when empty.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].effect` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].tolerationSeconds`

Seconds the pod stays bound to a node with a `NoExecute` taint before it is evicted. Only applies to the `NoExecute` effect.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].tolerationSeconds` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      tolerations:
        - tolerationSeconds: 300
```

---
