## Full Examples

Gluetun routes the traffic of the pod through a VPN. The container is added to the workloads in `targetSelector`, which defaults to `main`. Options of the container, like its security context, are set under `container`, see [Addon Container](/truecharts-common/addons/container).

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
