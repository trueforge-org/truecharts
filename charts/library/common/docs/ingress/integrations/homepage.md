---
title: Homepage
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingress/integrations/homepage#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress.integrations.homepage`

---

## `ingress.integrations.homepage`

Create Ingress objects

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `ingress.integrations.homepage` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `ingress.integrations.homepage.description`

Define the description for the application Sets the `gethomepage.dev/description` annotation

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `ingress.integrations.homepage.description` |
| Type       | `string`                                    |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

---

### `ingress.integrations.homepage.enabled`

Enables or Disables the homepage integration

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `ingress.integrations.homepage.enabled` |
| Type       | `boolean`                               |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `false`                                 |

Example

```yaml
ingress:
  integrations:
    homepage:
      enabled: false
```

---

### `ingress.integrations.homepage.group`

Define the group for the application Sets the `gethomepage.dev/group` annotation

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `ingress.integrations.homepage.group` |
| Type       | `string`                              |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | `""`                                  |

Example

```yaml
ingress:
  integrations:
    homepage:
      group: ""
```

---

### `ingress.integrations.homepage.href`

Define the href for the application Sets the `gethomepage.dev/href` annotation

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `ingress.integrations.homepage.href` |
| Type       | `string`                             |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `ingress.integrations.homepage.icon`

Define the icon for the application Sets the `gethomepage.dev/icon` annotation

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `ingress.integrations.homepage.icon` |
| Type       | `string`                             |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `ingress.integrations.homepage.name`

Define the name for the application Sets the `gethomepage.dev/name` annotation

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `ingress.integrations.homepage.name` |
| Type       | `string`                             |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `ingress.integrations.homepage.podSelector`

Define the pods to select Sets the `gethomepage.dev/pod-selector` annotation

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `ingress.integrations.homepage.podSelector` |
| Type       | `list of unknown`                           |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | `[]`                                        |

Example

```yaml
ingress:
  integrations:
    homepage:
      podSelector:
        []
```

---

### `ingress.integrations.homepage.weight`

Define the weight for the application Sets the `gethomepage.dev/weight` annotation

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `ingress.integrations.homepage.weight` |
| Type       | `integer`                              |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `ingress.integrations.homepage.widget`

Define configuration for the widget

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `ingress.integrations.homepage.widget` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | `{}`                                   |

Example

```yaml
ingress:
  integrations:
    homepage:
      widget:
        {}
```

---

## Full Examples

```yaml
ingress:
  ingress-name:
    integrations:
      homepage:
        enabled: false
        name: ""
        description: ""
        group: ""
        icon: ""
        href: ""
        weight: 0
        podSelector: []
        widget:
          enabled: true
          type: ""
          url: ""
          custom:
            key: value
          customkv:
            - key: some key
              value: some value
```
