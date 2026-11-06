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
