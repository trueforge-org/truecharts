## Full Examples

### Workloads

A chart can define several workloads. Exactly one is `primary`. See the page of each type for all its options:

- [Deployment](/truecharts-common/workload/deployment)
- [StatefulSet](/truecharts-common/workload/statefulset)
- [DaemonSet](/truecharts-common/workload/daemonset)
- [CronJob](/truecharts-common/workload/cronjob)
- [Job](/truecharts-common/workload/job)

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    type: Deployment
    namespace: some-namespace
    labels:
      key: value
    annotations:
      key: value
    extraSelectorLabels:
      key: value
    serviceAccountName: some-service-account
    dbWait: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image

  other-workload-name:
    enabled: true
    primary: false
    type: CronJob
    schedule: "0 3 * * *"
    podSpec:
      restartPolicy: OnFailure
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### Pod spec

See [Pod Spec](/truecharts-common/workload/podSpec) for the options of the pod.

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
      automountServiceAccountToken: true
      hostNetwork: false
      hostPID: false
      shareProcessNamespace: false
      enableServiceLinks: false
      schedulerName: some-scheduler
      priorityClassName: some-priority-class-name
      hostname: some-hostname
      terminationGracePeriodSeconds: 100
      nodeSelector:
        disk_type: ssd
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
      tolerations:
        - operator: Exists
          effect: NoExecute
          tolerationSeconds: 3600
      runtimeClassName: some-runtime-class
      securityContext:
        fsGroup: 568
        fsGroupChangePolicy: OnRootMismatch
        supplementalGroups:
          - 568
        sysctls:
          - name: net.ipv4.ip_local_port_range
            value: "1024 65535"
```
