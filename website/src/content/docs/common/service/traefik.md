---
title: Traefik Integration
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/common/service/traefik#full-examples) section for complete examples.

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

Alternatively you can set a [server name](/common/service/traefik#servername)
and [root CAs](/common/service/traefik#rootcas) to use when performing TLS validation.

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
| Type       | `bool`                                          |
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

The secrets must contain a key called `ca.crt` with the value being the certificate
authority. For more information refer to the [official documentation](https://doc.traefik.io/traefik/reference/routing-configuration/kubernetes/crd/http/serverstransport/#serverstransport-rootcas) and [this fixture](https://github.com/traefik/traefik/blob/6df82676aaf8186215086a1d9e934170fb5db13f/pkg/provider/kubernetes/crd/fixtures/with_servers_transport.yml).

:::

|            |                                                 |
| ---------- | ----------------------------------------------- |
| Key        | `service.$name.integrations.traefik.rootCAs` |
| Type       | `bool`                                          |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | `[]`                                            |

Example

```yaml
service:
  service-name:
    integrations:
      traefik:
        rootCAs:
          - my-ca-secret
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
          - my-ca-secret
```
