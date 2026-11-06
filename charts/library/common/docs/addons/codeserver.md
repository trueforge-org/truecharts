---
title: Code Server
---

:::note

- See the [Full Examples](/truecharts-common/addons/codeserver#full-examples) section for complete examples.

:::

## Appears in

- `.Values.addons.codeserver`

---

## `codeserver`

A code-server container to edit the files of the app.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Enable the code-server addon.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.enabled` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `targetSelector`

Workloads to which the code-server addon is attached. Defaults to `main`.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container`

Container of the code-server add-on.

Takes the same keys as the [Container](/truecharts-common/workload/podSpec/containers) page, next to the keys below.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env`

Environment variables of the code-server container.

Takes the same keys as the [Env](/truecharts-common/workload/podSpec/containers/env) page, next to the keys below.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `container.env.PORT`

Code-server port.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.PORT` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `12321` |

---

## `container.env.DEFAULT_WORKSPACE`

Default workspace path.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.env.DEFAULT_WORKSPACE` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"/"` |

---

## `container.targetSelector`

Workloads to which this container is attached.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.container.targetSelector` |
| Type | `list of string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `service`

Service of the code-server addon. Either one Service object, or named Service objects next to `enabled`.

See [Service](/truecharts-common/service) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.service` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `ingress`

Ingress of the code-server addon. Either one Ingress object, or named Ingress objects next to `enabled`.

See [Ingress](/truecharts-common/ingress) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `addons.codeserver.ingress` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## Full Examples

Code server runs next to the app, so it can edit the files the app uses. It can only be attached to a single workload.

### Enable

```yaml
addons:
  codeserver:
    enabled: true
    targetSelector:
      - main
```

### Environment variables

`PORT` is the port code-server listens on, and `DEFAULT_WORKSPACE` the folder it opens. The port of the service has to match:

```yaml
addons:
  codeserver:
    enabled: true
    container:
      env:
        PORT: 12345
        DEFAULT_WORKSPACE: /config
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
```

### Service

The service and port are named `codeserver`:

```yaml
addons:
  codeserver:
    enabled: true
    service:
      enabled: true
      type: LoadBalancer
      ports:
        codeserver:
          enabled: true
          port: 12345
          targetPort: 12345
          nodePort: 30067
```

### Ingress

```yaml
addons:
  codeserver:
    enabled: true
    service:
      enabled: true
    ingress:
      enabled: true
      hosts:
        - host: code.chart-example.local
          paths:
            - path: /
              pathType: Prefix
      tls:
        - hosts:
            - code.chart-example.local
          secretName: code-example-tls
```

### Mount the volumes of the app

Mount a volume into the `codeserver` container, so the files can be edited:

```yaml
addons:
  codeserver:
    enabled: true

persistence:
  config:
    enabled: true
    type: pvc
    mountPath: /config
    targetSelector:
      main:
        main:
          mountPath: /config
        codeserver:
          mountPath: /config
```
