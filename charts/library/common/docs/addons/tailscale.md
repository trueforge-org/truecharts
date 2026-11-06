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

Container of the tailscale add-on. It takes the same keys as a container of a workload.

Takes the same keys as the [Container](/truecharts-common/workload/podSpec/containers) page, next to the keys below.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env`

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

## `container.env.TS_KUBE_SECRET`

Secret the state of tailscale is stored in.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_KUBE_SECRET` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `container.env.TS_SOCKET`

Path of the tailscaled socket.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_SOCKET` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/var/run/tailscale/tailscaled.sock"` |

---

## `container.env.TS_STATE_DIR`

Directory the state of tailscale is stored in.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_STATE_DIR` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/var/lib/tailscale/state"` |

---

## `container.env.TS_USERSPACE`

Run tailscale in userspace networking mode.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_USERSPACE` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_AUTH_ONCE`

Only log in when the node is not logged in yet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_AUTH_ONCE` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_ACCEPT_DNS`

Accept the DNS settings of the tailnet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_ACCEPT_DNS` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_AUTH_KEY`

The Tailscale auth key.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_AUTH_KEY` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_TAILSCALED_EXTRA_ARGS`

Extra arguments of `tailscaled`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_TAILSCALED_EXTRA_ARGS` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_EXTRA_ARGS`

Extra arguments of `tailscale up`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_EXTRA_ARGS` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_SOCKS5_SERVER`

Address of a SOCKS5 proxy.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_SOCKS5_SERVER` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_DEST_IP`

IP that the traffic is forwarded to.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_DEST_IP` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_ROUTES`

Subnet routes that are advertised.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_ROUTES` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_OUTBOUND_HTTP_PROXY_LISTEN`

Address of an outbound HTTP proxy.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_OUTBOUND_HTTP_PROXY_LISTEN` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.targetSelector`

Workloads to which this container is attached.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `config`

Tailscale config file, passed to the container.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.config` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `userspace`

Run tailscale in userspace networking mode.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.userspace` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `auth_once`

Only log in when the node is not logged in yet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.auth_once` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `accept_dns`

Accept the DNS settings of the tailnet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.accept_dns` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `routes`

Subnet routes that are advertised, comma separated.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.routes` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dest_ip`

IP that the traffic is forwarded to.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.dest_ip` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `sock5_server`

Address of a SOCKS5 proxy, eg `:1080`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.sock5_server` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `extra_args`

Extra arguments of `tailscale up`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.extra_args` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `daemon_extra_args`

Extra arguments of `tailscaled`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.daemon_extra_args` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `outbound_http_proxy_listen`

Address of an outbound HTTP proxy, eg `:1055`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.outbound_http_proxy_listen` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `authkey`

Auth key to connect to the VPN service.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.authkey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

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

Tailscale connects the pod to a tailnet. It adds a `tailscale` container to the workloads in `targetSelector`.

### Userspace mode

Run tailscale in userspace networking mode:

```yaml
addons:
  tailscale:
    enabled: true
    authkey: tskey-auth-placeholder
    userspace: true
    auth_once: true
    accept_dns: false
```

### Advertise routes

Make networks reachable through the tailnet, and forward traffic to an IP:

```yaml
addons:
  tailscale:
    enabled: true
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
