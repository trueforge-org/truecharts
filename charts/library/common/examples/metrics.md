## Full Examples

```yaml
metrics:
  main:
    enabled: true
    type: servicemonitor
    targetSelector: main
    endpoints:
      - port: main
        interval: 5s
        scrapeTimeout: 5s
        path: /
    prometheusRule:
      enabled: false
      groups: {}
      additionalgroups: []
```
