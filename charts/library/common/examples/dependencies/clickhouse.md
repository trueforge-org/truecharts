## Full Examples

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
