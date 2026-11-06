---
title: plugin-geoblock
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/plugin-geoblock#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: plugin-geoblock`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.pluginName`

Name of the plugin, as registered in Traefik.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.pluginName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer`, `plugin-geoblock`, `plugin-mod-security`, `plugin-real-ip`, `plugin-rewrite-response-headers`, `plugin-theme-park` |

---

## `data.api`

URL of the geolocation API, with `{ip}` as the placeholder of the client IP.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.api` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.allowLocalRequests`

Allow requests from private networks without a lookup.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.allowLocalRequests` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.logLocalRequests`

Log the requests from private networks.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.logLocalRequests` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.logAllowedRequests`

Log the requests that are allowed.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.logAllowedRequests` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.logApiRequests`

Log the requests to the geolocation API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.logApiRequests` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.apiTimeoutMs`

Timeout of a geolocation API request, in milliseconds.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.apiTimeoutMs` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.cacheSize`

Number of IP lookups that are cached.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.cacheSize` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.forceMonthlyUpdate`

Update the geolocation database at least once a month.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.forceMonthlyUpdate` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.allowUnknownCountries`

Allow requests whose country can not be determined.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.allowUnknownCountries` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.unknownCountryApiResponse`

Response of the geolocation API for an unknown country.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.unknownCountryApiResponse` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.blackListMode`

Block the listed countries, instead of allowing only them.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.blackListMode` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.silentStartUp`

Do not log the start of the plugin.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.silentStartUp` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.addCountryHeader`

Add the country of the client as a request header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.addCountryHeader` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

---

## `data.countries`

Country codes that are allowed, or blocked with `blackListMode`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.countries` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-geoblock` |

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
        blackListMode: true
        silentStartUp: true
        addCountryHeader: true
        countries:
          - some-country
          - some-other-country
```
