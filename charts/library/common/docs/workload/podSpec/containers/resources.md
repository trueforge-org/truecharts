---
title: Resources
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/resources#full-examples) section for complete examples.

:::

## Appears in

- `.Values.resources`
- `.Values.addons.codeserver.container.resources`
- `.Values.addons.gluetun.container.resources`
- `.Values.addons.netshoot.container.resources`
- `.Values.addons.tailscale.container.resources`
- `.Values.cnpg.$name.cluster.resources`
- `.Values.workload.$name.podSpec.containers.$name.resources`
- `.Values.workload.$name.podSpec.initContainers.$name.resources`

---

## `resources`

CPU, memory and extended resources of the container. Overrides the top-level `resources` for this container. See [resources](/truecharts-common/workload/podSpec/containers/resources).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `limits`

Maximum amount of resources the container can use. Limits are **optional**. Set `cpu` and `memory` to `0` to remove them.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources.limits` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"cpu": "1500m", "memory": "2400Mi"}` |

---

## `limits.cpu`

Maximum CPU the container can use, in cores or millicores.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources.limits.cpu` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"1500m"` |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          resources:
            limits:
              cpu: 1500m
```

---

## `limits.memory`

Maximum memory the container can use. The container is killed when it uses more.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources.limits.memory` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"2400Mi"` |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          resources:
            limits:
              memory: 2Gi
```

---

## `limits.$name`

Extended resource quantity, keyed by resource name (for example `nvidia.com/gpu`). Rendered as-is.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources.limits.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requests`

Minimum amount of resources the container needs, which the scheduler reserves on a node. Requests are **required**, because without them Kubernetes uses the `limits` as the `requests`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources.requests` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{"cpu": "75m", "memory": "200Mi"}` |

---

## `requests.cpu`

CPU the scheduler reserves for the container, in cores or millicores.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources.requests.cpu` |
| Type | `string or number` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"75m"` |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          resources:
            requests:
              cpu: 100m
```

---

## `requests.memory`

Memory the scheduler reserves for the container.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources.requests.memory` |
| Type | `string or number` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"200Mi"` |

Example

```yaml
workload:
  example:
    podSpec:
      containers:
        example:
          resources:
            requests:
              memory: 256Mi
```

---

## `requests.$name`

Extended resource quantity, keyed by resource name (for example `ephemeral-storage`). Rendered as-is.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources.requests.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `excludeExtra`

Leave out the extra resources (for example GPUs) that common adds to this container, so only `cpu` and `memory` are rendered.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.resources.excludeExtra` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Defaults for all containers

Set on the root of the values, applies to every container that does not set its own resources:

```yaml
resources:
  limits:
    cpu: 1500m
    memory: 2400Mi
  requests:
    cpu: 75m
    memory: 200Mi
```

### Resources of one container

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          resources:
            limits:
              cpu: 4000m
              memory: 8Gi
            requests:
              cpu: 500m
              memory: 1Gi
```

### Extra resources

Any other resource can be added to `limits` and `requests`, for example a GPU:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          resources:
            limits:
              cpu: 2000m
              memory: 4Gi
              nvidia.com/gpu: 1
            requests:
              cpu: 200m
              memory: 512Mi
```

### Leave out the extra resources

`excludeExtra` leaves out the extra resources of the chart, like GPUs, for this container only. It is useful for sidecars that should not claim a GPU:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
        sidecar:
          enabled: true
          imageSelector: image
          resources:
            excludeExtra: true
            requests:
              cpu: 10m
              memory: 50Mi
```
