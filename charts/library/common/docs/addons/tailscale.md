---
title: Tailscale
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/addons/tailscale#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.tailscale`

---

## `tailscale`

A tailscale container that connects the pod to a tailnet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enable the tailscale addon.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.enabled` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `targetSelector`

Workloads to which the tailscale container is added. Defaults to the primary workload.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  tailscale:
    targetSelector:
      - main
```

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

## `container.enabled`

Whether the tailscale container is created.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `container.imageSelector`

Name of the image to use, a key on the root of the values. Defaults to `tailscaleImage`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.imageSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.probes`

Probes of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.probes.liveness`

The liveness probe.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.liveness` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.probes.liveness.enabled`

Whether the liveness probe is added to the tailscale container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.liveness.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `container.probes.readiness`

The readiness probe.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.readiness` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.probes.readiness.enabled`

Whether the readiness probe is added to the tailscale container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.readiness.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `container.probes.startup`

The startup probe.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.startup` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.probes.startup.enabled`

Whether the startup probe is added to the tailscale container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.probes.startup.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `container.command`

Command of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.resources`

Resources of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.resources.excludeExtra`

Leave out the extra resources, like GPUs, of the chart.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.resources.excludeExtra` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env`

Environment variables of the container, keyed by name.

See [Env](/truecharts-common/workload/podSpec/containers/env) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.securityContext`

Security context of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.securityContext.capabilities`

Linux capabilities of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.securityContext.capabilities` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.securityContext.capabilities.add`

Capabilities that are added.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.securityContext.capabilities.add` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings`

Tailscale settings. Each key sets the matching `TS_*` environment variable of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.config`

Path of a tailscaled config file.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.config` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.authkey`

The Tailscale auth key. It is stored in a secret and loaded from there into the `TS_AUTH_KEY` environment variable of the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.authkey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.userspace`

Run tailscale in userspace networking mode.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.userspace` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.auth_once`

Only log in when the node is not logged in yet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.auth_once` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.accept_dns`

Accept the DNS settings of the tailnet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.accept_dns` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.routes`

Subnet routes that are advertised, comma separated.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.routes` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.dest_ip`

IP that the traffic is forwarded to.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.dest_ip` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.sock5_server`

Address of a SOCKS5 proxy, eg `:1080`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.sock5_server` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.extra_args`

Extra arguments of `tailscale up`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.extra_args` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.daemon_extra_args`

Extra arguments of `tailscaled`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.daemon_extra_args` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `settings.outbound_http_proxy_listen`

Address of an outbound HTTP proxy, eg `:1055`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.settings.outbound_http_proxy_listen` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `annotations`

Additional annotations, keyed by name.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

Tailscale connects the pod to a tailnet. Its settings are mapped to the `TS_*` environment variables of the container.

### Userspace mode

Runs without extra privileges, so the container is run as a non-root user with a read only root filesystem:

```yaml
addons:
  tailscale:
    enabled: true
    settings:
      authkey: tskey-auth-placeholder
      userspace: true
      auth_once: true
      accept_dns: false
```

The auth key is stored in a Secret and loaded from there into `TS_AUTH_KEY`, instead of a plain environment variable.

### Advertise routes

Make networks reachable through the tailnet, and forward traffic to an IP:

```yaml
addons:
  tailscale:
    enabled: true
    settings:
      authkey: tskey-auth-placeholder
      userspace: false
      routes: 10.0.0.0/8,192.168.1.0/24
      dest_ip: 10.0.0.10
```

### Proxies and extra arguments

```yaml
addons:
  tailscale:
    enabled: true
    settings:
      authkey: tskey-auth-placeholder
      sock5_server: ":1080"
      outbound_http_proxy_listen: ":1055"
      extra_args: --advertise-exit-node --hostname=my-app
      daemon_extra_args: --verbose=1
```

### Configuration file

`config` is the path of a `tailscaled` config file in the container:

```yaml
addons:
  tailscale:
    enabled: true
    settings:
      config: /config/tailscaled.json
```

### Container

The environment variables can also be set on the container directly. Add capabilities when the app needs them, and set the workloads with `targetSelector`:

```yaml
addons:
  tailscale:
    enabled: true
    targetSelector:
      - main
    annotations:
      key: value
    settings:
      authkey: tskey-auth-placeholder
    container:
      env:
        TS_STATE_DIR: /var/lib/tailscale
        TS_SOCKET: /var/run/tailscale/tailscaled.sock
        TS_KUBE_SECRET: tailscale-state
      securityContext:
        capabilities:
          add:
            - NET_ADMIN
      probes:
        liveness:
          enabled: false
        readiness:
          enabled: false
        startup:
          enabled: false
      resources:
        excludeExtra: true
```
