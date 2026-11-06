## Full Examples

### Scheduling

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      schedulerName: some-scheduler
      priorityClassName: some-priority-class-name
      runtimeClassName: some-runtime-class
      nodeSelector:
        disk_type: ssd
      tolerations:
        - operator: Exists
          effect: NoExecute
          tolerationSeconds: 3600
      terminationGracePeriodSeconds: 100
```

### Networking

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      hostNetwork: false
      hostPID: false
      hostIPC: false
      hostUsers: false
      shareProcessNamespace: false
      enableServiceLinks: false
      hostname: some-hostname
      hostAliases:
        - ip: 10.10.10.100
          hostnames:
            - myserver.local
            - storage.local
      dnsPolicy: ClusterFirst
      dnsConfig:
        nameservers:
          - 1.1.1.1
          - 1.0.0.1
        searches:
          - ns1.svc.cluster-domain.example
        options:
          - name: ndots
            value: "1"
          - name: edns0
```

### Security context

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      automountServiceAccountToken: true
      serviceAccountName: some-service-account
      securityContext:
        fsGroup: 568
        fsGroupChangePolicy: OnRootMismatch
        supplementalGroups:
          - 568
          - 1000
        sysctls:
          - name: net.ipv4.ip_unprivileged_port_start
            value: "0"
```

### Labels and annotations

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      labels:
        key: value
      annotations:
        key: value
      restartPolicy: Always
```

### Containers and init containers

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      initContainers:
        init-name:
          enabled: true
          type: init
          imageSelector: image
          command:
            - /bin/sh
            - -c
            - echo "init"
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```
