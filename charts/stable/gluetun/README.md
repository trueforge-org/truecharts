# Gluetun VPN Proxy Service for Kubernetes

This repository provides a standalone deployment of **Gluetun VPN** running with a **SOCKS5 / HTTP / Shadowsocks proxy sidecar** (using `serjs/go-socks5-proxy`) to allow other Kubernetes workloads to route outbound traffic through a single VPN tunnel — **without needing a TUN device or per-application VPN container**.

This setup is ideal for apps like:
- qBittorrent
- Soulseek (slskd)
- Transmission
- Radarr / Sonarr / Lidarr
- Any CLI or container supporting SHADOWSOCKS/SOCKS5/HTTP proxy variables

---

## ✨ Features

- Central **VPN exit point** for your cluster
- One Gluetun instance services many apps
- Supports:
  - **SOCKS5 proxy**
  - **HTTP proxy**
  - **Shadowsocks**

## Installation

Downloads the values.yaml file and configure the Proxy, firewall and vpn Sections

  **example vpn section for wireguard**
vpn:
  type: "wireguard" # wireguard or openvpn
  provider: "mullvad" # VPN service provider
  address: "xxx.xxx.xxx.xxx/32" # VPN address for wireguard
  city: "Torronto" # VPN server city for wireguard and openvpn
  endpointPort: 51820 # VPN endpoint port for wireguard
  publicKey: "xxxxxxxx" # VPN public key for wireguard
  privateKey: "xxxxxxx" # VPN private key for wireguard
  endpointIp: "xx.xx.xxx.xxx" # VPN endpoint IP for wireguard
  username: "" # username for openvpn
  password: "" # password for openvpn
  region: "" # region for openvpn

  **example vpn section for openvpn**
vpn:
  type: "openvpn" # wireguard or openvpn
  provider: "windscribe" # VPN service provider
  address: "" # VPN address for wireguard
  city: "Montreal" # VPN server city for wireguard and openvpn
  endpointPort:  # VPN endpoint port for wireguard
  publicKey: "" # VPN public key for wireguard
  privateKey: "" # VPN private key for wireguard
  endpointIp: " # VPN endpoint IP for wireguard
  username: "username" # username for openvpn
  password: "password" # password for openvpn
  region: "Canada East" # region for openvpn

firewall:
  outboundSubnets: "192.168.178.0/24" # You can leave this as default
  vpnInputPorts: "59241" # You can leave this as default

proxy:
  http:
    log: true # Enable or Disable logging for the http proxy service
  shadowsocks:
    log: true # Enable or Disable logging for the Shadowsocks proxy service
    cipher: aes-256-gcm # Shadowsocks cipher (chacha20-ietf-poly1305, aes-128-gcm, aes-256-gcm)
    password: "" # Optional: Shadowsocks password
  socks5:
    username: "Changeme" # required: Username for SOCKS5 auth
    password: "Changeme" # required: Password for SOCKS5 auth

### Helm-Chart installation

To install TrueCharts Helm charts using Helm, you can use our OCI Repository.

`helm install mychart oci://oci.trueforge.org/truecharts/gluetun -f values.yaml`

For more information on how to install TrueCharts Helm charts, checkout the [instructions on the website](https://trueforge.org/truecharts/guides/)
