---
title: Common Chart Documentation
---

:::note

- See the [Full Examples](/truecharts-common#full-examples) section for complete examples.

:::

This applies across all the documentation:

- Helm `tpl`:
  - ❌ means that the value is not templated
  - ✅ means that the value is templated, for example instead of a hardcoded value, you can set it to `{{ .Values.some.value }}` and it will be replaced by the value contained in `.Values.some.value` at the installation/upgrade time.

## Keys

| Key | Type | Description |
| --- | --- | --- |
| [`global`](/truecharts-common/global) | `map` | Global values that apply to the chart and its dependencies. See [global](/truecharts-common/global). |
| [`namespace`](/truecharts-common/namespace) | `string` | Namespace to create all objects in, unless overridden at the object level. Does not apply to chart dependencies, use `global.namespace` for that. |
| [`image`](/truecharts-common/image) | `map` | The main image of the chart, used by containers that do not select another image with `imageSelector`. See [image](/truecharts-common/image). |
| [`chartContext`](/truecharts-common/chartContext) | `map` | Details about the release that common works out on every render, such as the URL of the app. Common sets these itself. |
| [`common`](/truecharts-common/common) | `any` | Values merged into the common defaults before the values of the chart. Takes the same values as the chart itself. |
| [`securityContext`](/truecharts-common/securityContext) | `map` | Default security contexts for all containers and pods, unless overridden at the container or pod level. See [securityContext](/truecharts-common/securityContext). |
| [`resources`](/truecharts-common/resources) | `map` | Default CPU and memory resources of each container, unless overridden at the container level. They apply to every container, not to the pod as a whole. See [resources](/truecharts-common/resources). |
| [`containerOptions`](/truecharts-common/containerOptions) | `map` | Options that apply to all containers, unless overridden at the container level. See [containerOptions](/truecharts-common/containerOptions). |
| [`podOptions`](/truecharts-common/podOptions) | `map` | Options that apply to all pods, unless overridden at the pod level. See [podOptions](/truecharts-common/podOptions). |
| [`workload`](/truecharts-common/workload) | `map` | Workloads (Deployment, StatefulSet, DaemonSet, Job, CronJob), keyed by name. Each one holds a pod spec and its containers. See [workload](/truecharts-common/workload). |
| [`TZ`](/truecharts-common/TZ) | `string` | Timezone set as the `TZ` environment variable of the containers, unless overridden at the container level. |
| [`diagnosticMode`](/truecharts-common/diagnosticMode) | `map` | Run the containers with a sleep command instead of the app, so you can exec into them to debug. |
| [`vpa`](/truecharts-common/vpa) | `map` | VerticalPodAutoscalers, keyed by name. Each one scales the resources of a workload. |
| [`hpa`](/truecharts-common/hpa) | `map` | HorizontalPodAutoscalers, keyed by name. Each one scales the replicas of a workload. |
| [`service`](/truecharts-common/service) | `map` | Services, keyed by name. Each one exposes a workload on one or more ports. See [service](/truecharts-common/service). |
| [`credentials`](/truecharts-common/credentials) | `map` | Credentials for S3 compatible backup targets, keyed by name. |
| [`ingressMiddlewares`](/truecharts-common/ingressMiddlewares) | `map` | Ingress middlewares (Traefik Middleware objects), keyed by ingress controller and then by name. See [middlewares](/truecharts-common/ingressMiddlewares). |
| [`persistence`](/truecharts-common/persistence) | `map` | Volumes, keyed by name. Each one is a PVC, emptyDir, hostPath, secret, configmap or other volume type, mounted into containers. See [persistence](/truecharts-common/persistence). |
| [`volumeSnapshotClass`](/truecharts-common/volumeSnapshotClass) | `map` | VolumeSnapshotClasses, keyed by name. |
| [`volumeSnapshots`](/truecharts-common/volumeSnapshots) | `map` | VolumeSnapshots, keyed by name. |
| [`imagePullSecret`](/truecharts-common/imagePullSecret) | `map` | Image pull secrets, keyed by name, for pulling images from a private registry. |
| [`configmap`](/truecharts-common/configmap) | `map` | ConfigMaps, keyed by name. |
| [`configMapsFromFolder`](/truecharts-common/configMapsFromFolder) | `map` | Generate ConfigMaps from the folders in a directory of the parent chart. |
| [`secret`](/truecharts-common/secret) | `map` | Secrets, keyed by name. |
| [`externalSecret`](/truecharts-common/externalSecret) | `map` | ExternalSecrets, keyed by name. The External Secrets Operator syncs them into Secrets from an external store. |
| [`serviceAccount`](/truecharts-common/serviceAccount) | `map` | ServiceAccounts, keyed by name. |
| [`rbac`](/truecharts-common/rbac) | `map` | Roles and RoleBindings (or ClusterRoles and ClusterRoleBindings), keyed by name. |
| [`notes`](/truecharts-common/notes) | `map` | Content of `NOTES.txt`, shown after install and upgrade. |
| [`gluetunImage`](/truecharts-common/image) | `map` | Image of the gluetun VPN client, used by the gluetun addon. |
| [`netshootImage`](/truecharts-common/image) | `map` | Image of netshoot, a network troubleshooting toolbox, used by the netshoot addon. |
| [`tailscaleImage`](/truecharts-common/image) | `map` | Image of Tailscale, used by the tailscale addon. |
| [`codeserverImage`](/truecharts-common/image) | `map` | Image of code-server, used by the codeserver addon. |
| [`ubuntuImage`](/truecharts-common/image) | `map` | Image of Ubuntu, used by the init containers that fix permissions (autoperms) and by the wait-for-database init containers. |
| [`kubectlImage`](/truecharts-common/image) | `map` | Image of kubectl, for containers that select it with `imageSelector: kubectlImage`. |
| [`postgresClientImage`](/truecharts-common/image) | `map` | Image of the PostgreSQL client, used by the init container that waits for the postgresql dependency. |
| [`postgresql18Image`](/truecharts-common/image) | `map` | Image of the postgresql dependency (PostgreSQL 18), used when `dependencies.postgresql` runs in standalone mode. |
| [`clickhouseImage`](/truecharts-common/image) | `map` | Image of the clickhouse dependency. |
| [`mariadbImage`](/truecharts-common/image) | `map` | Image of the mariadb dependency. |
| [`memcachedImage`](/truecharts-common/image) | `map` | Image of the memcached dependency. |
| [`mongodbImage`](/truecharts-common/image) | `map` | Image of the mongodb dependency. |
| [`valkeyImage`](/truecharts-common/image) | `map` | Image of the valkey dependency, used in `standalone` mode and, via `dependencies.valkey.operator.imageSelector`, for the nodes in `operator` mode. |
| [`valkeyExporterImage`](/truecharts-common/image) | `map` | Image of the metrics exporter of the valkey dependency in `operator` mode, selected by `dependencies.valkey.operator.exporter.imageSelector`. |
| [`mariadbClientImage`](/truecharts-common/image) | `map` | Image of the MariaDB client, used by the init container that waits for the mariadb dependency. |
| [`valkeyClientImage`](/truecharts-common/image) | `map` | Image of the Valkey client tools, used by the init container that waits for the valkey dependency. |
| [`mongodbClientImage`](/truecharts-common/image) | `map` | Image of the MongoDB shell, used by the init container that waits for the mongodb dependency. |
| [`postgres15Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 15 (CloudNativePG), used by CNPG clusters of the postgresql dependency with `pgVersion: 15`. |
| [`postgres16Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 16 (CloudNativePG), used by CNPG clusters of the postgresql dependency with `pgVersion: 16`. |
| [`postgres17Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 17 (CloudNativePG), used by CNPG clusters of the postgresql dependency with `pgVersion: 17`. |
| [`postgres18Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 18 (CloudNativePG), used by CNPG clusters of the postgresql dependency with `pgVersion: 18`. |
| [`postgresPostgis15Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 15 with PostGIS (CloudNativePG), used by CNPG clusters with `pgVersion: 15` and the `postgis` type. |
| [`postgresPostgis16Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 16 with PostGIS (CloudNativePG), used by CNPG clusters with `pgVersion: 16` and the `postgis` type. |
| [`postgresPostgis17Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 17 with PostGIS (CloudNativePG), used by CNPG clusters with `pgVersion: 17` and the `postgis` type. |
| [`postgresPostgis18Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 18 with PostGIS (CloudNativePG), used by CNPG clusters with `pgVersion: 18` and the `postgis` type. |
| [`postgresVectors15Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 15 with pgvecto.rs (CloudNativePG), used by CNPG clusters with `pgVersion: 15` and the `vectors` type. |
| [`postgresVectors16Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 16 with pgvecto.rs (CloudNativePG), used by CNPG clusters with `pgVersion: 16` and the `vectors` type. |
| [`postgresVectors17Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 17 with pgvecto.rs (CloudNativePG), used by CNPG clusters with `pgVersion: 17` and the `vectors` type. |
| [`postgresVectorchord15Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 15 with VectorChord (CloudNativePG), used by CNPG clusters with `pgVersion: 15` and the `vectorchord` type. |
| [`postgresVectorchord16Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 16 with VectorChord (CloudNativePG), used by CNPG clusters with `pgVersion: 16` and the `vectorchord` type. |
| [`postgresVectorchord17Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 17 with VectorChord (CloudNativePG), used by CNPG clusters with `pgVersion: 17` and the `vectorchord` type. |
| [`postgresVectorchord18Image`](/truecharts-common/image) | `map` | Image of PostgreSQL 18 with VectorChord (CloudNativePG), used by CNPG clusters with `pgVersion: 18` and the `vectorchord` type. |
| [`ingress`](/truecharts-common/ingress) | `map` | Ingresses, keyed by name. Each one routes external traffic to a service. See [ingress](/truecharts-common/ingress). |
| [`certificate`](/truecharts-common/certificate) | `map` | cert-manager Certificates, keyed by name. |
| [`gatewayClass`](/truecharts-common/gatewayClass) | `map` | Gateway API GatewayClasses, keyed by name. |
| [`gateway`](/truecharts-common/gateway) | `map` | Gateway API Gateways, keyed by name. See [gateway](/truecharts-common/gateway). |
| [`listenerSet`](/truecharts-common/listenerSet) | `map` | Gateway API ListenerSets, keyed by name. Each one adds listeners to an existing Gateway. |
| [`route`](/truecharts-common/route) | `map` | Gateway API routes (HTTPRoute, GRPCRoute, TCPRoute, TLSRoute, UDPRoute), keyed by name. See [route](/truecharts-common/route). |
| [`networkpolicy`](/truecharts-common/networkpolicy) | `map` | Network policies, keyed by name. See [networkpolicy](/truecharts-common/networkpolicy). |
| [`podDisruptionBudget`](/truecharts-common/podDisruptionBudget) | `map` | Pod Disruption Budgets, keyed by name. |
| [`webhook`](/truecharts-common/webhook) | `map` | Webhook configurations (validating and mutating), keyed by name. |
| [`priorityClass`](/truecharts-common/priorityClass) | `map` | PriorityClasses, keyed by name. |
| [`storageClass`](/truecharts-common/storageClass) | `map` | StorageClasses, keyed by name. |
| [`metrics`](/truecharts-common/metrics) | `map` | ServiceMonitors, PodMonitors and PrometheusRules, keyed by name. See [metrics](/truecharts-common/metrics). |
| [`addons`](/truecharts-common/addons) | `map` | Addons that add containers or objects to the workloads, such as a VPN, Tailscale or code-server. See [addons](/truecharts-common/addons). |
| [`dependencies`](/truecharts-common/dependencies) | `map` | Services the app needs, such as a database or cache, deployed with the chart. See [dependencies](/truecharts-common/dependencies). |
| [`extraTpl`](/truecharts-common/extraTpl) | `list of map or string` | Extra Kubernetes resources to render, one per list item, as a YAML object or as a string. Helm `tpl` is resolved in each item. |

---

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
- `securityContext`, `containerOptions`, `podOptions` and `resources` set the defaults for all pods and containers, see [Security Context](/truecharts-common/securityContext), [Container Options](/truecharts-common/containerOptions), [Pod Options](/truecharts-common/podOptions) and [Resources](/truecharts-common/resources).

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
