## Full Examples

### Redis with a custom password

The password and the database index are used in the connection URL. The password is a placeholder, set your own value:

```yaml
redis:
  enabled: true
  password: example-placeholder-password
  redisUsername: ""
  redisDatabase: "1"
```
