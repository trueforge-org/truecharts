---
title: Network Policy
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/networkpolicy#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkpolicy`

## Naming scheme

- `$FullName-$networkpolicyName` (release-name-chart-name-networkpolicyName)

:::tip

- Replace references to `$name` with the actual name you want to use.
- NetworkPolicy resources control pod-to-pod, pod-to-external, and external-to-pod network traffic.

:::

---

## `networkpolicy`

Create Network Policy objects

|            |                  |
| ---------- | ---------------- |
| Key        | `networkpolicy`  |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | `{}`             |

Example

```yaml
networkpolicy: {}
```

---

### `$name`

Define Network Policy

|            |                        |
| ---------- | ---------------------- |
| Key        | `networkpolicy.$name`  |
| Type       | `map`                  |
| Required   | ✅                     |
| Helm `tpl` | ❌                     |
| Default    | `{}`                   |

Example

```yaml
networkpolicy:
  policy-name: {}
```

---

#### `enabled`

Enables or Disables the Network Policy

|            |                                |
| ---------- | ------------------------------ |
| Key        | `networkpolicy.$name.enabled`  |
| Type       | `bool`                         |
| Required   | ✅                             |
| Helm `tpl` | ✅                             |
| Default    | `false`                        |

Example

```yaml
networkpolicy:
  policy-name:
    enabled: true
```

---

#### `primary`

Mark as primary Network Policy

|            |                                |
| ---------- | ------------------------------ |
| Key        | `networkpolicy.$name.primary`  |
| Type       | `bool`                         |
| Required   | ❌                             |
| Helm `tpl` | ✅                             |
| Default    | `false`                        |

Example

```yaml
networkpolicy:
  policy-name:
    primary: true
```

---

#### `expandObjectName`

Expand the object name

|            |                                         |
| ---------- | --------------------------------------- |
| Key        | `networkpolicy.$name.expandObjectName`  |
| Type       | `bool`                                  |
| Required   | ❌                                      |
| Helm `tpl` | ✅                                      |
| Default    | `false`                                 |

Example

```yaml
networkpolicy:
  policy-name:
    expandObjectName: false
```

---

#### `namespace`

Define the namespace for this object

|            |                                  |
| ---------- | -------------------------------- |
| Key        | `networkpolicy.$name.namespace`  |
| Type       | `string`                         |
| Required   | ❌                               |
| Helm `tpl` | ✅                               |
| Default    | `""`                             |

Example

```yaml
networkpolicy:
  policy-name:
    namespace: some-namespace
```

---

#### `labels`

Additional labels for Network Policy

|            |                               |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.$name.labels`  |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ✅ (On value only)            |
| Default    | `{}`                          |

Example

```yaml
networkpolicy:
  policy-name:
    labels:
      key: value
```

---

#### `annotations`

Additional annotations for Network Policy

|            |                                    |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.$name.annotations`  |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ✅ (On value only)                 |
| Default    | `{}`                               |

Example

```yaml
networkpolicy:
  policy-name:
    annotations:
      key: value
```

---

## Pod Selection

Network policies apply to pods based on label selectors. You can choose from several options:

---

#### `podSelector`

Select pods to which this network policy applies

:::note

- An empty `podSelector` (`{}`) matches all pods in the namespace.
- Both `matchLabels` and `matchExpressions` can be used together (AND logic).
- Cannot be used together with `targetSelector` or `targetAllPods`.

:::

|            |                                   |
| ---------- | --------------------------------- |
| Key        | `networkpolicy.$name.podSelector` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ✅                                |
| Default    | See below                         |

##### Default Behavior

If none of `podSelector`, `targetSelector`, or `targetAllPods` is specified, the policy will target all pods in the chart (using chart selector labels).

##### `matchLabels`

Match pods by labels (AND logic between labels)

|            |                                                |
| ---------- | ---------------------------------------------- |
| Key        | `networkpolicy.$name.podSelector.matchLabels`  |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ✅                                             |
| Default    | `{}`                                           |

Example

```yaml
networkpolicy:
  policy-name:
    podSelector:
      matchLabels:
        app: my-app
        tier: backend
```

##### `matchExpressions`

Match pods by label expressions (more advanced matching)

|            |                                                     |
| ---------- | --------------------------------------------------- |
| Key        | `networkpolicy.$name.podSelector.matchExpressions`  |
| Type       | `list`                                              |
| Required   | ❌                                                  |
| Helm `tpl` | ✅                                                  |
| Default    | `[]`                                                |

Each expression has:
- `key` (string): Label key to match
- `operator` (string): One of `In`, `NotIn`, `Exists`, `DoesNotExist`
- `values` (list): List of values (required for `In` and `NotIn`)

Example

```yaml
networkpolicy:
  policy-name:
    podSelector:
      matchExpressions:
        - key: environment
          operator: In
          values:
            - production
            - staging
        - key: app
          operator: Exists
```

---

#### `targetSelector`

Target a specific pod from this chart by name

:::note

This is a TrueCharts convenience option that automatically builds the correct `podSelector` for a pod in the chart.

:::

|            |                                      |
| ---------- | ------------------------------------ |
| Key        | `networkpolicy.$name.targetSelector` |
| Type       | `string`                             |
| Required   | ❌                                   |
| Helm `tpl` | ✅                                   |
| Default    | `""`                                 |

Example

```yaml
networkpolicy:
  policy-name:
    targetSelector: main-pod
```

---

#### `targetAllPods`

Target all pods in the namespace

:::note

This sets `podSelector: {}` which matches all pods in the namespace, not just pods in this chart.

:::

|            |                                    |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.$name.targetAllPods` |
| Type       | `bool`                             |
| Required   | ❌                                 |
| Helm `tpl` | ✅                                 |
| Default    | `false`                            |

Example

```yaml
networkpolicy:
  policy-name:
    targetAllPods: true
```

---

## Policy Configuration

---

#### `policyTypes`

List of policy types that this NetworkPolicy applies to

|            |                                    |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.$name.policyTypes`  |
| Type       | `list`                             |
| Required   | ❌                                 |
| Helm `tpl` | ✅                                 |
| Default    | Auto-detected                      |

Valid Values:

- `Ingress` - Policy applies to incoming traffic
- `Egress` - Policy applies to outgoing traffic

:::note

If not specified, `policyTypes` is automatically determined based on which rules are defined:
- If only `ingress` is defined: `["Ingress"]`
- If only `egress` is defined: `["Egress"]`
- If both are defined: `["Ingress", "Egress"]`

:::

Example

```yaml
networkpolicy:
  policy-name:
    policyTypes:
      - Ingress
      - Egress
```

---

## Ingress Rules

#### `ingress`

List of ingress rules (incoming traffic rules)

:::note

- Each rule allows traffic that matches ALL conditions (AND logic).
- Multiple rules create OR logic (traffic matching ANY rule is allowed).
- An empty `from` list (`from: []`) allows all sources on the specified ports.
- Omitting the `ingress` key entirely means no ingress traffic is allowed.

:::

|            |                               |
| ---------- | ----------------------------- |
| Key        | `networkpolicy.$name.ingress` |
| Type       | `list`                        |
| Required   | ❌                            |
| Helm `tpl` | ✅                            |
| Default    | `[]`                          |

Example

```yaml
networkpolicy:
  policy-name:
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
        ports:
          - protocol: TCP
            port: 8080
```

---

##### `from`

List of sources from which traffic is allowed

|            |                                      |
| ---------- | ------------------------------------ |
| Key        | `networkpolicy.$name.ingress[].from` |
| Type       | `list`                               |
| Required   | ❌                                   |
| Helm `tpl` | ✅                                   |
| Default    | `[]`                                 |

Each `from` entry can contain one or more of:
- `podSelector` - Select pods within namespaces
- `namespaceSelector` - Select entire namespaces
- `ipBlock` - Select IP CIDR ranges

:::tip Combining Selectors

When both `podSelector` and `namespaceSelector` are specified in the same entry, they are combined with AND logic (pods matching the pod selector in namespaces matching the namespace selector).

To create OR logic, use separate list entries.

:::

###### Pod Selector

Select pods that are allowed as sources

```yaml
networkpolicy:
  policy-name:
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
              matchExpressions:
                - key: tier
                  operator: In
                  values:
                    - web
```

###### Namespace Selector

Select namespaces from which all pods are allowed

```yaml
networkpolicy:
  policy-name:
    ingress:
      - from:
          - namespaceSelector:
              matchLabels:
                environment: production
```

###### Combined Pod and Namespace Selector

Allow pods matching labels in namespaces matching labels

```yaml
networkpolicy:
  policy-name:
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
            namespaceSelector:
              matchLabels:
                environment: production
```

###### IP Block

Select IP CIDR ranges

|            |                                                  |
| ---------- | ------------------------------------------------ |
| Key        | `networkpolicy.$name.ingress[].from[].ipBlock`   |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ✅                                               |
| Default    | `{}`                                             |

**`cidr`** - CIDR block (e.g., `192.168.0.0/16`)

|            |                                                       |
| ---------- | ----------------------------------------------------- |
| Key        | `networkpolicy.$name.ingress[].from[].ipBlock.cidr`   |
| Type       | `string`                                              |
| Required   | ✅ (if ipBlock is used)                               |
| Helm `tpl` | ✅                                                    |
| Default    | `""`                                                  |

**`except`** - List of CIDR blocks to exclude from the range

|            |                                                         |
| ---------- | ------------------------------------------------------- |
| Key        | `networkpolicy.$name.ingress[].from[].ipBlock.except`   |
| Type       | `list`                                                  |
| Required   | ❌                                                      |
| Helm `tpl` | ✅                                                      |
| Default    | `[]`                                                    |

Example

```yaml
networkpolicy:
  policy-name:
    ingress:
      - from:
          - ipBlock:
              cidr: 10.0.0.0/8
              except:
                - 10.1.0.0/16
                - 10.2.0.0/16
```

---

##### `ports`

List of ports which should be made accessible

|            |                                       |
| ---------- | ------------------------------------- |
| Key        | `networkpolicy.$name.ingress[].ports` |
| Type       | `list`                                |
| Required   | ❌                                    |
| Helm `tpl` | ✅                                    |
| Default    | `[]`                                  |

:::note

If omitted, all ports are allowed for traffic matching the `from` conditions.

:::

Each port entry can contain:
- `protocol` - Protocol (TCP, UDP, or SCTP)
- `port` - Port number (integer) or port name (string)
- `endPort` - End port for port range (Kubernetes 1.25+)

Example

```yaml
networkpolicy:
  policy-name:
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
        ports:
          - protocol: TCP
            port: 8080
          - protocol: TCP
            port: 8443
          - protocol: UDP
            port: 53
```

###### Port Ranges (Kubernetes 1.25+)

```yaml
networkpolicy:
  policy-name:
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

###### Named Ports

```yaml
networkpolicy:
  policy-name:
    ingress:
      - from:
          - podSelector:
              matchLabels:
                role: frontend
        ports:
          - protocol: TCP
            port: http
```

---

## Egress Rules

#### `egress`

List of egress rules (outgoing traffic rules)

:::note

- Each rule allows traffic that matches ALL conditions (AND logic).
- Multiple rules create OR logic (traffic matching ANY rule is allowed).
- An empty `to` list (`to: []`) allows all destinations on the specified ports.
- Omitting the `egress` key entirely means no egress traffic is allowed.

:::

|            |                              |
| ---------- | ---------------------------- |
| Key        | `networkpolicy.$name.egress` |
| Type       | `list`                       |
| Required   | ❌                           |
| Helm `tpl` | ✅                           |
| Default    | `[]`                         |

Example

```yaml
networkpolicy:
  policy-name:
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
        ports:
          - protocol: TCP
            port: 5432
```

---

##### `to`

List of destinations to which traffic is allowed

|            |                                    |
| ---------- | ---------------------------------- |
| Key        | `networkpolicy.$name.egress[].to`  |
| Type       | `list`                             |
| Required   | ❌                                 |
| Helm `tpl` | ✅                                 |
| Default    | `[]`                               |

Each `to` entry can contain one or more of:
- `podSelector` - Select destination pods
- `namespaceSelector` - Select destination namespaces
- `ipBlock` - Select destination IP CIDR ranges

:::tip Combining Selectors

When both `podSelector` and `namespaceSelector` are specified in the same entry, they are combined with AND logic.

To create OR logic, use separate list entries.

:::

###### Pod Selector

Select pods that are allowed as destinations

```yaml
networkpolicy:
  policy-name:
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
```

###### Namespace Selector

Select namespaces to which all pods are allowed as destinations

```yaml
networkpolicy:
  policy-name:
    egress:
      - to:
          - namespaceSelector:
              matchLabels:
                name: kube-system
```

###### IP Block

Select IP CIDR ranges as destinations

```yaml
networkpolicy:
  policy-name:
    egress:
      - to:
          - ipBlock:
              cidr: 0.0.0.0/0
              except:
                - 169.254.169.254/32
```

---

##### `ports`

List of destination ports for egress traffic

|            |                                      |
| ---------- | ------------------------------------ |
| Key        | `networkpolicy.$name.egress[].ports` |
| Type       | `list`                               |
| Required   | ❌                                   |
| Helm `tpl` | ✅                                   |
| Default    | `[]`                                 |

:::note

If omitted, all ports are allowed for traffic matching the `to` conditions.

:::

Each port entry can contain:
- `protocol` - Protocol (TCP, UDP, or SCTP)
- `port` - Port number (integer) or port name (string)
- `endPort` - End port for port range (Kubernetes 1.25+)

Example

```yaml
networkpolicy:
  policy-name:
    egress:
      - to:
          - podSelector:
              matchLabels:
                role: database
        ports:
          - protocol: TCP
            port: 5432
          - protocol: TCP
            port: 3306
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
