---
title: monitoring
---

:::note

- See the [Full Examples](/truecharts-common/cnpg/monitoring#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg.$name.monitoring`

---

## `monitoring`

Monitoring of the cluster.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enablePodMonitor": false, "disableDefaultQueries": false, "customQueries": []}` |

---

## `enablePodMonitor`

Create a PodMonitor for the cluster.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.enablePodMonitor` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `disableDefaultQueries`

Do not run the default queries of the metrics exporter.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.disableDefaultQueries` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `customQueries`

Additional queries for the metrics exporter.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `customQueries[]`

A custom query of the metrics exporter, read from a ConfigMap or Secret with `name` and `key`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `customQueries[].name`

Name of the query.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `customQueries[].key`

Key of the ConfigMap or Secret with the queries.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[].key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `customQueries[].query`

SQL query.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[].query` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `customQueries[].metrics`

Metrics the query returns, by column.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[].metrics` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `customQueries[].metrics[]`

Describes the columns the query returns, keyed by column name.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[].metrics[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `customQueries[].metrics[].$name`

How the column with this name is exported as a metric.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[].metrics[].$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `customQueries[].metrics[].$name.usage`

Usage of the column, eg `LABEL`, `GAUGE` or `COUNTER`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[].metrics[].$name.usage` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `customQueries[].metrics[].$name.description`

Description of the metric.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[].metrics[].$name.description` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `customQueries[].expandObjectName`

Expand the name of the ConfigMap or Secret with the name of the release.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.monitoring.customQueries[].expandObjectName` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
cnpg:
  example:
    monitoring:
      enablePodMonitor: false
      disableDefaultQueries: false
      customQueries: []
```
