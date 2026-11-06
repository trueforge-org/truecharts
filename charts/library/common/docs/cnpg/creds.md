---
title: creds
---

:::note

- See the [Full Examples](/truecharts-common/cnpg/creds#full-examples) section for complete examples.

:::

## Appears in

- `.Values.cnpg.$name.creds`

---

## `creds`

Credentials and URLs of the cluster, written by common so apps can use them. Read only.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `password`

Password of the database user.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.password` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `std`

Connection URL of the read-write endpoint.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.std` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nossl`

Connection URL of the read-write endpoint with `sslmode=disable`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.nossl` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `porthost`

Host and port of the read-write endpoint.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.porthost` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `host`

Host of the read-write endpoint.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.host` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `jdbc`

JDBC URL of the read-write endpoint.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.jdbc` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `stdRO`

Connection URL of the read-only pooler.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.stdRO` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `nosslRO`

Connection URL of the read-only pooler with `sslmode=disable`.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.nosslRO` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `porthostRO`

Host and port of the read-only pooler.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.porthostRO` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `hostRO`

Host of the read-only pooler.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.hostRO` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `jdbcRO`

JDBC URL of the read-only pooler.

| Field | Value |
| --- | --- |
| Key | `cnpg.$name.creds.jdbcRO` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

A small example, built from the schema. It shows the keys that the page needs.

```yaml
cnpg:
  example:
    creds:
      password: example
      std: example
```
