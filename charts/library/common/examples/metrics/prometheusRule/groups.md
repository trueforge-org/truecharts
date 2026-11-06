## Full Examples

### Alert and recording rules in two groups

```yaml
metrics:
  main:
    enabled: true
    type: servicemonitor
    targetSelector: main
    endpoints:
      - port: main
        interval: 30s
        path: /metrics
    prometheusRule:
      enabled: true
      groups:
        alerts:
          name: my-app.alerts
          rules:
            - alert: MyAppDown
              expr: up{job="my-app"} == 0
              for: 5m
              labels:
                severity: critical
              annotations:
                summary: my-app is down
                description: The target {{ "{{ $labels.instance }}" }} has been unreachable for 5 minutes.
            - alert: MyAppSlowRequests
              expr: histogram_quantile(0.95, sum by (le) (rate(http_request_duration_seconds_bucket{job="my-app"}[5m]))) > 2
              for: 15m
              labels:
                severity: warning
              annotations:
                summary: 95th percentile latency is above 2 seconds
        recordings:
          name: my-app.rules
          rules:
            - record: my_app:requests:rate5m
              expr: sum(rate(http_requests_total{job="my-app"}[5m]))
              labels:
                team: platform
```
