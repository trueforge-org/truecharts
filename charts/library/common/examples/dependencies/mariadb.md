## Full Examples

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
