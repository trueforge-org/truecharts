---
title: fixedEnv
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.addons.codeserver.container.fixedEnv`
- `.Values.addons.gluetun.container.fixedEnv`
- `.Values.addons.netshoot.container.fixedEnv`

---

## `fixedEnv`

Settings of the environment variables that common sets.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `NVIDIA_CAPS`

Capabilities of the NVIDIA driver that are made available (`NVIDIA_DRIVER_CAPABILITIES`), for containers that use an `nvidia.com/gpu` resource. Allowed entries are `all`, `compute`, `utility`, `graphics` and `video`, and entries must be unique. Defaults to `containerOptions.NVIDIA_CAPS`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv.NVIDIA_CAPS` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
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
| Key | `addons.codeserver.container.fixedEnv.TZ` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      fixedEnv:
        TZ: Europe/Amsterdam
```

---

## `UMASK`

File creation mask of the container (`UMASK` and `UMASK_SET`). Defaults to `securityContext.container.UMASK`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv.UMASK` |
| Type | `string or int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      fixedEnv:
        UMASK: '0022'
```

---

## `PUID`

User ID of the container (`PUID`), used by images that drop privileges themselves. Defaults to `securityContext.container.PUID`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.fixedEnv.PUID` |
| Type | `string or int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  codeserver:
    container:
      fixedEnv:
        PUID: 568
```

---
