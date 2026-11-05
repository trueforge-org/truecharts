---
title: resources
---

:::note

- Examples under each key are only to be used as a placement guide

:::

## Appears in

- `.Values.addons.codeserver.container.resources`
- `.Values.addons.gluetun.container.resources`
- `.Values.addons.netshoot.container.resources`

---

## `resources`

Resources of the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `limits`

Maximum amount of resources the container can use. Limits are **optional**. Set `cpu` and `memory` to `0` to remove them.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.limits` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"cpu": "1500m", "memory": "2400Mi"}` |

---

## `limits.cpu`

Maximum CPU the container can use, in cores or millicores.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.limits.cpu` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"1500m"` |

Example

```yaml
addons:
  codeserver:
    container:
      resources:
        limits:
          cpu: 1500m
```

---

## `limits.memory`

Maximum memory the container can use. The container is killed when it uses more.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.limits.memory` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"2400Mi"` |

Example

```yaml
addons:
  codeserver:
    container:
      resources:
        limits:
          memory: 2Gi
```

---

## `limits.$name`

Extended resource quantity, keyed by resource name (for example `nvidia.com/gpu`). Rendered as-is.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.limits.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `requests`

Minimum amount of resources the container needs, which the scheduler reserves on a node. Requests are **required**, because without them Kubernetes uses the `limits` as the `requests`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.requests` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{"cpu": "75m", "memory": "200Mi"}` |

---

## `requests.cpu`

CPU the scheduler reserves for the container, in cores or millicores.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.requests.cpu` |
| Type | `string or number` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"75m"` |

Example

```yaml
addons:
  codeserver:
    container:
      resources:
        requests:
          cpu: 100m
```

---

## `requests.memory`

Memory the scheduler reserves for the container.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.requests.memory` |
| Type | `string or number` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"200Mi"` |

Example

```yaml
addons:
  codeserver:
    container:
      resources:
        requests:
          memory: 256Mi
```

---

## `requests.$name`

Extended resource quantity, keyed by resource name (for example `ephemeral-storage`). Rendered as-is.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.requests.$name` |
| Type | `string or number` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `excludeExtra`

Leave out the extra resources (for example GPUs) that common adds to this container, so only `cpu` and `memory` are rendered.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.resources.excludeExtra` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
