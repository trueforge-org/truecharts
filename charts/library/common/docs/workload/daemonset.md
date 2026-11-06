---
title: DaemonSet
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/daemonset#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Workload](/truecharts-common/workload) page.
- These options apply only when `type: DaemonSet`.

:::

## Appears in

- `.Values.workload.$name`

---

## `revisionHistoryLimit`

Number of old ReplicaSets, ControllerRevisions or history entries that are kept for rollbacks (`revisionHistoryLimit`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.revisionHistoryLimit` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `Deployment`, `StatefulSet`, `DaemonSet` |

Example

```yaml
workload:
  example:
    revisionHistoryLimit: 3
```

---

## `strategy`

Update strategy of the workload. Deployments accept `Recreate` and `RollingUpdate`, StatefulSets and DaemonSets accept `RollingUpdate` and `OnDelete`. Set `maxUnavailable`, `maxSurge` and `partition` under `rollingUpdate`.

A Deployment with a single replica uses `Recreate` if it mounts a `ReadWriteOnce` volume.

| Field | Value |
| --- | --- |
| Key | `workload.$name.strategy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Recreate"`, `"RollingUpdate"`, `"OnDelete"` |
| Applies to | `Deployment`, `StatefulSet`, `DaemonSet` |

---

## `rollingUpdate`

Settings of the `RollingUpdate` strategy. Only used when `strategy` is `RollingUpdate`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.rollingUpdate` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `Deployment`, `StatefulSet`, `DaemonSet` |

---

## `rollingUpdate.maxUnavailable`

Maximum number of pods that can be unavailable during an update, as a number or a percentage like `25%`. Only used when `strategy` is `RollingUpdate`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.rollingUpdate.maxUnavailable` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `rollingUpdate.maxSurge`

Maximum number of pods that can be created above the desired number during an update, as a number or a percentage like `25%`. Only used when `strategy` is `RollingUpdate`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.rollingUpdate.maxSurge` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `Deployment`, `DaemonSet` |

---

## Full Examples

### RollingUpdate

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: DaemonSet
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 0
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### OnDelete

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: DaemonSet
    strategy: OnDelete
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### Run on every node

Tolerate taints so the pod also runs on control plane nodes.

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: DaemonSet
    strategy: RollingUpdate
    podSpec:
      tolerations:
        - key: node-role.kubernetes.io/control-plane
          operator: Exists
          effect: NoSchedule
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```
