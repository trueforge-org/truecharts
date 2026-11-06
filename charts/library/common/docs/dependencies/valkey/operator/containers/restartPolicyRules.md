---
title: restartPolicyRules
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/containers/restartPolicyRules#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.containers[].restartPolicyRules`

---

## `restartPolicyRules`

Rules that decide whether the container is restarted on exit.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

Rule that decides whether the container is restarted on exit.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].action`

Action taken when the exit codes match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[].action` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Restart"`, `"RestartAllContainers"` |

---

## `[].exitCodes`

Exit codes the rule applies to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[].exitCodes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].exitCodes.operator`

Whether the `values` are matched (`In`) or not (`NotIn`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[].exitCodes.operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"` |

---

## `[].exitCodes.values`

Exit codes to match.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].restartPolicyRules[].exitCodes.values` |
| Type | `list of int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
dependencies:
  valkey:
    operator:
      containers:
        - restartPolicyRules:
            - action: Restart
```
