## Full Examples

Each type has its own page with all of its options:

- [configmap](/truecharts-common/persistence/configmap)
- [device](/truecharts-common/persistence/device)
- [emptyDir](/truecharts-common/persistence/emptyDir)
- [hostPath](/truecharts-common/persistence/hostPath)
- [iscsi](/truecharts-common/persistence/iscsi)
- [nfs](/truecharts-common/persistence/nfs)
- [secret](/truecharts-common/persistence/secret)
- [pvc and vct](/truecharts-common/persistence/pvc-vct)

### Mounting into containers

`targetSelector` mounts the volume only in the given containers. With `targetSelectAll` it is mounted in every container, using `mountPath`.

```yaml
persistence:
  config:
    enabled: true
    type: pvc
    size: 1Gi
    targetSelector:
      workload-name:
        container-name:
          mountPath: /config
          readOnly: false
        other-container-name:
          mountPath: /data/config
          subPath: config
          mountPropagation: HostToContainer
  shared-scratch:
    enabled: true
    type: emptyDir
    mountPath: /scratch
    targetSelectAll: true
```

### Built-in volumes

`shared`, `varlogs`, `varrun`, `tmp`, `devshm` and `crontab` are enabled by default. Disable or override them like any other persistence.

```yaml
persistence:
  shared:
    enabled: false
  tmp:
    enabled: true
    type: emptyDir
    medium: Memory
    mountPath: /tmp
  devshm:
    enabled: true
    type: emptyDir
    medium: Memory
    mountPath: /dev/shm
  varlogs:
    enabled: false
  varrun:
    enabled: false
  crontab:
    enabled: false
```

### Automatic permissions

```yaml
persistence:
  config:
    enabled: true
    type: pvc
    size: 1Gi
    mountPath: /config
    autoPermissions:
      enabled: true
      chown: true
      chmod: "775"
      recursive: true
      user: 568
      group: 568
```

### Projected

Combine secrets, configmaps, service account tokens and downward API fields in one volume.

```yaml
persistence:
  projected-vol:
    enabled: true
    type: projected
    mountPath: /projected
    sources:
      - secret:
          objectName: secret-name
          optional: false
          items:
            - key: key1
              path: secret/key1
      - configMap:
          objectName: configmap-name
          expandObjectName: true
          items:
            - key: key2
              path: config/key2
      - serviceAccountToken:
          audience: some-audience
          expirationSeconds: 3600
          path: token
      - downwardAPI:
          items:
            - path: labels
              fieldRef:
                fieldPath: metadata.labels
            - path: cpu-limit
              resourceFieldRef:
                containerName: container-name
                resource: limits.cpu
                divisor: 1m
```
