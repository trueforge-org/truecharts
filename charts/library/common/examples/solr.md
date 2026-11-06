## Full Examples

### Solr with authentication

Uses the admin user and the password in the connection URL and the wait container. The password is a placeholder:

```yaml
solr:
  enabled: true
  password: example-placeholder-password
  solrUsername: admin
  solrCores: "main"
  solrEnableAuthentication: "yes"
```
