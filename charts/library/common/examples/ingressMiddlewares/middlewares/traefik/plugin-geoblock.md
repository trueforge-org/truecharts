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
        blackListMode: some-value
        silentStartUp: true
        addCountryHeader: true
        countries:
          - some-country
          - some-other-country
```
