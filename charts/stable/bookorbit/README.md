---
title: README
---

## Bookorbit

This chart provides a dedicated Bookorbit deployment for TrueCharts using the shared common library and hostPath-based media mounts.

## Database options

Bookorbit's upstream image is wired for PostgreSQL-compatible connection settings via the `POSTGRES_*` environment variables. This chart therefore supports PostgreSQL-backed modes only:

- external-postgres (default): use an existing PostgreSQL instance via the `database.external` values.
- cnpg: use a CNPG-managed PostgreSQL cluster by switching `database.type` to `cnpg` and enabling `cnpg.main.enabled`.

Other database engines such as MySQL, MariaDB, or SQLite are not supported by the upstream Bookorbit image and are not exposed by this chart.

## Prerequisites

When using the default external PostgreSQL mode, create the Postgres secret and cluster expected by the chart values:

```bash
kubectl create secret generic -n cnpg-system bookorbit-db \
  --from-literal=username=bookorbit \
  --from-literal=password='CHANGE_ME'
kubectl apply -f ../cn-pg/bookorbit-cnpg.yml
```

Replace the placeholder secrets in the chart values before the first install:

- POSTGRES_PASSWORD
- JWT_SECRET
- SETUP_BOOTSTRAP_TOKEN

Also ensure the host paths exist and are writable by UID/GID 1000:

```bash
sudo mkdir -p /data/config/bookorbit /data1/ncShare/bookdrop
sudo chown -R 1000:1000 /data/config/bookorbit /data1/ncShare/bookdrop
```

## Installation

```bash
helm upgrade --install bookorbit --create-namespace -n bookorbit \
  oci://oci.trueforge.org/truecharts/bookorbit -f values.yaml
```

## First-time setup

Open the configured host and complete the setup flow at `/auth/setup` using the bootstrap token from the values file.
