## Full Examples

PostgreSQL provided by CloudNativePG, the default `operator` mode, with the connection details from the credentials secret:

```yaml
dependencies:
  postgresql:
    enabled: true
    depconfig:
      postgresqlUsername: app
      postgresqlDatabase: app

workload:
  main:
    podSpec:
      containers:
        main:
          env:
            DATABASE_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "postgresqlcreds" }}'
                key: url
```

A plain PostgreSQL deployment in the chart instead, the `standalone` mode. It runs `postgresql18Image`:

```yaml
dependencies:
  postgresql:
    enabled: true
    mode: standalone
    depconfig:
      postgresqlUsername: app
      postgresqlDatabase: app
```
