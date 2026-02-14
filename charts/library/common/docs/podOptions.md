---
title: Pod Options
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/podoptions#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions`

## Defaults

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

---

## `enableServiceLinks`

See [Enable Service Links](/truecharts-common/workload#enableservicelinks)

Default

```yaml
podOptions:
  enableServiceLinks: false
```

---

## `hostNetwork`

See [Host Network](/truecharts-common/workload#hostnetwork)

Default

```yaml
podOptions:
  hostNetwork: false
```

---

## `hostPID`

See [Host PID](/truecharts-common/workload#hostpid)

Default

```yaml
podOptions:
  hostPID: false
```

---

## `hostIPC`

See [Host IPC](/truecharts-common/workload#hostipc)

Default

```yaml
podOptions:
  hostIPC: false
```

---

## `hostUsers`

See [Host Users](/truecharts-common/workload#hostusers)

Default

```yaml
podOptions:
  hostUsers: false
```

---

## `shareProcessNamespace`

See [Share Process Namespace](/truecharts-common/workload#shareprocessnamespace)

Default

```yaml
podOptions:
  shareProcessNamespace: false
```

---

## `restartPolicy`

See [Restart Policy](/truecharts-common/workload#restartpolicy)

Default

```yaml
podOptions:
  restartPolicy: Always
```

---

## `dnsPolicy`

See [DNS Policy](/truecharts-common/workload#dnspolicy)

Default

```yaml
podOptions:
  dnsPolicy: ClusterFirst
```

---

## `dnsConfig`

See [DNS Config](/truecharts-common/workload#dnsconfig)

Default

```yaml
podOptions:
  dnsConfig:
    options:
      - name: ndots
        value: "1"
```

---

## `hostAliases`

See [Host Aliases](/truecharts-common/workload#hostaliases)

Default

```yaml
podOptions:
  hostAliases: []
```

---

## `nodeSelector`

See [Node Selector](/truecharts-common/workload#nodeselector)

Default

```yaml
podOptions:
  nodeSelector:
    kubernetes.io/arch: "amd64"
```

---

## `defaultSpread`

Sets some default topology spread constraints for good spread of pods across nodes.

Default

```yaml
podOptions:
  defaultSpread: true
```

---

## `topologySpreadConstraints`

See [Topology Spread Constraints](/truecharts-common/workload#topologyspreadconstraints)

Default

```yaml
podOptions:
  topologySpreadConstraints: []
```

---

## `tolerations`

See [Tolerations](/truecharts-common/workload#tolerations)

Default

```yaml
podOptions:
  tolerations: []
```

---

## `schedulerName`

See [Scheduler Name](/truecharts-common/workload#schedulername)

Default

```yaml
podOptions:
  schedulerName: ""
```

---

## `priorityClassName`

See [Priority Class Name](/truecharts-common/workload#priorityclassname)

Default

```yaml
podOptions:
  priorityClassName: ""
```

---

## `runtimeClassName`

See [Runtime Class Name](/truecharts-common/workload#runtimeclassname)

Default

```yaml
podOptions:
  runtimeClassName: ""
```

---

## `automountServiceAccountToken`

See [Automount Service Account Token](/truecharts-common/workload#automountserviceaccounttoken)

Default

```yaml
podOptions:
  automountServiceAccountToken: false
```

---

## `terminationGracePeriodSeconds`

See [Termination Grace Period Seconds](/truecharts-common/workload#terminationgraceperiodseconds)

Default

```yaml
podOptions:
  terminationGracePeriodSeconds: 60
```

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
