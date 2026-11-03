---
title: Global
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/global#full-examples) section for complete examples.

:::

## Appears in

- `.Values.global`

---

## `global`

Global values that apply to all charts See more info about global values [documentation](/truecharts-common/global)

| Field      | Value    |
| ---------- | -------- |
| Key        | `global` |
| Type       | `map`    |
| Required   | ❌       |
| Helm `tpl` | ❌       |
| Default    | unset    |

---

### `global.annotations`

Additional Annotations that apply to all objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `global.annotations` |
| Type       | `map, string`        |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | `{}`                 |

Example

```yaml
global:
  annotations:
    {}
```

---

### `global.diagnosticMode`

Configuration for `global.diagnosticMode`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `global.diagnosticMode` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `global.fallbackDefaults`

The fallback defaults are used when a value is not defined in the chart. - See more info about fallbackDefaults [documentation](/truecharts-common/fallbackdefaults)

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `global.fallbackDefaults` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

See [Fallbackdefaults](fallbackDefaults.md) for full configuration.

---

### `global.ignoreIsStopped`

Ignore isStopped when applying global stop behaviour. Set by the stable external-service chart; no common template reads it.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `global.ignoreIsStopped` |
| Type       | `boolean`                |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `global.labels`

Additional Labels that apply to all objects

| Field      | Value           |
| ---------- | --------------- |
| Key        | `global.labels` |
| Type       | `map, string`   |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | `{}`            |

Example

```yaml
global:
  labels:
    {}
```

---

### `global.minNodePort`

Minimum Node Port Allowed

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `global.minNodePort` |
| Type       | `integer`            |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | `9000`               |
| Minimum    | `1`                  |

Example

```yaml
global:
  minNodePort: 9000
```

---

### `global.namespace`

Namespace to apply to all objects, unless overridden at the object level Does not apply to chart deps, use global.namespace for that

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `global.namespace` |
| Type       | `string`           |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | `""`               |

Example

```yaml
global:
  namespace: ""
```

---

### `global.podCIDR`

Configuration for `global.podCIDR`.

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `global.podCIDR` |
| Type       | `string`         |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

---

### `global.stopAll`

Applies different techniques to stop all objects in the chart and its dependencies

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `global.stopAll` |
| Type       | `boolean`        |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | `false`          |

Example

```yaml
global:
  stopAll: false
```

---

### `global.svcCIDR`

Configuration for `global.svcCIDR`.

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `global.svcCIDR` |
| Type       | `string`         |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

---

### `global.traefik`

Settings for traefik integration

| Field      | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Key        | `global.traefik`                                               |
| Type       | `map`                                                          |
| Required   | ❌                                                             |
| Helm `tpl` | ❌                                                             |
| Default    | `{"commonMiddlewares": [{"name": "tc-basic-secure-headers"}]}` |

Example

```yaml
global:
  traefik:
    commonMiddlewares:
      -
        name: "tc-basic-secure-headers"
```

---

## Child Pages

- [Fallbackdefaults](fallbackDefaults.md) - Configuration for `global.fallbackDefaults`.

---

## Full Examples

```yaml
global:
  labels:
    key: value
  annotations:
    key: value
  namespace: ""
  minNodePort: 9000
  stopAll: false
  metallb:
    addServiceAnnotations: true
  traefik:
    addServiceAnnotations: true
    commonMiddlewares:
      - name: tc-basic-secure-headers
```
