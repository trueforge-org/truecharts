## Full Examples

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
