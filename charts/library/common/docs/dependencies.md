---
title: Dependencies
---

:::note

- See the [Full Examples](/truecharts-common/dependencies#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies`

---

## `dependencies`

Services the app needs, such as a database or cache, deployed with the chart. See [dependencies](/truecharts-common/dependencies).

| Field | Value |
| --- | --- |
| Key | `dependencies` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A dependency, keyed by name: a set of chart values with an `enabled` key, merged into the values of the chart when enabled.

:::warning

This object also takes all keys of the root values, for example `workload`, `service` and `persistence`. Common sets them for the dependency. They are only for the internal use of common: do not use them in charts that are based on common.

:::

| Field | Value |
| --- | --- |
| Key | `dependencies.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Whether the dependency is enabled. The values of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
dependencies:
  postgresql:
    enabled: true
    depconfig:
      postgresqlUsername: app
      postgresqlDatabase: app
```

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      backups:
        enabled: true
        credentials: mys3
```
