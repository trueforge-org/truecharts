---
title: Fallback Defaults
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/global/fallbackDefaults#full-examples) section for complete examples.

:::

## Appears in

- `.Values.global.fallbackDefaults`

---

## Child Pages

- [probeTimeouts](/truecharts-common/global/fallbackDefaults/probeTimeouts)

---

## `fallbackDefaults`

Defaults used when a value is not set on the object itself.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `storageClass`

Storage class of a PVC that sets none. `-` leaves it unset.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.storageClass` |
| Type | `string or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `null` |

---

## `probeType`

Type of a probe that sets none, eg `http`, `tcp` or `grpc`.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeType` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"http"` |
| Length | 1 to … |

---

## `serviceProtocol`

Protocol of a service port that sets none, eg `tcp` or `udp`.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.serviceProtocol` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"tcp"` |
| Length | 1 to … |

---

## `serviceType`

Type of a service that sets none, eg `ClusterIP`.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.serviceType` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"ClusterIP"` |
| Length | 1 to … |

---

## `persistenceType`

Type of a persistence entry that sets none, eg `pvc`.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.persistenceType` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"pvc"` |
| Length | 1 to … |

---

## `pvcRetain`

Keep the PVCs when the release is deleted, for persistence that sets no `retain`.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.pvcRetain` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `pvcSize`

Size of a pvc that sets none.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.pvcSize` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"100Gi"` |
| Length | 1 to … |

Example

```yaml
global:
  fallbackDefaults:
    pvcSize: 100Gi
```

---

## `vctSize`

Size of a volume claim template that sets none.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.vctSize` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"100Gi"` |
| Length | 1 to … |

Example

```yaml
global:
  fallbackDefaults:
    vctSize: 100Gi
```

---

## `accessModes`

Access modes of a pvc that sets none.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.accessModes` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `["ReadWriteOnce"]` |

---

## `vctAccessModes`

Access modes of a volume claim template that sets none.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.vctAccessModes` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `["ReadWriteOnce"]` |

---

## `probeTimeouts`

Timings of the probes that set none.

See [probeTimeouts](/truecharts-common/global/fallbackDefaults/probeTimeouts) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
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
```

---

## `topologyKey`

Topology key of the default topology spread constraints, used when `defaultSpread` is true.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.topologyKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"kubernetes.io/hostname"` |

---

## `cnpg`

Defaults of the CNPG clusters.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.cnpg` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"pgVersion": 16, "skipEmptyWalArchiveCheck": true}` |

---

## `cnpg.pgVersion`

Major PostgreSQL version of a cluster that sets no `pgVersion`.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.cnpg.pgVersion` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `16` |
| Allowed values | `15`, `16`, `"15"`, `"16"` |

---

## `cnpg.skipEmptyWalArchiveCheck`

Skip the check that the WAL archive of a new cluster is empty. Can be overruled per cluster with `cluster.skipEmptyWalArchiveCheck`.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.cnpg.skipEmptyWalArchiveCheck` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## Full Examples

### Persistence and services

Defaults for volumes and services that do not set their own values:

```yaml
global:
  fallbackDefaults:
    storageClass: fast-storage
    persistenceType: pvc
    pvcSize: 10Gi
    vctSize: 20Gi
    pvcRetain: true
    accessModes:
      - ReadWriteOnce
    vctAccessModes:
      - ReadWriteOnce
    serviceType: ClusterIP
    serviceProtocol: tcp
```

### Probes

The default type of the probes, and their timings for each kind of probe:

```yaml
global:
  fallbackDefaults:
    probeType: http
    probeTimeouts:
      liveness:
        initialDelaySeconds: 10
        periodSeconds: 10
        timeoutSeconds: 5
        failureThreshold: 5
        successThreshold: 1
      readiness:
        initialDelaySeconds: 10
        periodSeconds: 10
        timeoutSeconds: 5
        failureThreshold: 5
        successThreshold: 2
      startup:
        initialDelaySeconds: 10
        periodSeconds: 5
        timeoutSeconds: 2
        failureThreshold: 60
        successThreshold: 1
```

### Topology

The topology key of the default topology spread constraints:

```yaml
global:
  fallbackDefaults:
    topologyKey: topology.kubernetes.io/zone
```

### CloudNativePG

The default PostgreSQL version of CNPG clusters, and whether the check for an empty WAL archive is skipped:

```yaml
global:
  fallbackDefaults:
    cnpg:
      pgVersion: 16
      skipEmptyWalArchiveCheck: true
```
