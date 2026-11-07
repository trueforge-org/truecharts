## Full Examples

### Persistence and services

Defaults for volumes and services that do not set their own values:

```yaml
global:
  fallbackDefaults:
    storageClass: fast-storage
    persistenceType: pvc
    pvcSize: 10Gi
    vctSize: 20Gi
    pvcRetain: true
    accessModes:
      - ReadWriteOnce
    vctAccessModes:
      - ReadWriteOnce
    serviceType: ClusterIP
    serviceProtocol: tcp
```

### Probes

The default type of the probes, and their timings for each kind of probe:

```yaml
global:
  fallbackDefaults:
    probeType: http
    probeTimeouts:
      liveness:
        initialDelaySeconds: 10
        periodSeconds: 10
        timeoutSeconds: 5
        failureThreshold: 5
        successThreshold: 1
      readiness:
        initialDelaySeconds: 10
        periodSeconds: 10
        timeoutSeconds: 5
        failureThreshold: 5
        successThreshold: 2
      startup:
        initialDelaySeconds: 10
        periodSeconds: 5
        timeoutSeconds: 2
        failureThreshold: 60
        successThreshold: 1
```

### Scheduling and routes

The topology key used to spread the pods, whether a Deployment with a `ReadWriteOnce` volume may use a rolling update, and the default listener port of routes:

```yaml
global:
  fallbackDefaults:
    topologyKey: topology.kubernetes.io/zone
    allowRollingUpdateWithRWO: true
    routeListenerPort: 8443
```

### CloudNativePG

The default PostgreSQL version of CNPG clusters, and whether the check for an empty WAL archive is skipped:

```yaml
global:
  fallbackDefaults:
    cnpg:
      pgVersion: 17
      skipEmptyWalArchiveCheck: true
```
