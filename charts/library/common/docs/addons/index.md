---
title: Addons
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/addons#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons`

---

## `addons`

Addons to the workloads.

| Field      | Value    |
| ---------- | -------- |
| Key        | `addons` |
| Type       | `map`    |
| Required   | ❌       |
| Helm `tpl` | ❌       |
| Default    | unset    |

---

### `addons.codeserver`

A code-server container to edit the files of the app.

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `addons.codeserver` |
| Type       | `map`               |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

See [Codeserver](codeserver/) for full configuration.

---

### `addons.gluetun`

A gluetun VPN container that routes the traffic of the pod.

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `addons.gluetun` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Gluetun](gluetun/) for full configuration.

---

### `addons.netshoot`

A netshoot container to debug the network of the pod.

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `addons.netshoot` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

See [Netshoot](netshoot.md) for full configuration.

---

### `addons.tailscale`

A tailscale container that connects the pod to a tailnet.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `addons.tailscale` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

See [Tailscale](tailscale/) for full configuration.

---

### `addons.vpn`

Removed vpn add-on. Only an empty object is accepted, any key is rejected, use `addons.gluetun` or `addons.tailscale` instead.

| Field      | Value        |
| ---------- | ------------ |
| Key        | `addons.vpn` |
| Type       | `map`        |
| Required   | ❌           |
| Helm `tpl` | ❌           |
| Default    | unset        |

---

## Child Pages

- [Codeserver](codeserver/) - Configuration for the code-server addon.
- [Container](container.md) - Container configuration for an addon.
- [Gluetun](gluetun/) - Configuration for the Gluetun addon.
- [Netshoot](netshoot.md) - Configuration for the netshoot addon.
- [Tailscale](tailscale/) - Addons to the workloads

---

## Full Examples

```yaml
addons:
  codeserver:
    enabled: true
    container:
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
    service:
      enabled: true
      ports:
        codeserver:
          enabled: true
          port: 12345
          targetPort: 12345
    ingress:
      enabled: true
      hosts:
        - host: code.chart-example.local
          paths:
            - path: /
              pathType: Prefix
```

The code-server addon can also use a Gateway API route instead of an ingress. It is a route the same as `route.<name>`, so it supports `tls`, `listenerSet` and the integrations. With per domain certificates, its listener is added to the same ListenerSet as the listeners of the other routes on the gateway.

```yaml
addons:
  codeserver:
    enabled: true
    route:
      enabled: true
      gateway: external
      gatewayNamespace: networking
      hostnames:
        - code.chart-example.local
      integrations:
        certManager:
          enabled: true
          certificateIssuer: my-issuer
```
