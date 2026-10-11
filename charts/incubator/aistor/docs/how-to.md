---
title: How-To
---

## TLS through an ingress

When TLS terminates at your ingress, the ingress manages the certificate and connects to AIStor over HTTP. Leave `minio.tls: false` and do not place server certificates in `/etc/minio/certs`.

The `main` service exposes the WebUI on port `9001`. The `api` service exposes the S3 API on port `9000`.

If you expose both services, use separate hostnames. Set `minio.browserRedirectUrl` to the public WebUI URL when browsers visiting the S3 API should be redirected to the WebUI. This URL must route to the `main` service, not back to the API.

```yaml
minio:
  tls: false
  browserRedirectUrl: "https://console.example.com"
```

Leave `browserRedirectUrl` empty when accessing the WebUI directly through its own ingress.

## TLS served by AIStor

AIStor automatically enables TLS when it finds `public.crt` and `private.key` in `/etc/minio/certs`. This enables HTTPS for both the S3 API and the WebUI.

The chart's `minio.tls` setting enables the certificate PVC and changes the service protocols and health probes. It does not generate certificates or enable TLS in AIStor by itself. Set it to `true` when supplying server certificates:

```yaml
minio:
  tls: true
```

Clients must trust the issuing certificate authority, and the certificate must include the hostname used to connect in its Subject Alternative Names (SANs).

If an ingress connects to AIStor over HTTPS, configure the ingress controller to use HTTPS for its backend and trust the issuing CA as required by that controller.

### Certificates stored on the PVC

Certificate persistence follows `minio.tls` and is disabled by default. Set `minio.tls: true` to enable the PVC:

```yaml
minio:
  tls: true
```

The volume is mounted at `/etc/minio/certs`. Place the PEM-encoded certificate chain and matching private key at:

```text
/etc/minio/certs/public.crt
/etc/minio/certs/private.key
```

The certificate chain should contain the server certificate followed by its intermediate certificates. Use an unencrypted private key for this example. The container user must be able to read both files and write to the certificate directory; the common defaults use UID/GID `568`.

Optional CA certificates for AIStor to trust other servers belong in `/etc/minio/certs/CAs/`.

Apply `minio.tls: true` and recreate the pod after installing the initial certificates. The certificate files remain on the PVC when the pod is replaced.

### Certificates from an existing TLS Secret

Alternatively, use a Kubernetes TLS Secret in the same namespace as AIStor. This example uses `aistor-server-tls`, containing `tls.crt` and `tls.key`. It can be managed by cert-manager or created from existing files:

```bash
kubectl create secret tls aistor-server-tls -n aistor \
  --cert=public.crt \
  --key=private.key
```

Add the following overrides to your HelmRelease values. Use an `emptyDir` for the writable certificate directory and mount the Secret's files individually. The certificates remain in the Secret, so no certificate PVC is needed:

```yaml
minio:
  tls: true

persistence:
  certs:
    type: emptyDir
  cert-public:
    enabled: true
    type: secret
    objectName: aistor-server-tls
    expandObjectName: false
    mountPath: /etc/minio/certs/public.crt
    subPath: tls.crt
    readOnly: true
  cert-private:
    enabled: true
    type: secret
    objectName: aistor-server-tls
    expandObjectName: false
    mountPath: /etc/minio/certs/private.key
    subPath: tls.key
    readOnly: true
```

`expandObjectName: false` uses the Secret's exact name. These mounts map `tls.crt` to `public.crt` and `tls.key` to `private.key`.

Secret updates do not propagate to `subPath` mounts. Recreate the pod after the Secret is renewed to load the updated certificates.

### Verify TLS

For a release named `aistor` in namespace `aistor`, forward the S3 API port:

```bash
kubectl port-forward -n aistor service/aistor-api 9000:9000
```

In another terminal, test with a hostname listed in the certificate:

```bash
curl --resolve s3.example.com:9000:127.0.0.1 \
  https://s3.example.com:9000/minio/health/live
```

Expect HTTP `200` without a certificate error. Add `--cacert ca.crt` when using a private CA. Do not use `-k` when testing certificate trust, because it disables certificate verification.

The pod should become Ready. With a valid license, also check `/minio/health/ready` and test an S3 upload/download. Without a license, the chart checks `/minio/health/live` for readiness, and S3 operations remain unavailable.

## References

- [AIStor container network encryption](https://docs.min.io/aistor/installation/container/network-encryption/)
- [AIStor TLS configuration and certificate directories](https://docs.min.io/aistor/installation/linux/network-encryption/enable-tls-encryption/)
