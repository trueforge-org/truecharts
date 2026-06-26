---
title: Dependencies
---

:::note

- This page documents the new dependencies feature that replaces helm-dependencies.
- Dependencies allow you to include complete chart values.yaml structures within your chart.
- Each dependency is merged into the main chart with prefixed resource names to avoid conflicts.
- Dependency configuration (credentials, passwords, etc.) is stored under `depconfig` and not merged.

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
    depconfig:
      password: "my-password"
      # Generated credentials available at:
      # .Values.dependencies.valkey.depconfig.creds.url
      # .Values.dependencies.valkey.depconfig.creds.redis-password
      # .Values.dependencies.valkey.depconfig.creds.plainhost
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
                REDIS_PASSWORD: "{{ .Values.dependencies.valkey.depconfig.password }}"
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

### `dependencies.$name.depconfig`

Configuration specific to the dependency that should NOT be merged into the main values tree. This includes:
- Input configuration (like passwords)
- Generated credentials
- Any other metadata about the dependency

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.$name.depconfig` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `{}`                           |

Example:

```yaml
dependencies:
  valkey:
    enabled: true
    depconfig:
      password: "secure-password"
      # After initialization, credentials are available:
      # .Values.dependencies.valkey.depconfig.creds.url
      # .Values.dependencies.valkey.depconfig.creds.redis-password
      # .Values.dependencies.valkey.depconfig.creds.plainhost
      # .Values.dependencies.valkey.depconfig.creds.plainporthost
      # .Values.dependencies.valkey.depconfig.creds.plainhostpass
```

---

## How Dependencies Work

1. **Complete Chart Values**: Each dependency under `dependencies.$name` should contain a complete chart values.yaml structure with all the resources it needs (workload, service, configmap, etc.)

2. **Depconfig Exclusion**: The `depconfig` subdict is NOT merged into main values. It contains dependency-specific configuration and generated credentials.

3. **Universal Resource Prefixing**: When a dependency is enabled, ALL its resources (except excluded keys) are merged into the main chart with prefixed names:
   - **Prefixed**: workload, service, configmap, secret, persistence, volumeClaimTemplates, podDisruptionBudget, hpa, vpa, ingress, route, gateway, certificate, serviceAccount, rbac, networkPolicy, storageClass, and any other resource type
   - **Excluded from prefixing**: global, securityContext, podOptions, enabled, depconfig, image (handled specially), chartContext, fallbackDefaults, notes, operator
   - Examples:
     - `workload.main` → `workload.$name-main`
     - `service.main` → `service.$name-main`
     - `configmap.config` → `configmap.$name-config`
     - `volumeClaimTemplates.data` → `volumeClaimTemplates.$name-data`
     - Any new resource type automatically gets prefixed

4. **Image Handling**: The `image` key is handled specially - instead of prefixing resources within it, the key itself is prefixed to `$nameImage` (e.g., `valkeyImage`)

5. **Automatic Init Containers**: The common chart automatically detects dependency services (like valkey) and creates appropriate init containers to wait for them to be ready.

6. **Connection Information**: Connection details for dependencies are automatically included in the chart notes.

7. **Credential Generation**: For database-like dependencies (valkey, mariadb, mongodb, etc.), credentials are automatically generated and stored in `depconfig.creds`.

---

## Full Examples

### Valkey Dependency

```yaml
dependencies:
  valkey:
    enabled: true
    depconfig:
      password: "secure-password"
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
                ALLOW_EMPTY_PASSWORD: "no"
                REDIS_PORT: "6379"
                REDIS_PASSWORD: "{{ .Values.dependencies.valkey.depconfig.password }}"
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

# In your main workload, access credentials:
workload:
  main:
    podSpec:
      containers:
        main:
          env:
            REDIS_URL: "{{ .Values.dependencies.valkey.depconfig.creds.url }}"
            REDIS_HOST: "{{ .Values.dependencies.valkey.depconfig.creds.plainhost }}"
            REDIS_PASSWORD: "{{ .Values.dependencies.valkey.depconfig.password }}"
```

---

## Differences from Helm Dependencies

This dependencies feature differs from traditional helm chart dependencies:

1. **No Separate Charts**: Dependencies are defined inline in values.yaml, not as separate helm charts in Chart.yaml
2. **Name Prefixing**: All resources get prefixed with the dependency name to avoid conflicts
3. **Single Release**: Everything is deployed as a single helm release
4. **Easier Configuration**: No need to manage separate chart repositories or versions
5. **Automatic Integration**: Init containers and connection information are automatically handled
6. **Depconfig Structure**: Configuration and credentials are stored in `depconfig` subdict and not merged

---

## Notes

- Dependencies replace the traditional helm-dependencies mechanism
- Each dependency can contain any valid chart values.yaml structure
- ALL resource types are automatically prefixed to prevent naming conflicts (except excluded keys like global, depconfig, etc.)
- New resource types automatically work without code changes - they just get prefixed
- The `enabled` flag is automatically added to resources if not present
- Init containers are automatically created to wait for dependency services to be ready
- Connection information is automatically included in chart notes
- Configuration and credentials are stored under `depconfig` and accessible via `.Values.dependencies.$name.depconfig`
- Credentials for database dependencies are automatically generated and stored in `depconfig.creds`

