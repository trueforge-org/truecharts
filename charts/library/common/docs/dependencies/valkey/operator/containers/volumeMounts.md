---
title: volumeMounts
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/containers/volumeMounts#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.containers[].volumeMounts`

---

## `volumeMounts`

Volumes mounted in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

Volume mounted in the container.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the volume to mount.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].mountPath`

Path in the container the volume is mounted at.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].mountPath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].readOnly`

Whether the volume is mounted read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].readOnly` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].recursiveReadOnly`

Whether the read-only mount is applied recursively to submounts.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].recursiveReadOnly` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Disabled"`, `"IfPossible"`, `"Enabled"` |

---

## `[].subPath`

Path inside the volume to mount instead of its root.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].subPath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].subPathExpr`

Like `subPath`, but expanded from environment variables of the container. Mutually exclusive with `subPath`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].subPathExpr` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].mountPropagation`

Mount propagation of the mount.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].mountPropagation` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"None"`, `"HostToContainer"`, `"Bidirectional"` |

---

## `[].bindMountOptions`

Options of the bind mount.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers[].volumeMounts[].bindMountOptions` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

The schema of `operator` has no `volumes` key, so a container can only mount a volume that the pods created by the valkey operator already have. Look up the name of that volume in those pods: `data` below is only a placeholder.

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: backup
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          volumeMounts:
            - name: data
              mountPath: /data
              readOnly: true
            - name: data
              mountPath: /config
              subPath: config
              recursiveReadOnly: IfPossible
```
