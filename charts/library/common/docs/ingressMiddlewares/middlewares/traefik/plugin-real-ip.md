---
title: Plugin Real Ip
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/plugin-real-ip#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.plugin-real-ip`

---

## `ingressMiddlewares.middlewares.traefik.plugin-real-ip`

Configuration for the Traefik plugin-real-ip middleware.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-real-ip` |
| Type       | `map`                                                   |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `ingressMiddlewares.middlewares.traefik.plugin-real-ip.excludednets`

No description provided.

| Field      | Value                                                                |
| ---------- | -------------------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-real-ip.excludednets` |
| Type       | `list of unknown`                                                    |
| Required   | ✅                                                                   |
| Helm `tpl` | ❌                                                                   |
| Default    | unset                                                                |
| Min Length | `1`                                                                  |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-real-ip
      data:
        pluginName: my-plugin-name
        excludednets:
          - some-excluded-net
          - some-other-excluded-net
```
