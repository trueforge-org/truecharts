---
title: hosts
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/ingress/hosts#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress.$name.hosts`

---

## `hosts`

Hosts of the Ingress and the paths for each.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

A host of the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].host`

Hostname the rules apply to, eg `app.example.com`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[].host` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
ingress:
  example:
    hosts:
      - host: app.example.com
```

---

## `[].paths`

Paths of the host. Defaults to `/` with `Prefix`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[].paths` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].paths[]`

A path of the host.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[].paths[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].paths[].path`

Path of the rule, eg `/`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[].paths[].path` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
ingress:
  example:
    hosts:
      - paths:
          - path: /
```

---

## `[].paths[].pathType`

How the path is matched: `Prefix`, `Exact` or `ImplementationSpecific`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[].paths[].pathType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].paths[].overrideService`

Send this path to another Service than the one in `targetSelector`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[].paths[].overrideService` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].paths[].overrideService.name`

Name of the Service.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[].paths[].overrideService.name` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].paths[].overrideService.expandObjectName`

Prefix `name` with the release fullname. Set to `false` for a Service that is not created by this chart.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[].paths[].overrideService.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `[].paths[].overrideService.port`

Port number of the Service.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts[].paths[].overrideService.port` |
| Type | `int or string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
ingress:
  main:
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
```

```yaml
ingress:
  main:
    hosts:
      - host: sonarr.example.com
        paths:
          - path: /
            pathType: Prefix
```

```yaml
ingress:
  main:
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
          - path: /api
            pathType: Prefix
            overrideService:
              name: api
              port: 8080
      - host: '{{ .Release.Name }}.example.com'
        paths:
          - path: /
            pathType: Prefix
```
