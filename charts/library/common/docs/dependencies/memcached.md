---
title: Memcached
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/memcached#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.clickhouse`
- `.Values.dependencies.mariadb`
- `.Values.dependencies.memcached`
- `.Values.dependencies.mongodb`
- `.Values.dependencies.postgresql`
- `.Values.dependencies.valkey`

---

## `memcached`

The memcached dependency. It has no credentials, the chart connects to its primary service.

:::warning

This object also takes all keys of the root values, for example `workload`, `service` and `persistence`. Common sets them for the dependency. They are only for the internal use of common: do not use them in charts that are based on common.

:::

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `mode`

How the dependency is provided. `standalone` merges and deploys it with the chart, `operator` leaves it to an operator, so its objects are not merged into the chart. The credentials, wait init container and notes still apply.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"standalone"` |
| Allowed values | `"standalone"`, `"operator"` |

---

## `depconfig`

Configuration of the dependency itself. Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.password`

Password used by the dependency. Defaults to `PLACEHOLDERPASSWORD`.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.creds`

Connection details populated by the dependency (eg `plainhost`, `url`). Read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `operator`

Settings specific to the operator providing the dependency (see `mode`). Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.memcached.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

Memcached has no credentials. The app connects to the service of the dependency on port `11211`:

```yaml
dependencies:
  memcached:
    enabled: true

workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          env:
            MEMCACHED_HOST: "{{ .Release.Name }}-memcached-main"
            MEMCACHED_PORT: 11211
```
