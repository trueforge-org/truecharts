---
title: Valkey
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.clickhouse`
- `.Values.dependencies.mariadb`
- `.Values.dependencies.memcached`
- `.Values.dependencies.mongodb`
- `.Values.dependencies.postgresql`
- `.Values.dependencies.valkey`

---

## `valkey`

The valkey dependency. In `operator` mode a `ValkeyCluster` is spawned from `operator`.

Takes the same keys as the [root values](/truecharts-common), next to the keys below.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `operator`

Settings of the `ValkeyCluster` of the [valkey-operator](https://github.com/valkey-io/valkey-operator), used when `mode` is `operator`. The credentials stay in `depconfig`. Never merged into the chart values.

See [Valkey Operator](/truecharts-common/dependencies/valkey-operator) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `mode`

How the dependency is provided. `standalone` merges and deploys it with the chart, `operator` leaves it to an operator, so its objects are not merged into the chart. The credentials, wait init container and notes still apply.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"standalone"` |
| Allowed values | `"standalone"`, `"operator"` |

---

## `depconfig`

Configuration of the dependency itself. Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.depconfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.password`

Password used by the dependency. Defaults to `PLACEHOLDERPASSWORD`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.depconfig.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.creds`

Connection details populated by the dependency (eg `plainhost`, `url`). Read-only.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.depconfig.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `depconfig.creds.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.depconfig.creds.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

Valkey is deployed in the chart in the default `standalone` mode, and provided by the valkey-operator with `mode: operator`. The credentials Secret is named `<release>-valkeycreds`.

### Standalone mode

A Valkey cache next to the app, with the connection details from the credentials Secret:

```yaml
dependencies:
  valkey:
    enabled: true

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
          env:
            REDIS_HOST: '{{ .Values.dependencies.valkey.depconfig.creds.plainhost | trimAll "\"" }}'
            REDIS_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "valkeycreds" }}'
                key: valkey-password
```

### Standalone: image, password and resources

Another image, a fixed password, or more resources for the dependency only:

```yaml
valkeyImage:
  repository: oci.trueforge.org/containerforge/valkey
  tag: 9.0.4@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
  pullPolicy: IfNotPresent

dependencies:
  valkey:
    enabled: true
    depconfig:
      password: "{{ .Values.valkeyPassword }}"
    resources:
      limits:
        memory: 1Gi
    persistence:
      data:
        size: 2Gi
```

### Operator mode

A `ValkeyCluster` with three shards and a replica per shard, provided by the valkey-operator:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      shards: 3
      replicas: 1
      config:
        maxmemory-policy: allkeys-lru
      persistence:
        enabled: true
        size: 2Gi
      exporter:
        enabled: true
```

### Operator: image

The nodes use `valkeyImage` and the exporter `valkeyExporterImage`, both on the root of the values. To use another image, select it with `imageSelector`:

```yaml
myValkeyImage:
  repository: oci.trueforge.org/containerforge/valkey
  tag: 9.0.4@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
  pullPolicy: IfNotPresent

dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      imageSelector: myValkeyImage
      workloadType: Deployment
```

### Operator: resources and storage

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      resources:
        limits:
          cpu: 1000m
          memory: 1Gi
        requests:
          cpu: 100m
          memory: 256Mi
      persistence:
        enabled: true
        size: 5Gi
        storageClass: fast-storage
        retain: true
```

### Operator: scheduling

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      scheduling:
        nodeSelector:
          kubernetes.io/arch: amd64
        tolerations:
          - key: dedicated
            operator: Equal
            value: cache
            effect: NoSchedule
        priorityClassName: system-cluster-critical
      podDisruptionBudget:
        mode: Cluster
```

### Operator: users

Users of the cluster, with a password from a Secret:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      users:
        - name: app
          enabled: true
          permissions: "+@all -@dangerous"
          passwordSecret:
            name: app-valkey-password
            keys:
              - password
```

### Operator: pod metadata and security

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      labels:
        label1: label1
      annotations:
        annotation1: annotation1
      podMetadata:
        labels:
          pod-label: value
        annotations:
          pod-annotation: value
      podSecurityContext:
        runAsNonRoot: true
        fsGroup: 568
        seccompProfile:
          type: RuntimeDefault
      terminationGracePeriodSeconds: 60
      networking:
        clusterDomain: cluster.local
```
