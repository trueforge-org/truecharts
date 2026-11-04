## Full Examples

A Valkey cache next to the app, with the connection details from the credentials secret:

```yaml
dependencies:
  valkey:
    enabled: true

workload:
  main:
    podSpec:
      containers:
        main:
          env:
            REDIS_HOST: '{{ .Values.dependencies.valkey.depconfig.creds.plainhost | trimAll "\"" }}'
            REDIS_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "valkeycreds" }}'
                key: valkey-password
```

Another image, or more resources for the dependency only:

```yaml
valkeyImage:
  repository: oci.trueforge.org/containerforge/valkey
  tag: 9.0.4@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
  pullPolicy: IfNotPresent

dependencies:
  valkey:
    enabled: true
    resources:
      limits:
        memory: 1Gi
```
