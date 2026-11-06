---
title: Storage Class
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/storageClass#full-examples) section for complete examples.

:::

## Appears in

- `.Values.storageClass`

---

## `storageClass`

StorageClasses, keyed by name.

| Field | Value |
| --- | --- |
| Key | `storageClass` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

A StorageClass.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.mountOptions`

Mount options of volumes of this class. Supports Helm `tpl` on each entry.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.mountOptions` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | `[]` |

Example

```yaml
storageClass:
  example:
    mountOptions:
      - nfsvers=4.1
```

---

## `$name.enabled`

Create this storage class when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.labels`

Additional labels for storage class

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for storage class

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.provisioner`

Provisioner (CSI driver) that provisions volumes of this class.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.provisioner` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
storageClass:
  example:
    provisioner: nfs.csi.k8s.io
```

---

## `$name.isDefault`

Make this the default StorageClass of the cluster.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.isDefault` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.parameters`

Parameters passed to the provisioner. Supports Helm `tpl` on values.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.parameters` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.parameters.$name`

Value of the parameter. Numbers and booleans are rendered as a string.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.parameters.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.reclaimPolicy`

What happens to a volume when its claim is deleted.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.reclaimPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Retain"` |
| Allowed values | `"Delete"`, `"Retain"` |

---

## `$name.allowVolumeExpansion`

Allow claims of this class to be resized.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.allowVolumeExpansion` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.volumeBindingMode`

When volumes are bound and provisioned. `WaitForFirstConsumer` waits until a pod uses the claim.

| Field | Value |
| --- | --- |
| Key | `storageClass.$name.volumeBindingMode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Immediate"` |
| Allowed values | `"Immediate"`, `"WaitForFirstConsumer"` |

---

## Full Examples

### Basic StorageClass

```yaml
storageClass:
  example:
    enabled: true
    provisioner: some.provisioner.io
    parameters:
      param1: value1
      param2: value2
    reclaimPolicy: Retain
    allowVolumeExpansion: true
    volumeBindingMode: Immediate
    mountOptions:
      - option1
      - option2=value
```

### Default class that binds late

`WaitForFirstConsumer` delays the volume until a pod uses it, so it is created on the right node:

```yaml
storageClass:
  local:
    enabled: true
    provisioner: rancher.io/local-path
    isDefault: true
    reclaimPolicy: Delete
    volumeBindingMode: WaitForFirstConsumer
    labels:
      key: value
    annotations:
      key: value
```

### Parameters and use

Parameters can be numbers and booleans. A volume selects the class by name:

```yaml
storageClass:
  nfs:
    enabled: true
    provisioner: nfs.csi.k8s.io
    parameters:
      server: nfs.example.com
      share: /exports
      mountPermissions: "0"
      subDir: data
    mountOptions:
      - nfsvers=4.1

persistence:
  config:
    enabled: true
    type: pvc
    storageClass: nfs
    size: 10Gi
    mountPath: /config
```
