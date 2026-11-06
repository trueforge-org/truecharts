## Full Examples

Netshoot adds a container with network troubleshooting tools to the pod, so you can `exec` into it to debug the network of the app.

### Enable

```yaml
addons:
  netshoot:
    enabled: true
```

### Other workloads

```yaml
addons:
  netshoot:
    enabled: true
    targetSelector:
      - main
      - worker
```

### Container options

```yaml
addons:
  netshoot:
    enabled: true
    container:
      resources:
        limits:
          cpu: 500m
          memory: 512Mi
      env:
        MY_VAR: my-value
```

### Image

The image is `netshootImage`:

```yaml
netshootImage:
  repository: oci.trueforge.org/containerforge/netshoot
  pullPolicy: IfNotPresent
  tag: 0.14.0@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef
```
