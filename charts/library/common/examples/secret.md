## Full Examples

### Basic Secret

The name of the Secret is prefixed with the fullname of the chart. `type` defaults to `Opaque`:

```yaml
secret:
  secret-name:
    enabled: true
    type: CustomSecretType
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    data:
      key: value
```

### Multi line values and a namespace

```yaml
secret:
  other-secret-name:
    enabled: true
    namespace: some-namespace
    data:
      key: |
        multi line
        text value
```

### Secret types

```yaml
secret:
  tls-secret:
    enabled: true
    type: kubernetes.io/tls
    data:
      tls.crt: "{{ .Values.tlsCrt }}"
      tls.key: "{{ .Values.tlsKey }}"
  basic-auth:
    enabled: true
    type: kubernetes.io/basic-auth
    data:
      username: "{{ .Values.username }}"
      password: "{{ .Values.password }}"
```

### Use it in a container

```yaml
secret:
  app-secret:
    enabled: true
    data:
      API_TOKEN: "{{ .Values.apiToken }}"

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
          envFrom:
            - secretRef:
                name: app-secret
```
