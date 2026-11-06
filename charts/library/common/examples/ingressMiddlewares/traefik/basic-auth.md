## Full Examples

### Users in the values

The password is stored in a generated Secret. Use placeholders only in documentation, and set a real password in your own values.

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: basic-auth
      data:
        users:
          - username: some-username
            password: <password>
```

### Existing secret

```yaml
ingressMiddlewares:
  traefik:
    middleware-name:
      enabled: true
      type: basic-auth
      data:
        secret: some-secret
```
