---
title: dnsConfig
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/podOptions/dnsConfig#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions.dnsConfig`
- `.Values.workload.$name.podSpec.dnsConfig`

---

## `dnsConfig`

Extra DNS settings of the pods (`dnsConfig`): nameservers, search domains and resolver options. Can be overridden per workload in `workload.<name>.podSpec`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"options": [{"name": "ndots", "value": "1"}]}` |

---

## `nameservers`

IP addresses of extra DNS servers, at most 3. Added to the servers of `dnsPolicy`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.nameservers` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | … to 3 |

Example

```yaml
podOptions:
  dnsConfig:
    nameservers:
      - 1.1.1.1
```

---

## `searches`

Extra DNS search domains, at most 6. Added to the search domains of `dnsPolicy`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.searches` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On entries only) |
| Default | unset |
| Items | … to 6 |

Example

```yaml
podOptions:
  dnsConfig:
    searches:
      - example.com
```

---

## `options`

Resolver options of the pods, eg `ndots`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.options` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `options[]`

A resolver option, with a name and an optional value.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.options[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `options[].name`

Name of the resolver option, eg `ndots`.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.options[].name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
podOptions:
  dnsConfig:
    options:
      - name: ndots
```

---

## `options[].value`

Value of the resolver option.

| Field | Value |
| --- | --- |
| Key | `podOptions.dnsConfig.options[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
podOptions:
  dnsConfig:
    options:
      - value: '2'
```

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
podOptions:
  dnsConfig:
    nameservers:
      - 1.1.1.1
      - 9.9.9.9
    searches:
      - my-namespace.svc.cluster.local
      - svc.cluster.local
    options:
      - name: ndots
        value: '2'
      - name: edns0
```
