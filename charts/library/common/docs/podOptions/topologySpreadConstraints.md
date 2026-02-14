---
title: Topologyspreadconstraints
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/podOptions/topologySpreadConstraints#full-examples) section for complete examples.

:::

## Appears in

- `.Values.podOptions.topologySpreadConstraints`

---

## `podOptions.topologySpreadConstraints`

See [Topology Spread Constraints](/truecharts-common/workload#topologyspreadconstraints)

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `podOptions.topologySpreadConstraints` |
| Type       | `list of map`                          |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

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
