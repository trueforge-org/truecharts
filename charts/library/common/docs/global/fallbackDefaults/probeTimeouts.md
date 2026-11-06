---
title: probeTimeouts
---

:::note

- See the [Full Examples](/truecharts-common/global/fallbackDefaults/probeTimeouts#full-examples) section for complete examples.

:::

## Appears in

- `.Values.global.fallbackDefaults.probeTimeouts`

---

## `probeTimeouts`

Timings of the probes that set none.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
liveness:
  initialDelaySeconds: 12
  periodSeconds: 15
  timeoutSeconds: 5
  failureThreshold: 5
  successThreshold: 1
readiness:
  initialDelaySeconds: 10
  periodSeconds: 12
  timeoutSeconds: 5
  failureThreshold: 4
  successThreshold: 2
startup:
  initialDelaySeconds: 10
  periodSeconds: 5
  timeoutSeconds: 3
  failureThreshold: 60
  successThreshold: 1
```

---

## `liveness`

Timings of liveness probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
initialDelaySeconds: 12
periodSeconds: 15
timeoutSeconds: 5
failureThreshold: 5
successThreshold: 1
```

---

## `liveness.initialDelaySeconds`

Seconds before the first probe.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.initialDelaySeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `12` |
| Range | 1 to … |

---

## `liveness.periodSeconds`

Seconds between probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.periodSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `15` |
| Range | 1 to … |

---

## `liveness.timeoutSeconds`

Seconds before a probe times out.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.timeoutSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `5` |
| Range | 1 to … |

---

## `liveness.failureThreshold`

Failed probes in a row before the probe fails.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.failureThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `5` |
| Range | 1 to … |

---

## `liveness.successThreshold`

Successful probes in a row before the probe succeeds.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.liveness.successThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `1` |
| Range | 1 to … |

---

## `readiness`

Timings of readiness probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
initialDelaySeconds: 10
periodSeconds: 12
timeoutSeconds: 5
failureThreshold: 4
successThreshold: 2
```

---

## `readiness.initialDelaySeconds`

Seconds before the first probe.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.initialDelaySeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `10` |
| Range | 1 to … |

---

## `readiness.periodSeconds`

Seconds between probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.periodSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `12` |
| Range | 1 to … |

---

## `readiness.timeoutSeconds`

Seconds before a probe times out.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.timeoutSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `5` |
| Range | 1 to … |

---

## `readiness.failureThreshold`

Failed probes in a row before the probe fails.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.failureThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `4` |
| Range | 1 to … |

---

## `readiness.successThreshold`

Successful probes in a row before the probe succeeds.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.readiness.successThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `2` |
| Range | 1 to … |

---

## `startup`

Timings of startup probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
initialDelaySeconds: 10
periodSeconds: 5
timeoutSeconds: 3
failureThreshold: 60
successThreshold: 1
```

---

## `startup.initialDelaySeconds`

Seconds before the first probe.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.initialDelaySeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `10` |
| Range | 1 to … |

---

## `startup.periodSeconds`

Seconds between probes.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.periodSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `5` |
| Range | 1 to … |

---

## `startup.timeoutSeconds`

Seconds before a probe times out.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.timeoutSeconds` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `3` |
| Range | 1 to … |

---

## `startup.failureThreshold`

Failed probes in a row before the probe fails.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.failureThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `60` |
| Range | 1 to … |

---

## `startup.successThreshold`

Successful probes in a row before the probe succeeds.

| Field | Value |
| --- | --- |
| Key | `global.fallbackDefaults.probeTimeouts.startup.successThreshold` |
| Type | `int` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `1` |
| Range | 1 to … |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
global:
  fallbackDefaults:
    probeTimeouts:
      liveness:
        initialDelaySeconds: 10
        periodSeconds: 10
        timeoutSeconds: 5
        failureThreshold: 5
        successThreshold: 1
      readiness:
        initialDelaySeconds: 10
        periodSeconds: 10
        timeoutSeconds: 5
        failureThreshold: 5
        successThreshold: 2
      startup:
        initialDelaySeconds: 10
        periodSeconds: 5
        timeoutSeconds: 2
        failureThreshold: 60
        successThreshold: 1
```
