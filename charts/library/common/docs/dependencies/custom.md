---
title: Custom Dependencies
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/custom#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.$name`
- `.Values.dependencies.clickhouse`
- `.Values.dependencies.mariadb`
- `.Values.dependencies.memcached`
- `.Values.dependencies.mongodb`
- `.Values.dependencies.postgresql`
- `.Values.dependencies.valkey`

---

## `$name`

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

## `depconfig`

Settings of the dependency itself. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.password`

Password of the dependency.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.creds`

Connection details set by the dependency, eg `plainhost` and `url`. Read only.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `operator`

Settings for the operator that provides the dependency. Never merged into the chart.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `operator.$name`

A setting for the operator. Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.operator.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `mode`

How the dependency is provided. `standalone` merges and deploys it with the chart, `operator` leaves it to an operator, so its objects are not merged into the chart. The credentials, wait init container and notes still apply.

| Field | Value |
| --- | --- |
| Key | `dependencies.$name.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"standalone"` |
| Allowed values | `"standalone"`, `"operator"` |

---

## Full Examples

Any other name is a dependency with a complete chart values structure. Its objects are merged into the chart as `<name>-<object>`, and the references between them are rewritten. There is no credentials Secret or wait init container:

```yaml
redisImage:
  repository: oci.trueforge.org/containerforge/redis
  pullPolicy: IfNotPresent
  tag: 8.0.0@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

dependencies:
  redis:
    enabled: true
    workload:
      main:
        replicas: 1
        type: StatefulSet
        podSpec:
          containers:
            main:
              imageSelector: redisImage
    service:
      main:
        ports:
          main:
            protocol: tcp
            port: 6379
            targetPort: 6379
    persistence:
      data:
        mountPath: /data
        size: 1Gi
```
