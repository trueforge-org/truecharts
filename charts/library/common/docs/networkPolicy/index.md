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
- [ingress](/truecharts-common/networkPolicy/ingress)

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
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.nameOverride`

Name appended to the chart fullname. Defaults to the name of the policy.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.nameOverride` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

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

## `$name.podSelector`

Custom Kubernetes label selector for the pods to which this policy applies.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.podSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchLabels`

Match pods with all of these labels.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.podSelector.matchLabels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchLabels.$name`

Value of the label.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.podSelector.matchLabels.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchExpressions`

Match pods using label expressions.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.podSelector.matchExpressions` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchExpressions[]`

A label expression.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.podSelector.matchExpressions[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchExpressions[].key`

Label key the expression applies to.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.podSelector.matchExpressions[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.podSelector.matchExpressions[].operator`

Operator: `In`, `NotIn`, `Exists` or `DoesNotExist`.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.podSelector.matchExpressions[].operator` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"In"`, `"NotIn"`, `"Exists"`, `"DoesNotExist"` |

---

## `$name.podSelector.matchExpressions[].values`

Values of the label.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.podSelector.matchExpressions[].values` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.targetSelector`

Name of a workload of this chart the policy applies to. Defaults to the pods of the primary workload when `podSelector` is not set.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.targetSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.policyType`

Type of the policy: `ingress`, `egress` or `ingress-egress`. When omitted, no `policyTypes` are set.

| Field | Value |
| --- | --- |
| Key | `networkPolicy.$name.policyType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"ingress"`, `"egress"`, `"ingress-egress"` |

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

## Full Examples

### Allow ingress from pods with a label

Allow traffic from pods labelled `role: frontend` to the primary pods on port 8080:

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

### Allow egress to a database

Allow the primary pods to reach pods labelled `role: database` on port 5432, and DNS lookups:

```yaml
networkPolicy:
  allow-database:
    enabled: true
    policyType: egress
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
                kubernetes.io/metadata.name: kube-system
        ports:
          - protocol: UDP
            port: 53
```

### Allow a namespace

Allow ingress from all pods in namespaces labelled `environment: production`:

```yaml
networkPolicy:
  allow-production:
    enabled: true
    ingress:
      - from:
          - namespaceSelector:
              matchLabels:
                environment: production
```

### Allow external IPs except the metadata service

Allow egress to any IPv4 address, except the cloud metadata address:

```yaml
networkPolicy:
  allow-external:
    enabled: true
    policyType: egress
    egress:
      - to:
          - ipBlock:
              cidr: 0.0.0.0/0
              except:
                - 169.254.169.254/32
```

### Target a workload and match expressions

Apply the policy to the pods of the `worker` workload, and allow ingress from pods that are not `experimental`:

```yaml
networkPolicy:
  worker-policy:
    enabled: true
    targetSelector: worker
    policyType: ingress
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
            port: 9000
            endPort: 9010
```

### Deny all traffic

A policy without rules selects the pods and allows nothing in the chosen direction:

```yaml
networkPolicy:
  default-deny:
    enabled: true
    nameOverride: deny-all
    policyType: ingress-egress
```
