---
title: plugin-rewrite-response-headers
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/plugin-rewrite-response-headers#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: plugin-rewrite-response-headers`.

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

## `data.regex`

Regular expression that is matched against the request URL.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.regex` |
| Type | `list or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-rewrite-response-headers`, `redirect-regex`, `replace-path-regex`, `strip-prefix-regex` |

---

## `data.replacement`

Replacement of the matched URL, can use the groups of `regex`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.replacement` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-rewrite-response-headers`, `redirect-regex`, `replace-path-regex` |

---

## `data.rewrites`

Rewrites of the response headers.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.rewrites` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-rewrite-response-headers` |

---

## `data.rewrites[]`

A rewrite of a response header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.rewrites[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.rewrites[].header`

Name of the response header that is rewritten.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.rewrites[].header` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.rewrites[].regex`

Regular expression that is matched against the request URL.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.rewrites[].regex` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.rewrites[].replacement`

Replacement of the matched URL, can use the groups of `regex`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.rewrites[].replacement` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-rewrite-response-headers
      data:
        pluginName: my-plugin-name
        rewrites:
          - header: some-header
            regex: some-regex
            replacement: some-replacement
          - header: some-other-header
            regex: some-other-regex
            replacement: some-other-replacement
```
