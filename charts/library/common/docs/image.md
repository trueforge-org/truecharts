---
title: Image
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/image#full-examples) section for complete examples.

:::

## Appears in

- `.Values.alpineImage`
- `.Values.codeserverImage`
- `.Values.gluetunImage`
- `.Values.image`
- `.Values.kubectlImage`
- `.Values.mariadbClientImage`
- `.Values.mongodbClientImage`
- `.Values.netshootImage`
- and 18 more places

---

## `image`

The main image of the chart, used by containers that do not select another image with `imageSelector`. See [image](/truecharts-common/image).

| Field | Value |
| --- | --- |
| Key | `image` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
repository: oci.trueforge.org/containerforge/whoami
pullPolicy: IfNotPresent
tag: 1.12.0@sha256:ab5d621fc3ecf2ddcc52a728551bab0b942c1e777126b9595df1cfa4e7b9adfa
```

---

## `image.repository`

Repository of the image, without the tag.

| Field | Value |
| --- | --- |
| Key | `image.repository` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `""` |

Example

```yaml
image:
  repository: oci.trueforge.org/containerforge/whoami
```

---

## `image.pullPolicy`

When Kubernetes pulls the image: `Always`, `IfNotPresent` or `Never`.

| Field | Value |
| --- | --- |
| Key | `image.pullPolicy` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"IfNotPresent"` |

---

## `image.tag`

Tag of the image. Pin it by digest, as `<version>@sha256:<digest>`.

| Field | Value |
| --- | --- |
| Key | `image.tag` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `""` |

Example

```yaml
image:
  tag: 1.12.0@sha256:ab5d621fc3ecf2ddcc52a728551bab0b942c1e777126b9595df1cfa4e7b9adfa
```

---

## Linked objects

| Key | Type | Description |
| --- | --- | --- |
| `gluetunImage` | `map` | Image of the gluetun VPN client, used by the gluetun addon. |
| `netshootImage` | `map` | Image of netshoot, a network troubleshooting toolbox, used by the netshoot addon. |
| `tailscaleImage` | `map` | Image of Tailscale, used by the tailscale addon. |
| `codeserverImage` | `map` | Image of code-server, used by the codeserver addon. |
| `ubuntuImage` | `map` | Image of Ubuntu, used by the init containers that fix permissions (autoperms) and by the wait-for-database init containers. |
| `kubectlImage` | `map` | Image of kubectl, for containers that select it with `imageSelector: kubectlImage`. |
| `postgresClientImage` | `map` | Image of the PostgreSQL client, used by the init container that waits for the postgresql dependency. |
| `mariadbClientImage` | `map` | Image of the MariaDB client, used by the init container that waits for the mariadb dependency. |
| `valkeyClientImage` | `map` | Image of the Valkey client tools, used by the init container that waits for the valkey dependency. |
| `mongodbClientImage` | `map` | Image of the MongoDB shell, used by the init container that waits for the mongodb dependency. |
| `postgres15Image` | `map` | Image of PostgreSQL 15 (CloudNativePG), used by CNPG clusters of the postgresql dependency with `pgVersion: 15`. |
| `postgres16Image` | `map` | Image of PostgreSQL 16 (CloudNativePG), used by CNPG clusters of the postgresql dependency with `pgVersion: 16`. |
| `postgresPostgis15Image` | `map` | Image of PostgreSQL 15 with PostGIS (CloudNativePG), used by CNPG clusters with `pgVersion: 15` and the `postgis` type. |
| `postgresPostgis16Image` | `map` | Image of PostgreSQL 16 with PostGIS (CloudNativePG), used by CNPG clusters with `pgVersion: 16` and the `postgis` type. |
| `postgresVectors15Image` | `map` | Image of PostgreSQL 15 with pgvecto.rs (CloudNativePG), used by CNPG clusters with `pgVersion: 15` and the `vectors` type. |
| `postgresVectors16Image` | `map` | Image of PostgreSQL 16 with pgvecto.rs (CloudNativePG), used by CNPG clusters with `pgVersion: 16` and the `vectors` type. |
| `postgresVectorchord15Image` | `map` | Image of PostgreSQL 15 with VectorChord (CloudNativePG), used by CNPG clusters with `pgVersion: 15` and the `vectorchord` type. |
| `postgresVectorchord16Image` | `map` | Image of PostgreSQL 16 with VectorChord (CloudNativePG), used by CNPG clusters with `pgVersion: 16` and the `vectorchord` type. |
| `alpineImage` | `map` | Alpine image, for helper containers. |
| `scratchImage` | `map` | Empty scratch image, for helper containers. |
| `wgetImage` | `map` | Image with `wget`, for helper containers. |
| `yqImage` | `map` | Image with `yq`, for helper containers. |
| `redisClientImage` | `map` | Image of the Redis client, used by the init container that waits for the redis dependency. |
| `openvpnImage` | `map` | Image of the OpenVPN client, for the OpenVPN addon. |
| `wireguardImage` | `map` | Image of WireGuard, for the WireGuard addon. |

---

## Full Examples

### Main image

The main image is used by every container that does not select another image with `imageSelector`. Pin it by digest:

```yaml
image:
  repository: oci.trueforge.org/containerforge/example
  pullPolicy: IfNotPresent
  tag: 1.2.3@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

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
```

### More images and imageSelector

Every key ending in `Image` on the root of the values defines an image. A container picks one by name with `imageSelector`:

```yaml
image:
  repository: oci.trueforge.org/containerforge/example
  pullPolicy: IfNotPresent
  tag: 1.2.3@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

migrationImage:
  repository: oci.trueforge.org/containerforge/example-migrate
  pullPolicy: Always
  tag: 1.2.3@sha256:fedcba9876543210fedcba9876543210fedcba9876543210fedcba9876543210

workload:
  main:
    enabled: true
    primary: true
    podSpec:
      initContainers:
        migrate:
          enabled: true
          type: init
          imageSelector: migrationImage
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
```

### Images used by common

Common ships the images for its addons, dependencies and helper containers. They are defined by the chart and can be overridden in the same way:

```yaml
gluetunImage:
  repository: oci.trueforge.org/containerforge/gluetun
  pullPolicy: IfNotPresent
  tag: 3.40.0@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

postgresql18Image:
  repository: oci.trueforge.org/containerforge/postgresql
  pullPolicy: IfNotPresent
  tag: 18.0.0@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

valkeyImage:
  repository: oci.trueforge.org/containerforge/valkey
  pullPolicy: IfNotPresent
  tag: 9.0.4@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
```

The CloudNativePG images follow the `pgVersion` and `type` of the cluster, for example `postgres17Image` for `pgVersion: 17` and `postgresPostgis17Image` for the `postgis` type:

```yaml
postgres17Image:
  repository: oci.trueforge.org/containerforge/cloudnative-pg
  pullPolicy: IfNotPresent
  tag: 17.6.0@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

dependencies:
  postgresql:
    enabled: true
    operator:
      pgVersion: 17
```
