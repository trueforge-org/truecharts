## Full Examples

### Mutating webhook served by a service

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
    webhooks:
      - name: sidecar-injector.example.com
        failurePolicy: Ignore
        sideEffects: None
        timeoutSeconds: 10
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: sidecar-injector
            namespace: injector-system
            path: /mutate
            port: 443
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

### Mutating webhook served by an external URL

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
    webhooks:
      - name: defaults.example.com
        failurePolicy: Fail
        sideEffects: None
        reinvocationPolicy: IfNeeded
        admissionReviewVersions:
          - v1
        clientConfig:
          url: https://webhook.example.com/mutate
        rules:
          - apiGroups:
              - apps
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - deployments
```
