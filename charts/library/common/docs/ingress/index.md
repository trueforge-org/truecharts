---
title: Ingress
---

:::note

- See the [Full Examples](/truecharts-common/ingress#full-examples) section for complete examples.

:::

## Appears in

- `.Values.ingress`

---

## Child Pages

- [hosts](/truecharts-common/ingress/hosts)
- [Ingress Integrations](/truecharts-common/ingress/integrations)

---

## `ingress`

Ingresses, keyed by name. Each one routes external traffic to a service. See [ingress](/truecharts-common/ingress).

| Field | Value |
| --- | --- |
| Key | `ingress` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name`

An Ingress, keyed by name.

| Field | Value |
| --- | --- |
| Key | `ingress.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.integrations`

Integrations that add annotations, middlewares or certificates to the Ingress.

See [Ingress Integrations](/truecharts-common/ingress/integrations) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.integrations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Enable the Ingress.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.primary`

Make this the primary Ingress, used in notes and the chart context. Only 1 Ingress can be primary.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.primary` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.expandObjectName`

Prefix the name of the Ingress with the release fullname.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.expandObjectName` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.required`

Fail when the Ingress is disabled, for charts that need one.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.required` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.namespace`

Namespace of the Ingress. Defaults to the release namespace.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.labels`

Additional labels, keyed by name.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotations`

Additional annotations, keyed by name.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.ingressClassName`

Ingress class, eg `traefik` or `nginx`. When empty, `global.fallbackDefaults.ingressClassName` is used.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.ingressClassName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `""` |

---

## `$name.targetSelector`

Backend of the Ingress, as a map of `service: port` where `port` is the name of a port of the Service. Defaults to the primary service and port.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.targetSelector` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.targetSelector.$name`

Name of the port of the Service.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.targetSelector.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.hosts`

Hosts of the Ingress and the paths for each.

See [hosts](/truecharts-common/ingress/hosts) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.hosts` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.tls`

TLS settings of the Ingress, one entry per certificate.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.tls` |
| Type | `list of map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.tls[]`

A TLS entry of the Ingress. Set one of `secretName`, `certificateIssuer` or `clusterCertificate`.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.tls[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls[].hosts`

Hostnames the certificate is for.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.tls[].hosts` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls[].secretName`

Name of an existing TLS Secret to use.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.tls[].secretName` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.tls[].certificateIssuer`

Name of the cert-manager ClusterIssuer that issues the certificate.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.tls[].certificateIssuer` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.tls[].clusterCertificate`

Name of a cluster certificate (see `certificate`) whose Secret is used.

| Field | Value |
| --- | --- |
| Key | `ingress.$name.tls[].clusterCertificate` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.certificateIssuer`

Has no effect. The templates read `certificateIssuer` per TLS entry (`tls.$item.certificateIssuer`).

| Field | Value |
| --- | --- |
| Key | `ingress.$name.certificateIssuer` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Basic ingress

```yaml
ingress:
  main:
    enabled: true
    primary: true
    ingressClassName: nginx
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
```

### Multiple hosts, paths and a service override

```yaml
ingress:
  main:
    enabled: true
    primary: true
    required: false
    expandObjectName: true
    labels:
      key: value
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    ingressClassName: traefik
    targetSelector:
      main: main
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
      - host: "{{ .Release.Name }}.example.com"
        paths:
          - path: /
            pathType: Prefix
```

### TLS with an existing secret

```yaml
ingress:
  main:
    enabled: true
    ingressClassName: nginx
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    tls:
      - hosts:
          - app.example.com
        secretName: app-example-com-tls
```

### TLS from a cert-manager issuer

```yaml
ingress:
  main:
    enabled: true
    ingressClassName: nginx
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    tls:
      - hosts:
          - app.example.com
        certificateIssuer: my-issuer
```

### TLS from a cluster certificate

```yaml
ingress:
  main:
    enabled: true
    ingressClassName: nginx
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    tls:
      - hosts:
          - app.example.com
        clusterCertificate: wildcard-example-com
```

### With integrations

```yaml
ingress:
  main:
    enabled: true
    ingressClassName: traefik
    targetSelector:
      main: main
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
    integrations:
      certManager:
        enabled: true
        certificateIssuer: my-issuer
      traefik:
        enabled: true
        entrypoints:
          - websecure
        forceTLS: true
      homepage:
        enabled: true
        name: My App
        group: Apps
        icon: mdi-application
```

### Annotations and labels as lists

```yaml
ingress:
  main:
    enabled: true
    targetSelector:
      main: main
    annotationsList:
      - name: nginx.ingress.kubernetes.io/proxy-body-size
        value: 50m
    labelsList:
      - name: team
        value: apps
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
```
