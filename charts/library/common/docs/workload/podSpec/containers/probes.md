---
title: Probes
---

:::note

- See the [Full Examples](/truecharts-common/workload/podSpec/containers/probes#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container.probes`
- `.Values.addons.gluetun.container.probes`
- `.Values.addons.netshoot.container.probes`
- `.Values.addons.tailscale.container.probes`
- `.Values.workload.$name.podSpec.containers.$name.probes`
- `.Values.workload.$name.podSpec.initContainers.$name.probes`

---

## `probes`

Liveness, readiness and startup probes of the container. Does **not** apply to `initContainers`. See [probes](/truecharts-common/workload/podSpec/containers/probes).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `liveness`

Liveness probe. When it fails, Kubernetes restarts the container. See [probe](/truecharts-common/workload/podSpec/containers/probe).

See [Probe](/truecharts-common/workload/podSpec/containers/probe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `readiness`

Readiness probe. While it fails, the pod is removed from the endpoints of Services. See [probe](/truecharts-common/workload/podSpec/containers/probe).

See [Probe](/truecharts-common/workload/podSpec/containers/probe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.readiness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `startup`

Startup probe. The other probes wait until it succeeds, which is useful for slow starting apps. See [probe](/truecharts-common/workload/podSpec/containers/probe).

See [Probe](/truecharts-common/workload/podSpec/containers/probe) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.startup` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Every probe

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          probes:
            liveness:
              enabled: true
              type: https
              port: 8080
              path: /healthz
              httpHeaders:
                key1: value1
                key2: value2
              spec:
                initialDelaySeconds: 10
                periodSeconds: 10
                timeoutSeconds: 10
                failureThreshold: 10
                successThreshold: 1
            readiness:
              enabled: true
              type: tcp
              port: 8080
              spec:
                initialDelaySeconds: 10
                periodSeconds: 10
                timeoutSeconds: 10
                failureThreshold: 10
                successThreshold: 10
            startup:
              enabled: true
              type: exec
              command:
                - command1
                - command2
              spec:
                initialDelaySeconds: 10
                periodSeconds: 10
                timeoutSeconds: 10
                failureThreshold: 60
                successThreshold: 1
```

### Disable a probe

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          probes:
            liveness:
              enabled: true
              type: http
              port: 8080
              path: /healthz
            readiness:
              enabled: true
              type: http
              port: 8080
              path: /ready
            startup:
              enabled: false
```

### Port from the service

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          probes:
            liveness:
              enabled: true
              type: http
              port: "{{ .Values.service.main.ports.main.port }}"
              path: /healthz
```
