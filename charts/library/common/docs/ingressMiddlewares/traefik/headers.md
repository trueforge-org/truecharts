---
title: headers
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/headers#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: headers`.

:::

## Appears in

- `.Values.ingressMiddlewares.traefik.$name`

---

## `data.customRequestHeaders`

Headers added to the request, keyed by name. An empty value removes the header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.customRequestHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.customRequestHeaders.$name`

Value of the header

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.customRequestHeaders.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.customResponseHeaders`

Headers added to the response, keyed by name. An empty value removes the header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.customResponseHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.customResponseHeaders.$name`

Value of the header

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.customResponseHeaders.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.accessControlAllowCredentials`

Sets the `Access-Control-Allow-Credentials` CORS header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.accessControlAllowCredentials` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.accessControlAllowHeaders`

Request headers allowed by CORS, for `Access-Control-Allow-Headers`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.accessControlAllowHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.accessControlAllowMethods`

Request methods allowed by CORS, for `Access-Control-Allow-Methods`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.accessControlAllowMethods` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.accessControlAllowOriginList`

Origins allowed by CORS, for `Access-Control-Allow-Origin`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.accessControlAllowOriginList` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.accessControlAllowOriginListRegex`

Regular expressions of the origins allowed by CORS.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.accessControlAllowOriginListRegex` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.accessControlExposeHeaders`

Response headers exposed to the browser, for `Access-Control-Expose-Headers`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.accessControlExposeHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.accessControlMaxAge`

Seconds a CORS preflight request can be cached, for `Access-Control-Max-Age`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.accessControlMaxAge` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.addVaryHeader`

Add the `Vary` header to CORS responses.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.addVaryHeader` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.allowedHosts`

Host names that are allowed. Empty allows all.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.allowedHosts` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.hostsProxyHeaders`

Headers that can hold the original host name.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.hostsProxyHeaders` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.sslProxyHeaders`

Headers, with their values, that tell the request was made over HTTPS.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.sslProxyHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.sslProxyHeaders.$name`

Value of the header

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.sslProxyHeaders.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `data.stsSeconds`

`max-age` of the `Strict-Transport-Security` header, in seconds. `0` disables it.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.stsSeconds` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.stsIncludeSubdomains`

Add `includeSubDomains` to the `Strict-Transport-Security` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.stsIncludeSubdomains` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.stsPreload`

Add `preload` to the `Strict-Transport-Security` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.stsPreload` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.forceSTSHeader`

Also add the `Strict-Transport-Security` header on plain HTTP requests.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.forceSTSHeader` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.frameDeny`

Set `X-Frame-Options: DENY`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.frameDeny` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.customFrameOptionsValue`

Custom value of the `X-Frame-Options` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.customFrameOptionsValue` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.contentTypeNosniff`

Set `X-Content-Type-Options: nosniff`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.contentTypeNosniff` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.browserXssFilter`

Set `X-XSS-Protection: 1; mode=block`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.browserXssFilter` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.customBrowserXSSValue`

Custom value of the `X-XSS-Protection` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.customBrowserXSSValue` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.contentSecurityPolicy`

Value of the `Content-Security-Policy` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.contentSecurityPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.contentSecurityPolicyReportOnly`

Value of the `Content-Security-Policy-Report-Only` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.contentSecurityPolicyReportOnly` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.publicKey`

Value of the `Public-Key-Pins` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.publicKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.referrerPolicy`

Value of the `Referrer-Policy` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.referrerPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.permissionsPolicy`

Value of the `Permissions-Policy` header.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.permissionsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

---

## `data.isDevelopment`

Allow the headers settings to be ignored for development hosts.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.isDevelopment` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `headers` |

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
        contentSecurityPolicyReportOnly: "default-src 'self'"
        publicKey: some-public-key
        referrerPolicy: some-referrer-policy
        permissionsPolicy: some-permissions-policy
        isDevelopment: true
```
