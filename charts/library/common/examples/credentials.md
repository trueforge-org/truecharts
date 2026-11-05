## Full Examples

Credentials are referenced by name from the objects that back up to, or restore from, S3 compatible storage. `s3` is the only `type`, and each of the examples below is a variant of it.

### Basic S3 credentials

```yaml
credentials:
  mys3:
    type: s3
    url: https://s3.example.com
    bucket: mybucket
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
```

### Region and path

The region is normally detected, so only set it when the endpoint needs it. `path` is the path within the bucket to use:

```yaml
credentials:
  mys3-region:
    type: s3
    url: https://s3.us-east-1.amazonaws.com
    region: us-east-1
    bucket: mybucket
    path: /backups
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
```

### Endpoint with a port or an IP

Use `http://` or `https://` and include the port when it is not the default one:

```yaml
credentials:
  minio:
    type: s3
    url: http://10.0.0.20:9000
    bucket: backups
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
```

### Custom CA

An endpoint with a certificate from a private CA. Put the PEM certificate in `customCA`:

```yaml
credentials:
  private-s3:
    type: s3
    url: https://s3.internal.example.com
    bucket: mybucket
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
    customCA: |
      -----BEGIN CERTIFICATE-----
      MIIB...placeholder...
      -----END CERTIFICATE-----
```

Or reference a Secret that holds the CA with `customCASecretRef`. The name is prefixed with the fullname of the chart, unless `expandObjectName` is `false`:

```yaml
secret:
  s3-ca:
    enabled: true
    data:
      ca.crt: "{{ .Values.s3CA }}"

credentials:
  private-s3-secret:
    type: s3
    url: https://s3.internal.example.com
    bucket: mybucket
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey
    customCASecretRef:
      name: s3-ca
      key: ca.crt
      expandObjectName: true
```

### Use them for backups

The PostgreSQL dependency refers to the credentials by name, see [PostgreSQL](/truecharts-common/dependencies/postgresql):

```yaml
credentials:
  mys3:
    type: s3
    url: https://s3.example.com
    bucket: mybucket
    accessKey: myaccesskey
    secretKey: mysecretkey
    encrKey: myencryptionkey

dependencies:
  postgresql:
    enabled: true
    operator:
      backups:
        enabled: true
        credentials: mys3
```
