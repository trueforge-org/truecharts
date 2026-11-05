---
title: plugin-bouncer
---

:::note

- See the [Full Examples](/truecharts-common/ingressMiddlewares/traefik/plugin-bouncer#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Traefik Middlewares](/truecharts-common/ingressMiddlewares/traefik) page.
- These options apply only when `type: plugin-bouncer`.

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

## `data.enabled`

Enable the plugin. Must be a boolean.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.logLevel`

Log level of the plugin.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.logLevel` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.updateIntervalSeconds`

Seconds between the updates of the decisions in `stream` mode.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.updateIntervalSeconds` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.updateMaxFailure`

Number of failed updates before all requests are blocked. `-1` never blocks.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.updateMaxFailure` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.defaultDecisionSeconds`

Seconds a decision is cached when it has no duration.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.defaultDecisionSeconds` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.httpTimeoutSeconds`

Timeout of the requests to CrowdSec, in seconds.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.httpTimeoutSeconds` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecAppsecEnabled`

Check requests with the CrowdSec AppSec component.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecAppsecEnabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecAppsecHost`

Host and port of the CrowdSec AppSec component.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecAppsecHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecAppsecFailureBlock`

Block requests when the AppSec component returns an error.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecAppsecFailureBlock` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecAppsecUnreachableBlock`

Block requests when the AppSec component can not be reached.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecAppsecUnreachableBlock` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecLapiKey`

Bouncer key for the CrowdSec Local API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecLapiKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecLapiHost`

Host and port of the CrowdSec Local API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecLapiHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecMode`

How decisions are fetched: `none`, `live`, `stream`, `alone` or `appsec`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecMode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecLapiScheme`

Scheme of the CrowdSec Local API, `http` or `https`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecLapiScheme` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecLapiTLSInsecureVerify`

Skip the verification of the certificate of the CrowdSec Local API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecLapiTLSInsecureVerify` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecCapiMachineId`

Machine ID for the CrowdSec Central API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecCapiMachineId` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecCapiPassword`

Password for the CrowdSec Central API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecCapiPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecCapiScenarios`

Scenarios reported to the CrowdSec Central API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecCapiScenarios` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.forwardedHeadersTrustedIPs`

IPs and CIDRs of trusted proxies, whose forwarded headers are used.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.forwardedHeadersTrustedIPs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.clientTrustedIPs`

IPs and CIDRs that are never checked.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.clientTrustedIPs` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.forwardedHeadersCustomName`

Name of the header the client IP is read from.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.forwardedHeadersCustomName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.remediationHeadersCustomName`

Name of the header that carries the remediation of a request.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.remediationHeadersCustomName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.redisCacheEnabled`

Cache the decisions in Redis, shared between Traefik instances.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.redisCacheEnabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.redisCacheHost`

Host and port of the Redis cache.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.redisCacheHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.redisCachePassword`

Password of the Redis cache.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.redisCachePassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.redisCacheDatabase`

Database number of the Redis cache.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.redisCacheDatabase` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecLapiTLSCertificateAuthority`

CA certificate to verify the CrowdSec Local API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecLapiTLSCertificateAuthority` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecLapiTLSCertificateBouncer`

Client certificate of the bouncer for the CrowdSec Local API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecLapiTLSCertificateBouncer` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.crowdsecLapiTLSCertificateBouncerKey`

Client key of the bouncer for the CrowdSec Local API.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.crowdsecLapiTLSCertificateBouncerKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.captchaProvider`

Captcha provider, eg `hcaptcha`, `recaptcha` or `turnstile`.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.captchaProvider` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.captchaSiteKey`

Site key of the captcha provider.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.captchaSiteKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.captchaSecretKey`

Secret key of the captcha provider.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.captchaSecretKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.captchaGracePeriodSeconds`

Seconds a solved captcha stays valid.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.captchaGracePeriodSeconds` |
| Type | `number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.captchaHTMLFilePath`

Path of the HTML page with the captcha.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.captchaHTMLFilePath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## `data.banHTMLFilePath`

Path of the HTML page shown to banned clients.

| Field | Value |
| --- | --- |
| Key | `ingressMiddlewares.traefik.$name.data.banHTMLFilePath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `plugin-bouncer` |

---

## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-bouncer
      data:
        enabled: true
        logLevel: DEBUG
        updateIntervalSeconds: 60
        updateMaxFailure: 0
        defaultDecisionSeconds: 60
        httpTimeoutSeconds: 10
        crowdsecMode: live
        crowdsecAppsecEnabled: false
        crowdsecAppsecHost: crowdsec:7422
        crowdsecAppsecFailureBlock: true
        crowdsecAppsecUnreachableBlock: true
        crowdsecLapiKey: <bouncer key>
        crowdsecLapiHost: crowdsec:8080
        crowdsecLapiScheme: http
        crowdsecLapiTLSInsecureVerify: false
        crowdsecCapiMachineId: login
        crowdsecCapiPassword: <password>
        crowdsecCapiScenarios:
          - crowdsecurity/http-path-traversal-probing
          - crowdsecurity/http-xss-probing
          - crowdsecurity/http-generic-bf
        forwardedHeadersTrustedIPs:
          - 10.0.10.23/32
          - 10.0.20.0/24
        clientTrustedIPs:
          - 192.168.1.0/24
        forwardedHeadersCustomName: X-Custom-Header
        remediationHeadersCustomName: cs-remediation
        redisCacheEnabled: false
        redisCacheHost: "redis:6379"
        redisCachePassword: <password>
        redisCacheDatabase: "5"
        crowdsecLapiTLSCertificateAuthority: |-
          -----BEGIN CERTIFICATE-----
          <ca certificate>
          -----END CERTIFICATE-----
        crowdsecLapiTLSCertificateBouncer: |-
          -----BEGIN CERTIFICATE-----
          <bouncer certificate>
          -----END CERTIFICATE-----
        captchaProvider: hcaptcha
        captchaSiteKey: <site key>
        captchaSecretKey: <secret key>
        captchaGracePeriodSeconds: 1800
        captchaHTMLFilePath: /captcha.html
        banHTMLFilePath: /ban.html
```
