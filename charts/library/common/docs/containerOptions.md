---
title: Container Options
---

:::note

- See the [Full Examples](/truecharts-common/containerOptions#full-examples) section for complete examples.

:::

## Appears in

- `.Values.containerOptions`

---

## `containerOptions`

Options that apply to all containers, unless overridden at the container level. See [containerOptions](/truecharts-common/containerOptions).

| Field | Value |
| --- | --- |
| Key | `containerOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"NVIDIA_CAPS": ["all"]}` |

---

## `NVIDIA_CAPS`

Driver capabilities passed to the NVIDIA runtime as the `NVIDIA_DRIVER_CAPABILITIES` environment variable of a container that uses an NVIDIA GPU.

| Field | Value |
| --- | --- |
| Key | `containerOptions.NVIDIA_CAPS` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `["all"]` |

---

## Full Examples

### NVIDIA capabilities

Sets the `NVIDIA_DRIVER_CAPABILITIES` of every container. The default is `all`:

```yaml
containerOptions:
  NVIDIA_CAPS:
    - compute
    - utility
```

### Video transcoding

```yaml
containerOptions:
  NVIDIA_CAPS:
    - compute
    - video
    - utility
```

A single container can override the value through `fixedEnv`:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          fixedEnv:
            NVIDIA_CAPS:
              - graphics
```
