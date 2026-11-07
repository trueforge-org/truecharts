---
title: lifecycle
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/containers/lifecycle#full-examples) section for complete examples.

:::

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

## Full Examples

### Hooks

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          lifecycle:
            postStart:
              exec:
                command:
                  - /bin/sh
                  - -c
                  - echo started > /tmp/started
            preStop:
              exec:
                command:
                  - /bin/sh
                  - -c
                  - sleep 5
```

### Stop signal

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          lifecycle:
            stopSignal: SIGTERM
            preStop:
              sleep:
                seconds: 10
```
