---
title: Discovery
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/networking/discovery#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.networking.discovery`

---

## `dependencies.valkey.operator.networking.discovery`

No description provided.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.valkey.operator.networking.discovery` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

---

### `dependencies.valkey.operator.networking.discovery.preferredEndpointType`

How the nodes announce themselves. The operator uses `IP` when unset, `Hostname` requires `workloadType: StatefulSet`.

| Field      | Value                                                                     |
| ---------- | ------------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.networking.discovery.preferredEndpointType` |
| Type       | `string`                                                                  |
| Required   | ❌                                                                        |
| Helm `tpl` | ❌                                                                        |
| Default    | `""`                                                                      |
| Enum       | ``, `IP`, `Hostname`                                                      |

Example

```yaml
dependencies:
  valkey:
    operator:
      networking:
        discovery:
          preferredEndpointType: ""
```

---
