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
