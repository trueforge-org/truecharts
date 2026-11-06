---
title: Probe
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/probe#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container.probes.liveness`
- `.Values.addons.codeserver.container.probes.readiness`
- `.Values.addons.codeserver.container.probes.startup`
- `.Values.addons.gluetun.container.probes.liveness`
- `.Values.addons.gluetun.container.probes.readiness`
- `.Values.addons.gluetun.container.probes.startup`
- `.Values.addons.netshoot.container.probes.liveness`
- `.Values.addons.netshoot.container.probes.readiness`
- and 10 more places

---

## `liveness`

A probe of the container. See [probe](/truecharts-common/workload/podSpec/containers/probe).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the probe is added to the container. Only a boolean is evaluated, any other value counts as `true`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.enabled` |
| Type | `bool or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `type`

How the probe checks the container: `exec` runs `command`, `http` and `https` send a GET request to `path`, `tcp` opens a connection to `port` and `grpc` calls the gRPC health service on `port`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |
| Allowed values | `"exec"`, `"http"`, `"https"`, `"tcp"`, `"grpc"` |
| Pattern | `^\{\{.*\}\}$` |

---

## `port`

Port that is probed. Used by `http`, `https`, `tcp` and `grpc` probes.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.port` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          probes:
            liveness:
              port: 8080
```

---

## `path`

Request path of `http` and `https` probes.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.path` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          probes:
            liveness:
              path: /healthz
```

---

## `httpHeaders`

Extra headers of the request of `http` and `https` probes, keyed by header name.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.httpHeaders` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `httpHeaders.$name`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.httpHeaders.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `spec`

Timing and threshold settings of the probe. Unset values default to `global.fallbackDefaults.probeTimeouts`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.spec` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `spec.successThreshold`

Number of successful probes in a row before the container is considered healthy again.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.spec.successThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `spec.initialDelaySeconds`

Seconds to wait after the container starts before the first probe.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.spec.initialDelaySeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 0 to … |

---

## `spec.periodSeconds`

Seconds between two probes.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.spec.periodSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `spec.timeoutSeconds`

Seconds after which a probe times out.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.spec.timeoutSeconds` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `spec.failureThreshold`

Number of failed probes in a row before the probe is considered failed.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.spec.failureThreshold` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Range | 1 to … |

---

## `command`

Command that is run by `exec` probes. A single command can be given as a string. Only applies when `type` is `exec`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.probes.liveness.command` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          probes:
            liveness:
              command:
                - cat
                - /tmp/healthy
```

---

## Full Examples

Each probe type is shown on the `liveness` probe, the same keys apply to `readiness` and `startup`.

### http

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
              httpHeaders:
                key1: value1
              spec:
                initialDelaySeconds: 5
                periodSeconds: 10
                timeoutSeconds: 5
                failureThreshold: 3
                successThreshold: 1
```

### https

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
              port: 8443
              path: /healthz
```

### tcp

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
              type: tcp
              port: 5432
```

### grpc

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
              type: grpc
              port: 9000
```

### exec

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
              type: exec
              command:
                - /bin/sh
                - -c
                - pg_isready -U postgres
```

### Type from a template

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
              type: "{{ .Values.probeType }}"
              port: "{{ .Values.probePort }}"
```
