---
title: Command
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/command#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container.command`
- `.Values.addons.gluetun.container.command`
- `.Values.addons.netshoot.container.command`
- `.Values.addons.tailscale.container.command`
- `.Values.workload.$name.podSpec.containers.$name.command`
- `.Values.workload.$name.podSpec.initContainers.$name.command`

---

## `command`

Entrypoint of the container (`command`), which replaces the `ENTRYPOINT` of the image. A single command can be given as a string, several as a list. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.command` |
| Type | `string or list of string` |
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
          command:
            - /bin/sh
```

---

## Full Examples

### As a list

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
          command:
            - command1
            - command2
```

### As a string

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
          command: command
```
