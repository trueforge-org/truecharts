---
title: allowedListeners
---

## Appears in

- `.Values.gateway.$name.allowedListeners`

---

## `allowedListeners`

Which ListenerSets can attach to the Gateway.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `namespaces`

Namespaces from which ListenerSets can attach.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `namespaces.from`

Where ListenerSets can attach from: `All`, `Same`, `Selector` or `None`.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.from` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"None"` |
| Allowed values | `"All"`, `"Selector"`, `"Same"`, `"None"` |

---

## `namespaces.selector`

Label selector of the namespaces, used with `from: Selector`.

See [namespaceSelector](/truecharts-common/webhook/mutating/webhooks/namespaceSelector) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `gateway.$name.allowedListeners.namespaces.selector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---
