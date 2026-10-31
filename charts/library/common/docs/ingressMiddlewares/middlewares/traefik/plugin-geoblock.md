---
title: Plugin Geoblock
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/plugin-geoblock#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.plugin-geoblock`

---

## `ingressMiddlewares.middlewares.traefik.plugin-geoblock`

Configuration for the Traefik plugin-geoblock middleware.

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-geoblock` |
| Type       | `map`                                                    |
| Required   | ❌                                                       |
| Helm `tpl` | ❌                                                       |
| Default    | unset                                                    |

---

### `ingressMiddlewares.middlewares.traefik.plugin-geoblock.api`

No description provided.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-geoblock.api` |
| Type       | `string`                                                     |
| Required   | ✅                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |
| Min Length | `1`                                                          |

---

### `ingressMiddlewares.middlewares.traefik.plugin-geoblock.countries`

No description provided.

| Field      | Value                                                              |
| ---------- | ------------------------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.plugin-geoblock.countries` |
| Type       | `list of unknown`                                                  |
| Required   | ✅                                                                 |
| Helm `tpl` | ❌                                                                 |
| Default    | unset                                                              |
| Min Length | `1`                                                                |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-geoblock
      data:
        api: https://api.geoblock.org/v2/geoblock
        allowLocalRequests: true
        logLocalRequests: true
        logAllowedRequests: true
        logApiRequests: true
        apiTimeoutMs: 1000
        cacheSize: 1000
        forceMonthlyUpdate: true
        allowUnknownCountries: true
        unknownCountryApiResponse: some-value
        blackListMode: some-value
        silentStartUp: true
        addCountryHeader: true
        countries:
          - some-country
          - some-other-country
```
