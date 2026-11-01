## Full Examples

ListenerSets require Gateway API v1.4 or later. The Gateway must opt in by setting `allowedListeners`, otherwise the ListenerSet is rejected.

### Attach to a Gateway of this Chart

The `targetSelector` references a gateway defined in this chart, the chart validates that the gateway allows listener sets:

```yaml
gateway:
  main:
    enabled: true
    gatewayClassName: traefik
    allowedListeners:
      namespaces:
        from: Same
    listeners:
      - name: http
        port: 80
        protocol: HTTP

listenerSet:
  https:
    enabled: true
    targetSelector: main
    listeners:
      - name: https
        hostname: app.example.com
        port: 443
        protocol: HTTPS
        tls:
          mode: Terminate
          certificateRefs:
            - name: app-tls
        allowedRoutes:
          namespaces:
            from: Same
          kinds:
            - group: gateway.networking.k8s.io
              kind: HTTPRoute
```

### Attach to a Shared Gateway in Another Namespace

Use `parentRef` for Gateways that are not managed by this chart. `name` and `namespace` support Helm `tpl`:

```yaml
listenerSet:
  main:
    enabled: true
    expandObjectName: false
    labels:
      key: value
    parentRef:
      name: shared-gateway
      namespace: infrastructure
    listeners:
      - name: app
        hostname: "{{ .Release.Name }}.example.com"
        port: 443
        protocol: HTTPS
        tls:
          mode: Terminate
          certificateRefs:
            - name: "{{ .Release.Name }}-tls"
```
