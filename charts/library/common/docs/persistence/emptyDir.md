---
title: EmptyDir
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/persistence/emptyDir#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Persistence](/truecharts-common/persistence) page.
- These options apply only when `type: emptyDir`.

:::

## Appears in

- `.Values.persistence.$name`

---

## `size`

Size limit of the `emptyDir`, as a quantity. Only for `type: emptyDir`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.size` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `emptyDir`, `pvc`, `vct` |

Example

```yaml
persistence:
  example:
    size: 1Gi
```

---

## `medium`

Medium of the `emptyDir`: `Memory` keeps the data in RAM (tmpfs), an empty string uses the disk of the node. Only for `type: emptyDir`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.medium` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Applies to | `emptyDir` |

---

## Full Examples

### Default medium

```yaml
persistence:
  emptydir-vol:
    enabled: true
    type: emptyDir
    size: 2Gi
    mountPath: /cache
```

### In memory

```yaml
persistence:
  emptydir-memory:
    enabled: true
    type: emptyDir
    medium: Memory
    size: 2Gi
    targetSelector:
      workload-name:
        container-name:
          mountPath: /dev/shm
```
