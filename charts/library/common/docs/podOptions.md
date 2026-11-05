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

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"options": [{"name": "ndots", "value": "1"}]}` |

---

## `dnsConfig.nameservers`

IP addresses of extra DNS servers, at most 3. Added to the servers of `dnsPolicy`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.nameservers` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | … to 3 |

Example

```yaml
podOptions:
  dnsConfig:
    nameservers:
      - 1.1.1.1
```

---

## `dnsConfig.searches`

Extra DNS search domains, at most 6. Added to the search domains of `dnsPolicy`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.searches` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | … to 6 |

Example

```yaml
podOptions:
  dnsConfig:
    searches:
      - example.com
```

---

## `dnsConfig.options`

Resolver options of the pods, eg `ndots`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.options` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dnsConfig.options[]`

A resolver option, with a name and an optional value.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.options[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dnsConfig.options[].name`

Name of the resolver option, eg `ndots`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.options[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
podOptions:
  dnsConfig:
    options:
      - name: ndots
```

---

## `dnsConfig.options[].value`

Value of the resolver option.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.options[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
podOptions:
  dnsConfig:
    options:
      - value: '2'
```

---

## `hostAliases`

Extra entries for the `/etc/hosts` file of the pods (`hostAliases`), each with an IP and its host names. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.hostAliases` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `hostAliases[]`

An `/etc/hosts` entry that maps one IP to one or more host names.

| Field | Value |
| --- | --- |
| Key | `podOptions.hostAliases[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostAliases[].ip`

IP address of the entry.

| Field | Value |
| --- | --- |
| Key | `podOptions.hostAliases[].ip` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
podOptions:
  hostAliases:
    - ip: 10.0.0.10
```

---

## `hostAliases[].hostnames`

Host names that resolve to the IP. At least one is required.

| Field | Value |
| --- | --- |
| Key | `podOptions.hostAliases[].hostnames` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |

Example

```yaml
podOptions:
  hostAliases:
    - hostnames:
        - myhost.local
```

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

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `topologySpreadConstraints[]`

A topology spread constraint.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].maxSkew`

Maximum difference in the number of matching pods between any two topology domains.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].maxSkew` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
podOptions:
  topologySpreadConstraints:
    - maxSkew: 1
```

---

## `topologySpreadConstraints[].topologyKey`

Node label of the topology domain, eg `kubernetes.io/hostname`.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].topologyKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
podOptions:
  topologySpreadConstraints:
    - topologyKey: kubernetes.io/hostname
```

---

## `topologySpreadConstraints[].whenUnsatisfiable`

What happens when the constraint can not be met: `DoNotSchedule` or `ScheduleAnyway`.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].whenUnsatisfiable` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
podOptions:
  topologySpreadConstraints:
    - whenUnsatisfiable: ScheduleAnyway
```

---

## `topologySpreadConstraints[].labelSelector`

Selects the pods that are counted when the skew is calculated.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].labelSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].minDomains`

Minimum number of eligible domains. Only applies with `whenUnsatisfiable: DoNotSchedule`.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].minDomains` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].matchLabelKeys`

Label keys of the pod. Their values are combined with `labelSelector` to select the pods that are counted.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].nodeAffinityPolicy`

Whether the node affinity of the pod is honored when the skew is calculated.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].nodeAffinityPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Honor"`, `"Ignore"` |

---

## `topologySpreadConstraints[].nodeTaintsPolicy`

Whether the node taints are honored when the skew is calculated.

| Field | Value |
| --- | --- |
| Key | `podOptions.topologySpreadConstraints[].nodeTaintsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Honor"`, `"Ignore"` |

---

## `tolerations`

Taints the pods tolerate (`tolerations`), so they can be scheduled on tainted nodes. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `tolerations[]`

A toleration of a node taint.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tolerations[].operator`

How the taint is matched: `Exists` matches any value of the key, `Equal` requires `value` to be equal.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
podOptions:
  tolerations:
    - operator: Equal
```

---

## `tolerations[].key`

Key of the taint. Required when `operator` is `Equal`.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `tolerations[].value`

Value of the taint. Required when `operator` is `Equal`, and must be empty when it is `Exists`.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `tolerations[].effect`

Effect of the taint to tolerate: `NoSchedule`, `PreferNoSchedule` or `NoExecute`. All effects match when empty.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].effect` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `tolerations[].tolerationSeconds`

Seconds the pod stays bound to a node with a `NoExecute` taint before it is evicted. Only applies to the `NoExecute` effect.

| Field | Value |
| --- | --- |
| Key | `podOptions.tolerations[].tolerationSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
podOptions:
  tolerations:
    - tolerationSeconds: 300
```

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
