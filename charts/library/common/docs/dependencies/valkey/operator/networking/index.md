---
title: Networking
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator/networking#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator.networking`

---

## `dependencies.valkey.operator.networking`

No description provided.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.valkey.operator.networking` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

---

### `dependencies.valkey.operator.networking.clusterDomain`

Domain of the Kubernetes cluster. The operator uses `cluster.local` when unset.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.networking.clusterDomain` |
| Type       | `string`                                                |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | `""`                                                    |

Example

```yaml
dependencies:
  valkey:
    operator:
      networking:
        clusterDomain: ""
```

---

### `dependencies.valkey.operator.networking.discovery`

Discovery (in-cluster announce) of the nodes.

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.valkey.operator.networking.discovery` |
| Type       | `map`                                               |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | `{"preferredEndpointType": ""}`                     |

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

## Child Pages

- [Discovery](discovery.md)

---
