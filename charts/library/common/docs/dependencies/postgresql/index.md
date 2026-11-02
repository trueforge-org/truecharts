---
title: Postgresql
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql`

---

## `dependencies.postgresql`

The postgresql dependency. In `operator` mode (default) a CloudNativePG `Cluster` is spawned from `operator`.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `dependencies.postgresql` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

---

### `dependencies.postgresql.TZ`

Timezone that is used everywhere applicable, unless overridden at the container level

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `dependencies.postgresql.TZ` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | `"UTC"`                      |

See [Tz](../../TZ.md) for full configuration.

Example

```yaml
dependencies:
  postgresql:
    TZ: UTC
```

---

### `dependencies.postgresql.addons`

Addons to the workloads

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `dependencies.postgresql.addons` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Addons](../../addons/) for full configuration.

---

### `dependencies.postgresql.args`

See [args](/truecharts-common/container/args#args)

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.postgresql.args` |
| Type       | `map, string, list of string`  |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

See [Args](../../workload/podSpec/containers/args.md) for full configuration.

---

### `dependencies.postgresql.automountServiceAccountToken`

See [Automount Service Account Token](/truecharts-common/workload#automountserviceaccounttoken)

| Field      | Value                                                  |
| ---------- | ------------------------------------------------------ |
| Key        | `dependencies.postgresql.automountServiceAccountToken` |
| Type       | `boolean`                                              |
| Required   | ❌                                                     |
| Helm `tpl` | ❌                                                     |
| Default    | unset                                                  |

See [Automountserviceaccounttoken](../../workload/podSpec/automountServiceAccountToken.md) for full configuration.

---

### `dependencies.postgresql.certificate`

Define certificates

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.certificate` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Certificate](../../certificate.md) for full configuration.

---

### `dependencies.postgresql.chartContext`

Configuration for `chartContext`.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.chartContext` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Chartcontext](../../chartContext.md) for full configuration.

---

### `dependencies.postgresql.clickhouse`

No description provided.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.postgresql.clickhouse` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `dependencies.postgresql.codeserverImage`

Configuration for `codeserverImage`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.codeserverImage` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Codeserverimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.command`

See [command](/truecharts-common/container/command)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.command` |
| Type       | `map, string, list of string`     |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Command](../../workload/podSpec/containers/command.md) for full configuration.

---

### `dependencies.postgresql.common`

Values to merge into the common chart defaults before chart-specific overrides.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `dependencies.postgresql.common` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Common](../../common.md) for full configuration.

---

### `dependencies.postgresql.configMapsFromFolder`

Generate ConfigMaps from a folder structure in the Helm chart's filesystem

| Field      | Value                                          |
| ---------- | ---------------------------------------------- |
| Key        | `dependencies.postgresql.configMapsFromFolder` |
| Type       | `map`                                          |
| Required   | ❌                                             |
| Helm `tpl` | ❌                                             |
| Default    | unset                                          |

See [Configmapsfromfolder](../../configMapsFromFolder.md) for full configuration.

---

### `dependencies.postgresql.configmap`

Create Configmap objects

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.configmap` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Configmap](../../configmap.md) for full configuration.

---

### `dependencies.postgresql.containerOptions`

Options that apply to all containers, unless overridden at the container level See more info about containerOptions [documentation](/truecharts-common/containeroptions)

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.postgresql.containerOptions` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

See [Containeroptions](../../containerOptions.md) for full configuration.

---

### `dependencies.postgresql.credentials`

Create credentials objects

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.credentials` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Credentials](../../credentials.md) for full configuration.

---

### `dependencies.postgresql.defaultSpread`

Sets some default topology spread constraints for good spread of pods across nodes.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.postgresql.defaultSpread` |
| Type       | `boolean`                               |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Defaultspread](../../workload/podSpec/defaultSpread.md) for full configuration.

---

### `dependencies.postgresql.depconfig`

Configuration of the dependency itself, for both modes. Never merged into the chart.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.depconfig` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `dependencies.postgresql.dependencies`

Configuration for `dependencies`.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.dependencies` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Dependencies](../) for full configuration.

---

### `dependencies.postgresql.diagnosticMode`

Configuration for `diagnosticMode`.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.postgresql.diagnosticMode` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

See [Diagnosticmode](../../diagnosticMode.md) for full configuration.

---

### `dependencies.postgresql.dnsConfig`

See [DNS Config](/truecharts-common/workload#dnsconfig)

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.dnsConfig` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Dnsconfig](../../podOptions/dnsConfig.md) for full configuration.

---

### `dependencies.postgresql.dnsPolicy`

See [DNS Policy](/truecharts-common/workload#dnspolicy)

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.dnsPolicy` |
| Type       | `string`                            |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Dnspolicy](../../workload/podSpec/dnsPolicy.md) for full configuration.

---

### `dependencies.postgresql.enableServiceLinks`

See [Enable Service Links](/truecharts-common/workload#enableservicelinks)

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.postgresql.enableServiceLinks` |
| Type       | `boolean`                                    |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Enableservicelinks](../../workload/podSpec/enableServiceLinks.md) for full configuration.

---

### `dependencies.postgresql.env`

See [env](/truecharts-common/container/env)

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.postgresql.env` |
| Type       | `map, null`                   |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Env](../../workload/podSpec/containers/env.md) for full configuration.

---

### `dependencies.postgresql.envFrom`

See [envFrom](/truecharts-common/container/envfrom)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.envFrom` |
| Type       | `list of map`                     |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Envfrom](../../workload/podSpec/containers/envFrom.md) for full configuration.

---

### `dependencies.postgresql.externalSecret`

Create ExternalSecret objects

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.postgresql.externalSecret` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

See [Externalsecret](../../externalSecret.md) for full configuration.

---

### `dependencies.postgresql.extraTpl`

Define kubernetes resources, 1 per list item, tpl will be resolved

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.postgresql.extraTpl` |
| Type       | `list of map, string`              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `[]`                               |

See [Extratpl](../../extraTpl.md) for full configuration.

Example

```yaml
dependencies:
  postgresql:
    extraTpl:
      []
```

---

### `dependencies.postgresql.fallbackDefaults`

The fallback defaults are used when a value is not defined in the chart. - See more info about fallbackDefaults [documentation](/truecharts-common/fallbackdefaults)

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.postgresql.fallbackDefaults` |
| Type       | `map`                                      |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

See [Fallbackdefaults](../../global/fallbackDefaults.md) for full configuration.

---

### `dependencies.postgresql.fixedEnv`

See [fixedEnv](/truecharts-common/container/fixedenv)

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.postgresql.fixedEnv` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Fixedenv](../../workload/podSpec/containers/fixedEnv.md) for full configuration.

---

### `dependencies.postgresql.gateway`

Configure Gateway API gateways

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.gateway` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Gateway](../../gateway.md) for full configuration.

---

### `dependencies.postgresql.gatewayClass`

Configure Gateway API gateway classes

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.gatewayClass` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Gatewayclass](../../gatewayClass.md) for full configuration.

---

### `dependencies.postgresql.global`

Global values that apply to all charts See more info about global values [documentation](/truecharts-common/global)

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `dependencies.postgresql.global` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Global](../../global/) for full configuration.

---

### `dependencies.postgresql.gluetunImage`

Configuration for `gluetunImage`.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.gluetunImage` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Gluetunimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.hostAliases`

See [Host Aliases](/truecharts-common/workload#hostaliases)

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.hostAliases` |
| Type       | `list, string`                        |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Hostaliases](../../podOptions/hostAliases.md) for full configuration.

---

### `dependencies.postgresql.hostIPC`

See [Host IPC](/truecharts-common/workload#hostipc)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.hostIPC` |
| Type       | `boolean`                         |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Hostipc](../../workload/podSpec/hostIPC.md) for full configuration.

---

### `dependencies.postgresql.hostNetwork`

See [Host Network](/truecharts-common/workload#hostnetwork)

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.hostNetwork` |
| Type       | `boolean`                             |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Hostnetwork](../../workload/podSpec/hostNetwork.md) for full configuration.

---

### `dependencies.postgresql.hostPID`

See [Host PID](/truecharts-common/workload#hostpid)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.hostPID` |
| Type       | `boolean`                         |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Hostpid](../../workload/podSpec/hostPID.md) for full configuration.

---

### `dependencies.postgresql.hostUsers`

See [Host Users](/truecharts-common/workload#hostusers)

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.hostUsers` |
| Type       | `boolean`                           |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Hostusers](../../workload/podSpec/hostUsers.md) for full configuration.

---

### `dependencies.postgresql.hpa`

Configuration for `hpa`.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.postgresql.hpa` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Hpa](../../hpa.md) for full configuration.

---

### `dependencies.postgresql.image`

Defines the image details

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.postgresql.image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Image](../../image.md) for full configuration.

---

### `dependencies.postgresql.imagePullSecret`

Define image pull secrets

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.imagePullSecret` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Imagepullsecret](../../imagePullSecret.md) for full configuration.

---

### `dependencies.postgresql.ingress`

Create Ingress objects

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.ingress` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Ingress](../../ingress/) for full configuration.

---

### `dependencies.postgresql.ingressMiddlewares`

Create Middleware objects

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.postgresql.ingressMiddlewares` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Ingressmiddlewares](../../ingressMiddlewares/) for full configuration.

---

### `dependencies.postgresql.kubectlImage`

Configuration for `kubectlImage`.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.kubectlImage` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Kubectlimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.lifecycle`

Does **not** apply to `initContainers` See [lifecycle](/truecharts-common/container/lifecycle)

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.lifecycle` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Lifecycle](../../workload/podSpec/containers/lifecycle.md) for full configuration.

---

### `dependencies.postgresql.listenerSet`

Create Gateway API ListenerSet objects

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.listenerSet` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Listenerset](../../listenerSet.md) for full configuration.

---

### `dependencies.postgresql.mariadb`

No description provided.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.mariadb` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `dependencies.postgresql.mariadbClientImage`

Configuration for `mariadbClientImage`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.postgresql.mariadbClientImage` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Mariadbclientimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.metrics`

Configuration for `metrics`.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.metrics` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Metrics](../../metrics.md) for full configuration.

---

### `dependencies.postgresql.mode`

How postgresql is provided. Unlike the other dependencies it defaults to `operator`, so CloudNativePG runs it and the settings are under `operator`. `standalone` merges a plain PostgreSQL deployment into the chart. Both modes share `depconfig`, the connection details in `depconfig.creds` and the `postgresql-wait` init container.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.postgresql.mode` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `"operator"`                   |
| Enum       | `standalone`, `operator`       |

Example

```yaml
dependencies:
  postgresql:
    mode: operator
```

---

### `dependencies.postgresql.mongodb`

No description provided.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.mongodb` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `dependencies.postgresql.mongodbClientImage`

Configuration for `mongodbClientImage`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.postgresql.mongodbClientImage` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Mongodbclientimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.namespace`

Namespace to apply to all objects, unless overridden at the object level Does not apply to chart deps, use global.namespace for that

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.namespace` |
| Type       | `string`                            |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Namespace](../../namespace.md) for full configuration.

---

### `dependencies.postgresql.netshootImage`

Configuration for `netshootImage`.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.postgresql.netshootImage` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Netshootimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.networkpolicy`

Create Network Policy objects

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.postgresql.networkpolicy` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Networkpolicy](../../networkpolicy/) for full configuration.

---

### `dependencies.postgresql.nodeSelector`

See [Node Selector](/truecharts-common/workload#nodeselector)

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.nodeSelector` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Nodeselector](../../podOptions/nodeSelector.md) for full configuration.

---

### `dependencies.postgresql.notes`

Define values for `NOTES.txt`

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.postgresql.notes` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `{}`                            |

See [Notes](../../notes.md) for full configuration.

Example

```yaml
dependencies:
  postgresql:
    notes:
      {}
```

---

### `dependencies.postgresql.operator`

Contains specific settings for helm charts containing or using system

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.postgresql.operator` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Operator](../../operator.md) for full configuration.

---

### `dependencies.postgresql.persistence`

Define persistence objects

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.persistence` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Persistence](../../persistence/) for full configuration.

---

### `dependencies.postgresql.podDisruptionBudget`

Create Pod Disruption Budget objects

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.postgresql.podDisruptionBudget` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

See [Poddisruptionbudget](../../podDisruptionBudget.md) for full configuration.

---

### `dependencies.postgresql.podOptions`

Options that apply to all pods, unless overridden at the pod level See more info about podOptions [documentation](/truecharts-common/podoptions)

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.postgresql.podOptions` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

See [Podoptions](../../podOptions/) for full configuration.

---

### `dependencies.postgresql.postgres15Image`

Configuration for `postgres15Image`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.postgres15Image` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Postgres15image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgres16Image`

Configuration for `postgres16Image`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.postgres16Image` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Postgres16image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgres17Image`

Configuration for `postgres17Image`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.postgres17Image` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Postgres17image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgres18Image`

Configuration for `postgres18Image`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.postgres18Image` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Postgres18image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresClientImage`

Configuration for `postgresClientImage`.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.postgresql.postgresClientImage` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

See [Postgresclientimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresPostgis15Image`

Configuration for `postgresPostgis15Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.postgresql.postgresPostgis15Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgrespostgis15image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresPostgis16Image`

Configuration for `postgresPostgis16Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.postgresql.postgresPostgis16Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgrespostgis16image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresPostgis17Image`

Configuration for `postgresPostgis17Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.postgresql.postgresPostgis17Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgrespostgis17image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresPostgis18Image`

Configuration for `postgresPostgis18Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.postgresql.postgresPostgis18Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgrespostgis18image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresVectorchord15Image`

Configuration for `postgresVectorchord15Image`.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.postgresql.postgresVectorchord15Image` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

See [Postgresvectorchord15image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresVectorchord16Image`

Configuration for `postgresVectorchord16Image`.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.postgresql.postgresVectorchord16Image` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

See [Postgresvectorchord16image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresVectorchord17Image`

Configuration for `postgresVectorchord17Image`.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.postgresql.postgresVectorchord17Image` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

See [Postgresvectorchord17image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresVectorchord18Image`

Configuration for `postgresVectorchord18Image`.

| Field      | Value                                                |
| ---------- | ---------------------------------------------------- |
| Key        | `dependencies.postgresql.postgresVectorchord18Image` |
| Type       | `map`                                                |
| Required   | ❌                                                   |
| Helm `tpl` | ❌                                                   |
| Default    | unset                                                |

See [Postgresvectorchord18image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresVectors15Image`

Configuration for `postgresVectors15Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.postgresql.postgresVectors15Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgresvectors15image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresVectors16Image`

Configuration for `postgresVectors16Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.postgresql.postgresVectors16Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgresvectors16image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresVectors17Image`

Configuration for `postgresVectors17Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.postgresql.postgresVectors17Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgresvectors17image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresql`

The postgresql dependency. In `operator` mode (default) a CloudNativePG `Cluster` is spawned from `operator`.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.postgresql.postgresql` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

---

### `dependencies.postgresql.postgresql18Image`

Configuration for `postgresql18Image`.

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `dependencies.postgresql.postgresql18Image` |
| Type       | `map`                                       |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

See [Postgresql18image](../../images.md) for full configuration.

---

### `dependencies.postgresql.priorityClass`

Define priority classes

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.postgresql.priorityClass` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Priorityclass](../../priorityClass.md) for full configuration.

---

### `dependencies.postgresql.priorityClassName`

See [Priority Class Name](/truecharts-common/workload#priorityclassname)

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `dependencies.postgresql.priorityClassName` |
| Type       | `string`                                    |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

See [Priorityclassname](../../workload/podSpec/priorityClassName.md) for full configuration.

---

### `dependencies.postgresql.probes`

Does **not** apply to `initContainers` See [probes](/truecharts-common/container/probes)

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `dependencies.postgresql.probes` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Probes](../../workload/podSpec/containers/probes/) for full configuration.

---

### `dependencies.postgresql.rbac`

Create rbac objects

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.postgresql.rbac` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

See [Rbac](../../rbac.md) for full configuration.

---

### `dependencies.postgresql.resources`

Define resources for all containers, unless overridden at the container level Resources apply to **EACH** container, not to the pod as a whole.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.resources` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Resources](../../workload/podSpec/containers/resources.md) for full configuration.

---

### `dependencies.postgresql.restartPolicy`

See [Restart Policy](/truecharts-common/workload#restartpolicy)

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.postgresql.restartPolicy` |
| Type       | `string`                                |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Restartpolicy](../../workload/podSpec/restartPolicy.md) for full configuration.

---

### `dependencies.postgresql.route`

Configuration for `route`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.postgresql.route` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Route](../../route/) for full configuration.

---

### `dependencies.postgresql.runtimeClassName`

See [Runtime Class Name](/truecharts-common/workload#runtimeclassname)

| Field      | Value                                      |
| ---------- | ------------------------------------------ |
| Key        | `dependencies.postgresql.runtimeClassName` |
| Type       | `string`                                   |
| Required   | ❌                                         |
| Helm `tpl` | ❌                                         |
| Default    | unset                                      |

See [Runtimeclassname](../../workload/podSpec/runtimeClassName.md) for full configuration.

---

### `dependencies.postgresql.schedulerName`

See [Scheduler Name](/truecharts-common/workload#schedulername)

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.postgresql.schedulerName` |
| Type       | `string`                                |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Schedulername](../../workload/podSpec/schedulerName.md) for full configuration.

---

### `dependencies.postgresql.secret`

Create Secret objects

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `dependencies.postgresql.secret` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Secret](../../secret.md) for full configuration.

---

### `dependencies.postgresql.securityContext`

Define security context for all containers and pods, unless overridden at the container/pod level See more info about securityContext [documentation](/truecharts-common/securitycontext)

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.securityContext` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Securitycontext](../../securityContext.md) for full configuration.

---

### `dependencies.postgresql.service`

Define service objects

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.service` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Service](../../service/) for full configuration.

---

### `dependencies.postgresql.serviceAccount`

Create serviceAccount objects

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.postgresql.serviceAccount` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

See [Serviceaccount](../../serviceAccount.md) for full configuration.

---

### `dependencies.postgresql.shareProcessNamespace`

See [Share Process Namespace](/truecharts-common/workload#shareprocessnamespace)

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `dependencies.postgresql.shareProcessNamespace` |
| Type       | `boolean`                                       |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

See [Shareprocessnamespace](../../workload/podSpec/shareProcessNamespace.md) for full configuration.

---

### `dependencies.postgresql.storageClass`

Define storage classes

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.storageClass` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Storageclass](../../storageClass.md) for full configuration.

---

### `dependencies.postgresql.tailscaleImage`

Configuration for `tailscaleImage`.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.postgresql.tailscaleImage` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

See [Tailscaleimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.termination`

See [termination](/truecharts-common/container/termination)

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.termination` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Termination](../../workload/container/termination.md) for full configuration.

---

### `dependencies.postgresql.terminationGracePeriodSeconds`

See [Termination Grace Period Seconds](/truecharts-common/workload#terminationgraceperiodseconds)

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.postgresql.terminationGracePeriodSeconds` |
| Type       | `integer, string`                                       |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

See [Terminationgraceperiodseconds](../../workload/terminationGracePeriodSeconds.md) for full configuration.

---

### `dependencies.postgresql.tolerations`

See [Tolerations](/truecharts-common/workload#tolerations)

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.tolerations` |
| Type       | `list of map`                         |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Tolerations](../../podOptions/tolerations.md) for full configuration.

---

### `dependencies.postgresql.topologySpreadConstraints`

See [Topology Spread Constraints](/truecharts-common/workload#topologyspreadconstraints)

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.postgresql.topologySpreadConstraints` |
| Type       | `list of map`                                       |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

See [Topologyspreadconstraints](../../podOptions/topologySpreadConstraints.md) for full configuration.

---

### `dependencies.postgresql.ubuntuImage`

Configuration for `ubuntuImage`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.ubuntuImage` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Ubuntuimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.valkey`

The valkey dependency. In `operator` mode a `ValkeyCluster` is spawned from `operator`.

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `dependencies.postgresql.valkey` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

---

### `dependencies.postgresql.valkeyClientImage`

Configuration for `valkeyClientImage`.

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `dependencies.postgresql.valkeyClientImage` |
| Type       | `map`                                       |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

See [Valkeyclientimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.volumeSnapshotClass`

Define a volume snapshot class

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.postgresql.volumeSnapshotClass` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

See [Volumesnapshotclass](../../volumeSnapshotClass.md) for full configuration.

---

### `dependencies.postgresql.volumeSnapshots`

Define a volume snapshot

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.volumeSnapshots` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Volumesnapshots](../../volumeSnapshots.md) for full configuration.

---

### `dependencies.postgresql.vpa`

Configuration for `vpa`.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.postgresql.vpa` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Vpa](../../vpa.md) for full configuration.

---

### `dependencies.postgresql.webhook`

Create webhook objects

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.webhook` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Webhook](../../webhook.md) for full configuration.

---

### `dependencies.postgresql.workload`

Define workload objects

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.postgresql.workload` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Workload](../../workload/) for full configuration.

---

## Child Pages

- [Operator](operator/) - Settings of the CloudNativePG cluster that provides the `postgresql` dependency in `operator` mode. Never merged into the chart values.

---
