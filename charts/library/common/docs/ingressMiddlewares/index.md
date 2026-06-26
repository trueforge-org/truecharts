---
title: Ingressmiddlewares
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares`

---

## `ingressMiddlewares`

Create Middleware objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `ingressMiddlewares` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `ingressMiddlewares.traefik`

Create Middleware objects

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `ingressMiddlewares.traefik` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

## Child Pages

- [Middlewares](middlewares/) - Configuration for `ingressMiddlewares.middlewares`.

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      expandObjectName: false
      labels:
        key: value
        keytpl: "{{ .Values.some.value }}"
      annotations:
        key: value
        keytpl: "{{ .Values.some.value }}"
      data:
        key: value

    other-middleware-name:
      enabled: true
      type: buffering
      namespace: some-namespace
      data:
        key: value
```
