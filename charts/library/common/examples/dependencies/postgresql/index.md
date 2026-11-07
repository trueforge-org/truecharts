## Full Examples

PostgreSQL is provided by CloudNativePG in the default `operator` mode, and as a plain deployment in the chart with `mode: standalone`. Both modes share `depconfig`, the connection details in `depconfig.creds` and the `postgresql-wait` init container. The credentials Secret is named `<release>-postgresqlcreds`.

### Operator mode

The default mode. A CloudNativePG `Cluster` is created, with the connection details from the credentials Secret:

```yaml
dependencies:
  postgresql:
    enabled: true
    depconfig:
      postgresqlUsername: app
      postgresqlDatabase: app

workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          env:
            DATABASE_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "postgresqlcreds" }}'
                key: url
```

### Standalone mode

A plain PostgreSQL deployment in the chart instead. It runs `postgresql18Image`, and its objects can be customised like those of the chart:

```yaml
dependencies:
  postgresql:
    enabled: true
    mode: standalone
    depconfig:
      postgresqlUsername: app
      postgresqlDatabase: app
    persistence:
      data:
        size: 5Gi
    resources:
      limits:
        memory: 1Gi
```

### Operator: version and type

`pgVersion` selects the image, for example `postgres17Image`. The `type` selects the variant: `postgres`, `postgis`, `vectors` or `vectorchord`:

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      pgVersion: 17
      type: postgis
      instances: 3
```

### Operator: labels, annotations and hibernation

Labels and annotations on all CNPG objects. `hibernate` stops the cluster while keeping its data:

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      hibernate: false
      labels:
        label1: label1
        label2: label2
      annotations:
        annotation1: annotation1
        annotation2: annotation2
```

### Operator: cluster options

The options of the `Cluster`: the number of instances, update behaviour, extra environment, PostgreSQL parameters and the `initdb` bootstrap:

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      cluster:
        instances: 2
        singleNode: false
        logLevel: info
        primaryUpdateMethod: switchover
        primaryUpdateStrategy: unsupervised
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
        # Each parameter is passed to PostgreSQL as a string
        postgresql:
          max_connections: "200"
          shared_buffers: 256MB
        preloadLibraries:
          - pg_stat_statements
        initdb:
          encoding: UTF8
          localeCollate: C
          localeCtype: C
          dataChecksums: true
          postInitApplicationSQL:
            - CREATE EXTENSION IF NOT EXISTS pg_trgm;
```

### Operator: storage and resources

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      cluster:
        storage:
          size: 20Gi
          storageClass: fast-storage
          accessModes:
            - ReadWriteOnce
        walStorage:
          size: 5Gi
          storageClass: fast-storage
        resources:
          limits:
            cpu: 2000m
            memory: 4Gi
          requests:
            cpu: 200m
            memory: 512Mi
```

### Operator: monitoring

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      monitoring:
        enablePodMonitor: true
        disableDefaultQueries: false
        customQueries:
          - name: app_rows
            key: queries.yaml
```

### Operator: pooler

A PgBouncer pooler in front of the cluster. `createRO` adds a pooler for the read-only endpoint, which adds the `RO` keys to `depconfig.creds`:

```yaml
dependencies:
  postgresql:
    enabled: true
    operator:
      pooler:
        enabled: true
        createRO: true
        poolMode: transaction
        instances: 2
        parameters:
          max_client_conn: "1000"
          default_pool_size: "20"
        labels:
          label1: label1
        annotations:
          annotation1: annotation1
```

### Operator: backups

Backups through the Barman Cloud plugin to the object store of the credentials in `credentials`, see [Credentials](/truecharts-common/credentials):

```yaml
credentials:
  my-s3:
    type: s3
    url: https://s3.example.com
    bucket: mybucket
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey

dependencies:
  postgresql:
    enabled: true
    operator:
      backups:
        enabled: true
        credentials: my-s3
        retentionPolicy: 30d
        target: prefer-standby
        jobs: 2
        compression:
          enabled: true
        encryption:
          enabled: true
        scheduledBackups:
          - name: daily-backup
            schedule: "0 0 0 * * *"
            backupOwnerReference: self
            immediate: true
        manualBackups:
          - name: before-upgrade
```

### Operator: recovery

Recover from a previous archive. The `revision` of the backups prevents archiving on top of the archive it recovers from:

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
        pitrTarget:
          time: "2026-01-01 12:00:00.00000+00"
      backups:
        enabled: true
        credentials: my-s3
        revision: "1"
        retentionPolicy: 30d
        scheduledBackups:
          - name: daily-backup
            schedule: "0 0 0 * * *"
            backupOwnerReference: self
```
