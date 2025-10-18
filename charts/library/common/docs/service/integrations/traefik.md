---
title: Traefik Integration
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/service/integrations/traefik#full-examples)
section for complete examples.

:::

## Appears in

- `.Values.service.$name.integration.traefik`

:::tip

- Replace references to `$name` with the actual name you want to use.

:::

---

## `enabled`

Enables or Disables the traefik integration

|            |                                              |
| ---------- | -------------------------------------------- |
| Key        | `service.$name.integrations.traefik.enabled` |
| Type       | `bool`                                       |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | `false`                                      |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        enabled: true
```

---

## `forceTLS`

Force TLS when talking to the backend service

:::note

Adds the `traefik.ingress.kubernetes.io/service.serversscheme: "https"` annotation.

It does that both with this set OR when there is a service with only https ports

:::

|            |                                               |
| ---------- | --------------------------------------------- |
| Key        | `service.$name.integrations.traefik.forceTLS` |
| Type       | `bool`                                        |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | `false`                                       |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        forceTLS: true
```

---

## `insecureSkipVerify`

Skip TLS verification when taling to an HTTPS backend service

:::note

Allows talking to HTTPS backend services which use self-signed certs.

Alternatively you can set a [server name](/truecharts-common/service/integrations/traefik#servername)
and [root CAs](/truecharts-common/service/integrations/traefik#rootcas) to use when performing
TLS validation.

:::

|            |                                                         |
| ---------- | ------------------------------------------------------- |
| Key        | `service.$name.integrations.traefik.insecureSkipVerify` |
| Type       | `bool`                                                  |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | `false`                                                 |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        insecureSkipVerify: false
```

---

## `serverName`

Set the hostname to use when talking to a backend service

|            |                                                 |
| ---------- | ----------------------------------------------- |
| Key        | `service.$name.integrations.traefik.serverName` |
| Type       | `string`                                        |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | ""                                              |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        serverName: "my.service.com"
```

---

## `rootCAs`

List of kubernetes secrets (in the same namespace) containing certificate
authorities to use when performing TLS verification of the backend service.

:::note

The secrets must contain a key called `ca.crt`, `tls.crt` or `tls.ca` with the
value being the certificate authority. For more information refer to the
[official documentation](https://doc.traefik.io/traefik/reference/routing-configuration/kubernetes/crd/http/serverstransport/#serverstransport-rootcas)
and [this fixture](https://github.com/traefik/traefik/blob/6df82676aaf8186215086a1d9e934170fb5db13f/pkg/provider/kubernetes/crd/fixtures/with_servers_transport.yml).

:::

|            |                                                 |
| ---------- | ----------------------------------------------- |
| Key        | `service.$name.integrations.traefik.rootCAs`    |
| Type       | `list` of `map`                                 |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | `[]`                                            |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        rootCAs: []
```

---

### `rootCAs.secretRef`

Define the secretRef

|            |                                                               |
| ---------- | ------------------------------------------------------------- |
| Key        | `service.$name.integrations.traefik.rootCAs[].secretRef`      |
| Type       | `map`                                                         |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | `{}`                                                          |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        rootCAs:
          - secretRef: {}
```

---

#### `rootCAs.secretRef.name`

Define the secret name

:::note

This will be automatically expanded to `fullname-secret-name`.
You can opt out of this by setting [`expandObjectName`](/truecharts-common/service/integrations/traefik#rootcassecretrefexpandobjectname)
to `false`

:::

|            |                                                                    |
| ---------- | ------------------------------------------------------------------ |
| Key        | `service.$name.integrations.traefik.rootCAs[].secretRef.name`      |
| Type       | `string`                                                           |
| Required   | ✅                                                                 |
| Helm `tpl` | ✅                                                                 |
| Default    | `""`                                                               |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        rootCAs:
          - secretRef:
              name: secret-name
```

---

#### `rootCAs.secretRef.expandObjectName`

Whether to expand (adding the fullname as prefix) the secret name

|            |                                                                                |
| ---------- | ------------------------------------------------------------------------------ |
| Key        | `service.$name.integrations.traefik.rootCAs[].secretRef.expandObjectName`      |
| Type       | `bool`                                                                         |
| Required   | ❌                                                                             |
| Helm `tpl` | ❌                                                                             |
| Default    | `true`                                                                         |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        rootCAs:
          - secretRef:
              name: secret-name
              expandObjectName: false
```

---

### `rootCAs.configMapRef`

Define the configMapRef

|            |                                                                  |
| ---------- | ---------------------------------------------------------------- |
| Key        | `service.$name.integrations.traefik.rootCAs[].configMapRef`      |
| Type       | `map`                                                            |
| Required   | ❌                                                               |
| Helm `tpl` | ❌                                                               |
| Default    | `{}`                                                             |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        rootCAs:
          - configMapRef: {}
```

---

#### `rootCAs.configMapRef.name`

Define the configmap name

:::note

This will be automatically expanded to `fullname-configmap-name`.
You can opt out of this by setting [`expandObjectName`](/truecharts-common/service/integrations/traefik#rootcasconfigmaprefexpandobjectname)
to `false`

:::

|            |                                                                       |
| ---------- | --------------------------------------------------------------------- |
| Key        | `service.$name.integrations.traefik.rootCAs[].configMapRef.name`      |
| Type       | `string`                                                              |
| Required   | ✅                                                                    |
| Helm `tpl` | ✅                                                                    |
| Default    | `""`                                                                  |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        rootCAs:
          - configMapRef:
              name: configmap-name
```

---

#### `rootCAs.configMapRef.expandObjectName`

Whether to expand (adding the fullname as prefix) the configmap name

|            |                                                                                   |
| ---------- | --------------------------------------------------------------------------------- |
| Key        | `service.$name.integrations.traefik.rootCAs[].configMapRef.expandObjectName`      |
| Type       | `bool`                                                                            |
| Required   | ❌                                                                                |
| Helm `tpl` | ❌                                                                                |
| Default    | `true`                                                                            |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        rootCAs:
          - configMapRef:
              name: configmap-name
              expandObjectName: false
```

---

## Full Examples

```yaml
service:
  service-name:
    integrations:
      traefik:
        enabled: true
        forceTLS: true
        insecureSkipVerify: false
        serverName: "my.service.com"
        rootCAs:
          - configMapRef:
              name: configmap-name
              expandObjectName: false
          - secretRef:
              name: secret-name
              expandObjectName: true
```
