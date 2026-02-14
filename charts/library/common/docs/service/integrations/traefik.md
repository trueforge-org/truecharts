---
title: Traefik
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/service/integrations/traefik#full-examples) section for complete examples.

:::

## Appears in

- `.Values.service.integrations.traefik`

---

## `service.integrations.traefik`

Define service objects

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `service.integrations.traefik` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `service.integrations.traefik.enabled`

Enables or Disables the traefik integration

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `service.integrations.traefik.enabled` |
| Type       | `boolean`                              |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `false`                                |

Example

```yaml
service:
  integrations:
    traefik:
      enabled: false
```

---

### `service.integrations.traefik.forceTLS`

Force TLS when talking to the backend service Adds the `traefik.ingress.kubernetes.io/service.serversscheme: "https"` annotation.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `service.integrations.traefik.forceTLS` |
| Type       | `boolean`                               |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `false`                                 |

Example

```yaml
service:
  integrations:
    traefik:
      forceTLS: false
```

---

### `service.integrations.traefik.insecureSkipVerify`

Skip TLS verification when talking to an HTTPS backend service Allows talking to HTTPS backend services which use self-signed certs.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `service.integrations.traefik.insecureSkipVerify` |
| Type       | `boolean`                                         |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | `false`                                           |

Example

```yaml
service:
  integrations:
    traefik:
      insecureSkipVerify: false
```

---

### `service.integrations.traefik.rootCAs`

List of kubernetes secrets (in the same namespace) containing certificate authorities to use when performing TLS verification of the backend service.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `service.integrations.traefik.rootCAs` |
| Type       | `list of unknown`                      |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `[]`                                   |

Example

```yaml
service:
  integrations:
    traefik:
      rootCAs:
        []
```

---

### `service.integrations.traefik.serverName`

Set the hostname to use when talking to a backend service

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `service.integrations.traefik.serverName` |
| Type       | `string`                                  |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

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
