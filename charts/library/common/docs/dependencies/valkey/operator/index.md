---
title: Operator
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey/operator#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator`

---

## `dependencies.valkey.operator`

No description provided.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.valkey.operator` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `dependencies.valkey.operator.annotations`

Additional annotations of the `ValkeyCluster`.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.valkey.operator.annotations` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `{}`                                       |

Example

```yaml
dependencies:
  valkey:
    operator:
      annotations:
        {}
```

---

### `dependencies.valkey.operator.config`

Valkey configuration directives (valkey.conf), eg `maxmemory-policy: allkeys-lru`. Booleans are written as `yes` and `no`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.operator.config` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `{}`                                  |

Example

```yaml
dependencies:
  valkey:
    operator:
      config:
        {}
```

---

### `dependencies.valkey.operator.containers`

Patches of the containers of the pods (strategic merge patch, by name: `server` and `metrics-exporter`), or additional sidecar containers.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.valkey.operator.containers` |
| Type       | `list of unknown`                         |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | `[]`                                      |

Example

```yaml
dependencies:
  valkey:
    operator:
      containers:
        []
```

---

### `dependencies.valkey.operator.exporter`

Metrics exporter sidecar of every pod.

| Field      | Value                                                                                |
| ---------- | ------------------------------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.exporter`                                              |
| Type       | `map`                                                                                |
| Required   | ❌                                                                                   |
| Helm `tpl` | ❌                                                                                   |
| Default    | `{"enabled": true, "image": "", "args": [], "resources": {}, "securityContext": {}}` |

Example

```yaml
dependencies:
  valkey:
    operator:
      exporter:
        enabled: true
        image: ""
        args:
          []
        resources:
          {}
        securityContext:
          {}
```

---

### `dependencies.valkey.operator.image`

Overrides the image of the nodes, as `repository:tag`. Defaults to `dependencies.valkey.image`.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.valkey.operator.image` |
| Type       | `string`                             |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | `""`                                 |

Example

```yaml
dependencies:
  valkey:
    operator:
      image: ""
```

---

### `dependencies.valkey.operator.imagePullSecrets`

Secrets used to pull the images. An item is a name, or an object with a `name`.

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `dependencies.valkey.operator.imagePullSecrets` |
| Type       | `list of string, map`                           |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | `[]`                                            |

Example

```yaml
dependencies:
  valkey:
    operator:
      imagePullSecrets:
        []
```

---

### `dependencies.valkey.operator.labels`

Additional labels of the `ValkeyCluster`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.operator.labels` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `{}`                                  |

Example

```yaml
dependencies:
  valkey:
    operator:
      labels:
        {}
```

---

### `dependencies.valkey.operator.networking`

Networking of the cluster. TLS is not supported, as the credentials and the wait init container connect without it.

| Field      | Value                                                               |
| ---------- | ------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.networking`                           |
| Type       | `map`                                                               |
| Required   | ❌                                                                  |
| Helm `tpl` | ❌                                                                  |
| Default    | `{"clusterDomain": "", "discovery": {"preferredEndpointType": ""}}` |

Example

```yaml
dependencies:
  valkey:
    operator:
      networking:
        clusterDomain: ""
        discovery:
          preferredEndpointType: ""
```

---

### `dependencies.valkey.operator.persistence`

Persistence of the nodes. Requires `workloadType: StatefulSet`, and can not be added or removed after creation.

| Field      | Value                                                                |
| ---------- | -------------------------------------------------------------------- |
| Key        | `dependencies.valkey.operator.persistence`                           |
| Type       | `map`                                                                |
| Required   | ❌                                                                   |
| Helm `tpl` | ❌                                                                   |
| Default    | `{"enabled": true, "size": "", "storageClass": "", "retain": false}` |

Example

```yaml
dependencies:
  valkey:
    operator:
      persistence:
        enabled: true
        size: ""
        storageClass: ""
        retain: false
```

---

### `dependencies.valkey.operator.podDisruptionBudget`

PodDisruptionBudget managed by the operator.

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podDisruptionBudget` |
| Type       | `map`                                              |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | `{"mode": "Cluster"}`                              |

Example

```yaml
dependencies:
  valkey:
    operator:
      podDisruptionBudget:
        mode: Cluster
```

---

### `dependencies.valkey.operator.podMetadata`

Labels and annotations added to every pod. The operator rejects the keys it sets itself.

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.valkey.operator.podMetadata` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | `{"labels": {}, "annotations": {}}`        |

Example

```yaml
dependencies:
  valkey:
    operator:
      podMetadata:
        labels:
          {}
        annotations:
          {}
```

---

### `dependencies.valkey.operator.podSecurityContext`

Overrides of the security context of the pods. Defaults to the `securityContext` of the chart (`runAsUser`, `runAsGroup`, `fsGroup`).

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.valkey.operator.podSecurityContext` |
| Type       | `map`                                             |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | `{}`                                              |

Example

```yaml
dependencies:
  valkey:
    operator:
      podSecurityContext:
        {}
```

---

### `dependencies.valkey.operator.replicas`

Number of replicas per shard.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.valkey.operator.replicas` |
| Type       | `integer`                               |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `0`                                     |
| Minimum    | `0`                                     |

Example

```yaml
dependencies:
  valkey:
    operator:
      replicas: 0
```

---

### `dependencies.valkey.operator.resources`

Resources of the Valkey containers. Defaults to the `resources` of the chart.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.valkey.operator.resources` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | `{}`                                     |

Example

```yaml
dependencies:
  valkey:
    operator:
      resources:
        {}
```

---

### `dependencies.valkey.operator.scheduling`

Scheduling of the pods: `tolerations`, `nodeSelector`, `affinity`, `topologySpreadConstraints`, `priorityClassName`, `node` and `zone` (spreading and pinning).

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.valkey.operator.scheduling` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | `{}`                                      |

Example

```yaml
dependencies:
  valkey:
    operator:
      scheduling:
        {}
```

---

### `dependencies.valkey.operator.serviceAccountName`

Name of an existing ServiceAccount for the pods.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `dependencies.valkey.operator.serviceAccountName` |
| Type       | `string`                                          |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | `""`                                              |

Example

```yaml
dependencies:
  valkey:
    operator:
      serviceAccountName: ""
```

---

### `dependencies.valkey.operator.shards`

Number of shards (primaries) of the cluster.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.operator.shards` |
| Type       | `integer`                             |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `1`                                   |
| Minimum    | `1`                                   |

Example

```yaml
dependencies:
  valkey:
    operator:
      shards: 1
```

---

### `dependencies.valkey.operator.terminationGracePeriodSeconds`

Grace period of the pods in seconds. The operator calculates it when unset.

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `dependencies.valkey.operator.terminationGracePeriodSeconds` |
| Type       | `integer, null`                                              |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | unset                                                        |
| Minimum    | `1`                                                          |

---

### `dependencies.valkey.operator.users`

Additional users of the cluster, see the [valkey-operator docs](https://github.com/valkey-io/valkey-operator/blob/main/docs/valkeycluster.md#users). The `default` user always exists with the password of the credentials, an item named `default` overrides its settings.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.valkey.operator.users` |
| Type       | `list of unknown`                    |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | `[]`                                 |

Example

```yaml
dependencies:
  valkey:
    operator:
      users:
        []
```

---

### `dependencies.valkey.operator.workloadType`

Workload of every node. Can not be changed after creation. `Deployment` does not support persistence.

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `dependencies.valkey.operator.workloadType` |
| Type       | `string`                                    |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | `"StatefulSet"`                             |
| Enum       | `StatefulSet`, `Deployment`                 |

Example

```yaml
dependencies:
  valkey:
    operator:
      workloadType: StatefulSet
```

---

## Child Pages

- [Container](container/)
- [Exporter](exporter.md)
- [Networking](networking/)
- [Persistence](persistence.md)
- [Poddisruptionbudget](podDisruptionBudget.md)
- [Podmetadata](podMetadata.md)
- [Podsecuritycontext](podSecurityContext.md)
- [Resourcerequirements](resourceRequirements.md)
- [Scheduling](scheduling/)
- [Securitycontext](securityContext.md)
- [User](user.md)

---
