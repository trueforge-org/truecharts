## Full Examples

Every dependency merges the objects it defines (workload, service, persistence and so on) into the chart, named `<dependency>-<object>`. The credentials Secrets are named `<release>-<dependency>creds`. See [Dependencies](/truecharts-common/dependencies) for how they work.

### MariaDB

```yaml
dependencies:
  mariadb:
    enabled: true
    depconfig:
      mariadbUsername: app
      mariadbDatabase: app
      password: "{{ .Values.dbPassword }}"
      rootPassword: "{{ .Values.dbRootPassword }}"
    persistence:
      data:
        size: 5Gi

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
            DB_HOST: '{{ .Values.dependencies.mariadb.depconfig.creds.plainhost | trimAll "\"" }}'
            DB_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "mariadbcreds" }}'
                key: url
            DB_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "mariadbcreds" }}'
                key: mariadb-password
```

### MongoDB

```yaml
dependencies:
  mongodb:
    enabled: true
    depconfig:
      mongodbUsername: app
      mongodbDatabase: app
    persistence:
      data:
        size: 5Gi

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
            MONGODB_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "mongodbcreds" }}'
                key: url
```

### ClickHouse

```yaml
dependencies:
  clickhouse:
    enabled: true
    depconfig:
      clickhouseUsername: app
      clickhouseDatabase: app
      clickhouseDefaultAccessManagement: 1

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
            CLICKHOUSE_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "clickhousecreds" }}'
                key: url
            CLICKHOUSE_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "clickhousecreds" }}'
                key: clickhouse-password
```

### Memcached

Memcached has no credentials. The app connects to the service of the dependency on port `11211`:

```yaml
dependencies:
  memcached:
    enabled: true

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
            MEMCACHED_HOST: "{{ .Release.Name }}-memcached-main"
            MEMCACHED_PORT: 11211
```

### Operator mode

MariaDB, MongoDB, ClickHouse and Memcached accept `mode: operator`. Their objects are then not merged into the chart, as an operator provides them. The credentials Secret, wait init container and notes still apply:

```yaml
dependencies:
  mariadb:
    enabled: true
    mode: operator
    depconfig:
      mariadbUsername: app
      mariadbDatabase: app
```

### Custom dependency

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
