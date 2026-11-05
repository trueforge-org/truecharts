---
title: lifecycle
---

## Appears in

- `.Values.addons.codeserver.container.lifecycle`
- `.Values.addons.gluetun.container.lifecycle`
- `.Values.addons.netshoot.container.lifecycle`

---

## `lifecycle`

Lifecycle hooks of the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `preStop`

Hook that runs before the container is stopped, before it receives SIGTERM.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `preStop.type`

Type of the hook. `exec` runs `command`, `http` and `https` send a GET request.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.type` |
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
| Key | `addons.codeserver.container.lifecycle.preStop.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `preStop.port`

Port of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `preStop.path`

Path of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `preStop.host`

Host of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `preStop.httpHeaders`

Headers of the request, keyed by name, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.httpHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `preStop.httpHeaders.$name`

Value of the header

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.preStop.httpHeaders.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postStart`

Hook that runs right after the container is created. The container is not marked as running until it completes.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postStart.type`

Type of the hook. `exec` runs `command`, `http` and `https` send a GET request.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.type` |
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
| Key | `addons.codeserver.container.lifecycle.postStart.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `postStart.port`

Port of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `postStart.path`

Path of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `postStart.host`

Host of the request, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `postStart.httpHeaders`

Headers of the request, keyed by name, for `type: http` and `https`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.httpHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `postStart.httpHeaders.$name`

Value of the header

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.lifecycle.postStart.httpHeaders.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
