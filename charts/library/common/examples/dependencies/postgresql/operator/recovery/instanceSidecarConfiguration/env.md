## Full Examples

### Plain value

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      mode: recovery
      recovery:
        method: object_store
        credentials: my-s3
        serverName: previous-cluster
        instanceSidecarConfiguration:
          env:
            - name: AWS_REQUEST_CHECKSUM_CALCULATION
              value: when_required
```

### Value from a Secret and from the pod

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      mode: recovery
      recovery:
        method: object_store
        credentials: my-s3
        serverName: previous-cluster
        instanceSidecarConfiguration:
          env:
            - name: AWS_CA_BUNDLE_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: my-ca-secret
                  key: password
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
```
