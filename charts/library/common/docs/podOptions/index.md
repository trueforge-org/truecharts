---
title: Podoptions
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/podOptions#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions`

---

## `podOptions`

Options that apply to all pods, unless overridden at the pod level See more info about podOptions [documentation](/truecharts-common/podoptions)

| Field      | Value        |
| ---------- | ------------ |
| Key        | `podOptions` |
| Type       | `map`        |
| Required   | ❌           |
| Helm `tpl` | ❌           |
| Default    | unset        |

---

### `podOptions.affinity`

Configuration for `podOptions.affinity`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `podOptions.affinity` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `podOptions.automountServiceAccountToken`

See [Automount Service Account Token](/truecharts-common/workload#automountserviceaccounttoken)

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `podOptions.automountServiceAccountToken` |
| Type       | `boolean`                                 |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | `false`                                   |

Example

```yaml
podOptions:
  automountServiceAccountToken: false
```

---

### `podOptions.defaultAffinity`

Configuration for `podOptions.defaultAffinity`.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `podOptions.defaultAffinity` |
| Type       | `boolean`                    |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `podOptions.defaultSpread`

Sets some default topology spread constraints for good spread of pods across nodes.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `podOptions.defaultSpread` |
| Type       | `boolean`                  |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `true`                     |

Example

```yaml
podOptions:
  defaultSpread: true
```

---

### `podOptions.dnsConfig`

See [DNS Config](/truecharts-common/workload#dnsconfig)

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `podOptions.dnsConfig`                           |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | `{"options": [{"name": "ndots", "value": "1"}]}` |

Example

```yaml
podOptions:
  dnsConfig:
    options:
      -
        name: ndots
        value: 1
```

---

### `podOptions.dnsPolicy`

See [DNS Policy](/truecharts-common/workload#dnspolicy)

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `podOptions.dnsPolicy` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | `"ClusterFirst"`       |

Example

```yaml
podOptions:
  dnsPolicy: ClusterFirst
```

---

### `podOptions.enableServiceLinks`

See [Enable Service Links](/truecharts-common/workload#enableservicelinks)

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `podOptions.enableServiceLinks` |
| Type       | `boolean`                       |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `false`                         |

Example

```yaml
podOptions:
  enableServiceLinks: false
```

---

### `podOptions.hostAliases`

See [Host Aliases](/truecharts-common/workload#hostaliases)

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `podOptions.hostAliases` |
| Type       | `list of map`            |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `[]`                     |

Example

```yaml
podOptions:
  hostAliases:
    []
```

---

### `podOptions.hostIPC`

See [Host IPC](/truecharts-common/workload#hostipc)

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `podOptions.hostIPC` |
| Type       | `boolean`            |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | `false`              |

Example

```yaml
podOptions:
  hostIPC: false
```

---

### `podOptions.hostNetwork`

See [Host Network](/truecharts-common/workload#hostnetwork)

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `podOptions.hostNetwork` |
| Type       | `boolean`                |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `false`                  |

Example

```yaml
podOptions:
  hostNetwork: false
```

---

### `podOptions.hostPID`

See [Host PID](/truecharts-common/workload#hostpid)

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `podOptions.hostPID` |
| Type       | `boolean`            |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | `false`              |

Example

```yaml
podOptions:
  hostPID: false
```

---

### `podOptions.nodeSelector`

See [Node Selector](/truecharts-common/workload#nodeselector)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `podOptions.nodeSelector`         |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `{"kubernetes.io/arch": "amd64"}` |

Example

```yaml
podOptions:
  nodeSelector:
    kubernetes.io/arch: amd64
```

---

### `podOptions.priorityClassName`

See [Priority Class Name](/truecharts-common/workload#priorityclassname)

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `podOptions.priorityClassName` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `""`                           |

Example

```yaml
podOptions:
  priorityClassName: ""
```

---

### `podOptions.runtimeClassName`

See [Runtime Class Name](/truecharts-common/workload#runtimeclassname)

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `podOptions.runtimeClassName` |
| Type       | `string`                      |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `""`                          |

Example

```yaml
podOptions:
  runtimeClassName: ""
```

---

### `podOptions.schedulerName`

See [Scheduler Name](/truecharts-common/workload#schedulername)

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `podOptions.schedulerName` |
| Type       | `string`                   |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `""`                       |

Example

```yaml
podOptions:
  schedulerName: ""
```

---

### `podOptions.shareProcessNamespace`

See [Share Process Namespace](/truecharts-common/workload#shareprocessnamespace)

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `podOptions.shareProcessNamespace` |
| Type       | `boolean`                          |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `false`                            |

Example

```yaml
podOptions:
  shareProcessNamespace: false
```

---

### `podOptions.terminationGracePeriodSeconds`

See [Termination Grace Period Seconds](/truecharts-common/workload#terminationgraceperiodseconds)

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `podOptions.terminationGracePeriodSeconds` |
| Type       | `integer`                                  |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `60`                                       |

Example

```yaml
podOptions:
  terminationGracePeriodSeconds: 60
```

---

### `podOptions.tolerations`

See [Tolerations](/truecharts-common/workload#tolerations)

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `podOptions.tolerations` |
| Type       | `list of map`            |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `[]`                     |

Example

```yaml
podOptions:
  tolerations:
    []
```

---

### `podOptions.topologySpreadConstraints`

See [Topology Spread Constraints](/truecharts-common/workload#topologyspreadconstraints)

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `podOptions.topologySpreadConstraints` |
| Type       | `list of map`                          |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `[]`                                   |

Example

```yaml
podOptions:
  topologySpreadConstraints:
    []
```

---

## Child Pages

- [Dnsconfig](dnsConfig.md) - See [DNS Config](/truecharts-common/workload#dnsconfig)
- [Hostaliases](hostAliases.md) - See [Host Aliases](/truecharts-common/workload#hostaliases)
- [Nodeselector](nodeSelector.md) - See [Node Selector](/truecharts-common/workload#nodeselector)
- [Tolerations](tolerations.md) - See [Tolerations](/truecharts-common/workload#tolerations)
- [Topologyspreadconstraints](topologySpreadConstraints.md) - See [Topology Spread Constraints](/truecharts-common/workload#topologyspreadconstraints)

---

## Full Examples

```yaml
podOptions:
  enableServiceLinks: false
  hostNetwork: false
  hostPID: false
  hostIPC: false
  hostUsers: false
  shareProcessNamespace: false
  restartPolicy: Always
  dnsPolicy: ClusterFirst
  dnsConfig:
    options:
      - name: ndots
        value: "1"
  hostAliases: []
  nodeSelector:
    kubernetes.io/arch: "amd64"
  defaultSpread: true
  topologySpreadConstraints: []
  tolerations: []
  schedulerName: ""
  priorityClassName: ""
  runtimeClassName: ""
  automountServiceAccountToken: false
  terminationGracePeriodSeconds: 60
```
