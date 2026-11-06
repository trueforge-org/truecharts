---
title: Termination
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/termination#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container.termination`
- `.Values.addons.gluetun.container.termination`
- `.Values.addons.netshoot.container.termination`
- `.Values.addons.tailscale.container.termination`
- `.Values.workload.$name.podSpec.containers.$name.termination`
- `.Values.workload.$name.podSpec.initContainers.$name.termination`

---

## `termination`

Where Kubernetes reads the termination message of the container from, which is shown when the container exits.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.termination` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `messagePolicy`

Where the termination message is taken from (`terminationMessagePolicy`): `File` reads only the message file, `FallbackToLogsOnError` uses the end of the container log when the file is empty and the container failed.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.termination.messagePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          termination:
            messagePolicy: FallbackToLogsOnError
```

---

## `messagePath`

Path of the file the container writes its termination message to (`terminationMessagePath`). Kubernetes uses `/dev/termination-log` when empty.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.termination.messagePath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          termination:
            messagePath: /dev/termination-log
```

---

## Full Examples

### File

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
          termination:
            messagePath: /dev/termination-log
            messagePolicy: File
```

### FallbackToLogsOnError

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
          termination:
            messagePath: /tmp/termination-message
            messagePolicy: FallbackToLogsOnError
```
