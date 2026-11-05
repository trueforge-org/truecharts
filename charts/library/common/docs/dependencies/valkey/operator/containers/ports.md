---
title: ports
---

## Appears in

- `.Values.dependencies.valkey.operator.containers[].ports`

---

## `ports`

Ports the container listens on.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

Port of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the port, can be referenced by probes. At most 15 characters.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Length | … to 15 |

---

## `[].containerPort`

Port the container listens on.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].containerPort` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 65535 |

---

## `[].hostPort`

Port on the host that is mapped to the `containerPort`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].hostPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 65535 |

---

## `[].protocol`

Protocol of the port.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"TCP"`, `"UDP"`, `"SCTP"` |

---

## `[].hostIP`

Host IP the `hostPort` is bound to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].ports[].hostIP` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
