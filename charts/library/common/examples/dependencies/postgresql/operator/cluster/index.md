## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        labels:
          label1: label1
        annotations:
          annotation1: annotation1
        env:
          key: value
        envFrom:
          - secretRef:
              name: my-secret
              expandObjectName: true
          - configMapRef:
              name: my-configmap
              expandObjectName: false
        instances: 2
        singleNode: false
        logLevel: info
        primaryUpdateMethod: switchover
        primaryUpdateStrategy: unsupervised
        postgresql:
          max_connections: "200"
        initdb:
          encoding: UTF8
```
