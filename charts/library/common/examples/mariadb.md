## Full Examples

### MariaDB with an application database

Creates the user and the database in the connection URLs. Both passwords are placeholders:

```yaml
mariadb:
  enabled: true
  password: example-placeholder-password
  rootPassword: example-placeholder-root-password
  mariadbUsername: app
  mariadbDatabase: app
```
