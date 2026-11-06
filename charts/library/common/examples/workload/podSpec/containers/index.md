## Full Examples

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
          stdin: true
          tty: true
          command:
            - /bin/sh
          args:
            - -c
            - sleep infinity
          extraArgs:
            - --verbose
          env:
            ENV_NAME: ENV_VALUE
          envFrom:
            - secretRef:
                name: secret-name
          fixedEnv:
            TZ: Europe/Amsterdam
          resources:
            limits:
              cpu: 4000m
              memory: 8Gi
            requests:
              cpu: 10m
              memory: 50Mi
          securityContext:
            runAsUser: 568
            runAsGroup: 568
            runAsNonRoot: true
            readOnlyRootFilesystem: true
            allowPrivilegeEscalation: false
          termination:
            messagePath: /dev/termination-log
            messagePolicy: File
          lifecycle:
            preStop:
              type: exec
              command:
                - /bin/sh
                - -c
                - sleep 5
          probes:
            liveness:
              enabled: true
              type: http
              port: 8080
              path: /healthz
            readiness:
              enabled: true
              type: tcp
              port: 8080
            startup:
              enabled: true
              type: http
              port: 8080
              path: /healthz

  other-workload-name:
    enabled: true
    primary: false
    podSpec:
      containers:
        other-container-name:
          enabled: true
          primary: true
          imageSelector: image
        sidecar-name:
          enabled: true
          primary: false
          imageSelector: sidecarImage
```
