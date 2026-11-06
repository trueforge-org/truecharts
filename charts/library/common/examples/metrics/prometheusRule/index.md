## Full Examples

### Alert rules

```yaml
metrics:
  main:
    enabled: true
    primary: true
    type: servicemonitor
    targetSelector: main
    endpoints:
      - port: main
        interval: 30s
        path: /metrics
    prometheusRule:
      enabled: true
      groups:
        availability:
          rules:
            - alert: MyAppDown
              expr: up{job="my-app"} == 0
              for: 5m
              labels:
                severity: critical
              annotations:
                summary: my-app is down
                description: The target {{ "{{ $labels.instance }}" }} has been unreachable for 5 minutes.
            - alert: MyAppHighErrorRate
              expr: sum(rate(http_requests_total{job="my-app",code=~"5.."}[5m])) / sum(rate(http_requests_total{job="my-app"}[5m])) > 0.05
              for: 10m
              keep_firing_for: 5m
              labels:
                severity: warning
              annotations:
                summary: my-app returns many errors
```
