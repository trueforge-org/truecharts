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
| Default | unset |

---

## `container.env.TS_SOCKET`

Path of the tailscaled socket.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_SOCKET` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.TS_STATE_DIR`

Directory the state of tailscale is stored in.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_STATE_DIR` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

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

The Tailscale auth key. Use `addons.tailscale.settings.authkey` instead, which stores the key in a secret instead of a plain environment variable.

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

## `container.env.$name`

Environment variable entry by key. A scalar or null is the value, a map holds exactly one of `configMapKeyRef`, `secretKeyRef` or `fieldRef`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name` |
| Type | `number or int or bool or map or null` |
| Required | ✅ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `container.env.$name.configMapKeyRef`

Use a key of a ConfigMap as value.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.$name.configMapKeyRef.name`

Name of the ConfigMap. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.configMapKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `container.env.$name.configMapKeyRef.key`

Key in the ConfigMap whose value is used.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.$name.configMapKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a ConfigMap of this chart. Set to `false` to use an existing ConfigMap.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.configMapKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `container.env.$name.secretKeyRef`

Use a key of a Secret as value.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.$name.secretKeyRef.name`

Name of the Secret. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.secretKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `container.env.$name.secretKeyRef.key`

Key in the Secret whose value is used.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.$name.secretKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a Secret of this chart. Set to `false` to use an existing Secret.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.secretKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `container.env.$name.fieldRef`

Use a field of the pod as value, eg its name or IP.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.$name.fieldRef.fieldPath`

Path of the field, eg `metadata.name` or `status.podIP`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.fieldRef.fieldPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
addons:
  tailscale:
    container:
      env:
        example:
          fieldRef:
            fieldPath: metadata.name
```

---

## `container.env.$name.fieldRef.apiVersion`

API version of the field path. Kubernetes uses `v1` when empty.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.fieldRef.apiVersion` |
| Type | `string` |
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
