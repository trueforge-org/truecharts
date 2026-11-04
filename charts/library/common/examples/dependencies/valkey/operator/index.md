## Full Examples

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

The nodes use `valkeyImage` and the exporter `valkeyExporterImage`, both on the root of the values. To use another image, select it:

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
```
