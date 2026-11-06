---
title: Dependencies
---

Dependencies are services the app needs, such as a database or a cache. They are deployed with the chart, and they are switched on with an `enabled` key. There are two ways to add them.

## Predefined services

The root keys `cnpg`, `redis`, `mariadb`, `mongodb`, `clickhouse` and `solr` set up a service that common knows about. They are disabled by default.

- [CNPG](/truecharts-common/cnpg) (`cnpg.<name>`) creates a CloudNativePG `Cluster` of PostgreSQL. It can have several named entries, and each one is switched on with its own `enabled`.
- [Redis](/truecharts-common/redis), [MariaDB](/truecharts-common/mariadb), [MongoDB](/truecharts-common/mongodb), [ClickHouse](/truecharts-common/clickhouse) and [Solr](/truecharts-common/solr) use the `enabled` key and the `password` and user settings of their page.

When one of the database keys is enabled, common creates a Secret with the connection details under `creds`, and adds a wait container to the workloads, so they start after the service is reachable.

```yaml
redis:
  enabled: true
  password: example-placeholder-password
```

## Dependency sets

`dependencies.<name>` is a map of sets of chart values. Each entry needs an `enabled` key. When it is `true`, its values are merged into the values of the chart, and they override the values of the chart and of `common` for the keys they set. A disabled entry is ignored.

```yaml
dependencies:
  cache:
    enabled: true
    redis:
      enabled: true
      password: example-placeholder-password
```

The entry is merged as a whole, so keys that are not set in it keep the value of the chart.
