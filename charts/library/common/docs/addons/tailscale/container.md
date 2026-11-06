---
title: container
---

## Appears in

- `.Values.addons.tailscale.container`

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

Takes the same keys as the [Env](/truecharts-common/workload/podSpec/containers/env) page, next to the keys below.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_KUBE_SECRET`

Secret the state of tailscale is stored in.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_KUBE_SECRET` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `env.TS_SOCKET`

Path of the tailscaled socket.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_SOCKET` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/var/run/tailscale/tailscaled.sock"` |

---

## `env.TS_STATE_DIR`

Directory the state of tailscale is stored in.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_STATE_DIR` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/var/lib/tailscale/state"` |

---

## `env.TS_USERSPACE`

Run tailscale in userspace networking mode.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_USERSPACE` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_AUTH_ONCE`

Only log in when the node is not logged in yet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_AUTH_ONCE` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_ACCEPT_DNS`

Accept the DNS settings of the tailnet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_ACCEPT_DNS` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_AUTH_KEY`

The Tailscale auth key. Use `addons.tailscale.settings.authkey` instead, which stores the key in a secret instead of a plain environment variable.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_AUTH_KEY` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_TAILSCALED_EXTRA_ARGS`

Extra arguments of `tailscaled`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_TAILSCALED_EXTRA_ARGS` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_EXTRA_ARGS`

Extra arguments of `tailscale up`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_EXTRA_ARGS` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_SOCKS5_SERVER`

Address of a SOCKS5 proxy.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_SOCKS5_SERVER` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_DEST_IP`

IP that the traffic is forwarded to.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_DEST_IP` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_ROUTES`

Subnet routes that are advertised.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_ROUTES` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `env.TS_OUTBOUND_HTTP_PROXY_LISTEN`

Address of an outbound HTTP proxy.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_OUTBOUND_HTTP_PROXY_LISTEN` |
| Type | `string` |
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
