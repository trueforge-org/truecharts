---
title: Envfrom
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/workload/podSpec/containers/envFrom#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.podSpec.containers.envFrom`

---

## `workload.podSpec.containers.envFrom`

Define envFrom for the container

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `workload.podSpec.containers.envFrom` |
| Type       | `list of map`                         |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

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
