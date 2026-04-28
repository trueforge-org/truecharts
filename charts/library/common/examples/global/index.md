## Full Examples

```yaml
global:
  labels:
    key: value
  annotations:
    key: value
  namespace: ""
  minNodePort: 9000
  stopAll: false
  metallb:
    addServiceAnnotations: true
  traefik:
    addServiceAnnotations: true
    commonMiddlewares:
      - name: tc-basic-secure-headers
```
