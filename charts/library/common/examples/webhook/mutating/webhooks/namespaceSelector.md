## Full Examples

### Only namespaces with a label

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
    webhooks:
      - name: inject.example.com
        failurePolicy: Ignore
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: inject-webhook
            namespace: inject-system
            path: /mutate
            port: 443
        namespaceSelector:
          matchLabels:
            injection: enabled
        rules:
          - apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
            resources:
              - pods
```

### Skip system namespaces with matchExpressions

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
    webhooks:
      - name: inject.example.com
        failurePolicy: Ignore
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: inject-webhook
            namespace: inject-system
            path: /mutate
            port: 443
        namespaceSelector:
          matchExpressions:
            - key: kubernetes.io/metadata.name
              operator: NotIn
              values:
                - kube-system
                - kube-public
                - inject-system
        rules:
          - apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
            resources:
              - pods
```
