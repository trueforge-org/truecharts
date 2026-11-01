---
title: Networkpolicy
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/networkpolicy#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy`

---

## `networkpolicy`

Create NetworkPolicy or CiliumNetworkPolicy objects

| Field      | Value           |
| ---------- | --------------- |
| Key        | `networkpolicy` |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | `{}`            |

Example

```yaml
networkpolicy:
  {}
```

---

### `networkpolicy.$name.annotations`

Additional annotations for Network Policy

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.$name.annotations` |
| Type       | `map, string`                     |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `{}`                              |

Example

```yaml
networkpolicy:
  $name:
    annotations:
      {}
```

---

### `networkpolicy.$name.clusterwide`

Cilium only. Create a CiliumClusterwideNetworkPolicy instead of a CiliumNetworkPolicy, chart based selectors are pinned to the namespace of the chart

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.$name.clusterwide` |
| Type       | `boolean, string`                 |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `false`                           |

Example

```yaml
networkpolicy:
  $name:
    clusterwide: false
```

---

### `networkpolicy.$name.description`

Cilium only. Free form description of the policy, supports Helm `tpl`

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.$name.description` |
| Type       | `string`                          |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `""`                              |

Example

```yaml
networkpolicy:
  $name:
    description: ""
```

---

### `networkpolicy.$name.egress`

List of egress rules

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `networkpolicy.$name.egress` |
| Type       | `list, string`               |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `[]`                         |

Example

```yaml
networkpolicy:
  $name:
    egress:
      []
```

---

### `networkpolicy.$name.egressDeny`

Cilium only. List of egress deny rules, these take precedence over allow rules, supports Helm `tpl`

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `networkpolicy.$name.egressDeny` |
| Type       | `list, string`                   |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `[]`                             |

Example

```yaml
networkpolicy:
  $name:
    egressDeny:
      []
```

---

### `networkpolicy.$name.enableDefaultDeny`

Cilium only. Control whether the policy puts the selected endpoints in default deny mode

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `networkpolicy.$name.enableDefaultDeny` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `networkpolicy.$name.enabled`

Create Network Policy objects

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.$name.enabled` |
| Type       | `boolean, string`             |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `false`                       |

Example

```yaml
networkpolicy:
  $name:
    enabled: false
```

---

### `networkpolicy.$name.endpointSelector`

Cilium only. Select the endpoints to which this policy applies, supports Helm `tpl`

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `networkpolicy.$name.endpointSelector` |
| Type       | `map, string`                          |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `networkpolicy.$name.expandObjectName`

Expand the object name

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `networkpolicy.$name.expandObjectName` |
| Type       | `boolean, string`                      |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `false`                                |

Example

```yaml
networkpolicy:
  $name:
    expandObjectName: false
```

---

### `networkpolicy.$name.ingress`

List of ingress rules

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.$name.ingress` |
| Type       | `list, string`                |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `[]`                          |

Example

```yaml
networkpolicy:
  $name:
    ingress:
      []
```

---

### `networkpolicy.$name.ingressDeny`

Cilium only. List of ingress deny rules, these take precedence over allow rules, supports Helm `tpl`

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.$name.ingressDeny` |
| Type       | `list, string`                    |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | `[]`                              |

Example

```yaml
networkpolicy:
  $name:
    ingressDeny:
      []
```

---

### `networkpolicy.$name.labels`

Additional labels for Network Policy

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `networkpolicy.$name.labels` |
| Type       | `map, string`                |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `{}`                         |

Example

```yaml
networkpolicy:
  $name:
    labels:
      {}
```

---

### `networkpolicy.$name.namespace`

Define the namespace for this object

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `networkpolicy.$name.namespace` |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `""`                            |

Example

```yaml
networkpolicy:
  $name:
    namespace: ""
```

---

### `networkpolicy.$name.nodeSelector`

Cilium only. Host policy, select the nodes to which this policy applies instead of pods, supports Helm `tpl`

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.$name.nodeSelector` |
| Type       | `map, string`                      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `networkpolicy.$name.podSelector`

Select pods to which this network policy applies

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.$name.podSelector` |
| Type       | `map, string`                     |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |
| Enum       | `key`, `operator`, `values`       |

---

### `networkpolicy.$name.policyTypes`

List of policy types (Ingress, Egress)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.$name.policyTypes` |
| Type       | `list, string`                    |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |
| Enum       | `Ingress`, `Egress`               |

---

### `networkpolicy.$name.primary`

Mark as primary Network Policy

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.$name.primary` |
| Type       | `boolean, string`             |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `false`                       |

Example

```yaml
networkpolicy:
  $name:
    primary: false
```

---

### `networkpolicy.$name.targetAllPods`

Target all pods in the namespace

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `networkpolicy.$name.targetAllPods` |
| Type       | `boolean, string`                   |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `false`                             |

Example

```yaml
networkpolicy:
  $name:
    targetAllPods: false
```

---

### `networkpolicy.$name.targetSelector`

Target one or more workloads from this chart by name

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `networkpolicy.$name.targetSelector` |
| Type       | `string, list`                       |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | `""`                                 |

Example

```yaml
networkpolicy:
  $name:
    targetSelector: ""
```

---

### `networkpolicy.$name.targetSelectorRegex`

Target workloads from this chart whose names match one or more regular expressions

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `networkpolicy.$name.targetSelectorRegex` |
| Type       | `string, list`                            |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | `""`                                      |

Example

```yaml
networkpolicy:
  $name:
    targetSelectorRegex: ""
```

---

### `networkpolicy.$name.type`

Type of policy to create. `kubernetes` creates a NetworkPolicy, `cilium` creates a CiliumNetworkPolicy and requires the Cilium CRDs

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `networkpolicy.$name.type` |
| Type       | `string`                   |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `"kubernetes"`             |
| Enum       | `kubernetes`, `cilium`     |

Example

```yaml
networkpolicy:
  $name:
    type: kubernetes
```

---

## Full Examples

### Basic Ingress Policy

Allow traffic from pods with label `role: frontend` to port 8080:

```yaml
networkpolicy:
  allow-frontend:
    enabled: true
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
        ports:
          - protocol: TCP
            port: 8080
```

### Basic Egress Policy

Allow traffic to pods with label `role: database` on port 5432:

```yaml
networkpolicy:
  allow-database:
    enabled: true
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
        ports:
          - protocol: TCP
            port: 5432
```

### Allow Traffic from Specific Namespace

Allow ingress from all pods in the `production` namespace:

```yaml
networkpolicy:
  allow-production-namespace:
    enabled: true
    ingress:
      - from:
          - namespaceSelector:
              matchLabels:
                environment: production
```

### Allow Traffic to External IPs

Allow egress to external IPs (except metadata service):

```yaml
networkpolicy:
  allow-external:
    enabled: true
    egress:
      - to:
          - ipBlock:
              cidr: 0.0.0.0/0
              except:
                - 169.254.169.254/32
```

### Combined Ingress and Egress

Allow specific ingress and egress traffic:

```yaml
networkpolicy:
  api-policy:
    enabled: true
    policyTypes:
      - Ingress
      - Egress
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
        ports:
          - protocol: TCP
            port: 8080
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
        ports:
          - protocol: TCP
            port: 5432
      - to:
          - namespaceSelector:
              matchLabels:
                name: kube-system
        ports:
          - protocol: UDP
            port: 53
```

### Allow Traffic from Pods in Specific Namespace

Allow ingress from pods with label `app: client` in namespace with label `team: platform`:

```yaml
networkpolicy:
  allow-platform-clients:
    enabled: true
    ingress:
      - from:
          - podSelector:
              matchLabels:
                app: client
            namespaceSelector:
              matchLabels:
                team: platform
        ports:
          - protocol: TCP
            port: 8080
```

### Multiple Rules (OR Logic)

Allow ingress from frontend OR from monitoring:

```yaml
networkpolicy:
  allow-multiple-sources:
    enabled: true
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
        ports:
          - protocol: TCP
            port: 8080
      - from:
          - namespaceSelector:
              matchLabels:
                name: monitoring
        ports:
          - protocol: TCP
            port: 9090
```

### Using matchExpressions

Use advanced label matching:

```yaml
networkpolicy:
  advanced-matching:
    enabled: true
    podSelector:
      matchExpressions:
        - key: environment
          operator: In
          values:
            - production
            - staging
        - key: app
          operator: Exists
    ingress:
      - from:
          - podSelector:
              matchExpressions:
                - key: tier
                  operator: NotIn
                  values:
                    - experimental
        ports:
          - protocol: TCP
            port: 8080
```

### Default Deny All

Deny all ingress and egress traffic (useful as a baseline):

```yaml
networkpolicy:
  default-deny-all:
    enabled: true
    policyTypes:
      - Ingress
      - Egress
    # No ingress or egress rules defined = deny all
```

### Allow All from Same Namespace

Allow all traffic from pods in the same namespace:

```yaml
networkpolicy:
  allow-same-namespace:
    enabled: true
    ingress:
      - from:
          - podSelector: {}
```

### Port Range Example (Kubernetes 1.25+)

Allow traffic on a range of ports:

```yaml
networkpolicy:
  port-range:
    enabled: true
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: client
        ports:
          - protocol: TCP
            port: 8000
            endPort: 9000
```

### Complete Example

Comprehensive network policy with multiple features:

```yaml
networkpolicy:
  comprehensive-policy:
    enabled: true
    primary: true
    labels:
      team: platform
      environment: production
    annotations:
      description: "Comprehensive network policy example"
    targetSelector: main-pod
    policyTypes:
      - Ingress
      - Egress
    ingress:
      # Allow from frontend in production namespace
      - from:
          - podSelector:
              matchLabels:
                role: frontend
            namespaceSelector:
              matchLabels:
                environment: production
        ports:
          - protocol: TCP
            port: 8080
          - protocol: TCP
            port: 8443
      # Allow from monitoring namespace
      - from:
          - namespaceSelector:
              matchLabels:
                name: monitoring
        ports:
          - protocol: TCP
            port: 9090
    egress:
      # Allow to database
      - to:
          - podSelector:
              matchLabels:
                role: database
        ports:
          - protocol: TCP
            port: 5432
      # Allow DNS
      - to:
          - namespaceSelector:
              matchLabels:
                name: kube-system
        ports:
          - protocol: UDP
            port: 53
      # Allow external HTTPS
      - to:
          - ipBlock:
              cidr: 0.0.0.0/0
              except:
                - 169.254.169.254/32
                - 10.0.0.0/8
                - 192.168.0.0/16
        ports:
          - protocol: TCP
            port: 443
```

### Cilium Network Policy

Set `type: cilium` to create a `CiliumNetworkPolicy` instead of a `NetworkPolicy`. Requires the Cilium CRDs to be installed in the cluster.
Controller targeting with `targetSelector`, `targetSelectorRegex` and `targetAllPods` works the same as for Kubernetes policies.
Rules use the Cilium rule format:

```yaml
networkpolicy:
  allow-dns:
    enabled: true
    type: cilium
    description: Allow DNS lookups from the worker
    targetSelector: worker
    enableDefaultDeny:
      egress: false
    egress:
      - toEndpoints:
          - matchLabels:
              k8s:io.kubernetes.pod.namespace: kube-system
              k8s-app: kube-dns
        toPorts:
          - ports:
              - port: "53"
                protocol: UDP
            rules:
              dns:
                - matchPattern: "*"
```

### Cilium Deny Rules

`ingressDeny` and `egressDeny` take precedence over allow rules:

```yaml
networkpolicy:
  deny-metadata:
    enabled: true
    type: cilium
    targetSelectorRegex: "^worker"
    egressDeny:
      - toCIDR:
          - 169.254.169.254/32
    egress:
      - toEntities:
          - world
```

### Cilium Clusterwide Network Policy

Set `clusterwide: true` to create a `CiliumClusterwideNetworkPolicy`. Selectors that are derived from this chart are pinned to the namespace of the chart.
Use `nodeSelector` for host policies:

```yaml
networkpolicy:
  allow-ingress-from-gateway:
    enabled: true
    type: cilium
    clusterwide: true
    ingress:
      - fromEndpoints:
          - matchLabels:
              k8s:io.kubernetes.pod.namespace: gateway-system
  host-policy:
    enabled: true
    type: cilium
    clusterwide: true
    nodeSelector:
      matchLabels:
        node-role.kubernetes.io/control-plane: ""
    ingress:
      - fromEntities:
          - cluster
```
