## Full Examples

### ServiceMonitor

```yaml
metrics:
  main:
    enabled: true
    primary: true
    type: servicemonitor
    targetSelector: main
    selector:
      matchLabels:
        app.kubernetes.io/name: my-app
    endpoints:
      - port: main
        interval: 30s
        scrapeTimeout: 10s
        path: /metrics
        scheme: http
        honorLabels: false
```

### ServiceMonitor with relabeling and TLS

```yaml
metrics:
  secure:
    enabled: true
    type: servicemonitor
    targetSelector: main
    endpoints:
      - port: https
        interval: 1m
        path: /metrics
        scheme: https
        params:
          format:
            - prometheus
        tlsConfig:
          insecureSkipVerify: true
        relabelings:
          - sourceLabels:
              - __meta_kubernetes_pod_node_name
            targetLabel: node
        metricRelabelings:
          - sourceLabels:
              - __name__
            regex: go_.*
            action: drop
```

### PodMonitor

```yaml
metrics:
  pods:
    enabled: true
    type: podmonitor
    targetSelector: main
    endpoints:
      - port: metrics
        interval: 15s
        path: /metrics
```

### Prometheus rules

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
      labels:
        release: prometheus
      groups:
        availability:
          rules:
            - alert: AppDown
              expr: up{job="my-app"} == 0
              for: 5m
              labels:
                severity: critical
              annotations:
                summary: my-app is down
                description: The target {{ "{{ $labels.instance }}" }} has been unreachable for 5 minutes.
            - record: my_app:requests:rate5m
              expr: sum(rate(http_requests_total{job="my-app"}[5m]))
