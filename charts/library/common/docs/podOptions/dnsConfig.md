---
title: Dnsconfig
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/podOptions/dnsConfig#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions.dnsConfig`

---

## `podOptions.dnsConfig`

See [DNS Config](/truecharts-common/workload#dnsconfig)

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `podOptions.dnsConfig` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `podOptions.dnsConfig.nameservers`

Additional DNS servers.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `podOptions.dnsConfig.nameservers` |
| Type       | `list of string`                   |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

---

### `podOptions.dnsConfig.options`

DNS resolver options.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `podOptions.dnsConfig.options`      |
| Type       | `list of map`                       |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | `[{"name": "ndots", "value": "1"}]` |

Example

```yaml
podOptions:
  dnsConfig:
    options:
      -
        name: ndots
        value: 1
```

---

### `podOptions.dnsConfig.searches`

Additional DNS search domains.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `podOptions.dnsConfig.searches` |
| Type       | `list of string`                |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

## Full Examples

```yaml
podOptions:
  enableServiceLinks: false
  hostNetwork: false
  hostPID: false
  hostIPC: false
  hostUsers: false
  shareProcessNamespace: false
  restartPolicy: Always
  dnsPolicy: ClusterFirst
  dnsConfig:
    options:
      - name: ndots
        value: "1"
  hostAliases: []
  nodeSelector:
    kubernetes.io/arch: "amd64"
  defaultSpread: true
  topologySpreadConstraints: []
  tolerations: []
  schedulerName: ""
  priorityClassName: ""
  runtimeClassName: ""
  automountServiceAccountToken: false
  terminationGracePeriodSeconds: 60
```
