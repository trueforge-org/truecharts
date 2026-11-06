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
