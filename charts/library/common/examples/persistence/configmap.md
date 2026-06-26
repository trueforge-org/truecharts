## Full Examples

```yaml
persistence:
  configmap-vol:
    enabled: true
    type: configmap
    objectName: configmap-name
    expandObjectName: false
    optional: false
    defaultMode: "0777"
    items:
      - key: key1
        path: path1
      - key: key2
        path: path2
```
