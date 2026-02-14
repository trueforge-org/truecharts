---
title: Traefik
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik`

---

## `ingressMiddlewares.middlewares.traefik`

Configuration for Traefik middlewares.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `ingressMiddlewares.middlewares.traefik` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

## Child Pages

- [Add Prefix](add-prefix.md) - Configuration for the Traefik add-prefix middleware.
- [Basic Auth](basic-auth.md) - Configuration for the Traefik basic-auth middleware.
- [Buffering](buffering.md) - Configuration for the Traefik buffering middleware.
- [Chain](chain.md) - Configuration for the Traefik chain middleware.
- [Compress](compress.md) - Configuration for the Traefik compress middleware.
- [Content Type](content-type.md) - Configuration for the Traefik content-type middleware.
- [Forward Auth](forward-auth.md) - Configuration for the Traefik forward-auth middleware.
- [Headers](headers.md) - Configuration for the Traefik headers middleware.
- [Ip Allow List](ip-allow-list.md) - Configuration for the Traefik ip-allow-list middleware.
- [Plugin Bouncer](plugin-bouncer.md) - Configuration for the Traefik plugin-bouncer middleware.
- [Plugin Geoblock](plugin-geoblock.md) - Configuration for the Traefik plugin-geoblock middleware.
- [Plugin Mod Security](plugin-mod-security.md) - Configuration for the Traefik plugin-mod-security middleware.
- [Plugin Real Ip](plugin-real-ip.md) - Configuration for the Traefik plugin-real-ip middleware.
- [Plugin Rewrite Response Headers](plugin-rewrite-response-headers.md) - Configuration for the Traefik plugin-rewrite-response-headers middleware.
- [Plugin Theme Park](plugin-theme-park.md) - Configuration for the Traefik plugin-theme-park middleware.
- [Rate Limit](rate-limit.md) - Configuration for the Traefik rate-limit middleware.
- [Redirect Regex](redirect-regex.md) - Configuration for the Traefik redirect-regex middleware.
- [Redirect Scheme](redirect-scheme.md) - Configuration for the Traefik redirect-scheme middleware.
- [Replace Path](replace-path.md) - Configuration for the Traefik replace-path middleware.
- [Replace Path Regex](replace-path-regex.md) - Configuration for the Traefik replace-path-regex middleware.
- [Retry](retry.md) - Configuration for the Traefik retry middleware.
- [Strip Prefix](strip-prefix.md) - Configuration for the Traefik strip-prefix middleware.
- [Strip Prefix Regex](strip-prefix-regex.md) - Configuration for the Traefik strip-prefix-regex middleware.

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
