---
title: Netshoot
---

:::note

- See the [Full Examples](/truecharts-common/addons/netshoot#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.netshoot`

---

## `netshoot`

A netshoot container to debug the network of the pod.

| Field | Value |
| --- | --- |
| Key | `addons.netshoot` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enable running a netshoot container in the pod.

| Field | Value |
| --- | --- |
| Key | `addons.netshoot.enabled` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `targetSelector`

Workloads to which the netshoot container is attached. Defaults to `main`.

| Field | Value |
| --- | --- |
| Key | `addons.netshoot.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container`

Container configuration for the netshoot addon.

Takes the same keys as the [Container](/truecharts-common/workload/podSpec/containers) page, next to the keys below.

| Field | Value |
| --- | --- |
| Key | `addons.netshoot.container` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.targetSelector`

Workloads to which this container is attached.

| Field | Value |
| --- | --- |
| Key | `addons.netshoot.container.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

Netshoot adds a container with network troubleshooting tools to the pod, so you can `exec` into it to debug the network of the app.

### Enable

```yaml
addons:
  netshoot:
    enabled: true
```

### Other workloads

```yaml
addons:
  netshoot:
    enabled: true
    targetSelector:
      - main
      - worker
```

### Container options

```yaml
addons:
  netshoot:
    enabled: true
    container:
      resources:
        limits:
          cpu: 500m
          memory: 512Mi
      env:
        MY_VAR: my-value
```

### Image

The image is `netshootImage`:

```yaml
netshootImage:
  repository: oci.trueforge.org/containerforge/netshoot
  pullPolicy: IfNotPresent
  tag: 0.14.0@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
```
