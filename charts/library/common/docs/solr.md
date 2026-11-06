---
title: Solr
---

:::note

- See the [Full Examples](/truecharts-common/solr#full-examples) section for complete examples.

:::

## Appears in

- `.Values.solr`

---

## `solr`

Solr dependency configuration. See [solr](/truecharts-common/solr).

:::warning

This object also takes all keys of the root values, for example `workload`, `service` and `persistence`. They come from the Helm subchart dependency that defines this object: Helm adds the default values of the subchart here. Do not set them in the values of the chart.

:::

| Field | Value |
| --- | --- |
| Key | `solr` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enables the Solr dependency. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `solr.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `includeCommon`

Marker for charts that the dependency uses common. Not read by common.

| Field | Value |
| --- | --- |
| Key | `solr.includeCommon` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `solr.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PLACEHOLDERPASSWORD"` |
| Length | 1 to … |

---

## `solrUsername`

Name of the admin user, used in the connection URL and the wait container.

| Field | Value |
| --- | --- |
| Key | `solr.solrUsername` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `solrCores`

Name or number of the core used in the connection URL and the wait container.

| Field | Value |
| --- | --- |
| Key | `solr.solrCores` |
| Type | `int or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `1` |

---

## `solrEnableAuthentication`

Whether the wait container authenticates with `solrUsername` and the password.

| Field | Value |
| --- | --- |
| Key | `solr.solrEnableAuthentication` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"no"` |
| Allowed values | `"yes"`, `"no"` |

---

## `creds`

Connection details written by common, so apps using the dependency can use them. Read only.

| Field | Value |
| --- | --- |
| Key | `solr.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `creds.solrPassword`

Password.

| Field | Value |
| --- | --- |
| Key | `solr.creds.solrPassword` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plain`

Hostname.

| Field | Value |
| --- | --- |
| Key | `solr.creds.plain` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.plainhost`

Hostname.

| Field | Value |
| --- | --- |
| Key | `solr.creds.plainhost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.portHost`

Hostname and port.

| Field | Value |
| --- | --- |
| Key | `solr.creds.portHost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `creds.url`

Connection URL.

| Field | Value |
| --- | --- |
| Key | `solr.creds.url` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Solr with authentication

Uses the admin user and the password in the connection URL and the wait container. The password is a placeholder:

```yaml
solr:
  enabled: true
  password: example-placeholder-password
  solrUsername: admin
  solrCores: "main"
  solrEnableAuthentication: "yes"
```
