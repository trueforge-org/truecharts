## Full Examples

```yaml
ingressMiddlewares:
  traefik:
    middleware-name1:
      enabled: true
      type: basic-auth
      data:
        users:
          - username: some-username
            password: some-password
    middleware-name2:
      enabled: true
      type: basic-auth
      data:
        secret: some-secret
```
