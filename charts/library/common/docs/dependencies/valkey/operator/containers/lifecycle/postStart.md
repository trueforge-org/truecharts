---
title: postStart
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/containers/lifecycle/postStart#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.containers[].lifecycle.postStart`
- `.Values.dependencies.valkey.operator.containers[].lifecycle.preStop`

---

## `postStart`

Handler run right after the container started.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exec`

Run a command in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.exec` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exec.command`

Command to run in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.exec.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet`

Request to an HTTP endpoint of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.path`

Path to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.port`

Port (number or name of a container port) to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.host`

Host to request, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.scheme`

Scheme to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.scheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP"`, `"HTTPS"` |

---

## `httpGet.httpHeaders`

Headers to set in the request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.httpHeaders` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.httpHeaders[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.httpHeaders[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.httpHeaders[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.httpHeaders[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.httpHeaders[].value`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.httpHeaders[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.protocol`

HTTP protocol version to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.httpGet.protocol` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"HTTP1"`, `"HTTP2"` |

---

## `tcpSocket`

Connection to a TCP port of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.tcpSocket` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tcpSocket.port`

Port (number or name of a container port) to connect to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.tcpSocket.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tcpSocket.host`

Host to connect to, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.tcpSocket.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `sleep`

Sleep for a number of seconds.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.sleep` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `sleep.seconds`

Seconds to sleep.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart.sleep.seconds` |
| Type | `int` |
| Required | ✅ |
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
        - lifecycle:
            postStart:
              exec:
                command:
                  - example
              httpGet:
                port: 1
```
