---
title: hostAliases
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/hostAliases#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions.hostAliases`
- `.Values.workload.$name.podSpec.hostAliases`

---

## `hostAliases`

Extra entries for the `/etc/hosts` file of the pods (`hostAliases`). Overrides `podOptions.hostAliases` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostAliases` |
| Type | `list of map or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

An `/etc/hosts` entry that maps one IP to one or more host names.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostAliases[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].ip`

IP address of the entry.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostAliases[].ip` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      hostAliases:
        - ip: 10.0.0.10
```

---

## `[].hostnames`

Host names that resolve to the IP. At least one is required.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.hostAliases[].hostnames` |
| Type | `list of string` |
| Required | ✅ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      hostAliases:
        - hostnames:
            - myhost.local
```

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
workload:
  workload-name:
    podSpec:
      hostAliases:
        - ip: 10.10.10.100
          hostnames:
            - myserver.local
            - storage.local
```
