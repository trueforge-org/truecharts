---
title: Fixed Env
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/fixedEnv#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container.fixedEnv`
- `.Values.addons.gluetun.container.fixedEnv`
- `.Values.addons.netshoot.container.fixedEnv`
- `.Values.addons.tailscale.container.fixedEnv`
- `.Values.workload.$name.podSpec.containers.$name.fixedEnv`

---

## `fixedEnv`

Overrides of the environment variables that common sets on every container. Each key replaces the value of `TZ`, `securityContext.container.UMASK`, `securityContext.container.PUID` or `containerOptions.NVIDIA_CAPS` for this container.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.fixedEnv` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `NVIDIA_CAPS`

Capabilities of the NVIDIA driver that are made available (`NVIDIA_DRIVER_CAPABILITIES`), for containers that use an `nvidia.com/gpu` resource. Allowed entries are `all`, `compute`, `utility`, `graphics` and `video`, and entries must be unique. Defaults to `containerOptions.NVIDIA_CAPS`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.fixedEnv.NVIDIA_CAPS` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          fixedEnv:
            NVIDIA_CAPS:
              - compute
              - utility
```

---

## `TZ`

Time zone of the container (`TZ`). Defaults to the top-level `TZ` value.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.fixedEnv.TZ` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          fixedEnv:
            TZ: Europe/Amsterdam
```

---

## `UMASK`

File creation mask of the container (`UMASK` and `UMASK_SET`). Defaults to `securityContext.container.UMASK`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.fixedEnv.UMASK` |
| Type | `string or int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          fixedEnv:
            UMASK: '0022'
```

---

## `PUID`

User ID of the container (`PUID`), used by images that drop privileges themselves. Defaults to `securityContext.container.PUID`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.fixedEnv.PUID` |
| Type | `string or int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          fixedEnv:
            PUID: 568
```

---

## Full Examples

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
          fixedEnv:
            TZ: "America/New_York"
            NVIDIA_CAPS:
              - compute
            UMASK: "003"
            PUID: "0"
```
