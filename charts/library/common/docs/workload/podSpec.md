---
title: Pod Spec
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.$name.podSpec`

---

## `podSpec`

Settings of the pods of the workload: containers, init containers and pod level options.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `containers`

Containers of the pod, keyed by name.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `containers.$name`

A container of the pod. The shared container settings are in [container](/truecharts-common/container).

See [Container](/truecharts-common/container) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `initContainers`

Init containers of the pod, keyed by name. See [initContainers](/truecharts-common/container/initContainers).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `initContainers.$name`

An init container of the pod. It supports the settings of a container, except `lifecycle`, `primary` and working probes.

See [Init Containers](/truecharts-common/container/initContainers) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `labels`

Additional labels for the pods of this workload.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `annotations`

Additional annotations for the pods of this workload.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `automountServiceAccountToken`

Whether the service account token is mounted into the pods (`automountServiceAccountToken`). Overrides `podOptions.automountServiceAccountToken` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.automountServiceAccountToken` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostNetwork`

Whether the pods use the network namespace of the node (`hostNetwork`). `dnsPolicy` is set to `ClusterFirstWithHostNet` automatically when this is `true`. Overrides `podOptions.hostNetwork` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostNetwork` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostPID`

Whether the containers can see the processes of the node (`hostPID`). Overrides `podOptions.hostPID` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostPID` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostIPC`

Whether the containers share the IPC namespace of the node (`hostIPC`). Overrides `podOptions.hostIPC` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostIPC` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostUsers`

Whether the pods use the user namespace of the node (`hostUsers`). When `false`, the pod gets its own user namespace. When not set, common calculates it. Overrides `podOptions.hostUsers` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostUsers` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `shareProcessNamespace`

Whether all containers of a pod share one process namespace (`shareProcessNamespace`), so they can see and signal each other's processes. Overrides `podOptions.shareProcessNamespace` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.shareProcessNamespace` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enableServiceLinks`

Whether Kubernetes injects environment variables for the Services of the namespace into the containers (`enableServiceLinks`). Overrides `podOptions.enableServiceLinks` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.enableServiceLinks` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `restartPolicy`

Restart policy of the pods (`restartPolicy`): `Always`, `OnFailure` or `Never`. Deployments, StatefulSets and DaemonSets only allow `Always`. Jobs and CronJobs default to `OnFailure` and do not allow `Always`. Overrides `podOptions.restartPolicy` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.restartPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `schedulerName`

Name of the scheduler that schedules the pods (`schedulerName`). The default scheduler is used when empty. Overrides `podOptions.schedulerName` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.schedulerName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `priorityClassName`

Name of the PriorityClass of the pods (`priorityClassName`), which sets their scheduling priority. Overrides `podOptions.priorityClassName` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.priorityClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `hostname`

Hostname of the pods (`hostname`). It must be a valid DNS label.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostname` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      hostname: myapp
```

---

## `affinity`

Affinity rules of the pods, passed on as is. Overrides `podOptions.affinity` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.affinity` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `affinity.$name`

A setting passed on as is.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.affinity.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `serviceAccountName`

Name of the service account the pods use (`serviceAccountName`). When not set, common uses the service account that targets this workload, or `default`. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.serviceAccountName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `terminationGracePeriodSeconds`

Seconds Kubernetes waits for the containers to stop after they receive SIGTERM, before it kills them (`terminationGracePeriodSeconds`). Overrides `podOptions.terminationGracePeriodSeconds` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.terminationGracePeriodSeconds` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `nodeSelector`

Labels a node must have for the pods to be scheduled on it (`nodeSelector`). Overrides `podOptions.nodeSelector` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.nodeSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | unset |

---

## `nodeSelector.kubernetes.io/arch`

CPU architecture the node must have, eg `amd64` or `arm64`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.nodeSelector.kubernetes.io/arch` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      nodeSelector:
        kubernetes:
          io/arch: amd64
```

---

## `nodeSelector.$name`

Value of the node label. Entries with an empty value are skipped.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.nodeSelector.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints`

Rules that spread the pods across topology domains such as nodes or zones (`topologySpreadConstraints`). Overrides `podOptions.topologySpreadConstraints` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[]`

A topology spread constraint.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].maxSkew`

Maximum difference in the number of matching pods between any two topology domains.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].maxSkew` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      topologySpreadConstraints:
        - maxSkew: 1
```

---

## `topologySpreadConstraints[].topologyKey`

Node label of the topology domain, eg `kubernetes.io/hostname`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].topologyKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      topologySpreadConstraints:
        - topologyKey: kubernetes.io/hostname
```

---

## `topologySpreadConstraints[].whenUnsatisfiable`

What happens when the constraint can not be met: `DoNotSchedule` or `ScheduleAnyway`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].whenUnsatisfiable` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      topologySpreadConstraints:
        - whenUnsatisfiable: ScheduleAnyway
```

---

## `topologySpreadConstraints[].labelSelector`

Selects the pods that are counted when the skew is calculated.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].labelSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchLabels`

Match by labels.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].labelSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchLabels.$name`

Value of the label

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].labelSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions`

Match by label expressions.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].labelSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[]`

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].labelSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[].key`

Label key the selector applies to.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].labelSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[].operator`

Relationship of the key to the values, e.g. `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].labelSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].labelSelector.matchExpressions[].values`

Values of the label. Empty for `Exists` and `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].labelSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].minDomains`

Minimum number of eligible domains. Only applies with `whenUnsatisfiable: DoNotSchedule`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].minDomains` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].matchLabelKeys`

Label keys of the pod. Their values are combined with `labelSelector` to select the pods that are counted.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].matchLabelKeys` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `topologySpreadConstraints[].nodeAffinityPolicy`

Whether the node affinity of the pod is honored when the skew is calculated.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints[].nodeAffinityPolicy` |
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
| Key | `workload.$name.podSpec.topologySpreadConstraints[].nodeTaintsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Honor"`, `"Ignore"` |

---

## `hostAliases`

Extra entries for the `/etc/hosts` file of the pods (`hostAliases`). Overrides `podOptions.hostAliases` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostAliases` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostAliases[]`

An `/etc/hosts` entry that maps one IP to one or more host names.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostAliases[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostAliases[].ip`

IP address of the entry.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostAliases[].ip` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      hostAliases:
        - ip: 10.0.0.10
```

---

## `hostAliases[].hostnames`

Host names that resolve to the IP. At least one is required.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostAliases[].hostnames` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      hostAliases:
        - hostnames:
            - myhost.local
```

---

## `dnsPolicy`

DNS policy of the pods (`dnsPolicy`): `ClusterFirst`, `ClusterFirstWithHostNet`, `Default` or `None`. It is forced to `ClusterFirstWithHostNet` when `hostNetwork` is `true`. Overrides `podOptions.dnsPolicy` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `dnsConfig`

Extra DNS settings of the pods (`dnsConfig`). Overrides `podOptions.dnsConfig` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dnsConfig.nameservers`

IP addresses of extra DNS servers, at most 3. Added to the servers of `dnsPolicy`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.nameservers` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | … to 3 |

Example

```yaml
workload:
  example:
    podSpec:
      dnsConfig:
        nameservers:
          - 1.1.1.1
```

---

## `dnsConfig.searches`

Extra DNS search domains, at most 6. Added to the search domains of `dnsPolicy`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.searches` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | … to 6 |

Example

```yaml
workload:
  example:
    podSpec:
      dnsConfig:
        searches:
          - example.com
```

---

## `dnsConfig.options`

Resolver options of the pods, eg `ndots`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.options` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dnsConfig.options[]`

A resolver option, with a name and an optional value.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.options[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `dnsConfig.options[].name`

Name of the resolver option, eg `ndots`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.options[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      dnsConfig:
        options:
          - name: ndots
```

---

## `dnsConfig.options[].value`

Value of the resolver option.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.options[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      dnsConfig:
        options:
          - value: '2'
```

---

## `tolerations`

Taints the pods tolerate (`tolerations`). Overrides `podOptions.tolerations` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tolerations[]`

A toleration of a node taint.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tolerations[].operator`

How the taint is matched: `Exists` matches any value of the key, `Equal` requires `value` to be equal.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      tolerations:
        - operator: Equal
```

---

## `tolerations[].key`

Key of the taint. Required when `operator` is `Equal`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `tolerations[].value`

Value of the taint. Required when `operator` is `Equal`, and must be empty when it is `Exists`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `tolerations[].effect`

Effect of the taint to tolerate: `NoSchedule`, `PreferNoSchedule` or `NoExecute`. All effects match when empty.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].effect` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `tolerations[].tolerationSeconds`

Seconds the pod stays bound to a node with a `NoExecute` taint before it is evicted. Only applies to the `NoExecute` effect.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations[].tolerationSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      tolerations:
        - tolerationSeconds: 300
```

---

## `runtimeClassName`

Name of the RuntimeClass of the pods (`runtimeClassName`), to run them with another container runtime. Overrides `podOptions.runtimeClassName` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.runtimeClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `securityContext`

Pod-level security context.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext.fsGroup`

Group ID applied to mounted volumes.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.fsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `568` |

---

## `securityContext.fsGroupChangePolicy`

Policy controlling when ownership and permissions of volume contents are changed.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.fsGroupChangePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"OnRootMismatch"` |
| Allowed values | `"Always"`, `"OnRootMismatch"` |

---

## `securityContext.supplementalGroups`

Additional group IDs applied to containers in the pod.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.supplementalGroups` |
| Type | `list of int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `securityContext.sysctls`

Kernel parameters to set in the pod's network namespace.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.sysctls` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `securityContext.sysctls[]`

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.sysctls[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext.sysctls[].name`

Name of the sysctl.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.sysctls[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `securityContext.sysctls[].value`

Value of the sysctl.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext.sysctls[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## Full Examples

### Scheduling

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      schedulerName: some-scheduler
      priorityClassName: some-priority-class-name
      runtimeClassName: some-runtime-class
      nodeSelector:
        disk_type: ssd
      tolerations:
        - operator: Exists
          effect: NoExecute
          tolerationSeconds: 3600
      terminationGracePeriodSeconds: 100
```

### Networking

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      hostNetwork: false
      hostPID: false
      hostIPC: false
      hostUsers: false
      shareProcessNamespace: false
      enableServiceLinks: false
      hostname: some-hostname
      hostAliases:
        - ip: 10.10.10.100
          hostnames:
            - myserver.local
            - storage.local
      dnsPolicy: ClusterFirst
      dnsConfig:
        nameservers:
          - 1.1.1.1
          - 1.0.0.1
        searches:
          - ns1.svc.cluster-domain.example
        options:
          - name: ndots
            value: "1"
          - name: edns0
```

### Security context

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      automountServiceAccountToken: true
      serviceAccountName: some-service-account
      securityContext:
        fsGroup: 568
        fsGroupChangePolicy: OnRootMismatch
        supplementalGroups:
          - 568
          - 1000
        sysctls:
          - name: net.ipv4.ip_unprivileged_port_start
            value: "0"
```

### Labels and annotations

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      labels:
        key: value
      annotations:
        key: value
      restartPolicy: Always
```

### Containers and init containers

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      initContainers:
        init-name:
          enabled: true
          type: init
          imageSelector: image
          command:
            - /bin/sh
            - -c
            - echo "init"
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```
