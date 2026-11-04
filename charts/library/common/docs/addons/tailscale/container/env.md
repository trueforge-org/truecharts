---
title: Env
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/tailscale/container/env#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.tailscale.container.env`

---

## `addons.tailscale.container.env`

Configuration for `addons.tailscale.container.env`.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `addons.tailscale.container.env` |
| Type       | `map, null`                      |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `addons.tailscale.container.env.$name.configMapKeyRef`

Reference an entry from a ConfigMap.

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `addons.tailscale.container.env.$name.configMapKeyRef` |
| Type       | `map`                                                  |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

---

### `addons.tailscale.container.env.$name.fieldRef`

Reference a field from the Pod metadata/spec.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `addons.tailscale.container.env.$name.fieldRef` |
| Type       | `map`                                           |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `addons.tailscale.container.env.$name.secretKeyRef`

Reference an entry from a Secret.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `addons.tailscale.container.env.$name.secretKeyRef` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `addons.tailscale.container.env.$name.value`

Direct value for the environment variable.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `addons.tailscale.container.env.$name.value` |
| Type       | `string`                                     |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `addons.tailscale.container.env.TS_ACCEPT_DNS`

Accept the DNS settings of the tailnet.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_ACCEPT_DNS` |
| Type       | `boolean`                                      |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `addons.tailscale.container.env.TS_AUTH_KEY`

The Tailscale auth key. Use `addons.tailscale.settings.authkey` instead, which stores the key in a secret instead of a plain environment variable.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_AUTH_KEY` |
| Type       | `string`                                     |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

---

### `addons.tailscale.container.env.TS_AUTH_ONCE`

Only log in when the node is not logged in yet.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_AUTH_ONCE` |
| Type       | `boolean`                                     |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `addons.tailscale.container.env.TS_DEST_IP`

IP that the traffic is forwarded to.

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_DEST_IP` |
| Type       | `string`                                    |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

---

### `addons.tailscale.container.env.TS_EXTRA_ARGS`

Extra arguments of `tailscale up`.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_EXTRA_ARGS` |
| Type       | `string`                                       |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

---

### `addons.tailscale.container.env.TS_KUBE_SECRET`

Secret the state of tailscale is stored in.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_KUBE_SECRET` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

---

### `addons.tailscale.container.env.TS_OUTBOUND_HTTP_PROXY_LISTEN`

Address of an outbound HTTP proxy.

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_OUTBOUND_HTTP_PROXY_LISTEN` |
| Type       | `string`                                                       |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | unset                                                          |

---

### `addons.tailscale.container.env.TS_ROUTES`

Subnet routes that are advertised.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `addons.tailscale.container.env.TS_ROUTES` |
| Type       | `string`                                   |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `addons.tailscale.container.env.TS_SOCKET`

Path of the tailscaled socket.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `addons.tailscale.container.env.TS_SOCKET` |
| Type       | `string`                                   |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

---

### `addons.tailscale.container.env.TS_SOCKS5_SERVER`

Address of a SOCKS5 proxy.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_SOCKS5_SERVER` |
| Type       | `string`                                          |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |

---

### `addons.tailscale.container.env.TS_STATE_DIR`

Directory the state of tailscale is stored in.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_STATE_DIR` |
| Type       | `string`                                      |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

### `addons.tailscale.container.env.TS_TAILSCALED_EXTRA_ARGS`

Extra arguments of `tailscaled`.

| Field      | Value                                                     |
| ---------- | --------------------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_TAILSCALED_EXTRA_ARGS` |
| Type       | `string`                                                  |
| Required   | ❌                                                        |
| Helm `tpl` | ❌                                                        |
| Default    | unset                                                     |

---

### `addons.tailscale.container.env.TS_USERSPACE`

Run tailscale in userspace networking mode.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `addons.tailscale.container.env.TS_USERSPACE` |
| Type       | `boolean`                                     |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

---

## Full Examples

```yaml
addons:
  codeserver:
    enabled: true
    container:
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
    service:
      enabled: true
      ports:
        codeserver:
          enabled: true
          port: 12345
          targetPort: 12345
    ingress:
      enabled: true
      hosts:
        - host: code.chart-example.local
          paths:
            - path: /
              pathType: Prefix
```
