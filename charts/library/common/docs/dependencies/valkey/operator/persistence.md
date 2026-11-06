---
title: persistence
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/persistence#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.persistence`

---

## `persistence`

Persistence of the nodes. Requires `workloadType: StatefulSet`, and can not be added or removed after creation.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": true, "size": "", "storageClass": "", "retain": false}` |

---

## `enabled`

Whether the nodes have a volume.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `size`

Size of the volume of every node. Defaults to `global.fallbackDefaults.vctSize`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.size` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `storageClass`

Storage class of the volumes. Defaults to `global.fallbackDefaults.storageClass`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.storageClass` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `retain`

Whether the volumes are retained when a node is deleted. Defaults to `global.fallbackDefaults.pvcRetain`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence.retain` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
dependencies:
  valkey:
    operator:
      persistence:
        enabled: true
        size: 2Gi
```

```yaml
dependencies:
  valkey:
    operator:
      persistence:
        enabled: true
        size: 5Gi
        storageClass: fast-storage
        retain: true
```
