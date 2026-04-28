---
title: Nodeselector
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/podOptions/nodeSelector#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions.nodeSelector`

---

## `podOptions.nodeSelector`

See [Node Selector](/truecharts-common/workload#nodeselector)

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `podOptions.nodeSelector` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `podOptions.nodeSelector.kubernetes.io/arch`

Configuration for `podOptions.nodeSelector.kubernetes.io/arch`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `podOptions.nodeSelector.kubernetes.io/arch` |
| Type       | `string`                                     |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

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
