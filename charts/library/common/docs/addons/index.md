---
title: Addons
---

:::note

- See the [Full Examples](/truecharts-common/addons#full-examples) section for complete examples.

:::

Addons that add containers or objects to the workloads, such as a VPN, Tailscale or code-server. See [addons](/truecharts-common/addons).

## Appears in

- `.Values.addons`

---

## Child Pages

- [Code Server](/truecharts-common/addons/codeserver)
- [Gluetun](/truecharts-common/addons/gluetun)
- [Netshoot](/truecharts-common/addons/netshoot)
- [Tailscale](/truecharts-common/addons/tailscale)

---

## Keys

| Key | Type | Description |
| --- | --- | --- |
| [`codeserver`](/truecharts-common/addons/codeserver) | `map` | A code-server container to edit the files of the app. |
| [`gluetun`](/truecharts-common/addons/gluetun) | `map` | A gluetun VPN container that routes the traffic of the pod. |
| [`netshoot`](/truecharts-common/addons/netshoot) | `map` | A netshoot container to debug the network of the pod. |
| [`tailscale`](/truecharts-common/addons/tailscale) | `map` | A tailscale container that connects the pod to a tailnet. |
| `vpn` | `map` | Removed vpn add-on. Only an empty object is accepted, any key is rejected, use `addons.gluetun` or `addons.tailscale` instead. |

---

## Full Examples

### Enable an addon

An addon adds a container, and for some addons objects like a service, to the workloads. Every addon is enabled with `enabled`, and `targetSelector` lists the workloads it is added to (`main` when not set):

```yaml
addons:
  netshoot:
    enabled: true
    targetSelector:
      - main
      - other-workload
```

### Several addons

Each addon has its own image on the root of the values, for example `netshootImage` and `tailscaleImage`, see [Image](/truecharts-common/image):

```yaml
addons:
  netshoot:
    enabled: true
  tailscale:
    enabled: true
    authkey: tskey-auth-placeholder
    routes: 10.0.0.0/8
  gluetun:
    enabled: true
    container:
      env:
        VPN_SERVICE_PROVIDER: custom
        VPN_TYPE: wireguard
```

### Container options

The `container` of every addon takes the options of an addon container, see [Addon Container](/truecharts-common/workload/podSpec/containers):

```yaml
addons:
  codeserver:
    enabled: true
    container:
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
```

### Code server with service and ingress

```yaml
addons:
  codeserver:
    enabled: true
    container:
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
    service:
      enabled: true
      ports:
        codeserver:
          enabled: true
          port: 12345
          targetPort: 12345
    ingress:
      enabled: true
      hosts:
        - host: code.chart-example.local
          paths:
            - path: /
              pathType: Prefix
```

### Addon container settings

The container of an addon takes the same keys as a [container](/truecharts-common/workload/podSpec/containers) of a workload, and adds `targetSelector`.

The `container` of an addon takes the options of a workload container. Common sets the image, command and environment of the addon itself, so you mostly set resources, the security context, probes and extra environment variables.

#### Resources

```yaml
addons:
  codeserver:
    enabled: true
    container:
      resources:
        limits:
          cpu: 3333m
          memory: 3333Mi
        requests:
          cpu: 100m
          memory: 256Mi
```

#### Environment variables

Values can be plain, or come from a Secret, ConfigMap or field:

```yaml
addons:
  netshoot:
    enabled: true
    container:
      env:
        MY_VAR: my-value
        MY_PORT: 8080
        MY_TOKEN:
          secretKeyRef:
            name: my-secret
            key: token
            expandObjectName: false
        MY_SETTING:
          configMapKeyRef:
            name: my-configmap
            key: setting
        POD_NAME:
          fieldRef:
            fieldPath: metadata.name
```

#### Environment variables from a ConfigMap or Secret

```yaml
addons:
  codeserver:
    enabled: true
    container:
      envFrom:
        - configMapRef:
            name: my-configmap
            expandObjectName: false
        - secretRef:
            name: my-secret
            expandObjectName: false
```

#### Security context

```yaml
addons:
  gluetun:
    enabled: true
    container:
      securityContext:
        runAsUser: 0
        runAsGroup: 0
        runAsNonRoot: false
        readOnlyRootFilesystem: false
        capabilities:
          add:
            - NET_ADMIN
```

#### Probes, command and arguments

```yaml
addons:
  netshoot:
    enabled: true
    container:
      probes:
        liveness:
          enabled: false
        readiness:
          enabled: false
        startup:
          enabled: false
      command:
        - /bin/sh
        - -c
      args:
        - sleep infinity
```

#### Lifecycle and termination

```yaml
addons:
  codeserver:
    enabled: true
    container:
      lifecycle:
        preStop:
          type: exec
          command:
            - /bin/sh
            - -c
            - sleep 5
      termination:
        messagePath: /dev/termination-log
        messagePolicy: FallbackToLogsOnError
```

#### Other options

`targetSelector` selects the workloads of this container, `stdin` and `tty` keep an interactive session open, and `fixedEnv` changes the environment variables that common sets:

```yaml
addons:
  netshoot:
    enabled: true
    container:
      stdin: true
      tty: true
      fixedEnv:
        TZ: Europe/Amsterdam
```
