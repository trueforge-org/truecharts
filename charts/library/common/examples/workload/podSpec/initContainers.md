## Full Examples

Init containers support `command`, `args`, `env`, `envFrom`, `resources`, `securityContext` and `termination`. `lifecycle` and `probes` do not apply to them.

### Types

`type` defines when the init container runs: `init` on every start of the pod, `install` only on the first install of the chart and `upgrade` only on upgrades.

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
            - echo "runs on every start"
        install-name:
          enabled: true
          type: install
          imageSelector: image
          command: /bin/seed-data
        upgrade-name:
          enabled: true
          type: upgrade
          imageSelector: image
          command: /bin/migrate
          args:
            - --yes
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### Env, resources and security context

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
            - chown -R 568:568 /config
          env:
            ENV_NAME1: ENV_VALUE
            ENV_NAME2:
              secretKeyRef:
                name: secret-name
                key: secret-key
          envFrom:
            - configMapRef:
                name: configmap-name
          resources:
            limits:
              cpu: 500m
              memory: 256Mi
            requests:
              cpu: 10m
              memory: 50Mi
          securityContext:
            runAsUser: 0
            runAsGroup: 0
            runAsNonRoot: false
            readOnlyRootFilesystem: false
            capabilities:
              add:
                - CHOWN
          termination:
            messagePath: /dev/termination-log
            messagePolicy: File
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```
