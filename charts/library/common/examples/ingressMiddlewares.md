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
        maxRequestBodyBytes: 1024

    other-middleware-name:
      enabled: true
      type: buffering
      namespace: some-namespace
      data:
        maxRequestBodyBytes: 1024
```

### Traefik middlewares

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
        maxRequestBodyBytes: 1024

    other-middleware-name:
      enabled: true
      type: buffering
      namespace: some-namespace
      data:
        maxRequestBodyBytes: 1024
```

#### add-prefix

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: add-prefix
      data:
        prefix: some-prefix
```

#### basic-auth

```yaml
ingressMiddlewares:
  traefik:
    middleware-name1:
      enabled: true
      type: basic-auth
      data:
        users:
          - username: some-username
            password: some-password
    middleware-name2:
      enabled: true
      type: basic-auth
      data:
        secret: some-secret
```

#### buffering

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: buffering
      data:
        maxRequestBodyBytes: 1024
        memRequestBodyBytes: 1024
        maxResponseBodyBytes: 1024
        memResponseBodyBytes: 1024
        retryExpression: "some-expression"
```

#### chain

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: chain
      data:
        middlewares:
          - name: some-middleware
          - name: some-other-middleware
            expandObjectName: false
```

#### compress

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: compress
```

#### content-type

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: content-type
```

#### forward-auth

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: forward-auth
      data:
        address: some-address
        authResponseHeadersRegex: some-regex
        trustForwardHeader: true
        authResponseHeaders:
          - some-header
        authRequestHeaders:
          - some-header
        tls:
          insecureSkipVerify: true
```

#### headers

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

#### ip-allow-list

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: ip-allow-list
      data:
        sourceRange:
          - some-source-range
        ipStrategy:
          depth: 1
          excludedIPs:
            - some-excluded-ip
```

#### plugin-bouncer

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

#### plugin-geoblock

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

#### plugin-mod-security

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-mod-security
      data:
        pluginName: my-plugin-name
        modSecurityUrl: https://example.com
        timeoutMillis: 1000
        maxBodySize: 1024
```

#### plugin-real-ip

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

#### plugin-rewrite-response-headers

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

#### plugin-theme-park

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: plugin-theme-park
      data:
        pluginName: my-plugin-name
        app: sonarr
        theme: dark
        baseUrl: https://example.com
        addons:
          - some-addon
          - some-other-addon
```

#### rate-limit

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: rate-limit
      data:
        average: 1000
        burst: 1000
```

#### redirect-regex

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: redirect-regex
      data:
        regex: some-regex
        replacement: some-replacement
        permanent: true
```

#### redirect-scheme

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: redirect-scheme
      data:
        scheme: https
        permanent: true
```

#### replace-path-regex

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: replace-path-regex
      data:
        regex: /some-path
        replacement: /some-replacement
```

#### replace-path

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: replace-path
      data:
        path: /some-path
```

#### retry

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: retry
      data:
        attempts: 3
        initialInterval: 1000
```

#### strip-prefix-regex

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: strip-prefix-regex
      data:
        regex:
          - some-regex
          - some-other-regex
```

#### strip-prefix

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: strip-prefix
      data:
        prefix:
          - /some-prefix
          - /some-other-prefix
        forceSlash: true
```
