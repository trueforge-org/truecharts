## Full Examples

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
      - name: webhook-name
        failurePolicy: Fail
        matchPolicy: Exact
        sideEffects: None
        reinvocationPolicy: Never
        timeoutSeconds: 30
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          caBundle: ""
          url: ""
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

  other-webhook-name:
    enabled: true
    namespace: some-namespace
    type: validating
    webhooks:
      - name: other-webhook-name
        failurePolicy: Fail
        matchPolicy: Exact
        sideEffects: None
        timeoutSeconds: 30
        admissionReviewVersions:
          - v1
          - v1beta1
        clientConfig:
          caBundle: ""
          service:
            name: ""
            namespace: ""
            path: ""
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
              - pods
              - pods/status
```
