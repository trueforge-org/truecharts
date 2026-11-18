---
title: requestHeaderModifier
---

:::note

- See the [Full Examples](/truecharts-common/route/rules/filters/requestHeaderModifier#full-examples) section for complete examples.

:::

## Appears in

- `.Values.route.$name.rules[].filters[].requestHeaderModifier`
- `.Values.route.$name.rules[].filters[].responseHeaderModifier`
- `.Values.addons.codeserver.route.rules[].filters[].requestHeaderModifier`
- `.Values.addons.codeserver.route.rules[].filters[].responseHeaderModifier`
- `.Values.route.$name.rules[].backendRefs[].filters[].requestHeaderModifier`
- `.Values.route.$name.rules[].backendRefs[].filters[].responseHeaderModifier`
- `.Values.addons.codeserver.route.rules[].backendRefs[].filters[].requestHeaderModifier`
- `.Values.addons.codeserver.route.rules[].backendRefs[].filters[].responseHeaderModifier`

---

## `requestHeaderModifier`

Used with type `RequestHeaderModifier`.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `set`

Headers that overwrite the header of the same name.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier.set` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `set[]`

A header to set.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier.set[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `set[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier.set[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `set[].value`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier.set[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `add`

Headers that are added to the existing value of the header.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier.add` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `add[]`

A header to add.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier.add[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `add[].name`

Name of the header.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier.add[].name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `add[].value`

Value of the header.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier.add[].value` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `remove`

Names of the headers to remove.

| Field | Value |
| --- | --- |
| Key | `route.$name.rules[].filters[].requestHeaderModifier.remove` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
route:
  web:
    rules:
      - filters:
          - requestHeaderModifier:
              add:
                - name: X-Example
                  value: example
```
