---
title: Deployment
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/deployment#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Workload](/truecharts-common/workload) page.
- These options apply only when `type: Deployment`.

:::

## Appears in

- `.Values.workload.$name`

---

## `replicas`

Number of pod replicas (`replicas`).

| Field | Value |
| --- | --- |
| Key | `workload.$name.replicas` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Applies to | `Deployment`, `StatefulSet` |

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

### Recreate

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    replicas: 1
    revisionHistoryLimit: 3
    strategy: Recreate
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### RollingUpdate

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    replicas: 3
    revisionHistoryLimit: 3
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: "25%"
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### Multiple Deployments

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    replicas: 1
    strategy: Recreate
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image

  other-workload-name:
    enabled: true
    primary: false
    type: Deployment
    labels:
      key: value
    annotations:
      key: value
    replicas: 2
    strategy: RollingUpdate
    rollingUpdate:
      maxUnavailable: 0
      maxSurge: 1
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```
