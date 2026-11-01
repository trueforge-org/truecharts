## Full Examples

```yaml
dependencies:
  postgresql:
    enabled: true
    mode: operator
    depconfig:
      postgresqlUsername: "app"
      postgresqlDatabase: "app"
      password: "PLACEHOLDERPASSWORD"
    operator:
      hibernate: false
      type: postgres
      pgVersion: 18
      mode: standalone
      cluster: {}
      monitoring: {}
      recovery: {}
      backups: {}
      pooler: {}
```

With labels and annotations on all CNPG objects:

```yaml
dependencies:
  postgresql:
    enabled: true
    depconfig:
      postgresqlUsername: "my-user"
      postgresqlDatabase: "my-app"
      password: "supersecret"
    operator:
      labels:
        label1: label1
        label2: label2
      annotations:
        annotation1: annotation1
        annotation2: annotation2
```

Backups through the Barman Cloud plugin, recovering from a previous archive:

```yaml
dependencies:
  postgresql:
    enabled: true
    depconfig:
      postgresqlUsername: "my-user"
      postgresqlDatabase: "my-app"
      password: "supersecret"
    operator:
      mode: recovery
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
