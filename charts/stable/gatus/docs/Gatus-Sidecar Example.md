---
title: Gatus Sidecar and Ingress Inheritance
---

As you can read in the upstream [docs](https://github.com/home-operations/gatus-sidecar) Gatus Sidecar implemented Ingress Inheritance.

## Example Values Ingress NGINX

**nginx-internal**

```yaml
// values.yaml
    controller:
      ingressClassResource:
        name: internal
        annotations:
          gatus.home-operations.com/endpoint: |
            group: internal
            client:
              dns-resolver: "tcp://blocky-dns.blocky.svc.cluster.local:53"
            ui:
              hide-url: true
              hide-hostname: true
```

**nginx-external**
```yaml
// values.yaml
    controller:
      ingressClassResource:
        name: internal
        annotations:
          gatus.home-operations.com/endpoint: |
            group: external
            client:
              dns-resolver: "tcp://1.1.1.1:53"
```

### IngressClass result

The IngressClass will be:
```yaml
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  name: internal
  annotations:
    gatus.home-operations.com/endpoint: |
      group: internal
      client:
        dns-resolver: "tcp://blocky-dns.blocky.svc.cluster.local:53"
      ui:
        hide-url: true
        hide-hostname: true"
spec:
  # ... IngressClass spec
---
apiVersion: networking.k8s.io/v1
kind: IngressClass
metadata:
  name: external
  annotations:
    gatus.home-operations.com/endpoint: |
      group: external
      client:
        dns-resolver: "tcp://1.1.1.1:53"
spec:
  # ... IngressClass spec
```

## Example with Plex NO extra Annotations

Consider in this example Plex defined with an Internal IngressClass.
No extra Annotations are given in the Helm Ingress Values of Plex.
The generated endpoint by Gatus Sidecar will be:
```yaml
    - name: plex
      group: internal
      url: https://plex.truecharts.com
      conditions:
        - '[STATUS] == 200'
      interval: 1m0s
      client:
        dns-resolver: tcp://blocky-dns.blocky.svc.cluster.local:53
      ui:
        hide-hostname: true
        hide-url: true
```
*note:* as you can see standard conditions are added by Gatus itself.

## Example with Plex with extra Annotations
```yaml
   ingress:
      main:
        enabled: true
        ingressClassName: internal
        annotations:
          gatus.home-operations.com/endpoint: |-
            conditions: ["[STATUS] == 401"]
```
The generated endpoint by Gatus Sidecar will be:
```yaml
    - name: plex
      group: internal
      url: https://plex.truecharts.com
      conditions:
        - '[STATUS] == 401'
      interval: 1m0s
      client:
        dns-resolver: tcp://blocky-dns.blocky.svc.cluster.local:53
      ui:
        hide-hostname: true
        hide-url: true
```
*note:* as you can see **Ingress Class** Annotation is merged with **Ingress** Annotation.
