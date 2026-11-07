## Full Examples

### Exec

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          lifecycle:
            postStart:
              exec:
                command:
                  - /bin/sh
                  - -c
                  - echo "started" > /tmp/started
```

### HTTP GET

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          lifecycle:
            postStart:
              httpGet:
                path: /register
                port: 8080
                scheme: HTTP
                httpHeaders:
                  - name: X-Source
                    value: valkey
```
