---
title: Gluetun
---

:::note

- See the [Full Examples](/truecharts-common/addons/gluetun#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.gluetun`

---

## `gluetun`

A gluetun VPN container that routes the traffic of the pod.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enable the Gluetun VPN addon.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.enabled` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `targetSelector`

Workloads to which the Gluetun container is added. Defaults to the primary workload.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `["main"]` |

---

## `container`

Container of the gluetun add-on.

Takes the same keys as the [Container](/truecharts-common/workload/podSpec/containers) page, next to the keys below.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.container` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env`

Environment variables of the gluetun container, for the VPN settings.

Takes the same keys as the [Env](/truecharts-common/workload/podSpec/containers/env) page, next to the keys below.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.DOT`

DNS over TLS provider setting.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.container.env.DOT` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"off"` |

---

## `container.env.DNS_KEEP_NAMESERVER`

Keep nameserver from host.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.container.env.DNS_KEEP_NAMESERVER` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"on"` |

---

## `container.env.FIREWALL`

Firewall mode.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.container.env.FIREWALL` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"off"` |

---

## `container.env.FIREWALL_OUTBOUND_SUBNETS`

Allowed outbound subnets.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.container.env.FIREWALL_OUTBOUND_SUBNETS` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `container.env.FIREWALL_INPUT_PORTS`

Allowed inbound ports.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.container.env.FIREWALL_INPUT_PORTS` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `container.targetSelector`

Workloads to which this container is attached.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.container.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret`

Secrets mounted into the Gluetun container, for example the WireGuard configuration. Each key is a name for the secret.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret.$name`

Define a secret that is mounted into the Gluetun container.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret.$name.basePath`

Path in the container where the secret files are mounted.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.basePath` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret.$name.defaultMode`

Octal file mode of the mounted files, for example `0777`.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.defaultMode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret.$name.data`

Files of the secret, keyed by file name.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.data` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret.$name.data.$name`

Content of the file

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.data.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret.$name.namespace`

Namespace of the secret. Defaults to the namespace of the release.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `secret.$name.labels`

Additional labels for secret.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `secret.$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret.$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `secret.$name.annotations`

Additional annotations for secret.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `secret.$name.type`

Kubernetes type of the secret, eg `Opaque`.

| Field | Value |
| --- | --- |
| Key | `addons.gluetun.secret.$name.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `"Opaque"` |

---

## Full Examples

Gluetun routes the traffic of the pod through a VPN. The container is added to the workloads in `targetSelector`, which defaults to `main`. Options of the container, like its security context, are set under `container`, see [Addon Container](/truecharts-common/workload/podSpec/containers).

### OpenVPN with a provider

The settings of gluetun are environment variables. Read the [gluetun documentation](https://github.com/qdm12/gluetun-wiki) for those of your provider:

```yaml
addons:
  gluetun:
    enabled: true
    container:
      env:
        VPN_SERVICE_PROVIDER: mullvad
        VPN_TYPE: openvpn
        OPENVPN_USER: "{{ .Values.vpnUser }}"
        SERVER_COUNTRIES: Netherlands
```

### Firewall

With `FIREWALL: "on"`, common adds the pod and service CIDR to `FIREWALL_OUTBOUND_SUBNETS`, and the port of `service.main.ports.main` to `FIREWALL_INPUT_PORTS`, next to the values you set:

```yaml
addons:
  gluetun:
    enabled: true
    container:
      env:
        FIREWALL: "on"
        FIREWALL_OUTBOUND_SUBNETS: 192.168.1.0/24
        FIREWALL_INPUT_PORTS: 8080,9090
        DOT: "off"
        DNS_KEEP_NAMESERVER: "on"
```

### WireGuard configuration from a secret

Every `secret` is created as a Secret and mounted in the gluetun container at `basePath`, with a file for every key of `data`:

```yaml
addons:
  gluetun:
    enabled: true
    container:
      env:
        VPN_SERVICE_PROVIDER: custom
        VPN_TYPE: wireguard
    secret:
      wireguard:
        basePath: /gluetun/wireguard
        defaultMode: "0400"
        data:
          wg0.conf: |
            [Interface]
            PrivateKey = placeholder
            Address = 10.64.0.2/32

            [Peer]
            PublicKey = placeholder
            AllowedIPs = 0.0.0.0/0
            Endpoint = vpn.example.com:51820
```

### More than one workload

```yaml
addons:
  gluetun:
    enabled: true
    targetSelector:
      - main
      - downloader
    container:
      env:
        VPN_SERVICE_PROVIDER: custom
        VPN_TYPE: wireguard
```
