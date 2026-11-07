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
