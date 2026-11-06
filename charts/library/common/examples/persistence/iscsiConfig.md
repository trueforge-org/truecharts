## Full Examples

### Session authentication

```yaml
persistence:
  iscsi-vol:
    enabled: true
    type: iscsi
    mountPath: /data
    iscsi:
      fsType: ext4
      targetPortal: some.target.portal
      iqn: some.iqn
      lun: 0
      authSession:
        username: some.username
        password: some.password
        usernameInitiator: some.usernameInitiator
        passwordInitiator: some.passwordInitiator
```

### Discovery authentication

```yaml
persistence:
  iscsi-vol:
    enabled: true
    type: iscsi
    mountPath: /data
    iscsi:
      fsType: ext4
      targetPortal: some.target.portal
      iqn: some.iqn
      lun: 1
      authDiscovery:
        username: some.username
        password: some.password
```
