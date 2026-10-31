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
    barmanMode: plugin
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

## Migrating to the Barman Cloud plugin

CloudNativePG removes its built-in Barman integration in version 1.32. To move a cluster to the plugin:

1. [Install the plugin](https://cloudnative-pg.io/plugin-barman-cloud/docs/installation/) in the namespace of the CloudNativePG operator. It requires cert-manager.
2. Set `barmanMode: plugin` on the cluster, or `global.fallbackDefaults.cnpg.barmanMode` for all of them.
3. Keep `destinationPath`, `serverName` and `revision` unchanged, so existing backups stay usable.

Keep in mind that:

- The switch triggers a rolling update of the cluster. Clusters with a single instance have a brief outage.
- `recovery.method: backup` is not available, use `object_store` instead.
- The metrics are renamed, from `cnpg_collector_*` to `barman_cloud_cloudnative_pg_io_*`. Update your alerts and dashboards.
- The check for the plugin looks for its API on the cluster. It cannot tell if the plugin is running. When rendering without access to a cluster, pass `--api-versions barmancloud.cnpg.io/v1/ObjectStore`.
