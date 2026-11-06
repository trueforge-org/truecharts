## Full Examples

### Basic ConfigMap

The name of the ConfigMap is prefixed with the fullname of the chart:

```yaml
configmap:
  configmap-name:
    enabled: true
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
configmap:
  other-configmap-name:
    enabled: true
    namespace: some-namespace
    data:
      key: |
        multi line
        text value
      config.yaml: |
        server:
          port: 8080
```

### Exact name

With `expandObjectName: false`, the name is not prefixed with the fullname of the chart:

```yaml
configmap:
  exact-name:
    enabled: true
    expandObjectName: false
    data:
      key: value
```

### Binary data

`binaryData` takes base64 encoded values:

```yaml
configmap:
  binary-configmap:
    enabled: true
    data:
      text: some text
    binaryData:
      logo.png: aGVsbG8gd29ybGQ=
```

### Use it in a volume

```yaml
configmap:
  app-config:
    enabled: true
    data:
      config.ini: |
        [app]
        debug = false

persistence:
  config:
    enabled: true
    type: configmap
    objectName: app-config
    mountPath: /etc/app
    readOnly: true
```
