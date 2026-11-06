## Full Examples

### Values and references

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          env:
            - name: LOG_LEVEL
              value: info
            - name: VALKEY_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: app-valkey-password
                  key: password
            - name: SHIPPER_ENDPOINT
              valueFrom:
                configMapKeyRef:
                  name: shipper-config
                  key: endpoint
                  optional: true
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  apiVersion: v1
                  fieldPath: metadata.name
```

### Resource field reference

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          resources:
            limits:
              memory: 128Mi
          env:
            - name: MEMORY_LIMIT
              valueFrom:
                resourceFieldRef:
                  containerName: log-shipper
                  resource: limits.memory
                  divisor: 1Mi
```
