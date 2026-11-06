## Full Examples

Tailscale connects the pod to a tailnet. It adds a `tailscale` container to the workloads in `targetSelector`.

### Userspace mode

Run tailscale in userspace networking mode:

```yaml
addons:
  tailscale:
    enabled: true
    authkey: tskey-auth-placeholder
    userspace: true
    auth_once: true
    accept_dns: false
```

### Advertise routes

Make networks reachable through the tailnet, and forward traffic to an IP:

```yaml
addons:
  tailscale:
    enabled: true
    authkey: tskey-auth-placeholder
    userspace: false
    routes: 10.0.0.0/8,192.168.1.0/24
    dest_ip: 10.0.0.10
```

### Proxies and extra arguments

```yaml
addons:
  tailscale:
    enabled: true
    authkey: tskey-auth-placeholder
    sock5_server: ":1080"
    outbound_http_proxy_listen: ":1055"
    extra_args: --advertise-exit-node --hostname=my-app
    daemon_extra_args: --verbose=1
```

### Configuration file

`config` is the path of a `tailscaled` config file in the container:

```yaml
addons:
  tailscale:
    enabled: true
    config: /config/tailscaled.json
```

### Container

The environment variables can also be set on the container directly. Add capabilities when the app needs them, and set the workloads with `targetSelector`:

```yaml
addons:
  tailscale:
    enabled: true
    targetSelector:
      - main
    annotations:
      key: value
    authkey: tskey-auth-placeholder
    container:
      env:
        TS_STATE_DIR: /var/lib/tailscale
        TS_SOCKET: /var/run/tailscale/tailscaled.sock
        TS_KUBE_SECRET: tailscale-state
      securityContext:
        capabilities:
          add:
            - NET_ADMIN
      probes:
        liveness:
          enabled: false
        readiness:
          enabled: false
        startup:
          enabled: false
      resources:
        excludeExtra: true
```
