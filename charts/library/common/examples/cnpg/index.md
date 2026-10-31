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

  # Backups through the Barman Cloud plugin, recovering from a previous archive
  my-cluster-2:
    enabled: true
    mode: recovery
    database: "my-app"
    user: "my-user"
    password: "supersecret"
    recovery:
      method: object_store
      credentials: my-s3
    backups:
      enabled: true
      credentials: my-s3
      # Prevents archiving on top of the archive it recovers from
      revision: "1"
      retentionPolicy: "30d"
      scheduledBackups:
        - name: daily-backup
          schedule: "0 0 0 * * *"
          backupOwnerReference: self
```
