## Full Examples

The `protocol` of a port is one of `tcp`, `udp`, `http` and `https`. `http` and `https` are converted to `tcp` where Kubernetes needs it, and set the `appProtocol`.

### http

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        targetSelector: container-name
        port: 80
        targetPort: 8080
        protocol: http
```

### https

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        port: 443
        targetPort: 8443
        protocol: https
```

### tcp and udp

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      tcp-port:
        enabled: true
        primary: true
        port: 5432
        protocol: tcp
      udp-port:
        enabled: true
        port: 53
        protocol: udp
```

### appProtocol, hostPort and templates

```yaml
service:
  service-name:
    enabled: true
    primary: true
    ports:
      port-name:
        enabled: true
        primary: true
        port: "{{ .Values.port }}"
        targetPort: "{{ .Values.targetPort }}"
        protocol: "{{ .Values.protocol }}"
        appProtocol: kubernetes.io/h2c
        hostPort: 8080

  service-nodeport:
    enabled: true
    type: NodePort
    ports:
      port-name:
        enabled: true
        primary: true
        port: 80
        protocol: tcp
        nodePort: 30080
```
