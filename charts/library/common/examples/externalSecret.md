## Full Examples

ExternalSecrets require the [External Secrets Operator](https://external-secrets.io) CRDs to be installed in the cluster.

### Fetch individual keys

Create a Secret named `<fullname>-credentials` with the keys `username` and `password`, fetched from a `ClusterSecretStore`:

```yaml
externalSecret:
  credentials:
    enabled: true
    refreshInterval: 1h
    secretStoreRef:
      name: vault
      kind: ClusterSecretStore
    data:
      - secretKey: username
        remoteRef:
          key: my-app
          property: username
      - secretKey: password
        remoteRef:
          key: my-app
          property: password
```

### Fetch all keys of a provider entry

Use `dataFrom` to copy every key of a provider entry into the Secret:

```yaml
externalSecret:
  config:
    enabled: true
    secretStoreRef:
      name: aws-parameter-store
    dataFrom:
      - extract:
          key: my-app/config
```

### Find entries and rewrite the keys

`find` selects entries of the provider, and `rewrite` changes the names of the keys:

```yaml
externalSecret:
  all-config:
    enabled: true
    refreshPolicy: Periodic
    refreshInterval: 30m
    secretStoreRef:
      name: vault
      kind: ClusterSecretStore
    dataFrom:
      - find:
          name:
            regexp: "^my-app-.*"
        rewrite:
          - regexp:
              source: "my-app-(.*)"
              target: "app_$1"
```

### Custom Secret name and template

`target.template` is passed to the ExternalSecret as is, so the External Secrets Operator can evaluate its own templates in there. Values in `data` do support Helm `tpl`:

```yaml
externalSecret:
  database:
    enabled: true
    expandObjectName: false
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    secretStoreRef:
      name: vault
    target:
      name: database-url
      creationPolicy: Owner
      deletionPolicy: Retain
      template:
        type: Opaque
        data:
          url: "postgres://{{ .username }}:{{ .password }}@db:5432/app"
    data:
      - secretKey: username
        remoteRef:
          key: "{{ .Release.Name }}-database"
          property: username
      - secretKey: password
        remoteRef:
          key: "{{ .Release.Name }}-database"
          property: password
```
