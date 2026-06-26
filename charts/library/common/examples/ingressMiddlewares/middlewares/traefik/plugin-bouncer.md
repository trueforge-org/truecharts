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
        crowdsecLapiKey: privateKey-foo
        crowdsecLapiHost: crowdsec:8080
        crowdsecLapiScheme: http
        crowdsecLapiTLSInsecureVerify: false
        crowdsecCapiMachineId: login
        crowdsecCapiPassword: password
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
        redisCachePassword: password
        redisCacheDatabase: "5"
        crowdsecLapiTLSCertificateAuthority: |-
          -----BEGIN TOTALY NOT A CERT-----
          MIIEBzCCAu+gAwIBAgICEAAwDQYJKoZIhvcNAQELBQAwgZQxCzAJBgNVBAYTAlVT
          ...
          Q0veeNzBQXg1f/JxfeA39IDIX1kiCf71tGlT
          -----END TOTALY NOT A CERT-----
        crowdsecLapiTLSCertificateBouncer: |-
          -----BEGIN TOTALY NOT A CERT-----
          MIIEHjCCAwagAwIBAgIUOBTs1eqkaAUcPplztUr2xRapvNAwDQYJKoZIhvcNAQEL
          ...
          RaXAnYYUVRblS1jmePemh388hFxbmrpG2pITx8B5FMULqHoj11o2Rl0gSV6tHIHz
          N2U=
          -----END TOTALY NOT A CERT-----
        captchaProvider: hcaptcha
        captchaSiteKey: FIXME
        captchaSecretKey: FIXME
        captchaGracePeriodSeconds: 1800
        captchaHTMLFilePath: /captcha.html
        banHTMLFilePath: /ban.html
```
