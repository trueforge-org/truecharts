---
title: Bookorbit installation notes
---

The chart is intentionally lightweight and relies on the shared TrueCharts common chart for most deployment concerns. The main things you typically override are persistence, database connection settings, and the route.

## Persistence

Persistence is handled through the shared TrueCharts common chart, so the usual TrueCharts persistence options should work. As a simple example, the chart defines three hostPath-backed mounts for Bookorbit:

```yaml
persistence:
  data:
    mountPath: /data
  book-dock:
    mountPath: /data/book-dock
  books:
    mountPath: /books
```

You can replace these with other persistence backends supported by the common chart, such as PVC-based storage, depending on your environment.

## Database

Bookorbit expects PostgreSQL-compatible connection settings via the `POSTGRES_*` environment variables. You can either point at an existing PostgreSQL instance or let this chart create a CNPG-backed PostgreSQL cluster.

### Existing PostgreSQL

```yaml
database:
  type: external-postgres
  external:
    host: your-postgres-host
    port: 5432
    user: bookorbit
    password: CHANGE_ME
    database: bookorbit
```

### CNPG-managed PostgreSQL

```yaml
database:
  type: cnpg

cnpg:
  main:
    enabled: true
    user: bookorbit
    database: bookorbit
```

## Route

If you want to expose Bookorbit through a Gateway API HTTPRoute, you can override the route block in your own values file:

```yaml
route:
  main:
    enabled: true
    kind: HTTPRoute
    annotations:
      cert-manager.io/cluster-issuer: letsencrypt-prod
    parentRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: your-gateway
        namespace: traefik
    hostnames:
      - bookorbit.example.com
    rules:
      - backendRefs:
          - group: ""
            kind: Service
            weight: 1
        matches:
          - path:
              type: PathPrefix
              value: /
```
