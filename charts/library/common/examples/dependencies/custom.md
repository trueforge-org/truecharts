## Full Examples

Any other name is a dependency with a complete chart values structure. Its objects are merged into the chart as `<name>-<object>`, and the references between them are rewritten. There is no credentials Secret or wait init container:

```yaml
redisImage:
  repository: oci.trueforge.org/containerforge/redis
  pullPolicy: IfNotPresent
  tag: 8.0.0@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

dependencies:
  redis:
    enabled: true
    workload:
      main:
        replicas: 1
        type: StatefulSet
        podSpec:
          containers:
            main:
              imageSelector: redisImage
    service:
      main:
        ports:
          main:
            protocol: tcp
            port: 6379
            targetPort: 6379
    persistence:
      data:
        mountPath: /data
        size: 1Gi
```
