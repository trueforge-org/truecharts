---
title: dnsConfig
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.workload.$name.podSpec.dnsConfig`

---

## `dnsConfig`

Extra DNS settings of the pods (`dnsConfig`). Overrides `podOptions.dnsConfig` for this workload.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nameservers`

IP addresses of extra DNS servers, at most 3. Added to the servers of `dnsPolicy`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.nameservers` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      dnsConfig:
        nameservers:
          - 1.1.1.1
```

---

## `searches`

Extra DNS search domains, at most 6. Added to the search domains of `dnsPolicy`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.searches` |
| Type | `list` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      dnsConfig:
        searches:
          - example.com
```

---

## `options`

Resolver options of the pods, eg `ndots`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.options` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `options[]`

A resolver option, with a name and an optional value.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.options[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `options[].name`

Name of the resolver option, eg `ndots`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.options[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      dnsConfig:
        options:
          - name: ndots
```

---

## `options[].value`

Value of the resolver option.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.dnsConfig.options[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      dnsConfig:
        options:
          - value: '2'
```

---
