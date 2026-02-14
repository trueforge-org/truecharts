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

Configuration for `global.fallbackDefaults.accessModes`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `global.fallbackDefaults.accessModes` |
| Type       | `list of string`                      |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `"ReadWriteOnce"`                     |

Example

```yaml
global:
  fallbackDefaults:
    accessModes: ReadWriteOnce
```

---

### `global.fallbackDefaults.cnpg`

Configuration for `global.fallbackDefaults.cnpg`.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `global.fallbackDefaults.cnpg` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `global.fallbackDefaults.persistenceType`

Configuration for `global.fallbackDefaults.persistenceType`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `global.fallbackDefaults.persistenceType` |
| Type       | `string`                                  |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | `"emptyDir"`                              |
| Min Length | `1`                                       |

Example

```yaml
global:
  fallbackDefaults:
    persistenceType: emptyDir
```

---

### `global.fallbackDefaults.probeTimeouts`

Configuration for `global.fallbackDefaults.probeTimeouts`.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `global.fallbackDefaults.probeTimeouts` |
| Type       | `map`                                   |
| Required   | ❌                                      |
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

Configuration for `global.fallbackDefaults.probeType`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `global.fallbackDefaults.probeType` |
| Type       | `string`                            |
| Required   | ❌                                  |
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

Configuration for `global.fallbackDefaults.pvcRetain`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `global.fallbackDefaults.pvcRetain` |
| Type       | `boolean`                           |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `true`                              |

Example

```yaml
global:
  fallbackDefaults:
    pvcRetain: true
```

---

### `global.fallbackDefaults.pvcSize`

Configuration for `global.fallbackDefaults.pvcSize`.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `global.fallbackDefaults.pvcSize` |
| Type       | `string`                          |
| Required   | ❌                                |
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

### `global.fallbackDefaults.serviceProtocol`

Configuration for `global.fallbackDefaults.serviceProtocol`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `global.fallbackDefaults.serviceProtocol` |
| Type       | `string`                                  |
| Required   | ❌                                        |
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

Configuration for `global.fallbackDefaults.serviceType`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `global.fallbackDefaults.serviceType` |
| Type       | `string`                              |
| Required   | ❌                                    |
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

Configuration for `global.fallbackDefaults.storageClass`.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `global.fallbackDefaults.storageClass` |
| Type       | `string, null`                         |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `global.fallbackDefaults.topologyKey`

Configuration for `global.fallbackDefaults.topologyKey`.

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

Configuration for `global.fallbackDefaults.vctAccessModes`.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `global.fallbackDefaults.vctAccessModes` |
| Type       | `list of string`                         |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `global.fallbackDefaults.vctSize`

Configuration for `global.fallbackDefaults.vctSize`.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `global.fallbackDefaults.vctSize` |
| Type       | `string`                          |
| Required   | ❌                                |
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
