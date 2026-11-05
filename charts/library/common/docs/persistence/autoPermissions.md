---
title: autoPermissions
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.persistence.$name.autoPermissions`

---

## `autoPermissions`

Set the ownership and mode of the volume with an init container before the app starts.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Run the permissions init container for this volume.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `chown`

Change the owner of the volume to `user` and `group`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.chown` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `chmod`

Mode to apply to the volume, for example `775`.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.chmod` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
persistence:
  example:
    autoPermissions:
      chmod: '775'
```

---

## `recursive`

Apply the chown and chmod recursively.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.recursive` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `user`

User ID to change the owner of the volume to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.user` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `group`

Group ID to change the group of the volume to.

| Field | Value |
| --- | --- |
| Key | `persistence.$name.autoPermissions.group` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
