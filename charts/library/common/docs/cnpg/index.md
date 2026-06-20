---
title: Cnpg
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/cnpg#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg`

---

## `cnpg`

Define a CNPG cluster

| Field      | Value  |
| ---------- | ------ |
| Key        | `cnpg` |
| Type       | `map`  |
| Required   | ❌     |
| Helm `tpl` | ❌     |
| Default    | unset  |

---

### `cnpg.$name.annotations`

Define a CNPG cluster

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `cnpg.$name.annotations` |
| Type       | `map, string`            |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `{}`                     |

Example

```yaml
cnpg:
  $name:
    annotations:
      {}
```

---

### `cnpg.$name.backups`

Configuration for `cnpg.main.backups`.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `cnpg.$name.backups` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `cnpg.$name.cluster`

Define a CNPG cluster

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `cnpg.$name.cluster` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `cnpg.$name.creds`

Configuration for `cnpg.main.creds`.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `cnpg.$name.creds` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `cnpg.$name.database`

Define a CNPG cluster

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `cnpg.$name.database` |
| Type       | `string`              |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `""`                  |
| Min Length | `1`                   |

Example

```yaml
cnpg:
  $name:
    database: ""
```

---

### `cnpg.$name.enabled`

Define a CNPG cluster

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `cnpg.$name.enabled` |
| Type       | `boolean, string`    |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | `false`              |

Example

```yaml
cnpg:
  $name:
    enabled: false
```

---

### `cnpg.$name.hibernate`

Define a CNPG cluster

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `cnpg.$name.hibernate` |
| Type       | `boolean`              |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | `false`                |

Example

```yaml
cnpg:
  $name:
    hibernate: false
```

---

### `cnpg.$name.labels`

Define a CNPG cluster

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `cnpg.$name.labels` |
| Type       | `map, string`       |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | `{}`                |

Example

```yaml
cnpg:
  $name:
    labels:
      {}
```

---

### `cnpg.$name.mode`

Define a CNPG cluster

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `cnpg.$name.mode`        |
| Type       | `string`                 |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `"standalone"`           |
| Enum       | `standalone`, `recovery` |

Example

```yaml
cnpg:
  $name:
    mode: standalone
```

---

### `cnpg.$name.monitoring`

Configuration for `cnpg.main.monitoring`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `cnpg.$name.monitoring` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `cnpg.$name.password`

Define a CNPG cluster

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `cnpg.$name.password` |
| Type       | `string`              |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `""`                  |
| Min Length | `1`                   |

Example

```yaml
cnpg:
  $name:
    password: ""
```

---

### `cnpg.$name.pgVersion`

Define a CNPG cluster

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `cnpg.$name.pgVersion` |
| Type       | `integer`              |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | `16`                   |
| Enum       | `15`, `16`, `17`, `18` |

Example

```yaml
cnpg:
  $name:
    pgVersion: 16
```

---

### `cnpg.$name.pooler`

Configuration for `cnpg.main.pooler`.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `cnpg.$name.pooler` |
| Type       | `map`               |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

---

### `cnpg.$name.primary`

Define a CNPG cluster

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `cnpg.$name.primary` |
| Type       | `boolean`            |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | `false`              |

Example

```yaml
cnpg:
  $name:
    primary: false
```

---

### `cnpg.$name.recovery`

Configuration for `cnpg.main.recovery`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `cnpg.$name.recovery` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `cnpg.$name.type`

Define a CNPG cluster

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `cnpg.$name.type`                                              |
| Type       | `string`                                                       |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | `"postgres"`                                                   |
| Enum       | `postgres`, `postgis`, `timescaledb`, `vectors`, `vectorchord` |

Example

```yaml
cnpg:
  $name:
    type: postgres
```

---

### `cnpg.$name.user`

Define a CNPG cluster

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `cnpg.$name.user` |
| Type       | `string`          |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | `""`              |
| Min Length | `1`               |

Example

```yaml
cnpg:
  $name:
    user: ""
```

---

## Child Pages

- [Cluster](cluster/)

---

## Full Examples

```yaml
cnpg:
  main:
    enabled: true
    primary: true
    hibernate: false
    type: postgres
    pgVersion: 16
    mode: standalone
    database: "app"
    user: "app"
    password: "PLACEHOLDERPASSWORD"
    cluster: {}
    monitoring: {}
    recovery: {}
    backups: {}
    pooler: {}

  my-cluster-1:
    enabled: true
    primary: false
    hibernate: false
    labels:
      label1: label1
      label2: label2
    annotations:
      annotation1: annotation1
      annotation2: annotation2
    type: postgres
    pgVersion: 16
    mode: standalone
    database: "my-app"
    user: "my-user"
    password: "supersecret"
    cluster: {}
    monitoring: {}
    recovery: {}
    backups: {}
    pooler: {}
```
