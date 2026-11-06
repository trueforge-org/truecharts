---
title: Global
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/global#full-examples) section for complete examples.

:::

## Appears in

- `.Values.global`

---

## Child Pages

- [Fallback Defaults](/truecharts-common/global/fallbackDefaults)

---

## `global`

Global values that apply to the chart and its dependencies. See [global](/truecharts-common/global).

| Field | Value |
| --- | --- |
| Key | `global` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
labels: {}
annotations: {}
namespace: ''
diagnosticMode:
  enabled: false
fallbackDefaults:
  storageClass: null
  probeType: http
  serviceProtocol: tcp
  serviceType: ClusterIP
  persistenceType: pvc
  pvcRetain: false
  pvcSize: 100Gi
  vctSize: 100Gi
  accessModes:
    - ReadWriteOnce
  vctAccessModes:
    - ReadWriteOnce
  probeTimeouts:
    liveness:
      initialDelaySeconds: 12
      periodSeconds: 15
      timeoutSeconds: 5
      failureThreshold: 5
      successThreshold: 1
    readiness:
      initialDelaySeconds: 10
      periodSeconds: 12
      timeoutSeconds: 5
      failureThreshold: 4
      successThreshold: 2
    startup:
      initialDelaySeconds: 10
      periodSeconds: 5
      timeoutSeconds: 3
      failureThreshold: 60
      successThreshold: 1
  topologyKey: kubernetes.io/hostname
  cnpg:
    pgVersion: 16
    skipEmptyWalArchiveCheck: true
traefik:
  commonMiddlewares:
    - name: tc-basic-secure-headers
minNodePort: 9000
stopAll: false
```

---

## `labels`

Labels added to all objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `global.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `annotations`

Annotations added to all objects.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `global.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `namespace`

Namespace to create all objects in, unless overridden at the object level. Also applies to chart dependencies.

| Field | Value |
| --- | --- |
| Key | `global.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `podCIDR`

CIDR of the pods of the cluster, used by addons such as gluetun to keep cluster traffic outside the VPN. Falls back to `172.16.0.0/16`.

| Field | Value |
| --- | --- |
| Key | `global.podCIDR` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
global:
  podCIDR: 172.16.0.0/16
```

---

## `svcCIDR`

CIDR of the services of the cluster. Falls back to `172.17.0.0/16`.

| Field | Value |
| --- | --- |
| Key | `global.svcCIDR` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
global:
  svcCIDR: 172.17.0.0/16
```

---

## `diagnosticMode`

Diagnostic mode for the chart.

| Field | Value |
| --- | --- |
| Key | `global.diagnosticMode` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `diagnosticMode.enabled`

Run the containers of the chart with a sleep command instead of the app, to debug them.

| Field | Value |
| --- | --- |
| Key | `global.diagnosticMode.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `fallbackDefaults`

Defaults used when a value is not set on the object itself. See [fallbackDefaults](/truecharts-common/global/fallbackDefaults).

See [Fallback Defaults](/truecharts-common/global/fallbackDefaults) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `traefik`

Settings for the Traefik integration.

| Field | Value |
| --- | --- |
| Key | `global.traefik` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"commonMiddlewares": [{"name": "tc-basic-secure-headers"}]}` |

---

## `traefik.commonMiddlewares`

Traefik middlewares added to every ingress and route that uses Traefik.

| Field | Value |
| --- | --- |
| Key | `global.traefik.commonMiddlewares` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[{"name": "tc-basic-secure-headers"}]` |

---

## `traefik.commonMiddlewares[]`

A Traefik middleware.

| Field | Value |
| --- | --- |
| Key | `global.traefik.commonMiddlewares[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `traefik.commonMiddlewares[].name`

Name of the middleware.

| Field | Value |
| --- | --- |
| Key | `global.traefik.commonMiddlewares[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `minNodePort`

Lowest `nodePort` that a service may use.

| Field | Value |
| --- | --- |
| Key | `global.minNodePort` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `9000` |
| Range | 1 to … |

---

## `stopAll`

Stop all objects of the chart and its dependencies, including CNPG clusters. Stand-alone pods are not stopped.

| Field | Value |
| --- | --- |
| Key | `global.stopAll` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

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

`global.fallbackDefaults` sets the defaults for objects that do not set a value themselves, see [Fallback Defaults](/truecharts-common/global/fallbackDefaults):

```yaml
global:
  fallbackDefaults:
    pvcSize: 10Gi
    storageClass: fast-storage
```
