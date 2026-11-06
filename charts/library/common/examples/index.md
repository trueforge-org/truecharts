## Full Examples

### Minimal values file

A complete minimal `values.yaml` of an app chart that depends on `common`. It has one workload with one container, a service that exposes it, a volume for the data and an ingress:

```yaml
TZ: Europe/Amsterdam

image:
  repository: oci.trueforge.org/containerforge/example
  pullPolicy: IfNotPresent
  tag: 1.2.3@sha256:0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef

workload:
  main:
    enabled: true
    primary: true
    type: Deployment
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          env:
            APP_PORT: 8080
          probes:
            liveness:
              enabled: true
              type: http
              path: /health
              port: 8080
            readiness:
              enabled: true
              type: http
              path: /health
              port: 8080
            startup:
              enabled: true
              type: http
              path: /health
              port: 8080

service:
  main:
    enabled: true
    primary: true
    ports:
      main:
        enabled: true
        primary: true
        port: 8080
        protocol: http

persistence:
  config:
    enabled: true
    type: pvc
    size: 1Gi
    mountPath: /config

ingress:
  main:
    enabled: true
    primary: true
    hosts:
      - host: app.example.com
        paths:
          - path: /
            pathType: Prefix
```

The main keys and where to read more about them:

- `image` and the other `*Image` keys define the images, see [Image](/truecharts-common/image).
- `workload` defines the pods and their containers, see [Workload](/truecharts-common/workload) and [Container](/truecharts-common/workload/podSpec/containers).
- `service`, `ingress` and `route` expose the workload, see [Service](/truecharts-common/service), [Ingress](/truecharts-common/ingress) and [Route](/truecharts-common/route).
- `persistence` defines the volumes, see [Persistence](/truecharts-common/persistence).
- `securityContext`, `containerOptions`, `podOptions` and `resources` set the defaults for all pods and containers, see [Security Context](/truecharts-common/securityContext), [Container Options](/truecharts-common/containerOptions), [Pod Options](/truecharts-common/podOptions) and [Resources](/truecharts-common/workload/podSpec/containers/resources).

### Defaults for all pods and containers

The defaults for every pod and container are set on the root of the values, and can be overridden on each workload and container:

```yaml
securityContext:
  container:
    runAsUser: 1000
    runAsGroup: 1000
  pod:
    fsGroup: 1000

resources:
  limits:
    cpu: 2000m
    memory: 2Gi
  requests:
    cpu: 100m
    memory: 256Mi

podOptions:
  automountServiceAccountToken: false
  terminationGracePeriodSeconds: 120

containerOptions:
  NVIDIA_CAPS:
    - compute
    - utility
```

### Database and addons

Dependencies and addons are switched on with an `enabled` key, see [Dependencies](/truecharts-common/dependencies) and [Addons](/truecharts-common/addons):

```yaml
dependencies:
  postgresql:
    enabled: true
    depconfig:
      postgresqlUsername: app
      postgresqlDatabase: app

addons:
  netshoot:
    enabled: true
```

## Keys that the values schema rejects

The values schema of `common` lists every key that `common` reads. Some keys in existing values files are silently ignored, because no template reads them. Charts do not validate your values against the schema yet, but once they do, these keys will fail the install or upgrade with an error like `Additional property apiKey is not allowed`. You can clean them up now. They do nothing today, so removing them does not change anything, and the table says when moving one does.

These are the most common ones:

| Ignored key | What to do |
| --- | --- |
| `ingress.$name.autoLink` | Remove it. |
| `metrics.$name.apiKey` | Remove it. For `bazarr` and `sabnzbd`, this key is in use: move it to `exportarr.apiKey`, which their exportarr container reads from the next major version of these charts. |
| `metrics.$name.matchLabels` | Move it to `metrics.$name.selector.matchLabels`. This starts selecting with these labels. |
| `metrics.$name.prometheusRule.labels`, `metrics.$name.prometheusRule.rules` | Remove them. Rules go in `metrics.$name.prometheusRule.groups`. |
| `cnpg.$name.username` | Remove it on an existing database. The database keeps the user it has, and `cnpg.$name.user` sets the user of a new database. |
| `cnpg.$name.primaryUpdateStrategy` | Move it to `cnpg.$name.cluster.primaryUpdateStrategy`. This starts using the strategy. |
| `cnpg.$name.storage.size` | Move it to `cnpg.$name.cluster.storage.size`, or remove it to keep the current size. A moved value starts to apply, and a volume can not shrink. |
| `cnpg.$name.storage.walsize` | Move it to `cnpg.$name.cluster.walStorage.size`, or remove it to keep the current size. A moved value starts to apply, and a volume can not shrink. |
| `service.$name.portsList` | Move each entry to `service.$name.ports.$name`. This starts creating these ports. |

Any other key that the schema rejects is a mistake in the values too: a misspelling, or a key in the wrong place. Find the right key in these docs, or remove it.
