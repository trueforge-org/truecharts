---
title: env
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.addons.tailscale.container.env`

---

## `env`

Environment variables of the container, keyed by name.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_KUBE_SECRET`

Secret the state of tailscale is stored in.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_KUBE_SECRET` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_SOCKET`

Path of the tailscaled socket.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_SOCKET` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_STATE_DIR`

Directory the state of tailscale is stored in.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_STATE_DIR` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_USERSPACE`

Run tailscale in userspace networking mode.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_USERSPACE` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_AUTH_ONCE`

Only log in when the node is not logged in yet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_AUTH_ONCE` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_ACCEPT_DNS`

Accept the DNS settings of the tailnet.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_ACCEPT_DNS` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_AUTH_KEY`

The Tailscale auth key. Use `addons.tailscale.settings.authkey` instead, which stores the key in a secret instead of a plain environment variable.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_AUTH_KEY` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_TAILSCALED_EXTRA_ARGS`

Extra arguments of `tailscaled`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_TAILSCALED_EXTRA_ARGS` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_EXTRA_ARGS`

Extra arguments of `tailscale up`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_EXTRA_ARGS` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_SOCKS5_SERVER`

Address of a SOCKS5 proxy.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_SOCKS5_SERVER` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_DEST_IP`

IP that the traffic is forwarded to.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_DEST_IP` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_ROUTES`

Subnet routes that are advertised.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_ROUTES` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `TS_OUTBOUND_HTTP_PROXY_LISTEN`

Address of an outbound HTTP proxy.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.TS_OUTBOUND_HTTP_PROXY_LISTEN` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

Environment variable entry by key. A scalar or null is the value, a map holds exactly one of `configMapKeyRef`, `secretKeyRef` or `fieldRef`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name` |
| Type | `number or int or bool or map or null` |
| Required | ✅ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `$name.configMapKeyRef`

Use a key of a ConfigMap as value.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.configMapKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.configMapKeyRef.name`

Name of the ConfigMap. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.configMapKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.configMapKeyRef.key`

Key in the ConfigMap whose value is used.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.configMapKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.configMapKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a ConfigMap of this chart. Set to `false` to use an existing ConfigMap.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.configMapKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.secretKeyRef`

Use a key of a Secret as value.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.secretKeyRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.secretKeyRef.name`

Name of the Secret. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.secretKeyRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.secretKeyRef.key`

Key in the Secret whose value is used.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.secretKeyRef.key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.secretKeyRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a Secret of this chart. Set to `false` to use an existing Secret.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.secretKeyRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.fieldRef`

Use a field of the pod as value, eg its name or IP.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.fieldRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.fieldRef.fieldPath`

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

## `$name.fieldRef.apiVersion`

API version of the field path. Kubernetes uses `v1` when empty.

| Field | Value |
| --- | --- |
| Key | `addons.tailscale.container.env.$name.fieldRef.apiVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
