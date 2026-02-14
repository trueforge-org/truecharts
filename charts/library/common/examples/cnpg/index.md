## Full Examples

```yaml
cnpg:
  main:
    enabled: true
    primary: true
    hibernate: false
    type: postgres
    pgVersion: 16
    mode: standalone
    database: "app"
    user: "app"
    password: "PLACEHOLDERPASSWORD"
    cluster: {}
    monitoring: {}
    recovery: {}
    backups: {}
    pooler: {}

  my-cluster-1:
    enabled: true
    primary: false
    hibernate: false
    labels:
      label1: label1
      label2: label2
    annotations:
      annotation1: annotation1
      annotation2: annotation2
    type: postgres
    pgVersion: 16
    mode: standalone
    database: "my-app"
    user: "my-user"
    password: "supersecret"
    cluster: {}
    monitoring: {}
    recovery: {}
    backups: {}
    pooler: {}
```
