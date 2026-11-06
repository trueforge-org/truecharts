---
title: livenessProbe
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/containers/livenessProbe#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.containers[].livenessProbe`
- `.Values.dependencies.valkey.operator.containers[].readinessProbe`
- `.Values.dependencies.valkey.operator.containers[].startupProbe`

---

## `livenessProbe`

Liveness probe of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exec`

Run a command in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.exec` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `exec.command`

Command to run in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.exec.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet`

Request to an HTTP endpoint of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.path`

Path to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.port`

Port (number or name of a container port) to request.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.host`

Host to request, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.scheme`

Scheme to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.scheme` |
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
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.httpHeaders` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.httpHeaders[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.httpHeaders[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.httpHeaders[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.httpHeaders[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.httpHeaders[].value`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.httpHeaders[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `httpGet.protocol`

HTTP protocol version to use.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.httpGet.protocol` |
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
| Key | `dependencies.valkey.operator.containers[].livenessProbe.tcpSocket` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tcpSocket.port`

Port (number or name of a container port) to connect to.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.tcpSocket.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tcpSocket.host`

Host to connect to, defaults to the pod IP.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.tcpSocket.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `grpc`

gRPC health check of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.grpc` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `grpc.port`

Port of the gRPC server.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.grpc.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to 65535 |

---

## `grpc.service`

Name of the service to check.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.grpc.service` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `grpc.mode`

Whether the connection uses TLS.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.grpc.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Plaintext"`, `"TLS"` |

---

## `initialDelaySeconds`

Seconds to wait after the container started before the first probe.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.initialDelaySeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `timeoutSeconds`

Seconds after which the probe times out.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `periodSeconds`

How often (in seconds) the probe runs.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.periodSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `successThreshold`

Consecutive successes needed to be considered successful after a failure.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.successThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `failureThreshold`

Consecutive failures needed to be considered failed.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.failureThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `terminationGracePeriodSeconds`

Grace period before the container is stopped when this probe fails.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].livenessProbe.terminationGracePeriodSeconds` |
| Type | `int` |
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
        - livenessProbe:
            exec:
              command:
                - example
            httpGet:
              port: 1
```
