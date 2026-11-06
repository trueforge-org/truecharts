## Full Examples

### Webhook with a service and several rules

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
    webhooks:
      - name: inject.example.com
        failurePolicy: Fail
        matchPolicy: Equivalent
        sideEffects: NoneOnDryRun
        reinvocationPolicy: Never
        timeoutSeconds: 15
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          service:
            name: inject-webhook
            namespace: inject-system
            path: /mutate
            port: 8443
        rules:
          - scope: Namespaced
            apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
            resources:
              - pods
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
```

### Two webhooks in one configuration

```yaml
webhook:
  mutating:
    enabled: true
    type: mutating
    webhooks:
      - name: labels.example.com
        failurePolicy: Ignore
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          url: https://webhook.example.com/labels
        rules:
          - apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
            resources:
              - configmaps
      - name: resources.example.com
        failurePolicy: Fail
        sideEffects: None
        timeoutSeconds: 5
        admissionReviewVersions:
          - v1
        clientConfig:
          url: https://webhook.example.com/resources
        rules:
          - apiGroups:
              - batch
            apiVersions:
              - v1
            operations:
              - CREATE
            resources:
              - jobs
              - cronjobs
```
