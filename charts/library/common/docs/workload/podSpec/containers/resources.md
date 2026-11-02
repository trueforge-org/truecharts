---
title: Resources
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/resources#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers.resources`

---

## `workload.podSpec.containers.resources`

The resources that the container can use.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `workload.podSpec.containers.resources` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

---

### `workload.podSpec.containers.resources.excludeExtra`

Exclude non-CPU and memory resource values when rendering this container.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `workload.podSpec.containers.resources.excludeExtra` |
| Type       | `boolean`                                            |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

---

### `workload.podSpec.containers.resources.limits`

The maximum amount of resources that the container can use. Limits are **optional**, can be set to "unlimited" by setting it's values (`cpu` and `memory`) to `0`.

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `workload.podSpec.containers.resources.limits` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | `{"cpu": "1500m", "memory": "2400Mi"}`         |

Example

```yaml
workload:
  podSpec:
    containers:
      resources:
        limits:
          cpu: 1500m
          memory: 2400Mi
```

---

### `workload.podSpec.containers.resources.requests`

The minimum amount of resources that the container needs. Requests are **required**, because without it, kubernetes uses the `limits` as the `requests`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `workload.podSpec.containers.resources.requests` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | `{"cpu": "75m", "memory": "200Mi"}`              |

Example

```yaml
workload:
  podSpec:
    containers:
      resources:
        requests:
          cpu: 75m
          memory: 200Mi
```

---

## Full Examples

```yaml
resources:
  limits:
    cpu: 4000m
    memory: 8Gi
  requests:
    cpu: 10m
    memory: 50Mi
```
