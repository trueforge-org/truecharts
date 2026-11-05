---
title: Ingress
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/ingress#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress`

---

## `ingress`

Create Ingress objects

| Field      | Value     |
| ---------- | --------- |
| Key        | `ingress` |
| Type       | `map`     |
| Required   | ❌        |
| Helm `tpl` | ❌        |
| Default    | unset     |

---

### `ingress.$name.annotations`

Additional annotations, keyed by name.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `ingress.$name.annotations` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ✅ (On value only)           |
| Default    | `{}`                        |

Example

```yaml
ingress:
  $name:
    annotations:
      {}
```

---

### `ingress.$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `ingress.$name.annotationsList` |
| Type       | `list of map`                   |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `ingress.$name.certificateIssuer`

Certificate issuer for this ingress. The templates read `certificateIssuer` per TLS entry (`tls.$item.certificateIssuer`), so this key has no effect.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `ingress.$name.certificateIssuer` |
| Type       | `string`                          |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `ingress.$name.enabled`

Enable the Ingress.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `ingress.$name.enabled` |
| Type       | `boolean, string`       |
| Required   | ✅                      |
| Helm `tpl` | ✅                      |
| Default    | `false`                 |

Example

```yaml
ingress:
  $name:
    enabled: false
```

---

### `ingress.$name.expandObjectName`

Define if the object name should be expanded

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `ingress.$name.expandObjectName` |
| Type       | `boolean`                        |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `false`                          |

Example

```yaml
ingress:
  $name:
    expandObjectName: false
```

---

### `ingress.$name.hosts`

Define the hosts for this ingress

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `ingress.$name.hosts` |
| Type       | `list of map`         |
| Required   | ✅                    |
| Helm `tpl` | ❌                    |
| Default    | `[]`                  |

Example

```yaml
ingress:
  $name:
    hosts:
      []
```

---

### `ingress.$name.ingressClassName`

Ingress class, eg `traefik` or `nginx`.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `ingress.$name.ingressClassName` |
| Type       | `string`                         |
| Required   | ❌                               |
| Helm `tpl` | ✅                               |
| Default    | `""`                             |

Example

```yaml
ingress:
  $name:
    ingressClassName: ""
```

---

### `ingress.$name.integrations`

Integrations with Traefik, nginx, cert-manager and homepage.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `ingress.$name.integrations` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `{}`                         |

Example

```yaml
ingress:
  $name:
    integrations:
      {}
```

---

### `ingress.$name.labels`

Additional labels, keyed by name.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `ingress.$name.labels` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ✅ (On value only)      |
| Default    | `{}`                   |

Example

```yaml
ingress:
  $name:
    labels:
      {}
```

---

### `ingress.$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `ingress.$name.labelsList` |
| Type       | `list of map`              |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

### `ingress.$name.namespace`

Define the namespace for this object

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `ingress.$name.namespace` |
| Type       | `string`                  |
| Required   | ❌                        |
| Helm `tpl` | ✅                        |
| Default    | `""`                      |

Example

```yaml
ingress:
  $name:
    namespace: ""
```

---

### `ingress.$name.primary`

Make this the primary Ingress.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `ingress.$name.primary` |
| Type       | `boolean`               |
| Required   | ✅                      |
| Helm `tpl` | ❌                      |
| Default    | `false`                 |

Example

```yaml
ingress:
  $name:
    primary: false
```

---

### `ingress.$name.required`

Fail when the Ingress is disabled, for charts that need one.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `ingress.$name.required` |
| Type       | `boolean`                |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | `false`                  |

Example

```yaml
ingress:
  $name:
    required: false
```

---

### `ingress.$name.targetSelector`

Define the `service: port` to assign the ingress

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `ingress.$name.targetSelector` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `"{}"`                         |

Example

```yaml
ingress:
  $name:
    targetSelector: {}
```

---

### `ingress.$name.tls`

Define TLS for this ingress

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `ingress.$name.tls` |
| Type       | `list of map`       |
| Required   | ✅                  |
| Helm `tpl` | ❌                  |
| Default    | `[]`                |

Example

```yaml
ingress:
  $name:
    tls:
      []
```

---

## Child Pages

- [Certmanager](certManager.md) - Create Ingress objects
- [Integrations](integrations/) - Configuration for `ingress.integrations`.
- [Traefik](traefik.md) - Create Ingress objects

---

## Full Examples

```yaml
ingress:
  main:
    enabled: false
    primary: true
    required: false
    expandObjectName: false
    labels:
      key: value
    annotations:
      key: value
    ingressClassName: ""
    targetSelector:
      main: main
    hosts:
      - host: chart-example.local
        paths:
          - path: /
            pathType: Prefix
            overrideService:
              name: main
              port: 80
    tls:
      - hosts:
          - chart-example.local
        secretName: chart-example-tls
        # OR
        certificateIssuer: ""
    integrations:
      certManager:
        enabled: false
        certificateIssuer: ""
      traefik:
        enabled: true
        entrypoints:
          - websecure
        forceTLS: true
        middlewares:
          - name: my-middleware
            namespace: ""
      homepage:
        enabled: false
        name: ""
        description: ""
        group: ""
        icon: ""
        widget:
          type: ""
          url: ""
          custom:
            key: value
          customkv:
            - key: some key
              value: some value
```
