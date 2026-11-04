---
title: Policy
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/networkpolicy/policy#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy.policy`

---

## `networkpolicy.policy`

Configuration for a NetworkPolicy.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `networkpolicy.policy` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `networkpolicy.policy.annotations`

Additional annotations for this NetworkPolicy.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.policy.annotations` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `{}`                               |

Example

```yaml
networkpolicy:
  policy:
    annotations:
      {}
```

---

### `networkpolicy.policy.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `networkpolicy.policy.annotationsList` |
| Type       | `list of map`                          |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `networkpolicy.policy.clusterwide`

Cilium only. Create a CiliumClusterwideNetworkPolicy instead of a CiliumNetworkPolicy, chart based selectors are pinned to the namespace of the chart

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.policy.clusterwide` |
| Type       | `boolean`                          |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `false`                            |

Example

```yaml
networkpolicy:
  policy:
    clusterwide: false
```

---

### `networkpolicy.policy.description`

Cilium only. Free form description of the policy, supports Helm `tpl`

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.policy.description` |
| Type       | `string`                           |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `""`                               |

Example

```yaml
networkpolicy:
  policy:
    description: ""
```

---

### `networkpolicy.policy.egress`

Egress rules.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.policy.egress` |
| Type       | `list of unknown`             |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `[]`                          |

Example

```yaml
networkpolicy:
  policy:
    egress:
      []
```

---

### `networkpolicy.policy.egressDeny`

Cilium only. List of egress deny rules, these take precedence over allow rules, supports Helm `tpl`

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.policy.egressDeny` |
| Type       | `list of map`                     |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `[]`                              |

Example

```yaml
networkpolicy:
  policy:
    egressDeny:
      []
```

---

### `networkpolicy.policy.enableDefaultDeny`

Cilium only. Control whether the policy puts the selected endpoints in default deny mode

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `networkpolicy.policy.enableDefaultDeny` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

---

### `networkpolicy.policy.enabled`

Create this NetworkPolicy.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `networkpolicy.policy.enabled` |
| Type       | `boolean, string`              |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `false`                        |

Example

```yaml
networkpolicy:
  policy:
    enabled: false
```

---

### `networkpolicy.policy.endpointSelector`

Cilium only. Select the endpoints to which this policy applies, supports Helm `tpl`

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `networkpolicy.policy.endpointSelector` |
| Type       | `map, string`                           |
| Required   | ❌                                      |
| Helm `tpl` | ✅                                      |
| Default    | unset                                   |

---

### `networkpolicy.policy.expandObjectName`

Expand the object name.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `networkpolicy.policy.expandObjectName` |
| Type       | `boolean, string`                       |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `false`                                 |

Example

```yaml
networkpolicy:
  policy:
    expandObjectName: false
```

---

### `networkpolicy.policy.ingress`

Ingress rules.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `networkpolicy.policy.ingress` |
| Type       | `list of unknown`              |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `[]`                           |

Example

```yaml
networkpolicy:
  policy:
    ingress:
      []
```

---

### `networkpolicy.policy.ingressDeny`

Cilium only. List of ingress deny rules, these take precedence over allow rules, supports Helm `tpl`

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.policy.ingressDeny` |
| Type       | `list of map`                      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `[]`                               |

Example

```yaml
networkpolicy:
  policy:
    ingressDeny:
      []
```

---

### `networkpolicy.policy.labels`

Additional labels for this NetworkPolicy.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.policy.labels` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `{}`                          |

Example

```yaml
networkpolicy:
  policy:
    labels:
      {}
```

---

### `networkpolicy.policy.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.policy.labelsList` |
| Type       | `list of map`                     |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `networkpolicy.policy.namespace`

Namespace for this NetworkPolicy.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `networkpolicy.policy.namespace` |
| Type       | `string`                         |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `""`                             |

See [Namespace](../special/namespaces.md) for full configuration.

Example

```yaml
networkpolicy:
  policy:
    namespace: ""
```

---

### `networkpolicy.policy.nodeSelector`

Cilium only. Host policy, select the nodes to which this policy applies instead of pods. Requires `clusterwide: true`, supports Helm `tpl`

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `networkpolicy.policy.nodeSelector` |
| Type       | `map, string`                       |
| Required   | ❌                                  |
| Helm `tpl` | ✅                                  |
| Default    | unset                               |

---

### `networkpolicy.policy.podSelector`

Custom Kubernetes label selector for pods to which this policy applies.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.policy.podSelector` |
| Type       | `map, string`                      |
| Required   | ❌                                 |
| Helm `tpl` | ✅                                 |
| Default    | unset                              |

See [Podselector](podSelector.md) for full configuration.

---

### `networkpolicy.policy.policyTypes`

Policy types. When omitted, types are inferred from the configured rules.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.policy.policyTypes` |
| Type       | `list of string`                   |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `networkpolicy.policy.primary`

Mark this as the primary NetworkPolicy.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `networkpolicy.policy.primary` |
| Type       | `boolean, string`              |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `false`                        |

Example

```yaml
networkpolicy:
  policy:
    primary: false
```

---

### `networkpolicy.policy.targetAllPods`

Target all pods in the namespace.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `networkpolicy.policy.targetAllPods` |
| Type       | `boolean`                            |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | `false`                              |

Example

```yaml
networkpolicy:
  policy:
    targetAllPods: false
```

---

### `networkpolicy.policy.targetSelector`

Target one or more workloads from this chart by name.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `networkpolicy.policy.targetSelector` |
| Type       | `string, list`                        |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `""`                                  |

Example

```yaml
networkpolicy:
  policy:
    targetSelector: ""
```

---

### `networkpolicy.policy.targetSelectorRegex`

Target workloads from this chart whose names match one or more regular expressions

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `networkpolicy.policy.targetSelectorRegex` |
| Type       | `string, list`                             |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `""`                                       |

Example

```yaml
networkpolicy:
  policy:
    targetSelectorRegex: ""
```

---

### `networkpolicy.policy.type`

Type of policy to create. `kubernetes` creates a NetworkPolicy, `cilium` creates a CiliumNetworkPolicy and requires the Cilium CRDs

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `networkpolicy.policy.type` |
| Type       | `string`                    |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `"kubernetes"`              |
| Enum       | `kubernetes`, `cilium`      |

Example

```yaml
networkpolicy:
  policy:
    type: kubernetes
```

---
