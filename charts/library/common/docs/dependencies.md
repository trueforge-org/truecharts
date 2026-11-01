---
title: Dependencies
---

:::note

- Dependencies replace helm-dependencies (sub charts) for the services an app needs, like a Valkey cache.
- Each dependency is a complete chart values structure (`workload`, `service`, `persistence`, ...) defined inline under `dependencies.$name`.
- The objects of a dependency are merged into the chart under the name `$name-$object` and all references between them are rewritten, so they never conflict with the objects of the chart.
- Configuration of the dependency itself (password, generated credentials) lives under `depconfig` and is never merged.

:::

## Appears in

- `.Values.dependencies`

---

## `dependencies`

Configuration for chart dependencies. Each key is the name of a dependency and contains a chart values structure, which is merged on top of the defaults of the same name in the common library.
The `valkey`, `mariadb` and `clickhouse` dependencies are predefined in common with `enabled: false` and their full specification, so a chart only needs to enable them and set its overrides.

| Field      | Value          |
| ---------- | -------------- |
| Key        | `dependencies` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | `{clickhouse: {enabled: false, ...}, mariadb: {enabled: false, ...}, valkey: {enabled: false, ...}}` (see `dependencies.clickhouse`, `dependencies.mariadb` and `dependencies.valkey` in `values.yaml`) |

Example:

```yaml
dependencies:
  valkey:
    enabled: true
    depconfig:
      password: "my-password"
    image:
      repository: oci.trueforge.org/containerforge/valkey
      tag: 9.0.4
    workload:
      main:
        type: StatefulSet
        podSpec:
          containers:
            main:
              env:
                VALKEY_PASSWORD:
                  secretKeyRef:
                    expandObjectName: false
                    name: '{{ printf "%s-%s" .Release.Name "valkeycreds" }}'
                    key: valkey-password
    service:
      main:
        ports:
          main:
            protocol: tcp
            port: 6379
    persistence:
      data:
        type: vct
        mountPath: /config

```

---

### `dependencies.$name`

The name of the dependency is used as the prefix of its objects, so it must be a valid DNS label (lowercase alphanumeric characters or `-`, starting and ending with an alphanumeric character).

Besides `enabled` and `depconfig`, the dependency accepts the same keys as the chart values. They are handled as follows:

| Keys                                                                                                                                           | Handling                                                                                                                                                     |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `workload`, `service`, `persistence`, `configmap`, `secret`, `serviceAccount`, `rbac`, `ingress`, `route`, `hpa`, `metrics`, ... (any object collection) | Each object is added to the chart as `$name-$object` (eg `workload.valkey-main`). Fails if an object with that name already exists in the chart.            |
| `image`, `*Image`                                                                                                                              | Added to the chart as `$nameImage` and `$name<Foo>Image` (eg `valkeyImage`, `valkeyClientImage` for `clientImage`). Containers are pointed to them. A container selecting `image` fails if the dependency defines none, a dependency never falls back to the main image of the chart. Other images of the chart can be selected explicitly (eg `imageSelector: someImage`). |
| `securityContext`, `podOptions`, `resources`                                                                                                   | Applied as defaults to the pods and containers of the dependency only, the same way the chart-level keys apply to the chart.                                  |
| `global`, `chartContext`, `notes`, `operator`, `fallbackDefaults`, `TZ`, `namespace`, `diagnosticMode`, `containerOptions`                     | Ignored. These apply to the whole release and are taken from the chart.                                                                                      |
| `addons`                                                                                                                                       | Applied to the workloads of the dependency, see [Addons](#addons).                                                                                           |
| `dependencies`, `configMapsFromFolder`, `extraTpl`, `ingressMiddlewares`, `mariadb`, `mongodb`, `clickhouse`, `solr`                 | Not supported, rendering fails.                                                                                                                              |
| Any other key                                                                                                                                  | Kept as is and available to templates under `.Values.dependencies.$name.$key`.                                                                               |

---

### `dependencies.$name.enabled`

Enable or disable the dependency. Objects of disabled dependencies are not merged.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `dependencies.$name.enabled` |
| Type       | `boolean`                    |
| Required   | ✅                           |
| Helm `tpl` | ✅                           |
| Default    | unset                        |

---

### `dependencies.$name.depconfig`

Configuration of the dependency itself. It is never merged into the chart values and can be referenced by templates under `.Values.dependencies.$name.depconfig`.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.$name.depconfig` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `{}`                           |

---

### `dependencies.$name.depconfig.password`

Password of the dependency, used by the dependencies with additional handling (see [ClickHouse](#clickhouse), [MariaDB](#mariadb) and [Valkey](#valkey)).

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.$name.depconfig.password` |
| Type       | `string`                                |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `PLACEHOLDERPASSWORD`                   |

---

### `dependencies.$name.depconfig.creds`

Connection details, populated by the dependencies with additional handling (see [ClickHouse](#clickhouse), [MariaDB](#mariadb) and [Valkey](#valkey)). Read-only.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.$name.depconfig.creds` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | `{}`                                 |

---

## How Dependencies Work

### Defaults

Objects of a dependency inherit the defaults of the object with the same name in the common library, exactly like the objects of a chart do.
For example `workload.main` of a dependency inherits `type: Deployment`, the `main` container with `imageSelector: image` and its default probes,
and `service.main` inherits its `main` port with `protocol: http`.

The `enabled`, `primary`, `targetSelector` and `dbWait` keys are not inherited, they are resolved within the dependency.
Objects without an `enabled` key default to `enabled: true`, even if the object is disabled by default in common (eg `ingress.main`).

The default probes of common target `service.main.ports.main`. Within a dependency they are pointed to `dependencies.$name.service.main.ports.main`.
If the dependency has no `service.main.ports.main`, the default probes are disabled instead.

The workloads of a dependency default to `dbWait: false`, so they do not wait for the dependencies of the chart (including themselves).

### Primary Objects

Within a dependency, the primary objects are resolved as follows: the object with `primary: true`, otherwise the only object of the collection, otherwise the object named `main`.
This applies to workloads, their containers, services, their ports and serviceAccounts.


In the chart, the objects of a dependency are marked with the name of their dependency (`dependency: valkey`) and are **not** primary (`primary: false`), unless they explicitly set `primary: true`.
Marked objects that are not primary do not take part in the primary validation of the chart, so a chart does not need a primary object of its own in a collection that only has objects of dependencies.
The primary workload, service, ingress, etc. of the release stay the ones of the chart, and their names are not affected by the dependency
(eg the Service of the chart is still named `$fullname`, the one of the dependency `$fullname-valkey-main`).

#### Primary Objects of a Dependency

An object of a dependency with an explicit `primary: true` becomes the primary object of the release, the same as the object would in the chart.
It is named `$fullname` instead of `$fullname-$name-$object`, and is used wherever the chart looks for its primary object (notes, chart context, the credentials of `valkey`, ...).
This works for every collection that has a primary object (`workload`, `service`, `serviceAccount`, `rbac`, `ingress`, `route`, `gateway`, `gatewayClass`, `networkpolicy`, `metrics`, `cnpg`, ...), and only objects that are set explicitly are primary.
Being the primary object within the dependency (the only object, or the one named `main`) does not make it the primary object of the release.

The usual rules apply, so there can only be one primary object per collection in the release, across the chart and all dependencies.
To run a release without a workload of its own, disable the `main` objects of the chart and set the objects of the dependency to primary:

```yaml
workload:
  main:
    enabled: false
service:
  main:
    enabled: false

dependencies:
  valkey:
    enabled: true
    workload:
      main:
        primary: true
    service:
      main:
        primary: true
```

This renders a `StatefulSet` and a `Service` named `$fullname`, and nothing else besides the objects of the dependency itself.

3. **Universal Resource Prefixing**: When a dependency is enabled, ALL its resources (except excluded keys) are merged into the main chart with prefixed names:
   - **Prefixed**: workload, service, configmap, secret, persistence, podDisruptionBudget, hpa, vpa, ingress, route, gateway, certificate, serviceAccount, rbac, networkPolicy, storageClass, and any other resource type
   - **Excluded from prefixing**: global, securityContext, podOptions, enabled, depconfig, image (handled specially), chartContext, fallbackDefaults, notes, operator
   - Examples:
     - `workload.main` → `workload.$name-main`
     - `service.main` → `service.$name-main`
     - `configmap.config` → `configmap.$name-config`
     - `persistence.data` → `persistence.$name-data`
     - Any new resource type automatically gets prefixed


### References

All references to other objects are rewritten to the prefixed names, when the referenced object is defined within the dependency.
A reference to an object that is not defined in the dependency is kept as is, which means it points to the object of the chart.



6. **Persistent Data**: Add a `persistence` entry for any data that has to survive a restart. Without one, the data is on the container filesystem and is lost with the pod. The `mountPath` has to be where the image stores its data, which is `/config` for the default Valkey image. A top-level `volumeClaimTemplates` key is not used, and fails rendering.

7. **Connection Information**: Connection details for dependencies are automatically included in the chart notes.


| Object                                   | Reference                                                    | Default                                                         |
| ---------------------------------------- | ------------------------------------------------------------ | --------------------------------------------------------------- |
| `service`                                | `targetSelector` → workload                                  | primary workload of the dependency                              |
| `persistence`                            | `targetSelector` → workloads and containers                  | primary workload and container of the dependency                |
| `persistence` (`configmap`, `secret`)    | `objectName` → configmap or secret                           | -                                                               |
| `persistence` (`volsync`)                | `credentials` → credentials                                  | -                                                               |
| `serviceAccount`, `imagePullSecret`      | `targetSelector` → workloads                                 | primary workload of the dependency                              |
| `rbac`                                   | `serviceAccounts` → serviceAccounts                          | primary serviceAccount of the dependency                        |
| `ingress`                                | `targetSelector` → service and port                          | primary service and port of the dependency                      |
| `route`                                  | `targetSelector`, `parentRefs[].targetSelector` → gateway    | -                                                               |
| `route`                                  | `rules[].backendRefs[].targetSelector` → service             | primary service of the dependency                               |
| `gateway`                                | `targetSelector` → gatewayClass                              | -                                                               |
| `hpa`, `vpa`                             | `targetSelector` → workloads                                 | all workloads of the dependency                                 |
| `podDisruptionBudget`, `networkpolicy`   | `targetSelector` → workload                                  | primary workload of the dependency                              |
| `metrics`                                | `targetSelector` → service (or workload for `podmonitor`)    | primary service (or workload) of the dependency                 |
| `cnpg`                                   | `backups.credentials`, `recovery.credentials` → credentials  | -                                                               |
| containers                               | `imageSelector` → image                                      | `image` of the dependency (required, unless another image is selected)  |
| containers                               | `env.*.configMapKeyRef`, `env.*.secretKeyRef`, `envFrom[]`   | -                                                               |

The `targetSelector` of service ports points to a container name and is not rewritten.

### Templating

Templates within the dependency can reference its own values under `.Values.dependencies.$name`, which is normalized the same way (defaults applied, primaries set).
For example the password: `"{{ .Values.dependencies.valkey.depconfig.password }}"`.

### Addons

The addons `codeserver`, `gluetun`, `netshoot` and `tailscale` can be enabled per dependency, under `dependencies.$name.addons`.
They use the same keys as the [addons of the chart](/truecharts-common/addons), and are applied to the workloads of the dependency.

```yaml
dependencies:
  valkey:
    enabled: true
    addons:
      netshoot:
        enabled: true
```

- The addons inherit the defaults of the common library, **not** the addons configured on the chart. The same addon can be configured differently on the chart and on each dependency.
- `enabled` supports `tpl`. Addons that are not enabled are ignored.
- Without a `targetSelector`, an addon targets the primary workload of the dependency (see [Primary Objects](#primary-objects)).
  A `targetSelector` must list workloads of the dependency, otherwise rendering fails. This also applies to the `[main]` default of `gluetun` and `tailscale`.
- The containers, services, ingresses, persistence and secrets of an addon are added to the dependency, and are merged and prefixed with `$name-` like its other objects
  (eg the secret `vpn-conf` of `gluetun` becomes `$name-gluetun-vpn-conf`).
- The objects of an addon never become the primary ones of the dependency. The primary container and service stay the ones the dependency would have without the addon.
  This includes the `codeserver` service and ingress, which are not primary either.
- The addon images (`netshootImage`, `gluetunImage`, `tailscaleImage`, `codeserverImage`) default to the ones of the chart. A dependency can use another image by defining the image itself (eg `dependencies.valkey.netshootImage`).
- The notes only list the connection details of the addons of the chart, not the ones of its dependencies.

---

## ClickHouse

The `clickhouse` dependency has additional handling:

- A secret named `$releaseName-clickhousecreds` is created with the connection details, and the same details are available under `.Values.dependencies.clickhouse.depconfig.creds`:

  | Key                   | `creds` key          | Example                                           |
  | --------------------- | -------------------- | ------------------------------------------------- |
  | `clickhouse-password` | `clickhousePassword` | `my-password`                                     |
  | `plainhost`           | `plain`, `plainhost` | `myapp-clickhouse-main`                           |
  | -                     | `plainport`          | `8123`                                            |
  | `plainporthost`       | `plainporthost`      | `myapp-clickhouse-main:8123`                      |
  | `ping`                | `ping`               | `http://myapp-clickhouse-main:8123/ping`          |
  | `url`                 | `complete`           | `http://test:my-password@myapp-clickhouse-main:8123/test` |
  | `jdbc`                | `jdbc`               | `jdbc:ch://myapp-clickhouse-main:8123/test`       |

  The host and port are the ones of the primary service and port of the dependency, and the URLs use the HTTP interface.
  Like the `creds` of the other dependencies, the values are quoted strings, use `| trimAll "\""` when templating them.
- An init container `clickhouse-wait` is added to the workloads of the chart (the ones with `dbWait` not set to `false`), waiting for the `/ping` endpoint of ClickHouse to respond.
- The connection details are included in the notes.

The `depconfig` of the dependency accepts:

| Key                                 | Default               | Description                                                       |
| ----------------------------------- | --------------------- | ----------------------------------------------------------------- |
| `password`                          | `PLACEHOLDERPASSWORD` | Password of the database user                                     |
| `clickhouseUsername`                | `test`                | Name of the database user                                         |
| `clickhouseDatabase`                | `test`                | Name of the database                                              |
| `clickhouseDefaultAccessManagement` | `0`                   | Set to `1` to allow the user to manage users and grants with SQL  |

The password is applied again on every start, so it can be changed later.
The database is only created when the volume is empty, so changing `clickhouseDatabase` later does not create a new database.
The `url` value does not escape the password, so avoid characters like `@`, `:` and `/` when an app uses it.

The dependency runs the upstream `docker.io/clickhouse/clickhouse-server` image as a `StatefulSet` with one replica, as UID and GID `568`.
Its data is stored in the `data` volume, mounted at `/var/lib/clickhouse`.

### Moving from the `clickhouse` chart dependency

Enabling the top-level `clickhouse` key fails with a message pointing to `dependencies.clickhouse`.
Move `enabled` to `dependencies.clickhouse`, and `clickhouseUsername`, `clickhouseDatabase` and `password` to `dependencies.clickhouse.depconfig`.
In values and templates of the chart, replace `.Values.clickhouse.creds` with `.Values.dependencies.clickhouse.depconfig.creds`.
The name of the secret stays `$releaseName-clickhousecreds`.

The data is **not** moved. The dependency uses a new volume, and the old chart used another workload with its own volume.
Back up the data before upgrading, and restore it after the upgrade.

### Example

The full specification of the `clickhouse` dependency (image, workload, service, persistence and probes) is part of the defaults of common.
A chart only enables it and sets the values it needs to override:

```yaml
image:
  repository: ghcr.io/example/app
  tag: latest

workload:
  main:
    podSpec:
      containers:
        main:
          env:
            CLICKHOUSE_HOST: '{{ .Values.dependencies.clickhouse.depconfig.creds.plainhost | trimAll "\"" }}'
            CLICKHOUSE_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "clickhousecreds" }}'
                key: url
            CLICKHOUSE_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "clickhousecreds" }}'
                key: clickhouse-password

dependencies:
  clickhouse:
    enabled: true
    depconfig:
      password: "secure-password"
      clickhouseUsername: myapp
      clickhouseDatabase: myapp
```

This renders, among others:

- `Deployment` `myapp` with the `clickhouse-wait` init container
- `StatefulSet` `myapp-clickhouse-main` with the `data` volume mounted at `/var/lib/clickhouse`
- `Service` `myapp-clickhouse-main` on port 8123
- `PersistentVolumeClaim` `myapp-clickhouse-data`
- `Secret` `myapp-clickhousecreds`

---

## MariaDB

The `mariadb` dependency has additional handling:

- A secret named `$releaseName-mariadbcreds` is created with the connection details, and the same details are available under `.Values.dependencies.mariadb.depconfig.creds`:

  | Key                     | `creds` key        | Example                                                              |
  | ----------------------- | ------------------ | -------------------------------------------------------------------- |
  | `mariadb-password`      | `mariadbPassword`  | `my-password`                                                        |
  | `mariadb-root-password` | `mariadbRootPassword` | `my-root-password`                                                |
  | `plainhost`             | `plain`, `plainhost` | `myapp-mariadb-main`                                               |
  | -                       | `plainport`        | `3306`                                                               |
  | `plainporthost`         | `plainporthost`    | `myapp-mariadb-main:3306`                                            |
  | `url`                   | `complete`         | `mysql://test:my-password@myapp-mariadb-main:3306/test`              |
  | `urlnossl`              | `urlnossl`         | `mysql://test:my-password@myapp-mariadb-main:3306/test?sslmode=disable` |
  | `jdbc`                  | `jdbc`             | `jdbc:mariadb://myapp-mariadb-main:3306/test`                        |
  | `jdbc-mysql`            | `jdbcmysql`        | `jdbc:mysql://myapp-mariadb-main:3306/test`                          |
  | `jdbc-mariadb`          | `jdbcmariadb`      | `jdbc:mariadb://myapp-mariadb-main:3306/test`                        |

  The host and port are the ones of the primary service and port of the dependency.
  Like the `creds` of the other dependencies, the values are quoted strings, use `| trimAll "\""` when templating them.
- An init container `mariadb-wait` is added to the workloads of the chart (the ones with `dbWait` not set to `false`), waiting for MariaDB to respond.
- The connection details are included in the notes.

The `depconfig` of the dependency accepts:

| Key               | Default                   | Description                         |
| ----------------- | ------------------------- | ----------------------------------- |
| `password`        | `PLACEHOLDERPASSWORD`     | Password of the database user       |
| `rootPassword`    | `PLACEHOLDERROOTPASSWORD` | Password of the `root` user         |
| `mariadbUsername` | `test`                    | Name of the database user           |
| `mariadbDatabase` | `test`                    | Name of the database                |

Both passwords need at least 4 characters, and are applied again on every start, so they can be changed later.
The `url` and `urlnossl` values do not escape the password, so avoid characters like `@`, `:` and `/` when an app uses those.

The dependency runs `oci.trueforge.org/containerforge/mariadb` as a `StatefulSet` with one replica, as UID and GID `568` with a read-only root filesystem.
Its data is stored in the `data` volume, mounted at `/config` (databases in `/config/databases`, settings in `/config/custom.cnf`).

### Moving from the `mariadb` chart dependency

Enabling the top-level `mariadb` key fails with a message pointing to `dependencies.mariadb`.
Move `enabled` to `dependencies.mariadb`, and `mariadbUsername`, `mariadbDatabase`, `password` and `rootPassword` to `dependencies.mariadb.depconfig`.
In values and templates of the chart, replace `.Values.mariadb.creds` with `.Values.dependencies.mariadb.depconfig.creds`.
The name of the secret stays `$releaseName-mariadbcreds`.

The data is **not** moved. The dependency uses a new volume, and the old chart used another image with another data layout.
Back up the database with `mariadb-dump` before upgrading, and restore it after the upgrade.

### Example

The full specification of the `mariadb` dependency (image, workload, service, persistence and probes) is part of the defaults of common.
A chart only enables it and sets the values it needs to override:

```yaml
image:
  repository: ghcr.io/example/app
  tag: latest

workload:
  main:
    podSpec:
      containers:
        main:
          env:
            DATABASE_HOST: '{{ .Values.dependencies.mariadb.depconfig.creds.plainhost | trimAll "\"" }}'
            DATABASE_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "mariadbcreds" }}'
                key: url
            DATABASE_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "mariadbcreds" }}'
                key: mariadb-password

dependencies:
  mariadb:
    enabled: true
    depconfig:
      password: "secure-password"
      rootPassword: "secure-root-password"
      mariadbUsername: myapp
      mariadbDatabase: myapp
```

This renders, among others:

- `Deployment` `myapp` with the `mariadb-wait` init container
- `StatefulSet` `myapp-mariadb-main` with the `data` volume mounted at `/config`
- `Service` `myapp-mariadb-main` on port 3306
- `PersistentVolumeClaim` `myapp-mariadb-data`
- `Secret` `myapp-mariadbcreds`

---

## Valkey

The `valkey` dependency has additional handling:

- A secret named `$releaseName-valkeycreds` is created with the connection details, and the same details are available under `.Values.dependencies.valkey.depconfig.creds`:

  | Key               | Example                                            |
  | ----------------- | -------------------------------------------------- |
  | `valkey-password` | `my-password`                                      |
  | `plain`           | `myapp-valkey-main`                                |
  | `plainhost`       | `myapp-valkey-main`                                |
  | `plainport`       | `6379`                                             |
  | `plainporthost`   | `myapp-valkey-main:6379`                           |
  | `plainhostpass`   | `myapp-valkey-main:my-password`                    |
  | `url`             | `redis://default:my-password@myapp-valkey-main:6379/0`    |

  The host and port are the ones of the primary service and port of the dependency.
  Like the `creds` of the other dependencies, the values are quoted strings, use `| trimAll "\""` when templating them.
- `valkey-password`, `url` and `plainhostpass` are credentials (or contain them), so they must be loaded into the environment from this secret with `secretKeyRef` (with `expandObjectName: false`), and never be set as a plain value in `env`.
  Only the host and port from `creds` are safe to use in a plain `env` value.
- An init container `valkey-wait` is added to the workloads of the chart (the ones with `dbWait` not set to `false`), waiting for Valkey to respond.
- The connection details are included in the notes.

### Example

The full specification of the `valkey` dependency (image, workload, service, persistence, probes and the health configmap) is part of the defaults of `dependencies.valkey` in the common library `values.yaml`.
A chart only enables it and sets the values it needs to override:

```yaml
image:
  repository: ghcr.io/example/app
  tag: latest
dependencies:
  valkey:
    enabled: true
    depconfig:
      password: "secure-password"
    image:
      repository: oci.trueforge.org/containerforge/valkey
      pullPolicy: IfNotPresent
      tag: 9.0.4
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
                REDIS_PORT: "6379"
                REDIS_PASSWORD:
                  secretKeyRef:
                    expandObjectName: false
                    name: '{{ printf "%s-%s" .Release.Name "valkeycreds" }}'
                    key: valkey-password
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
    persistence:
      data:
        enabled: true
        mountPath: /config

workload:
  main:
    podSpec:
      containers:
        main:
          env:
            REDIS_HOST: '{{ .Values.dependencies.valkey.depconfig.creds.plainhost | trimAll "\"" }}'
            REDIS_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "valkeycreds" }}'
                key: url
            REDIS_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "valkeycreds" }}'
                key: valkey-password

dependencies:
  valkey:
    enabled: true
    depconfig:
      password: "secure-password"
```

This renders, among others:

- `Deployment` `myapp` with the `valkey-wait` init container
- `StatefulSet` `myapp-valkey-main` with the `data` volume claim template and the `health` configmap mounted
- `Service` `myapp-valkey-main` on port 6379
- `ConfigMap` `myapp-valkey-health`
- `Secret` `myapp-valkeycreds`

---

## Removed Top-Level Keys

The `clickhouse` key on the root level of the values is replaced by `dependencies.clickhouse` (see [ClickHouse](#clickhouse)), the `mariadb` key by `dependencies.mariadb` (see [MariaDB](#mariadb)), and the `redis` and `valkey` keys by `dependencies.valkey`.
Rendering fails when one of them has `enabled: true` (also when set using a template), as it would otherwise be silently ignored.
A disabled key, or one without `enabled`, never rendered anything and does not fail.

| Old key                             | New key                                  |
| ----------------------------------- | ---------------------------------------- |
| `redis.enabled`, `valkey.enabled`   | `dependencies.valkey.enabled`            |
| `redis.password`, `valkey.password` | `dependencies.valkey.depconfig.password` |
| `redis.creds`, `valkey.creds`       | `dependencies.valkey.depconfig.creds`    |

| Old key                                                            | New key                                                          |
| ------------------------------------------------------------------ | ---------------------------------------------------------------- |
| `clickhouse.enabled`                                               | `dependencies.clickhouse.enabled`                                |
| `clickhouse.password`                                              | `dependencies.clickhouse.depconfig.password`                     |
| `clickhouse.clickhouseUsername`, `clickhouse.clickhouseDatabase`   | `dependencies.clickhouse.depconfig.clickhouseUsername`, `dependencies.clickhouse.depconfig.clickhouseDatabase` |
| `clickhouse.creds`                                                 | `dependencies.clickhouse.depconfig.creds`                        |

The `solr`, `mongodb` and `memcached` keys on the root level of the values are no longer supported and have no replacement.
Rendering fails when one of them has `enabled: true` (also when set using a template). A disabled key, or one without `enabled`, does not fail.
