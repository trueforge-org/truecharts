---
title: Args
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/args#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container.args`
- `.Values.addons.gluetun.container.args`
- `.Values.addons.netshoot.container.args`
- `.Values.addons.tailscale.container.args`
- `.Values.workload.$name.podSpec.containers.$name.args`
- `.Values.workload.$name.podSpec.initContainers.$name.args`

---

## `args`

Arguments of the container (`args`), which replace the `CMD` of the image. A single argument can be given as a string, several as a list. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.args` |
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
          args:
            - --port=8080
```

---

## Full Examples

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
          args: --verbose
```

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
          args:
            - --port
            - "8080"
          extraArgs:
            - --verbose
```
