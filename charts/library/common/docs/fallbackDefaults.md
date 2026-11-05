---
title: Fallback Defaults
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/fallbackDefaults#full-examples) section for complete examples.

:::

## Appears in

- `.Values.global.fallbackDefaults`

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

## `probeTimeouts.liveness`

Timings of liveness probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
initialDelaySeconds: 12
periodSeconds: 15
timeoutSeconds: 5
failureThreshold: 5
successThreshold: 1
```

---

## `probeTimeouts.liveness.initialDelaySeconds`

Seconds before the first probe.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.initialDelaySeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `12` |
| Range | 1 to … |

---

## `probeTimeouts.liveness.periodSeconds`

Seconds between probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.periodSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `15` |
| Range | 1 to … |

---

## `probeTimeouts.liveness.timeoutSeconds`

Seconds before a probe times out.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.timeoutSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `5` |
| Range | 1 to … |

---

## `probeTimeouts.liveness.failureThreshold`

Failed probes in a row before the probe fails.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.failureThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `5` |
| Range | 1 to … |

---

## `probeTimeouts.liveness.successThreshold`

Successful probes in a row before the probe succeeds.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.successThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `1` |
| Range | 1 to … |

---

## `probeTimeouts.readiness`

Timings of readiness probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
initialDelaySeconds: 10
periodSeconds: 12
timeoutSeconds: 5
failureThreshold: 4
successThreshold: 2
```

---

## `probeTimeouts.readiness.initialDelaySeconds`

Seconds before the first probe.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.initialDelaySeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `10` |
| Range | 1 to … |

---

## `probeTimeouts.readiness.periodSeconds`

Seconds between probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.periodSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `12` |
| Range | 1 to … |

---

## `probeTimeouts.readiness.timeoutSeconds`

Seconds before a probe times out.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.timeoutSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `5` |
| Range | 1 to … |

---

## `probeTimeouts.readiness.failureThreshold`

Failed probes in a row before the probe fails.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.failureThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `4` |
| Range | 1 to … |

---

## `probeTimeouts.readiness.successThreshold`

Successful probes in a row before the probe succeeds.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.successThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `2` |
| Range | 1 to … |

---

## `probeTimeouts.startup`

Timings of startup probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
initialDelaySeconds: 10
periodSeconds: 5
timeoutSeconds: 3
failureThreshold: 60
successThreshold: 1
```

---

## `probeTimeouts.startup.initialDelaySeconds`

Seconds before the first probe.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.initialDelaySeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `10` |
| Range | 1 to … |

---

## `probeTimeouts.startup.periodSeconds`

Seconds between probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.periodSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `5` |
| Range | 1 to … |

---

## `probeTimeouts.startup.timeoutSeconds`

Seconds before a probe times out.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.timeoutSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `3` |
| Range | 1 to … |

---

## `probeTimeouts.startup.failureThreshold`

Failed probes in a row before the probe fails.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.failureThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `60` |
| Range | 1 to … |

---

## `probeTimeouts.startup.successThreshold`

Successful probes in a row before the probe succeeds.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.successThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `1` |
| Range | 1 to … |

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

## `allowRollingUpdateWithRWO`

Keep `strategy: RollingUpdate` on a single replica Deployment with `ReadWriteOnce` volumes, instead of changing it to `Recreate`. Can be overruled with `workload.$name.allowRollingUpdateWithRWO`. Updates can get stuck if the storage stays locked to the old pod, which can happen on the same node with storage like iSCSI, and two pods use the same data during an update.

:::caution

Enabling this applies to all workloads of the chart that set `strategy: RollingUpdate`. Common shows a warning in the notes for each of them.

:::

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.allowRollingUpdateWithRWO` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `routeListenerPort`

Port of the listeners created for route TLS. Can be overruled per route with `route.$name.listenerPort`. Traefik needs the port of its entrypoint here, which is not always the port it is exposed on.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.routeListenerPort` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `443` |
| Range | 1 to 65535 |

---

## `cnpg`

Defaults of the CNPG clusters of the postgresql dependency.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.cnpg` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"pgVersion": 18, "skipEmptyWalArchiveCheck": true}` |

---

## `cnpg.pgVersion`

Major PostgreSQL version of a cluster that sets no `pgVersion`.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.cnpg.pgVersion` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `18` |

---

## `cnpg.skipEmptyWalArchiveCheck`

Skip the check that the WAL archive of a new cluster is empty.

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

### Scheduling and routes

The topology key used to spread the pods, whether a Deployment with a `ReadWriteOnce` volume may use a rolling update, and the default listener port of routes:

```yaml
global:
  fallbackDefaults:
    topologyKey: topology.kubernetes.io/zone
    allowRollingUpdateWithRWO: true
    routeListenerPort: 8443
```

### CloudNativePG

The default PostgreSQL version of CNPG clusters, and whether the check for an empty WAL archive is skipped:

```yaml
global:
  fallbackDefaults:
    cnpg:
      pgVersion: 17
      skipEmptyWalArchiveCheck: true
```
