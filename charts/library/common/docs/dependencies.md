---
title: Dependencies
---

:::note

- This page documents the new dependencies feature that replaces helm-dependencies.
- Dependencies allow you to include complete chart values.yaml structures within your chart.
- Each dependency is merged into the main chart with prefixed resource names to avoid conflicts.

:::

## Appears in

- `.Values.dependencies`

---

## `dependencies`

Configuration for chart dependencies. Each dependency should contain a complete chart values.yaml structure. Resources from dependencies are automatically merged into the main chart with prefixed names (e.g., `valkey-main` for a dependency named `valkey` with a workload named `main`).

| Field      | Value           |
| ---------- | --------------- |
| Key        | `dependencies`  |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | `{}`            |

Example:

```yaml
dependencies:
  valkey:
    enabled: true
    image:
      repository: docker.io/bitnamisecure/valkey
      tag: latest
    workload:
      main:
        enabled: true
        type: StatefulSet
        podSpec:
          containers:
            main:
              enabled: true
              primary: true
              env:
                REDIS_PASSWORD: "my-password"
    service:
      main:
        enabled: true
        ports:
          main:
            enabled: true
            port: 6379
    persistence:
      data:
        enabled: true
        mountPath: /data
```

---

### `dependencies.$name.enabled`

Enable or disable the dependency.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `dependencies.$name.enabled` |
| Type       | `boolean`                    |
| Required   | ✅                           |
| Helm `tpl` | ✅                           |
| Default    | unset                        |

---

## How Dependencies Work

1. **Complete Chart Values**: Each dependency under `dependencies.$name` should contain a complete chart values.yaml structure with all the resources it needs (workload, service, configmap, etc.)

2. **Resource Merging**: When a dependency is enabled, its resources are merged into the main chart:
   - `workload.main` becomes `workload.$name-main`
   - `service.main` becomes `service.$name-main`
   - `configmap.config` becomes `configmap.$name-config`
   - etc.

3. **Automatic Init Containers**: The common chart automatically detects dependency services (like valkey) and creates appropriate init containers to wait for them to be ready.

4. **Connection Information**: Connection details for dependencies are automatically included in the chart notes.

---

## Full Examples

### Valkey Dependency

```yaml
dependencies:
  valkey:
    enabled: true
    image:
      repository: docker.io/bitnamisecure/valkey
      pullPolicy: IfNotPresent
      tag: latest
    workload:
      main:
        enabled: true
        replicas: 1
        type: StatefulSet
        podSpec:
          containers:
            main:
              enabled: true
              primary: true
              env:
                REDIS_REPLICATION_MODE: master
                ALLOW_EMPTY_PASSWORD: "yes"
                REDIS_PORT: "6379"
                REDIS_PASSWORD: "secure-password"
              probes:
                liveness:
                  enabled: true
                  type: exec
                  command:
                    - sh
                    - -c
                    - /health/ping_liveness_local.sh 2
    service:
      main:
        enabled: true
        ports:
          main:
            enabled: true
            port: 6379
            targetPort: 6379
    volumeClaimTemplates:
      data:
        enabled: true
        accessModes:
          - ReadWriteOnce
        mountPath: "/bitnami/valkey"
```

---

## Differences from Helm Dependencies

This dependencies feature differs from traditional helm chart dependencies:

1. **No Separate Charts**: Dependencies are defined inline in values.yaml, not as separate helm charts in Chart.yaml
2. **Name Prefixing**: All resources get prefixed with the dependency name to avoid conflicts
3. **Single Release**: Everything is deployed as a single helm release
4. **Easier Configuration**: No need to manage separate chart repositories or versions
5. **Automatic Integration**: Init containers and connection information are automatically handled

---

## Notes

- Dependencies replace the traditional helm-dependencies mechanism
- Each dependency can contain any valid chart values.yaml structure
- Resource names are automatically prefixed to prevent naming conflicts
- The `enabled` flag is automatically added to resources if not present
- Init containers are automatically created to wait for dependency services to be ready
- Connection information is automatically included in chart notes

