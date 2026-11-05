## Full Examples

The options are the defaults for all pods. Each of them can be overridden per workload in `workload.<name>.podSpec`.

### Defaults

The default values of common:

```yaml
podOptions:
  enableServiceLinks: false
  hostNetwork: false
  hostPID: false
  hostIPC: false
  shareProcessNamespace: false
  restartPolicy: Always
  dnsPolicy: ClusterFirst
  defaultSpread: true
  defaultAffinity: true
  automountServiceAccountToken: false
  terminationGracePeriodSeconds: 60
```

### Host namespaces

Only share the namespaces of the node when the app cannot work without it. With `hostNetwork`, `dnsPolicy` is set to `ClusterFirstWithHostNet` automatically:

```yaml
podOptions:
  hostNetwork: true
  hostPID: false
  hostIPC: false
  hostUsers: false
  shareProcessNamespace: true
```

### Scheduler, priority and runtime

```yaml
podOptions:
  schedulerName: my-scheduler
  priorityClassName: system-cluster-critical
  runtimeClassName: gvisor
  terminationGracePeriodSeconds: 120
```

### hostAliases

Extra entries for the `/etc/hosts` file of the pods:

```yaml
podOptions:
  hostAliases:
    - ip: 10.10.10.100
      hostnames:
        - myserver.local
        - storage.local
    - ip: 10.10.10.101
      hostnames:
        - database.local
```

### dnsPolicy and dnsConfig

```yaml
podOptions:
  dnsPolicy: None
  dnsConfig:
    nameservers:
      - 1.1.1.1
      - 9.9.9.9
    searches:
      - my-namespace.svc.cluster.local
      - svc.cluster.local
    options:
      - name: ndots
        value: "2"
      - name: edns0
```

### nodeSelector

Only schedule the pods on nodes that have all of these labels:

```yaml
podOptions:
  nodeSelector:
    kubernetes.io/arch: arm64
    disk_type: ssd
```

### tolerations

Allow the pods to be scheduled on tainted nodes. With `operator: Exists` no `value` is set:

```yaml
podOptions:
  tolerations:
    - key: dedicated
      operator: Equal
      value: media
      effect: NoSchedule
    - key: node.kubernetes.io/unreachable
      operator: Exists
      effect: NoExecute
      tolerationSeconds: 300
```

### topologySpreadConstraints

Spread the pods across zones, and across nodes within a zone. They are added after the constraint of `defaultSpread`:

```yaml
podOptions:
  topologySpreadConstraints:
    - maxSkew: 1
      topologyKey: topology.kubernetes.io/zone
      whenUnsatisfiable: DoNotSchedule
      labelSelector:
        matchLabels:
          app.kubernetes.io/name: my-app
    - maxSkew: 2
      topologyKey: kubernetes.io/hostname
      whenUnsatisfiable: ScheduleAnyway
      minDomains: 2
      nodeAffinityPolicy: Honor
      nodeTaintsPolicy: Ignore
      labelSelector:
        matchExpressions:
          - key: app.kubernetes.io/name
            operator: In
            values:
              - my-app
```

### affinity

Rules are merged over the default affinity when `defaultAffinity` is enabled. This one keeps the pods of the app on separate nodes:

```yaml
podOptions:
  defaultAffinity: true
  affinity:
    podAntiAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        - labelSelector:
            matchLabels:
              app.kubernetes.io/name: my-app
          topologyKey: kubernetes.io/hostname
```

### Override per workload

```yaml
podOptions:
  nodeSelector:
    kubernetes.io/arch: amd64

workload:
  main:
    enabled: true
    primary: true
    podSpec:
      nodeSelector:
        kubernetes.io/arch: arm64
      terminationGracePeriodSeconds: 300
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
```
