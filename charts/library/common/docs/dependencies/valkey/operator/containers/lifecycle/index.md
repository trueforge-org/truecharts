---
title: lifecycle
---

## Appears in

- `.Values.dependencies.valkey.operator.containers[].lifecycle`

---

## Child Pages

- [postStart](/truecharts-common/dependencies/valkey/operator/containers/lifecycle/postStart)

---

## `lifecycle`

Lifecycle hooks of the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `postStart`

Handler run right after the container started.

See [postStart](/truecharts-common/dependencies/valkey/operator/containers/lifecycle/postStart) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.postStart` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `preStop`

Handler run before the container is stopped.

See [postStart](/truecharts-common/dependencies/valkey/operator/containers/lifecycle/postStart) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.preStop` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `stopSignal`

Signal sent to the container to stop it, instead of the default.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].lifecycle.stopSignal` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"SIGABRT"`, `"SIGALRM"`, `"SIGBUS"`, `"SIGCHLD"`, `"SIGCLD"`, `"SIGCONT"`, `"SIGFPE"`, `"SIGHUP"`, `"SIGILL"`, `"SIGINT"`, `"SIGIO"`, `"SIGIOT"`, `"SIGKILL"`, `"SIGPIPE"`, `"SIGPOLL"`, `"SIGPROF"`, `"SIGPWR"`, `"SIGQUIT"`, `"SIGSEGV"`, `"SIGSTKFLT"`, `"SIGSTOP"`, `"SIGSYS"`, `"SIGTERM"`, `"SIGTRAP"`, `"SIGTSTP"`, `"SIGTTIN"`, `"SIGTTOU"`, `"SIGURG"`, `"SIGVTALRM"`, `"SIGWINCH"`, `"SIGXCPU"`, `"SIGXFSZ"`, `"SIGRTMIN"`, `"SIGRTMAX"` |

---
