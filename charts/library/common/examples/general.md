## Full Examples

### TZ and namespace

`TZ` is set as the `TZ` environment variable of all containers. `namespace` is used for every object that does not set its own namespace:

```yaml
TZ: Europe/Amsterdam

namespace: my-namespace
```

A single container can override the timezone with `fixedEnv`:

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
          fixedEnv:
            TZ: America/New_York
```

### extraTpl

Every item of `extraTpl` is rendered as an extra Kubernetes object. An item is a YAML object or a string with a manifest, and Helm `tpl` is resolved in both:

```yaml
extraTpl:
  - apiVersion: v1
    kind: ConfigMap
    metadata:
      name: "{{ .Release.Name }}-extra"
    data:
      key: value
  - |
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: {{ .Release.Name }}-extra-string
    data:
      release: {{ .Release.Name }}
```

### diagnosticMode

Runs the containers with a sleep command instead of the app, so you can `exec` into them. The probes are disabled meanwhile:

```yaml
diagnosticMode:
  enabled: true
```

To do the same for the chart and all of its dependencies, use `global.diagnosticMode.enabled`.

### chartContext

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

### common

`common` is merged into the defaults of the library before the values of the chart. In a chart that depends on `common`, Helm puts the values for the library under this key, and it takes the same values as the chart itself:

```yaml
common:
  TZ: Europe/Amsterdam
  podOptions:
    enableServiceLinks: false
  securityContext:
    pod:
      fsGroup: 1000
```
