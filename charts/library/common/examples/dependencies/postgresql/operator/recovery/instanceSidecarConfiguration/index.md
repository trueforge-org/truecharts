## Full Examples

### Log level and resources

Configure the sidecar of the instances of the cluster that is restored from a backup:

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
          logLevel: debug
          resources:
            requests:
              cpu: 50m
              memory: 64Mi
            limits:
              memory: 256Mi
```

### Arguments and environment

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
          retentionPolicyIntervalSeconds: 600
          additionalContainerArgs:
            - --log-level=debug
          env:
            - name: AWS_REQUEST_CHECKSUM_CALCULATION
              value: when_required
```
