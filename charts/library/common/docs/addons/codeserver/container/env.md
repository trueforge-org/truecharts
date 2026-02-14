---
title: Env
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons/codeserver/container/env#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container.env`

---

## `addons.codeserver.container.env`

Environment variables for codeserver addon.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `addons.codeserver.container.env` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `addons.codeserver.container.env.DEFAULT_WORKSPACE`

Default workspace path.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `addons.codeserver.container.env.DEFAULT_WORKSPACE` |
| Type       | `string`                                            |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `addons.codeserver.container.env.PORT`

Code-server port.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `addons.codeserver.container.env.PORT` |
| Type       | `integer`                              |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

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
