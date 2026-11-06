---
title: Metrics
---

:::note

- See the [Full Examples](/truecharts-common/metrics#full-examples) section for complete examples.

:::

## Appears in

- `.Values.metrics`

---

## Child Pages

- [endpoints](/truecharts-common/metrics/endpoints)
- [prometheusRule](/truecharts-common/metrics/prometheusRule)

---

## `metrics`

ServiceMonitors, PodMonitors and PrometheusRules, keyed by name. See [metrics](/truecharts-common/metrics).

| Field | Value |
| --- | --- |
| Key | `metrics` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A ServiceMonitor or PodMonitor, keyed by name.

| Field | Value |
| --- | --- |
| Key | `metrics.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Create this monitor.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.primary`

Make this the primary metrics object. Only 1 can be primary.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.primary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.type`

Type of the monitor, `servicemonitor` or `podmonitor`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"servicemonitor"` |
| Allowed values | `"servicemonitor"`, `"podmonitor"` |

---

## `$name.selector`

Labels that select the service or pods, instead of `targetSelector`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `{}` |

---

## `$name.selector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.selector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.selector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.endpoints`

Endpoints that are scraped.

See [endpoints](/truecharts-common/metrics/endpoints) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.endpoints` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.prometheusRule`

A PrometheusRule with alerting and recording rules.

See [prometheusRule](/truecharts-common/metrics/prometheusRule) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.prometheusRule` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": false}` |

---

## `$name.targetSelector`

Service or workload the monitor selects. Defaults to the primary one.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.targetSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labels`

Additional labels, keyed by name.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations, keyed by name.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.nameOverride`

Suffix of the name, instead of the name of the object.

| Field | Value |
| --- | --- |
| Key | `metrics.$name.nameOverride` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

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
