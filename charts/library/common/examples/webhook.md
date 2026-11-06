## Full Examples

### Mutating webhook with a URL

```yaml
webhook:
  webhook-name:
    enabled: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    type: mutating
    webhooks:
      - name: webhook-name.example.com
        failurePolicy: Fail
        matchPolicy: Exact
        sideEffects: None
        reinvocationPolicy: Never
        timeoutSeconds: 30
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          caBundle: <base64 encoded ca bundle>
          url: https://webhook.example.com/mutate
        rules:
          - scope: Cluster
            apiGroups:
              - ""
            apiVersions:
              - v1
            operations:
              - CREATE
              - UPDATE
            resources:
              - pods
              - pods/status
```

### Validating webhook with a service

```yaml
webhook:
  other-webhook-name:
    enabled: true
    namespace: some-namespace
    type: validating
    webhooks:
      - name: other-webhook-name.example.com
        failurePolicy: Fail
        matchPolicy: Exact
        sideEffects: None
        timeoutSeconds: 30
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          caBundle: <base64 encoded ca bundle>
          service:
            name: my-webhook-service
            namespace: my-namespace
            path: /validate
            port: "443"
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
              - pods
              - pods/status
```

### Limit the webhook with selectors

```yaml
webhook:
  selective-webhook:
    enabled: true
    type: validating
    webhooks:
      - name: selective.example.com
        failurePolicy: Ignore
        sideEffects: None
        admissionReviewVersions:
          - v1
        clientConfig:
          service:
            name: my-webhook-service
            namespace: my-namespace
            path: /validate
            port: "443"
        namespaceSelector:
          matchLabels:
            admission: enabled
        objectSelector:
          matchExpressions:
            - key: skip-webhook
              operator: DoesNotExist
        rules:
          - scope: "*"
            apiGroups:
              - apps
            apiVersions:
              - v1
            operations:
              - CREATE
            resources:
              - deployments
              - statefulsets
```
