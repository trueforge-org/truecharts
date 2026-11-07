---
title: dataFrom
---

:::note

- See the [Full Examples](/truecharts-common/externalSecret/dataFrom#full-examples) section for complete examples.

:::

## Appears in

- `.Values.externalSecret.$name.dataFrom`

---

## `dataFrom`

Fetch multiple keys from the provider at once, passed as is. External Secrets Operator evaluates its own Go templates in rewrite transforms.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `[]`

A set of keys to fetch from the provider at once.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extract`

Extract all keys from a single provider entry.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extract.key`

Key of the entry in the provider.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extract.property`

Property of the entry to extract.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.property` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extract.version`

Version of the entry.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.version` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extract.conversionStrategy`

How the keys are converted, passed on as is, eg `Default` or `Unicode`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.conversionStrategy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extract.decodingStrategy`

How the values are decoded, passed on as is, eg `None`, `Base64`, `Base64URL` or `Auto`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.decodingStrategy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].extract.metadataPolicy`

Whether to fetch the metadata of the entry, eg `None` or `Fetch`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.metadataPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].find`

Find provider entries by name or tags, passed on as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].find` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].find.$name`

A setting of the search, passed on as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].find.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rewrite`

Rewrite the keys of the fetched data.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rewrite[]`

A rule that rewrites the keys of the fetched data, either with `regexp` or with `transform`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rewrite[].regexp`

Rewrite the keys with a regular expression.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].regexp` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rewrite[].regexp.source`

Regular expression to match the keys.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].regexp.source` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rewrite[].regexp.target`

Replacement of the matched part.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].regexp.target` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rewrite[].transform`

Rewrite the keys with a template.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].transform` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].rewrite[].transform.template`

Go template that gets the key as `.value`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].transform.template` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sourceRef`

Override the store for this entry, passed as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].sourceRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `[].sourceRef.$name`

A setting of the store reference, passed on as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].sourceRef.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
externalSecret:
  config:
    dataFrom:
      - extract:
          key: my-app/config
```

```yaml
externalSecret:
  all-config:
    dataFrom:
      - find:
          name:
            regexp: ^my-app-.*
        rewrite:
          - regexp:
              source: my-app-(.*)
              target: app_$1
```
