---
title: Headers
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingressMiddlewares/middlewares/traefik/headers#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingressMiddlewares.middlewares.traefik.headers`

---

## `ingressMiddlewares.middlewares.traefik.headers`

Configuration for the Traefik headers middleware.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `ingressMiddlewares.middlewares.traefik.headers` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: headers
      data:
        customRequestHeaders:
          some-name: some-value
          some-other-name: some-other-value
        customResponseHeaders:
          some-name: some-value
          some-other-name: some-other-value
        accessControlAllowCredentials: true
        accessControlAllowHeaders:
          - some-header
          - some-other-header
        accessControlAllowMethods:
          - GET
          - DELETE
        accessControlAllowOriginList:
          - some-origin
          - some-other-origin
        accessControlAllowOriginListRegex:
          - some-origin-regex
          - some-other-origin-regex
        accessControlExposeHeaders:
          - some-header
          - some-other-header
        accessControlMaxAge: 1000
        addVaryHeader: true
        allowedHosts:
          - some-host
          - some-other-host
        hostsProxyHeaders:
          - some-header
          - some-other-header
        sslProxyHeaders:
          some-header: some-value
          some-other-header: some-other-value
        stsSeconds: 1000
        stsIncludeSubdomains: true
        stsPreload: true
        forceSTSHeader: true
        frameDeny: true
        customFrameOptionsValue: some-value
        contentTypeNosniff: true
        browserXssFilter: true
        customBrowserXSSValue: some-value
        contentSecurityPolicy: some-value
        contentSecurityPolicyReportOnly: true
        publicKey: some-public-key
        referrerPolicy: some-referrer-policy
        permissionsPolicy: some-permissions-policy
        isDevelopment: true
```
