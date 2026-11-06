---
title: Pod Options
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/podOptions#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions`

---

## Child Pages

- [dnsConfig](/truecharts-common/podOptions/dnsConfig)
- [tolerations](/truecharts-common/podOptions/tolerations)
- [topologySpreadConstraints](/truecharts-common/podOptions/topologySpreadConstraints)

---

## `podOptions`

Options that apply to all pods, unless overridden at the pod level. See [podOptions](/truecharts-common/podOptions).

| Field | Value |
| --- | --- |
| Key | `podOptions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enableServiceLinks`

Whether Kubernetes injects environment variables for the Services of the namespace into the containers (`enableServiceLinks`). Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.enableServiceLinks` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `hostNetwork`

Whether the pods use the network namespace of the node (`hostNetwork`). `dnsPolicy` is set to `ClusterFirstWithHostNet` automatically when this is `true`. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.hostNetwork` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `hostPID`

Whether the containers can see the processes of the node (`hostPID`). Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.hostPID` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `hostIPC`

Whether the containers share the IPC namespace of the node (`hostIPC`). Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.hostIPC` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `shareProcessNamespace`

Whether all containers of a pod share one process namespace (`shareProcessNamespace`), so they can see and signal each other's processes. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.shareProcessNamespace` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `affinity`

Affinity rules of the pods (`podAffinity` and `podAntiAffinity`), passed on as is. Merged over the default affinity when `defaultAffinity` is enabled. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.affinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `podOptions.affinity.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dnsPolicy`

DNS policy of the pods (`dnsPolicy`): `ClusterFirst`, `ClusterFirstWithHostNet`, `Default` or `None`. It is forced to `ClusterFirstWithHostNet` when `hostNetwork` is `true`. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `"ClusterFirst"` |

---

## `dnsConfig`

Extra DNS settings of the pods (`dnsConfig`): nameservers, search domains and resolver options. Can be overridden per workload in `workload.<name>.podSpec`.

See [dnsConfig](/truecharts-common/podOptions/dnsConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"options": [{"name": "ndots", "value": "1"}]}` |

---

## `hostAliases`

Extra entries for the `/etc/hosts` file of the pods (`hostAliases`), each with an IP and its host names. Can be overridden per workload in `workload.<name>.podSpec`.

See [hostAliases](/truecharts-common/workload/podSpec/hostAliases) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podOptions.hostAliases` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `nodeSelector`

Labels a node must have for the pods to be scheduled on it (`nodeSelector`). Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.nodeSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{"kubernetes.io/arch": "amd64"}` |

---

## `nodeSelector.kubernetes.io/arch`

CPU architecture the node must have, eg `amd64` or `arm64`.

| Field | Value |
| --- | --- |
| Key | `podOptions.nodeSelector.kubernetes.io/arch` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
podOptions:
  nodeSelector:
    kubernetes:
      io/arch: amd64
```

---

## `nodeSelector.$name`

Value of the node label. Entries with an empty value are skipped.

| Field | Value |
| --- | --- |
| Key | `podOptions.nodeSelector.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `defaultSpread`

Adds a default topology spread constraint to Deployments and StatefulSets, so their pods are spread across nodes on a best-effort basis.

| Field | Value |
| --- | --- |
| Key | `podOptions.defaultSpread` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `defaultAffinity`

Adds a default pod affinity to Deployments and StatefulSets, so pods that mount the same PVCs are scheduled on the same node.

| Field | Value |
| --- | --- |
| Key | `podOptions.defaultAffinity` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `topologySpreadConstraints`

How the pods are spread across topology domains such as nodes or zones (`topologySpreadConstraints`). Added after the constraints of `defaultSpread`. Can be overridden per workload in `workload.<name>.podSpec`.

See [topologySpreadConstraints](/truecharts-common/podOptions/topologySpreadConstraints) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `tolerations`

Taints the pods tolerate (`tolerations`), so they can be scheduled on tainted nodes. Can be overridden per workload in `workload.<name>.podSpec`.

See [tolerations](/truecharts-common/podOptions/tolerations) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `schedulerName`

Name of the scheduler that schedules the pods (`schedulerName`). The default scheduler is used when empty. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.schedulerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `priorityClassName`

Name of the PriorityClass of the pods (`priorityClassName`), which sets their scheduling priority. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.priorityClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `runtimeClassName`

Name of the RuntimeClass of the pods (`runtimeClassName`), to run them with another container runtime. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.runtimeClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `automountServiceAccountToken`

Whether the service account token is mounted into the pods (`automountServiceAccountToken`). Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.automountServiceAccountToken` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `terminationGracePeriodSeconds`

Seconds Kubernetes waits for the containers to stop after they receive SIGTERM, before it kills them (`terminationGracePeriodSeconds`). Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.terminationGracePeriodSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `60` |

Example

```yaml
podOptions:
  terminationGracePeriodSeconds: 60
```

---

## `hostUsers`

Whether the pods use the user namespace of the node (`hostUsers`). When `false`, the pod gets its own user namespace. When not set, common calculates it. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.hostUsers` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `restartPolicy`

Restart policy of the pods (`restartPolicy`): `Always`, `OnFailure` or `Never`. Deployments, StatefulSets and DaemonSets only allow `Always`. Jobs and CronJobs default to `OnFailure` and do not allow `Always`. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.restartPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `""`, `"Never"`, `"Always"`, `"OnFailure"` |
| Pattern | `^\{\{.*\}\}$` |

---

## Full Examples

The options are the defaults for all pods. Each of them can be overridden per workload in `workload.<name>.podSpec`.

### Defaults

The default values of common:

```yaml
podOptions:
  enableServiceLinks: false
  hostNetwork: false
  hostPID: false
  hostIPC: false
  shareProcessNamespace: false
  restartPolicy: Always
  dnsPolicy: ClusterFirst
  defaultSpread: true
  defaultAffinity: true
  automountServiceAccountToken: false
  terminationGracePeriodSeconds: 60
```

### Host namespaces

Only share the namespaces of the node when the app cannot work without it. With `hostNetwork`, `dnsPolicy` is set to `ClusterFirstWithHostNet` automatically:

```yaml
podOptions:
  hostNetwork: true
  hostPID: false
  hostIPC: false
  hostUsers: false
  shareProcessNamespace: true
```

### Scheduler, priority and runtime

```yaml
podOptions:
  schedulerName: my-scheduler
  priorityClassName: system-cluster-critical
  runtimeClassName: gvisor
  terminationGracePeriodSeconds: 120
```

### hostAliases

Extra entries for the `/etc/hosts` file of the pods:

```yaml
podOptions:
  hostAliases:
    - ip: 10.10.10.100
      hostnames:
        - myserver.local
        - storage.local
    - ip: 10.10.10.101
      hostnames:
        - database.local
```

### dnsPolicy and dnsConfig

```yaml
podOptions:
  dnsPolicy: None
  dnsConfig:
    nameservers:
      - 1.1.1.1
      - 9.9.9.9
    searches:
      - my-namespace.svc.cluster.local
      - svc.cluster.local
    options:
      - name: ndots
        value: "2"
      - name: edns0
```

### nodeSelector

Only schedule the pods on nodes that have all of these labels:

```yaml
podOptions:
  nodeSelector:
    kubernetes.io/arch: arm64
    disk_type: ssd
```

### tolerations

Allow the pods to be scheduled on tainted nodes. With `operator: Exists` no `value` is set:

```yaml
podOptions:
  tolerations:
    - key: dedicated
      operator: Equal
      value: media
      effect: NoSchedule
    - key: node.kubernetes.io/unreachable
      operator: Exists
      effect: NoExecute
      tolerationSeconds: 300
```

### topologySpreadConstraints

Spread the pods across zones, and across nodes within a zone. They are added after the constraint of `defaultSpread`:

```yaml
podOptions:
  topologySpreadConstraints:
    - maxSkew: 1
      topologyKey: topology.kubernetes.io/zone
      whenUnsatisfiable: DoNotSchedule
      labelSelector:
        matchLabels:
          app.kubernetes.io/name: my-app
    - maxSkew: 2
      topologyKey: kubernetes.io/hostname
      whenUnsatisfiable: ScheduleAnyway
      minDomains: 2
      nodeAffinityPolicy: Honor
      nodeTaintsPolicy: Ignore
      labelSelector:
        matchExpressions:
          - key: app.kubernetes.io/name
            operator: In
            values:
              - my-app
```

### affinity

Rules are merged over the default affinity when `defaultAffinity` is enabled. This one keeps the pods of the app on separate nodes:

```yaml
podOptions:
  defaultAffinity: true
  affinity:
    podAntiAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        - labelSelector:
            matchLabels:
              app.kubernetes.io/name: my-app
          topologyKey: kubernetes.io/hostname
```

### Override per workload

```yaml
podOptions:
  nodeSelector:
    kubernetes.io/arch: amd64

workload:
  main:
    enabled: true
    primary: true
    podSpec:
      nodeSelector:
        kubernetes.io/arch: arm64
      terminationGracePeriodSeconds: 300
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
```
