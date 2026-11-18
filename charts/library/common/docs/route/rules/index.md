---
title: rules
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/route/rules#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.rules`

---

## Child Pages

- [backendRefs](/truecharts-common/route/rules/backendRefs)
- [filters](/truecharts-common/route/rules/filters)
- [matches](/truecharts-common/route/rules/matches)

---

## `rules`

Routing rules. Without rules everything goes to the primary service. Fields the route kind does not support fail rendering.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[]`

A routing rule.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].backendRefs`

Where to send requests. Without this and without `filters`, the rule uses the primary service.

See [backendRefs](/truecharts-common/route/rules/backendRefs) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].backendRefs` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].matches`

Conditions for matching requests. Only for `HTTPRoute` and `GRPCRoute`.

See [matches](/truecharts-common/route/rules/matches) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].matches` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].name`

Name of the rule.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].filters`

Filters applied to requests matching this rule. Only for `HTTPRoute` and `GRPCRoute`. A rule with only filters needs no `backendRefs`, eg a redirect.

See [filters](/truecharts-common/route/rules/filters) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].timeouts`

`request` and `backendRequest` timeouts. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].timeouts` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].timeouts.request`

Timeout for the complete request, expressed as a duration such as `10s`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].timeouts.request` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
route:
  example:
    rules:
      - timeouts:
          request: 30s
```

---

## `[].timeouts.backendRequest`

Timeout for a backend request, expressed as a duration such as `5s`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].timeouts.backendRequest` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
route:
  example:
    rules:
      - timeouts:
          backendRequest: 10s
```

---

## `[].retry`

Retry configuration. Only for `HTTPRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].retry` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].retry.codes`

Status codes that are retried.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].retry.codes` |
| Type | `list of int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].retry.attempts`

Number of retries.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].retry.attempts` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].retry.backoff`

Minimum wait between retries, a duration like `100ms` or `1s`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].retry.backoff` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sessionPersistence`

Session persistence, needs the experimental Gateway API channel. Only for `HTTPRoute` and `GRPCRoute`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sessionPersistence.sessionName`

Name of the cookie or header that holds the session.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence.sessionName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sessionPersistence.absoluteTimeout`

Maximum lifetime of a session, a duration like `1h`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence.absoluteTimeout` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sessionPersistence.idleTimeout`

Time without requests after which a session ends, a duration like `10m`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence.idleTimeout` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sessionPersistence.type`

How the session is kept: `Cookie` or `Header`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Cookie"`, `"Header"` |

---

## `[].sessionPersistence.cookieConfig`

Settings of the cookie. Only with type `Cookie`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence.cookieConfig` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sessionPersistence.cookieConfig.lifetimeType`

Lifetime of the cookie: `Permanent` or `Session`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].sessionPersistence.cookieConfig.lifetimeType` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `"Permanent"`, `"Session"` |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
route:
  dns:
    rules:
      - backendRefs:
          - targetSelector: dns
```

```yaml
route:
  mqtt:
    rules:
      - backendRefs:
          - targetSelector: mqtt
```

```yaml
route:
  passthrough:
    rules:
      - backendRefs:
          - targetSelector: main
```
