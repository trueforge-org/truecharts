---
title: Traefik
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingress/traefik#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress.traefik`

---

## `ingress.traefik`

Create Ingress objects

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `ingress.traefik` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

---

### `ingress.traefik.chartMiddlewares`

Same as middlewares but meant to be used by the chart developer to define some custom middleware specific to this ingress.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `ingress.traefik.chartMiddlewares` |
| Type       | `list of unknown`                  |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `[]`                               |

Example

```yaml
ingress:
  traefik:
    chartMiddlewares:
      []
```

---

### `ingress.traefik.enabled`

Enables or Disables the traefik integration

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `ingress.traefik.enabled` |
| Type       | `boolean`                 |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | `false`                   |

Example

```yaml
ingress:
  traefik:
    enabled: false
```

---

### `ingress.traefik.entrypoints`

Define the entrypoints for this traefik integration

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `ingress.traefik.entrypoints` |
| Type       | `list of string`              |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `"[\"websecure\"]"`           |

Example

```yaml
ingress:
  traefik:
    entrypoints: ["websecure"]
```

---

### `ingress.traefik.forceTLS`

Force TLS on this ingress Adds the `traefik.ingress.kubernetes.io/router.tls` annotation.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `ingress.traefik.forceTLS` |
| Type       | `boolean`                  |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `true`                     |

Example

```yaml
ingress:
  traefik:
    forceTLS: true
```

---

### `ingress.traefik.middlewares`

The middlewares for this traefik integration

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `ingress.traefik.middlewares` |
| Type       | `list of unknown`             |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `[]`                          |

Example

```yaml
ingress:
  traefik:
    middlewares:
      []
```

---

## Full Examples

```yaml
ingress:
  ingress-name:
    integrations:
      traefik:
        enabled: true
        entrypoints:
          - websecure
        forceTLS: true
        middlewares:
          - name: my-middleware
            namespace: ""
            expandObjectName: false
        chartMiddlewares:
          - name: my-middleware
```
