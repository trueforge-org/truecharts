## Full Examples

### Whole secret

```yaml
persistence:
  secret-vol:
    enabled: true
    type: secret
    objectName: secret-name
    mountPath: /secrets
    targetSelectAll: true
```

### Selected items

```yaml
persistence:
  secret-vol:
    enabled: true
    type: secret
    # This will be expanded to 'fullname-secret-name' unless expandObjectName is false
    objectName: secret-name
    expandObjectName: false
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
          mountPath: /secrets
          readOnly: true
```
