---
title: container
---

## Appears in

- `.Values.addons.tailscale.container`

---

## Child Pages

- [env](/truecharts-common/addons/tailscale/container/env)

---

## `container`

Container of the tailscale addon. It supports the same settings as a container of a workload.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the tailscale container is created.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `imageSelector`

Name of the image to use, a key on the root of the values. Defaults to `tailscaleImage`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.imageSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes`

Probes of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes.liveness`

The liveness probe.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.liveness` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes.liveness.enabled`

Whether the liveness probe is added to the tailscale container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.liveness.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `probes.readiness`

The readiness probe.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.readiness` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes.readiness.enabled`

Whether the readiness probe is added to the tailscale container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.readiness.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `probes.startup`

The startup probe.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.startup` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes.startup.enabled`

Whether the startup probe is added to the tailscale container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.startup.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `command`

Command of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources`

Resources of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources.excludeExtra`

Leave out the extra resources, like GPUs, of the chart.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.resources.excludeExtra` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env`

Environment variables of the container, keyed by name.

See [env](/truecharts-common/addons/tailscale/container/env) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext`

Security context of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext.capabilities`

Linux capabilities of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.securityContext.capabilities` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext.capabilities.add`

Capabilities that are added.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.securityContext.capabilities.add` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
