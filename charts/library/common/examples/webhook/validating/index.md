## Full Examples

### Validating webhook served by a service

```yaml
webhook:
  validating:
    enabled: true
    type: validating
    webhooks:
      - name: policy.example.com
        failurePolicy: Fail
        sideEffects: None
        timeoutSeconds: 10
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: policy-webhook
            namespace: policy-system
            path: /validate
            port: 443
        rules:
          - apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - pods
```

### Validating webhook limited by selectors

```yaml
webhook:
  validating:
    enabled: true
    type: validating
    webhooks:
      - name: ingress.example.com
        failurePolicy: Ignore
        matchPolicy: Equivalent
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          url: https://webhook.example.com/validate
        namespaceSelector:
          matchLabels:
            policy: enforced
        objectSelector:
          matchExpressions:
            - key: skip-validation
              operator: DoesNotExist
        rules:
          - apiGroups:
              - networking.k8s.io
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - ingresses
```
