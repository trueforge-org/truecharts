## Full Examples

### Labels, annotations and namespace

Labels and annotations on all objects of the chart. `global.namespace` also applies to the dependencies:

```yaml
global:
  labels:
    key: value
    keytpl: "{{ .Values.some.value }}"
  annotations:
    key: value
  namespace: my-namespace
```

### Cluster networks

The pod and service CIDR of the cluster. Addons like gluetun use them to keep cluster traffic outside the VPN, and they are available as `chartContext.podCIDR` and `chartContext.svcCIDR`:

```yaml
global:
  podCIDR: 10.42.0.0/16
  svcCIDR: 10.43.0.0/16
```

### Stop all and diagnostic mode

`stopAll` stops all objects of the chart and its dependencies, including CNPG clusters. `diagnosticMode` runs the containers of the chart and its dependencies with a sleep command:

```yaml
global:
  stopAll: false
  diagnosticMode:
    enabled: true
```

### Traefik and node ports

The middlewares that are added to every ingress and route that uses Traefik, and the lowest `nodePort` a service may use:

```yaml
global:
  minNodePort: 9000
  traefik:
    commonMiddlewares:
      - name: tc-basic-secure-headers
      - name: tc-compress
```

### Fallback defaults

`global.fallbackDefaults` sets the defaults for objects that do not set a value themselves, see [Fallback Defaults](/truecharts-common/fallbackDefaults):

```yaml
global:
  fallbackDefaults:
    pvcSize: 10Gi
    storageClass: fast-storage
```
