## Full Examples

### Sidecar container

A sidecar next to the valkey nodes. Any name except `server` and `metrics-exporter` adds a container:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: log-shipper
          image: oci.trueforge.org/containerforge/busybox:1.37.0@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
          imagePullPolicy: IfNotPresent
          command:
            - /bin/sh
            - -c
          args:
            - while true; do date; sleep 60; done
          workingDir: /tmp
```

### Patch the server container

A container named `server` patches the container of the chart instead of adding one:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      containers:
        - name: server
          resources:
            limits:
              memory: 1Gi
```
