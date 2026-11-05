---
title: Time Zone
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/TZ#full-examples) section for complete examples.

:::

## Appears in

- `.Values.TZ`

---

## `TZ`

Timezone set as the `TZ` environment variable of the containers, unless overridden at the container level.

| Field | Value |
| --- | --- |
| Key | `TZ` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `"UTC"` |

Example

```yaml
TZ: Europe/Amsterdam
```

---

## Full Examples

`TZ` is set as the `TZ` environment variable of all containers. `namespace` is used for every object that does not set its own namespace:

```yaml
TZ: Europe/Amsterdam

namespace: my-namespace
```

A single container can override the timezone with `fixedEnv`:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          fixedEnv:
            TZ: America/New_York
```
