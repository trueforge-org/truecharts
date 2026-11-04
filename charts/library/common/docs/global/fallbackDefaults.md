---
title: Fallbackdefaults
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/global/fallbackDefaults#full-examples) section for complete examples.

:::

## Appears in

- `.Values.global.fallbackDefaults`

---

## `global.fallbackDefaults`

Configuration for `global.fallbackDefaults`.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `global.fallbackDefaults` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `global.fallbackDefaults.accessModes`

Access modes of a pvc that sets none.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `global.fallbackDefaults.accessModes` |
| Type       | `list of string`                      |
| Required   | ✅                                    |
| Helm `tpl` | ❌                                    |
| Default    | `["ReadWriteOnce"]`                   |

Example

```yaml
global:
  fallbackDefaults:
    accessModes:
      - ReadWriteOnce
```

---

### `global.fallbackDefaults.allowRollingUpdateWithRWO`

Keep `strategy: RollingUpdate` on a single replica Deployment with `ReadWriteOnce` volumes, instead of changing it to `Recreate`. Can be overruled with `workload.$name.allowRollingUpdateWithRWO`. Updates can get stuck if the storage stays locked to the old pod, which can happen on the same node with storage like iSCSI, and two pods use the same data during an update.

:::caution

Enabling this applies to all workloads of the chart that set `strategy: RollingUpdate`. Common shows a warning in the notes for each of them.

:::

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `global.fallbackDefaults.allowRollingUpdateWithRWO` |
| Type       | `boolean`                                           |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | `false`                                             |

Example

```yaml
global:
  fallbackDefaults:
    allowRollingUpdateWithRWO: false
```

---

### `global.fallbackDefaults.cnpg`

Defaults of the postgresql dependency in `operator` mode.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `global.fallbackDefaults.cnpg` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `global.fallbackDefaults.persistenceType`

Type of a persistence entry that sets none.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `global.fallbackDefaults.persistenceType` |
| Type       | `string`                                  |
| Required   | ✅                                        |
| Helm `tpl` | ❌                                        |
| Default    | `"pvc"`                                   |
| Min Length | `1`                                       |

Example

```yaml
global:
  fallbackDefaults:
    persistenceType: pvc
```

---

### `global.fallbackDefaults.probeTimeouts`

Timings of the probes that set none.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `global.fallbackDefaults.probeTimeouts` |
| Type       | `map`                                   |
| Required   | ✅                                      |
| Helm `tpl` | ❌                                      |
| Default    | See schema                              |

Example

```yaml
global:
  fallbackDefaults:
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

---

### `global.fallbackDefaults.probeType`

Type of a probe that sets none.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `global.fallbackDefaults.probeType` |
| Type       | `string`                            |
| Required   | ✅                                  |
| Helm `tpl` | ❌                                  |
| Default    | `"http"`                            |
| Min Length | `1`                                 |

Example

```yaml
global:
  fallbackDefaults:
    probeType: http
```

---

### `global.fallbackDefaults.pvcRetain`

Keep the pvcs when the release is deleted, for persistence that sets no `retain`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `global.fallbackDefaults.pvcRetain` |
| Type       | `boolean`                           |
| Required   | ✅                                  |
| Helm `tpl` | ❌                                  |
| Default    | `false`                             |

Example

```yaml
global:
  fallbackDefaults:
    pvcRetain: false
```

---

### `global.fallbackDefaults.pvcSize`

Size of a pvc that sets none.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `global.fallbackDefaults.pvcSize` |
| Type       | `string`                          |
| Required   | ✅                                |
| Helm `tpl` | ❌                                |
| Default    | `"100Gi"`                         |
| Min Length | `1`                               |

Example

```yaml
global:
  fallbackDefaults:
    pvcSize: 100Gi
```

---

### `global.fallbackDefaults.routeListenerPort`

Port of the listeners created for route TLS. Can be overruled per route with `route.$name.listenerPort`. Traefik needs the port of its entrypoint here, which is not always the port it is exposed on.

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `global.fallbackDefaults.routeListenerPort` |
| Type       | `integer`                                   |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | `443`                                       |
| Minimum    | `1`                                         |
| Maximum    | `65535`                                     |

Example

```yaml
global:
  fallbackDefaults:
    routeListenerPort: 443
```

---

### `global.fallbackDefaults.serviceProtocol`

Protocol of a service port that sets none.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `global.fallbackDefaults.serviceProtocol` |
| Type       | `string`                                  |
| Required   | ✅                                        |
| Helm `tpl` | ❌                                        |
| Default    | `"tcp"`                                   |
| Min Length | `1`                                       |

Example

```yaml
global:
  fallbackDefaults:
    serviceProtocol: tcp
```

---

### `global.fallbackDefaults.serviceType`

Type of a service that sets none.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `global.fallbackDefaults.serviceType` |
| Type       | `string`                              |
| Required   | ✅                                    |
| Helm `tpl` | ❌                                    |
| Default    | `"ClusterIP"`                         |
| Min Length | `1`                                   |

Example

```yaml
global:
  fallbackDefaults:
    serviceType: ClusterIP
```

---

### `global.fallbackDefaults.storageClass`

Storage class of a pvc that sets none. `-` leaves it unset.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `global.fallbackDefaults.storageClass` |
| Type       | `string, null`                         |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `global.fallbackDefaults.topologyKey`

Topology key of the default topology spread constraints.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `global.fallbackDefaults.topologyKey` |
| Type       | `string`                              |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `"kubernetes.io/hostname"`            |

Example

```yaml
global:
  fallbackDefaults:
    topologyKey: kubernetes.io/hostname
```

---

### `global.fallbackDefaults.vctAccessModes`

Access modes of a volume claim template that sets none.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `global.fallbackDefaults.vctAccessModes` |
| Type       | `list of string`                         |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | `["ReadWriteOnce"]`                      |

Example

```yaml
global:
  fallbackDefaults:
    vctAccessModes:
      - ReadWriteOnce
```

---

### `global.fallbackDefaults.vctSize`

Size of a volume claim template that sets none.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `global.fallbackDefaults.vctSize` |
| Type       | `string`                          |
| Required   | ✅                                |
| Helm `tpl` | ❌                                |
| Default    | `"100Gi"`                         |
| Min Length | `1`                               |

Example

```yaml
global:
  fallbackDefaults:
    vctSize: 100Gi
```

---

## Full Examples

```yaml
fallbackDefaults:
  probeType: http
  serviceProtocol: tcp
  serviceType: ClusterIP
  persistenceType: pvc
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
  topologyKey: truecharts.org/example
```
