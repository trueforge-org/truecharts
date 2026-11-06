## Full Examples

### Webhook with all common options

```yaml
webhook:
  validating:
    enabled: true
    type: validating
    webhooks:
      - name: deployments.example.com
        failurePolicy: Fail
        matchPolicy: Equivalent
        sideEffects: None
        timeoutSeconds: 15
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          service:
            name: policy-webhook
            namespace: policy-system
            path: /validate-deployments
            port: 8443
        rules:
          - scope: Namespaced
            apiGroups:
              - apps
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - deployments
              - statefulsets
              - daemonsets
```

### Two webhooks, one with a URL

```yaml
webhook:
  validating:
    enabled: true
    type: validating
    webhooks:
      - name: secrets.example.com
        failurePolicy: Fail
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: policy-webhook
            namespace: policy-system
            path: /validate-secrets
            port: 443
        rules:
          - scope: Namespaced
            apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - secrets
      - name: external.example.com
        failurePolicy: Ignore
        sideEffects: None
        timeoutSeconds: 5
        admissionReviewVersions:
          - v1
        clientConfig:
          url: https://webhook.example.com/validate
        rules:
          - scope: "*"
            apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - DELETE
            resources:
              - namespaces
```
