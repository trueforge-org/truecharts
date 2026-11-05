---
title: resources
---

## Appears in

- `.Values.dependencies.valkey.operator.containers[].resources`
- `.Values.dependencies.valkey.operator.exporter.resources`

---

## `resources`

Resources of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `limits`

Maximum amount of each resource the container can use, keyed by resource name (for example `cpu`, `memory` or `nvidia.com/gpu`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.limits` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `limits.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.limits.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requests`

Minimum amount of each resource the container needs, keyed by resource name (for example `cpu`, `memory` or `nvidia.com/gpu`).

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.requests` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requests.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.requests.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `claims`

Dynamic resource claims of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.claims` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `claims[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.claims[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `claims[].name`

Name of the claim the container uses.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.claims[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `claims[].request`

Name of the request within the claim. Uses every request of the claim when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].resources.claims[].request` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
