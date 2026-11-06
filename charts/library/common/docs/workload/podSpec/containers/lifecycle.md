---
title: Lifecycle
---

:::note

- See the [Full Examples](/truecharts-common/workload/podSpec/containers/lifecycle#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container.lifecycle`
- `.Values.addons.gluetun.container.lifecycle`
- `.Values.addons.netshoot.container.lifecycle`
- `.Values.addons.tailscale.container.lifecycle`
- `.Values.workload.$name.podSpec.containers.$name.lifecycle`

---

## `lifecycle`

Hooks that run when the container starts or before it stops. Does **not** apply to `initContainers`. See [lifecycle](/truecharts-common/workload/podSpec/containers/lifecycle).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `preStop`

Hook that runs before the container is stopped, before it receives SIGTERM.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.preStop` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `preStop.type`

Type of the hook. `exec` runs `command`, `http` and `https` send a GET request.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.preStop.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"exec"`, `"http"`, `"https"` |

---

## `preStop.command`

Command to run, for `type: exec`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.preStop.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `preStop.port`

Port of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.preStop.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `preStop.path`

Path of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.preStop.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `preStop.host`

Host of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.preStop.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `preStop.httpHeaders`

Headers of the request, keyed by name, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.preStop.httpHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `preStop.httpHeaders.$name`

Value of the header

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.preStop.httpHeaders.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postStart`

Hook that runs right after the container is created. The container is not marked as running until it completes.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.postStart` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postStart.type`

Type of the hook. `exec` runs `command`, `http` and `https` send a GET request.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.postStart.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"exec"`, `"http"`, `"https"` |

---

## `postStart.command`

Command to run, for `type: exec`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.postStart.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `postStart.port`

Port of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.postStart.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `postStart.path`

Path of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.postStart.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `postStart.host`

Host of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.postStart.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `postStart.httpHeaders`

Headers of the request, keyed by name, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.postStart.httpHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `postStart.httpHeaders.$name`

Value of the header

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.lifecycle.postStart.httpHeaders.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### exec

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          lifecycle:
            preStop:
              type: exec
              command:
                - /bin/sh
                - -c
                - sleep 10
            postStart:
              type: exec
              command: /bin/warmup
```

### http

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          lifecycle:
            preStop:
              type: http
              port: 8080
              host: localhost
              path: /shutdown
              httpHeaders:
                key: value
            postStart:
              type: http
              port: "{{ .Values.service.main.ports.main.port }}"
              path: /ready
```

### https

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          lifecycle:
            preStop:
              type: https
              port: 8443
              host: localhost
              path: /shutdown
              httpHeaders:
                Authorization: Bearer token
            postStart:
              type: https
              port: 8443
              path: /started
```
