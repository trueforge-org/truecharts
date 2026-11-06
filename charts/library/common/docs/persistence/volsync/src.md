---
title: src
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/volsync/src#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.$name.volsync[].src`

---

## `src`

The ReplicationSource, which backs up the data.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enables or Disables the VolSync source, which backs up the data

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `trigger`

When the backup is triggered.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.trigger` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `trigger.schedule`

Cron schedule of the backup. Defaults to `0 0 * * *`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.trigger.schedule` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    volsync:
      - src:
          trigger:
            schedule: 0 3 * * *
```

---

## `retain`

How many snapshots to keep per interval.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `retain.hourly`

Define the number of hourly snapshots to retain, defaults to 6

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.hourly` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `retain.daily`

Define the number of daily snapshots to retain, defaults to 5

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.daily` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `retain.weekly`

Define the number of weekly snapshots to retain, defaults to 4

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.weekly` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `retain.monthly`

Define the number of monthly snapshots to retain, defaults to 3

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.monthly` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `retain.yearly`

Define the number of yearly snapshots to retain, defaults to 1

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.retain.yearly` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `pruneIntervalDays`

Days between prunes of old snapshots. Defaults to `7`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.pruneIntervalDays` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `accessModes`

Access modes of the PVC used for the source.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.accessModes` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `storageClassName`

Define the storageClassName of the source storage

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.storageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `volumeSnapshotClassName`

Define the volumeSnapshotClassName used for the source snapshots

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.volumeSnapshotClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `cacheCapacity`

Size of the cache PVC, as a quantity. Defaults to `10Gi`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.cacheCapacity` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    volsync:
      - src:
          cacheCapacity: 10Gi
```

---

## `cacheStorageClassName`

Define the storageClassName of the cache PVC

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.cacheStorageClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `cacheAccessModes`

Access modes of the cache PVC.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.cacheAccessModes` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `moverSecurityContext`

Pod security context of the VolSync mover pod of the source.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `moverSecurityContext.fsGroup`

Group ID owning the volumes of the pod, and the files created in them.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.fsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `moverSecurityContext.runAsGroup`

Group ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.runAsGroup` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `moverSecurityContext.runAsUser`

User ID of the first process of the containers of the pod.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.volsync[].src.moverSecurityContext.runAsUser` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
persistence:
  restored:
    volsync:
      - src:
          enabled: false
```

```yaml
persistence:
  backedup:
    volsync:
      - src:
          enabled: true
          trigger:
            schedule: 0 0 * * *
          pruneIntervalDays: 7
          retain:
            hourly: 6
            daily: 5
            weekly: 4
            monthly: 3
            yearly: 1
          accessModes:
            - ReadWriteOnce
          storageClassName: some-storage-class
          volumeSnapshotClassName: some-snapshot-class
          cacheCapacity: 1Gi
          moverSecurityContext:
            runAsUser: 568
            runAsGroup: 568
            fsGroup: 568
```
