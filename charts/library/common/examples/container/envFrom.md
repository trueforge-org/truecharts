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
          envFrom:
            - secretRef:
                # This will be expanded to `fullname-secret-name`
                name: secret-name
            - configMapRef:
                name: configmap-name
                expandObjectName: false
```
