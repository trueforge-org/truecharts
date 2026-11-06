---
title: Env From
---

:::note

- See the [Full Examples](/truecharts-common/workload/podSpec/containers/envFrom#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver.container.envFrom`
- `.Values.addons.gluetun.container.envFrom`
- `.Values.addons.netshoot.container.envFrom`
- `.Values.addons.tailscale.container.envFrom`
- `.Values.workload.$name.podSpec.containers.$name.envFrom`
- `.Values.workload.$name.podSpec.initContainers.$name.envFrom`

---

## `envFrom`

ConfigMaps and Secrets whose keys all become environment variables of the container. See [envFrom](/truecharts-common/workload/podSpec/containers/envFrom).

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A ConfigMap or Secret to load the environment variables from. Set one of `configMapRef` or `secretRef`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envFrom[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMapRef`

A ConfigMap whose keys become environment variables.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envFrom[].configMapRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMapRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a ConfigMap of this chart. Set to `false` to use an existing ConfigMap.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envFrom[].configMapRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].configMapRef.name`

Name of the ConfigMap. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envFrom[].configMapRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].secretRef`

A Secret whose keys become environment variables.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envFrom[].secretRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].secretRef.name`

Name of the Secret. Expanded to `<fullname>-<name>` unless `expandObjectName` is `false`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envFrom[].secretRef.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].secretRef.expandObjectName`

Whether the name is expanded to `<fullname>-<name>`, the name of a Secret of this chart. Set to `false` to use an existing Secret.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.containers.$name.envFrom[].secretRef.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

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
          envFrom:
            - secretRef:
                # This will be expanded to `fullname-secret-name`
                name: secret-name
            - configMapRef:
                name: configmap-name
                expandObjectName: false
```
