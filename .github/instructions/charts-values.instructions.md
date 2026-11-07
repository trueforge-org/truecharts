---
applyTo: "charts/stable/*/values.yaml,charts/incubator/*/values.yaml,charts/stable/*/ci/**,charts/incubator/*/ci/**"
paths:
  - "charts/stable/*/values.yaml"
  - "charts/incubator/*/values.yaml"
  - "charts/stable/*/ci/**"
  - "charts/incubator/*/ci/**"
description: "Rules for application chart values.yaml and ci values: common schema, images, naming, security, persistence, databases and caches"
---

# Application chart values

These rules apply to `values.yaml` and `ci/*-values.yaml` of application charts. They add to [`charts.instructions.md`](charts.instructions.md) and [`AGENTS.md`](../../AGENTS.md).

- Keep the first line exactly: `# yaml-language-server: $schema=./values.schema.json`. The chart's `values.schema.json` is not committed, and is not added on release or while linting. To use it in your editor, copy `charts/library/common/values.schema.json` to the chart and do not commit it.
- Every key must be valid for the `common` values schema (`charts/library/common/values.schema.json`). CI validates every chart's `values.yaml` against it.
- Only set values that differ from the `common` defaults in `charts/library/common/values.yaml`. Do not copy defaults.
- Images: `image: { repository, pullPolicy: IfNotPresent, tag: <version>@sha256:<digest> }`. Put extra images in `<name>Image` keys (e.g. `postgresImage`) and select them in containers with `imageSelector: <name>Image`.
- The primary workload, container, service and port are named `main`. Keep existing object names, ports, keys and persistence `mountPath`s stable, because renaming them breaks upgrades and needs a **major** bump.
- Keep the restricted security defaults of `common` (see `AGENTS.md` → Security). Relax one (e.g. `runAsUser: 0`, `readOnlyRootFilesystem: false`, an added capability) only when the app requires it, and leave a short comment explaining why.
- Give credentials with `secretKeyRef` to a Secret, never as plain `env` values or in a `configmap`. Plain values are fine for hosts and ports.
- `externalSecret` and `networkPolicy` are available, but do not enable them by default.
- All user data and configuration must be stored on `persistence` volumes and survive restarts and upgrades.
- Most `common` value strings are rendered with `tpl`, so you can reference other values, e.g. `"{{ .Values.service.main.ports.main.port }}"`.
- The app must work without manual config-file editing, with sensible, secure defaults.

## Databases and caches

Use the built-in options of `common`, never Helm chart dependencies or custom deployments. Do not set passwords in the chart values.

- PostgreSQL: enable `dependencies.postgresql` (set `postgresqlUsername` and `postgresqlDatabase` in `depconfig`). It defaults to `mode: operator`, a single CloudNativePG cluster configured in `dependencies.postgresql.operator`. `mode: standalone` merges a plain PostgreSQL server instead.
- Valkey (also for apps that expect Redis) and MariaDB: enable `dependencies.valkey` or `dependencies.mariadb`, and only override what the app needs.
- The connection details are in the `<release>-postgresqlcreds`, `<release>-valkeycreds` and `<release>-mariadbcreds` Secrets, e.g. `postgresql-password`, `valkey-password` or `mariadb-password`. Load credentials from them with `secretKeyRef` and `expandObjectName: false`:

  ```yaml
  env:
    REDIS_HOST: '{{ .Values.dependencies.valkey.depconfig.creds.plainhost | trimAll "\"" }}'
    REDIS_PASSWORD:
      secretKeyRef:
        expandObjectName: false
        name: '{{ printf "%s-%s" .Release.Name "valkeycreds" }}'
        key: valkey-password
  ```

- The same details are in `.Values.dependencies.<name>.depconfig.creds`, as quoted strings. Only use the host and port from there, with `| trimAll "\""`.
- The top-level `redis`, `valkey`, `mariadb` and `cnpg` keys fail rendering when enabled. MongoDB, Solr, ClickHouse and Memcached are no longer available. See `charts/library/common/docs/dependencies/index.md`.
