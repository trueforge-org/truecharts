## Full Examples

Restart the container when it exits with a retryable code, for a sidecar that restarts itself:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          restartPolicy: Never
          restartPolicyRules:
            - action: Restart
              exitCodes:
                operator: In
                values:
                  - 42
                  - 43
```
