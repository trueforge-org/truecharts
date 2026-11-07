---
title: ports
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/containers/ports#full-examples) section for complete examples.

:::

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

## Full Examples

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          ports:
            - name: http
              containerPort: 8080
              protocol: TCP
            - name: syslog
              containerPort: 5140
              protocol: UDP
```
