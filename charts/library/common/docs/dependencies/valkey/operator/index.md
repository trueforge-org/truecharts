---
title: Valkey Operator
---

:::note

- See the [Full Examples](/truecharts-common/dependencies/valkey/operator#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey.operator`

---

## Child Pages

- [exporter](/truecharts-common/dependencies/valkey/operator/exporter)
- [persistence](/truecharts-common/dependencies/valkey/operator/persistence)
- [podSecurityContext](/truecharts-common/dependencies/valkey/operator/podSecurityContext)
- [users](/truecharts-common/dependencies/valkey/operator/users)
- [Valkey Operator Containers](/truecharts-common/dependencies/valkey/operator/containers)
- [Valkey Operator Scheduling](/truecharts-common/dependencies/valkey/operator/scheduling)

---

## `operator`

Settings of the `ValkeyCluster` of the [valkey-operator](https://github.com/valkey-io/valkey-operator), used when `mode` is `operator`. The credentials stay in `depconfig`. Never merged into the chart values.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `shards`

Number of shards (primaries) of the cluster.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.shards` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `1` |
| Range | 1 to … |

---

## `replicas`

Number of replicas per shard.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.replicas` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `0` |
| Range | 0 to … |

---

## `imageSelector`

Image of the nodes, the name of an image on the root of the values. Defaults to `valkeyImage`, the image of the standalone mode.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.imageSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"valkeyImage"` |

---

## `workloadType`

Workload of every node. Can not be changed after creation. `Deployment` does not support persistence.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.workloadType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"StatefulSet"` |
| Allowed values | `"StatefulSet"`, `"Deployment"` |

---

## `config`

Valkey configuration directives (valkey.conf), eg `maxmemory-policy: allkeys-lru`. Booleans are written as `yes` and `no`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.config` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `{}` |

---

## `config.$name`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.config.$name` |
| Type | `string or number or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources`

Resources of the Valkey containers. Defaults to the `resources` of the chart.

See [Resources](/truecharts-common/workload/podSpec/containers/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `persistence`

Persistence of the nodes. Requires `workloadType: StatefulSet`, and can not be added or removed after creation.

See [persistence](/truecharts-common/dependencies/valkey/operator/persistence) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.persistence` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"enabled": true, "size": "", "storageClass": "", "retain": false}` |

---

## `exporter`

Metrics exporter sidecar of every pod.

See [exporter](/truecharts-common/dependencies/valkey/operator/exporter) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.exporter` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
enabled: true
imageSelector: valkeyExporterImage
args: []
resources: {}
securityContext: {}
```

---

## `scheduling`

Scheduling of the pods: `tolerations`, `nodeSelector`, `affinity`, `topologySpreadConstraints`, `priorityClassName`, `node` and `zone` (spreading and pinning).

See [Valkey Operator Scheduling](/truecharts-common/dependencies/valkey/operator/scheduling) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.scheduling` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `podDisruptionBudget`

PodDisruptionBudget managed by the operator.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podDisruptionBudget` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"mode": "Cluster"}` |

---

## `podDisruptionBudget.mode`

`Cluster` creates one budget (`maxUnavailable: 1`) for all pods, `Disabled` creates none.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podDisruptionBudget.mode` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Cluster"` |
| Allowed values | `"Cluster"`, `"Disabled"` |

---

## `podMetadata`

Labels and annotations added to every pod. The operator rejects the keys it sets itself.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podMetadata` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"labels": {}, "annotations": {}}` |

---

## `podMetadata.labels`

Labels of the pods.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podMetadata.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `podMetadata.annotations`

Annotations of the pods.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podMetadata.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `imagePullSecrets`

Secrets used to pull the images. An item is a name, or an object with a `name`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.imagePullSecrets` |
| Type | `list of string or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `imagePullSecrets[]`

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.imagePullSecrets[]` |
| Type | `string or map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `imagePullSecrets[].name`

Name of the Secret.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.imagePullSecrets[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSecurityContext`

Overrides of the security context of the pods. Defaults to the `securityContext` of the chart (`runAsUser`, `runAsGroup`, `fsGroup`).

See [podSecurityContext](/truecharts-common/dependencies/valkey/operator/podSecurityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.podSecurityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `serviceAccountName`

Name of an existing ServiceAccount for the pods.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.serviceAccountName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `terminationGracePeriodSeconds`

Grace period of the pods in seconds. The operator calculates it when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.terminationGracePeriodSeconds` |
| Type | `int or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `null` |
| Range | 1 to … |

---

## `containers`

Patches of the containers of the pods (strategic merge patch, by name: `server` and `metrics-exporter`), or additional sidecar containers.

See [Valkey Operator Containers](/truecharts-common/dependencies/valkey/operator/containers) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.containers` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `networking`

Networking of the cluster. TLS is not supported, as the credentials and the wait init container connect without it.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.networking` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"clusterDomain": "", "discovery": {"preferredEndpointType": ""}}` |

---

## `networking.clusterDomain`

Domain of the Kubernetes cluster. The operator uses `cluster.local` when unset.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.networking.clusterDomain` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `networking.discovery`

Discovery (in-cluster announce) of the nodes.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.networking.discovery` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"preferredEndpointType": ""}` |

---

## `networking.discovery.preferredEndpointType`

How the nodes announce themselves. The operator uses `IP` when unset, `Hostname` requires `workloadType: StatefulSet`.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.networking.discovery.preferredEndpointType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |
| Allowed values | `""`, `"IP"`, `"Hostname"` |

---

## `users`

Additional users of the cluster, see the [valkey-operator docs](https://github.com/valkey-io/valkey-operator/blob/main/docs/valkeycluster.md#users). The `default` user always exists with the password of the credentials, an item named `default` overrides its settings.

See [users](/truecharts-common/dependencies/valkey/operator/users) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.users` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `labels`

Additional labels of the `ValkeyCluster`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `annotations`

Additional annotations of the `ValkeyCluster`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `dependencies.valkey.operator.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
dependencies:
  valkey:
    operator:
      containers:
        - name: server
          resources:
            limits:
              memory: 1Gi
```

```yaml
dependencies:
  valkey:
    operator:
      scheduling:
        topologySpreadConstraints:
          - maxSkew: 1
            topologyKey: topology.example.com/rack
            whenUnsatisfiable: DoNotSchedule
```

```yaml
dependencies:
  valkey:
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          lifecycle:
            stopSignal: SIGTERM
            preStop:
              sleep:
                seconds: 10
```
