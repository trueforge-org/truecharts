## Full Examples

Common sets `chartContext` on every render, so it is only read, in Helm `tpl` strings. For example, to tell an app its own URL and the networks to trust:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          env:
            APP_URL: "{{ .Values.chartContext.appUrl }}"
            TRUSTED_PROXIES: "{{ .Values.chartContext.podCIDR }},{{ .Values.chartContext.svcCIDR }}"
```

The CIDRs come from `global`:

```yaml
global:
  podCIDR: 10.42.0.0/16
  svcCIDR: 10.43.0.0/16
```
