---
title: Workload
---

:::note

- See the [Full Examples](/truecharts-common/workload#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.$name`

---

## Child Pages

- [CronJob](/truecharts-common/workload/cronjob)
- [DaemonSet](/truecharts-common/workload/daemonset)
- [Deployment](/truecharts-common/workload/deployment)
- [Job](/truecharts-common/workload/job)
- [Pod Spec](/truecharts-common/workload/podSpec)
- [StatefulSet](/truecharts-common/workload/statefulset)

---

## `$name`

A workload, spawned as a Deployment, StatefulSet, DaemonSet, Job or CronJob.

| Field | Value |
| --- | --- |
| Key | `workload.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `podSpec`

Settings of the pods of the workload: containers, init containers and pod level options.

See [Pod Spec](/truecharts-common/workload/podSpec) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `suspend`

Whether the CronJob is suspended, so no new Jobs start (`suspend`). Forced to `true` when `stopAll` is enabled.

| Field | Value |
| --- | --- |
| Key | `workload.$name.suspend` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the workload is created.

| Field | Value |
| --- | --- |
| Key | `workload.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `primary`

Whether this is the primary workload of the chart. A chart needs one primary workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.primary` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations of the workload.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `labelsList`

Additional labels as a list of name and value pairs, merged into the labels of the workload.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `labels`

Additional labels for the workload object.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `annotations`

Additional annotations for the workload object.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `namespace`

Namespace of the workload. Defaults to the namespace of the release.

| Field | Value |
| --- | --- |
| Key | `workload.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `""` |

---

## `type`

Kind of the workload: `Deployment`, `DaemonSet`, `StatefulSet`, `CronJob` or `Job`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Deployment"`, `"DaemonSet"`, `"StatefulSet"`, `"CronJob"`, `"Job"` |

---

## `dbWait`

Not used by common itself. Kept for compatibility with existing values.

| Field | Value |
| --- | --- |
| Key | `workload.$name.dbWait` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Internal Common Keys

:::warning

These keys are only for the internal use of common. Do not use them in charts that are based on common: they can change or be removed at any time, without a breaking change.

:::

---

## `initContainers`

Not used. Init containers go under `podSpec.initContainers`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.initContainers` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `serviceAccountName`

Not used. Set the service account of the pods with `podSpec.serviceAccountName`, or with the top-level `serviceAccount` key and its `targetSelector`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.serviceAccountName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `""` |

---

## `containers`

Not used. Containers go under `podSpec.containers`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.containers` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## Full Examples

### Workloads

A chart can define several workloads. Exactly one is `primary`. See the page of each type for all its options:

- [Deployment](/truecharts-common/workload/deployment)
- [StatefulSet](/truecharts-common/workload/statefulset)
- [DaemonSet](/truecharts-common/workload/daemonset)
- [CronJob](/truecharts-common/workload/cronjob)
- [Job](/truecharts-common/workload/job)

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    namespace: some-namespace
    labels:
      key: value
    annotations:
      key: value
    serviceAccountName: some-service-account
    dbWait: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image

  other-workload-name:
    enabled: true
    primary: false
    type: CronJob
    schedule: "0 3 * * *"
    podSpec:
      restartPolicy: OnFailure
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### Pod spec

See [Pod Spec](/truecharts-common/workload/podSpec) for the options of the pod.

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
      automountServiceAccountToken: true
      hostNetwork: false
      hostPID: false
      shareProcessNamespace: false
      enableServiceLinks: false
      schedulerName: some-scheduler
      priorityClassName: some-priority-class-name
      hostname: some-hostname
      terminationGracePeriodSeconds: 100
      nodeSelector:
        disk_type: ssd
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
      tolerations:
        - operator: Exists
          effect: NoExecute
          tolerationSeconds: 3600
      runtimeClassName: some-runtime-class
      securityContext:
        fsGroup: 568
        fsGroupChangePolicy: OnRootMismatch
        supplementalGroups:
          - 568
        sysctls:
          - name: net.ipv4.ip_local_port_range
            value: "1024 65535"
```
