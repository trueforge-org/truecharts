---
title: Network Policy
---

:::note

- See the [Full Examples](/truecharts-common/networkPolicy#full-examples) section for complete examples.

:::

## Appears in

- `.Values.networkPolicy`

---

## Child Pages

- [egress](/truecharts-common/networkPolicy/egress)
- [egressDeny](/truecharts-common/networkPolicy/egressDeny)
- [endpointSelector](/truecharts-common/networkPolicy/endpointSelector)
- [ingress](/truecharts-common/networkPolicy/ingress)
- [ingressDeny](/truecharts-common/networkPolicy/ingressDeny)
- [nodeSelector](/truecharts-common/networkPolicy/nodeSelector)
- [podSelector](/truecharts-common/networkPolicy/podSelector)

---

## `networkPolicy`

Network policies, keyed by name. See [networkPolicy](/truecharts-common/networkPolicy).

| Field | Value |
| --- | --- |
| Key | `networkPolicy` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

A network policy, keyed by name.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enabled`

Create this NetworkPolicy.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Mark this as the primary NetworkPolicy.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.primary` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.expandObjectName`

Prefix the name of the policy with the release fullname.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.expandObjectName` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.namespace`

Namespace of the policy. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.labels`

Additional labels for this NetworkPolicy.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.annotations`

Additional annotations for this NetworkPolicy.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.type`

Type of policy to create. `kubernetes` creates a NetworkPolicy, `cilium` creates a CiliumNetworkPolicy and requires the Cilium CRDs

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `"kubernetes"` |
| Allowed values | `"kubernetes"`, `"cilium"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.clusterwide`

Cilium only. Create a CiliumClusterwideNetworkPolicy instead of a CiliumNetworkPolicy, chart based selectors are pinned to the namespace of the chart

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.clusterwide` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.description`

Cilium only. Free form description of the policy, supports Helm `tpl`

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.description` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.podSelector`

Custom Kubernetes label selector for pods to which this policy applies.

See [podSelector](/truecharts-common/networkPolicy/podSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.podSelector` |
| Type | `map or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Pattern | `^\{\{.*\}\}$` |

---

## `$name.targetSelector`

Target one or more workloads from this chart by name.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.targetSelector` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.targetSelectorRegex`

Target workloads from this chart whose names match one or more regular expressions

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.targetSelectorRegex` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.targetAllPods`

Target all pods in the namespace.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.targetAllPods` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.endpointSelector`

Cilium only. Select the endpoints to which this policy applies, supports Helm `tpl`

See [endpointSelector](/truecharts-common/networkPolicy/endpointSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.endpointSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.nodeSelector`

Cilium only. Host policy, select the nodes to which this policy applies instead of pods. Requires `clusterwide: true`, supports Helm `tpl`

See [nodeSelector](/truecharts-common/networkPolicy/nodeSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nodeSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.policyTypes`

Policy types. When omitted, types are inferred from the configured rules.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.policyTypes` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Ingress"`, `"Egress"` |

---

## `$name.enableDefaultDeny`

Cilium only. Control whether the policy puts the selected endpoints in default deny mode

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.enableDefaultDeny` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enableDefaultDeny.ingress`

Put the selected endpoints in ingress default deny mode

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.enableDefaultDeny.ingress` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.enableDefaultDeny.egress`

Put the selected endpoints in egress default deny mode

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.enableDefaultDeny.egress` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingress`

Ingress rules.

See [ingress](/truecharts-common/networkPolicy/ingress) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.ingress` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.ingressDeny`

Cilium only. List of ingress deny rules, these take precedence over allow rules, supports Helm `tpl`

See [ingressDeny](/truecharts-common/networkPolicy/ingressDeny) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.ingressDeny` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.egress`

Egress rules.

See [egress](/truecharts-common/networkPolicy/egress) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egress` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.egressDeny`

Cilium only. List of egress deny rules, these take precedence over allow rules, supports Helm `tpl`

See [egressDeny](/truecharts-common/networkPolicy/egressDeny) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.egressDeny` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## Full Examples

### Basic Ingress Policy

Allow traffic from pods with label `role: frontend` to port 8080:

```yaml
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
networkPolicy:
  allow-same-namespace:
    enabled: true
    ingress:
      - from:
          - podSelector: {}
```

### Port Range Example (Kubernetes 1.25+)

Allow traffic on a range of ports:

```yaml
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
networkPolicy:
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
