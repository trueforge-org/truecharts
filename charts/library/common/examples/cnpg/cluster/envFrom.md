## Full Examples

### ConfigMap and Secret

Adds the keys of a ConfigMap and a Secret as environment variables of the PostgreSQL instances. The Secret name is not expanded with the fullname:

```yaml
cnpg:
  main:
    enabled: true
    cluster:
      envFrom:
        - configMapRef:
            name: postgres-settings
        - secretRef:
            name: postgres-extra
            expandObjectName: false
```
