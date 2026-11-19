## Full Examples

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
