## Full Examples

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
