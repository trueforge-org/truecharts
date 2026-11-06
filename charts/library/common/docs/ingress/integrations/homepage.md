---
title: Homepage Integration
---

:::note

- See the [Full Examples](/truecharts-common/ingress/integrations/homepage#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress.$name.integrations.homepage`
- `.Values.addons.codeserver.ingress.integrations.homepage`
- `.Values.addons.codeserver.ingress.$name.integrations.homepage`

---

## `homepage`

Homepage (gethomepage.dev) integration. Adds the service discovery annotations to the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Add the Homepage annotations to the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `name`

Name of the entry on the homepage. Sets the `gethomepage.dev/name` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `description`

Description of the entry on the homepage. Sets the `gethomepage.dev/description` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.description` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `group`

Group of the entry on the homepage. Sets the `gethomepage.dev/group` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.group` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `icon`

Icon of the entry on the homepage. Sets the `gethomepage.dev/icon` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.icon` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `href`

Link of the entry on the homepage. Sets the `gethomepage.dev/href` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.href` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `weight`

Sort weight of the entry within its group. Sets the `gethomepage.dev/weight` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.weight` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `podSelector`

Selectors of the pods used for the status of the entry. Sets the `gethomepage.dev/pod-selector` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.podSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `widget`

Widget shown with the entry on the homepage.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `widget.customkv`

Custom widget settings as a list of `key` and `value`. Each item sets a `gethomepage.dev/widget.$key` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.customkv` |
| Type | `list of map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `null` |

---

## `widget.customkv[]`

A custom widget setting.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.customkv[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `widget.customkv[].key`

Name of the setting. Sets the `gethomepage.dev/widget.$key` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.customkv[].key` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `widget.customkv[].value`

Value of the setting.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.customkv[].value` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `widget.enabled`

Add the widget annotations to the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `widget.type`

Type of the widget. Sets the `gethomepage.dev/widget.type` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `widget.version`

Version of the widget. Sets the `gethomepage.dev/widget.version` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.version` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `1` |

---

## `widget.url`

URL the widget talks to. Sets the `gethomepage.dev/widget.url` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.url` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `widget.custom`

Custom widget settings as a map of `key: value`. Each entry sets a `gethomepage.dev/widget.$key` annotation.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.custom` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `null` |

---

## `widget.custom.$name`

Value of the widget setting. Supports Helm `tpl`, empty values are skipped. Numbers and booleans are rendered as a string.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations.homepage.widget.custom.$name` |
| Type | `number or bool or null` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## Full Examples

### Basic

```yaml
ingress:
  main:
    enabled: true
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      homepage:
        enabled: true
        name: My App
        description: An example app
        group: Apps
        icon: mdi-application
        href: https://app.example.com
        weight: 10
```

### With a widget

```yaml
ingress:
  main:
    enabled: true
    targetSelector:
      main: main
    hosts:
      - host: sonarr.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      homepage:
        enabled: true
        name: Sonarr
        group: Media
        icon: sonarr
        podSelector:
          - main
        widget:
          enabled: true
          type: sonarr
          url: http://sonarr.media.svc.cluster.local:8989
          custom:
            enableQueue: "true"
          customkv:
            - key: key
              value: <api key>
```
