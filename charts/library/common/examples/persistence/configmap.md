## Full Examples

### Whole configmap

```yaml
persistence:
  configmap-vol:
    enabled: true
    type: configmap
    objectName: configmap-name
    mountPath: /config
    targetSelectAll: true
```

### Selected items

```yaml
persistence:
  configmap-vol:
    enabled: true
    type: configmap
    # This will be expanded to 'fullname-configmap-name' unless expandObjectName is false
    objectName: configmap-name
    expandObjectName: true
    optional: false
    defaultMode: "0777"
    items:
      - key: key1
        path: path1
      - key: key2
        path: path2
    targetSelector:
      workload-name:
        container-name:
          mountPath: /config
          readOnly: true
```

### Existing configmap

```yaml
persistence:
  configmap-vol:
    enabled: true
    type: configmap
    objectName: configmap-not-created-by-chart
    expandObjectName: false
    optional: true
    targetSelector:
      workload-name:
        container-name:
          mountPath: /etc/app/app.conf
          subPath: app.conf
```
