## Full Examples

```yaml
cnpg:
  $name:
    cluster:
      labels:
        label1: label1
        label2: label2
      annotations:
        annotation1: annotation1
        annotation2: annotation2
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
      primaryUpdateMethod: # TODO
      primaryUpdateStrategy: # TODO
      certificates: # TODO
      postgresql: # TODO
      initdb: # TODO
      primaryUpdateStrategy: # TODO
```
