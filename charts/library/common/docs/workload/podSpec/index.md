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

## Child Pages

- [Container](/truecharts-common/workload/podSpec/containers)
- [hostAliases](/truecharts-common/workload/podSpec/hostAliases)
- [Init Containers](/truecharts-common/workload/podSpec/initContainers)
- [securityContext](/truecharts-common/workload/podSpec/securityContext)

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

A container of the pod. The shared container settings are in [container](/truecharts-common/workload/podSpec/containers).

See [Container](/truecharts-common/workload/podSpec/containers) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `initContainers`

Init containers of the pod, keyed by name. See [initContainers](/truecharts-common/workload/podSpec/initContainers).

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

See [Init Containers](/truecharts-common/workload/podSpec/initContainers) for all keys of this object.

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

See [topologySpreadConstraints](/truecharts-common/podOptions/topologySpreadConstraints) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.topologySpreadConstraints` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostAliases`

Extra entries for the `/etc/hosts` file of the pods (`hostAliases`). Overrides `podOptions.hostAliases` for this workload.

See [hostAliases](/truecharts-common/workload/podSpec/hostAliases) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostAliases` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

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

See [dnsConfig](/truecharts-common/podOptions/dnsConfig) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `tolerations`

Taints the pods tolerate (`tolerations`). Overrides `podOptions.tolerations` for this workload.

See [tolerations](/truecharts-common/podOptions/tolerations) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.tolerations` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

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

See [securityContext](/truecharts-common/workload/podSpec/securityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
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
