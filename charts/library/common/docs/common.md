---
title: Common
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/common#full-examples) section for complete examples.

:::

## Appears in

- `.Values.common`

---

## `common`

Shared values merged into the common chart defaults before chart-specific values. In a chart that depends on common, Helm puts all values of common here, so it takes the same values as the chart itself.

| Field      | Value    |
| ---------- | -------- |
| Key        | `common` |
| Type       | `map`    |
| Required   | ❌       |
| Helm `tpl` | ❌       |
| Default    | unset    |

---

### `common.TZ`

Timezone that is used everywhere applicable, unless overridden at the container level

| Field      | Value       |
| ---------- | ----------- |
| Key        | `common.TZ` |
| Type       | `map`       |
| Required   | ❌          |
| Helm `tpl` | ❌          |
| Default    | `"UTC"`     |

See [Tz](TZ.md) for full configuration.

Example

```yaml
common:
  TZ: UTC
```

---

### `common.addons`

Addons to the workloads

| Field      | Value           |
| ---------- | --------------- |
| Key        | `common.addons` |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |

See [Addons](addons/) for full configuration.

---

### `common.args`

See [args](/truecharts-common/container/args#args)

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `common.args`                 |
| Type       | `map, string, list of string` |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Args](workload/podSpec/containers/args.md) for full configuration.

---

### `common.automountServiceAccountToken`

See [Automount Service Account Token](/truecharts-common/workload#automountserviceaccounttoken)

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `common.automountServiceAccountToken` |
| Type       | `boolean`                             |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Automountserviceaccounttoken](workload/podSpec/automountServiceAccountToken.md) for full configuration.

---

### `common.certificate`

Define certificates

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.certificate` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Certificate](certificate.md) for full configuration.

---

### `common.chartContext`

Configuration for `chartContext`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.chartContext` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Chartcontext](chartContext.md) for full configuration.

---

### `common.clickhouseImage`

Image of the clickhouse dependency, selected by its container.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `common.clickhouseImage` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Clickhouseimage](images.md) for full configuration.

---

### `common.codeserverImage`

Configuration for `codeserverImage`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `common.codeserverImage` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Codeserverimage](images.md) for full configuration.

---

### `common.command`

See [command](/truecharts-common/container/command)

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `common.command`              |
| Type       | `map, string, list of string` |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Command](workload/podSpec/containers/command.md) for full configuration.

---

### `common.common`

Values to merge into the common chart defaults before chart-specific overrides.

| Field      | Value           |
| ---------- | --------------- |
| Key        | `common.common` |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |

See [Common](common.md) for full configuration.

---

### `common.configMapsFromFolder`

Generate ConfigMaps from a folder structure in the Helm chart's filesystem

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `common.configMapsFromFolder` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Configmapsfromfolder](configMapsFromFolder.md) for full configuration.

---

### `common.configmap`

Create Configmap objects

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `common.configmap` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

See [Configmap](configmap.md) for full configuration.

---

### `common.containerOptions`

Options that apply to all containers, unless overridden at the container level See more info about containerOptions [documentation](/truecharts-common/containeroptions)

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `common.containerOptions` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

See [Containeroptions](containerOptions.md) for full configuration.

---

### `common.credentials`

Create credentials objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.credentials` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Credentials](credentials.md) for full configuration.

---

### `common.defaultSpread`

Sets some default topology spread constraints for good spread of pods across nodes.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `common.defaultSpread` |
| Type       | `boolean`              |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Defaultspread](workload/podSpec/defaultSpread.md) for full configuration.

---

### `common.dependencies`

Configuration for `dependencies`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.dependencies` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Dependencies](dependencies/) for full configuration.

---

### `common.diagnosticMode`

Configuration for `diagnosticMode`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `common.diagnosticMode` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

See [Diagnosticmode](diagnosticMode.md) for full configuration.

---

### `common.dnsConfig`

See [DNS Config](/truecharts-common/workload#dnsconfig)

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `common.dnsConfig` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

See [Dnsconfig](podOptions/dnsConfig.md) for full configuration.

---

### `common.dnsPolicy`

See [DNS Policy](/truecharts-common/workload#dnspolicy)

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `common.dnsPolicy` |
| Type       | `string`           |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

See [Dnspolicy](workload/podSpec/dnsPolicy.md) for full configuration.

---

### `common.enableServiceLinks`

See [Enable Service Links](/truecharts-common/workload#enableservicelinks)

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `common.enableServiceLinks` |
| Type       | `boolean`                   |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

See [Enableservicelinks](workload/podSpec/enableServiceLinks.md) for full configuration.

---

### `common.env`

See [env](/truecharts-common/container/env)

| Field      | Value        |
| ---------- | ------------ |
| Key        | `common.env` |
| Type       | `map, null`  |
| Required   | ❌           |
| Helm `tpl` | ❌           |
| Default    | unset        |

See [Env](workload/podSpec/containers/env.md) for full configuration.

---

### `common.envFrom`

See [envFrom](/truecharts-common/container/envfrom)

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `common.envFrom` |
| Type       | `list of map`    |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Envfrom](workload/podSpec/containers/envFrom.md) for full configuration.

---

### `common.externalSecret`

Create ExternalSecret objects

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `common.externalSecret` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

See [Externalsecret](externalSecret.md) for full configuration.

---

### `common.extraTpl`

Define kubernetes resources, 1 per list item, tpl will be resolved

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.extraTpl`     |
| Type       | `list of map, string` |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | `[]`                  |

See [Extratpl](extraTpl.md) for full configuration.

Example

```yaml
common:
  extraTpl:
    []
```

---

### `common.fallbackDefaults`

The fallback defaults are used when a value is not defined in the chart. - See more info about fallbackDefaults [documentation](/truecharts-common/fallbackdefaults)

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `common.fallbackDefaults` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

See [Fallbackdefaults](global/fallbackDefaults.md) for full configuration.

---

### `common.fixedEnv`

See [fixedEnv](/truecharts-common/container/fixedenv)

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `common.fixedEnv` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

See [Fixedenv](workload/podSpec/containers/fixedEnv.md) for full configuration.

---

### `common.gateway`

Configure Gateway API gateways

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `common.gateway` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Gateway](gateway.md) for full configuration.

---

### `common.gatewayClass`

Configure Gateway API gateway classes

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.gatewayClass` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Gatewayclass](gatewayClass.md) for full configuration.

---

### `common.global`

Global values that apply to all charts See more info about global values [documentation](/truecharts-common/global)

| Field      | Value           |
| ---------- | --------------- |
| Key        | `common.global` |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |

See [Global](global/) for full configuration.

---

### `common.gluetunImage`

Configuration for `gluetunImage`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.gluetunImage` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Gluetunimage](images.md) for full configuration.

---

### `common.hostAliases`

See [Host Aliases](/truecharts-common/workload#hostaliases)

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.hostAliases` |
| Type       | `list, string`       |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Hostaliases](podOptions/hostAliases.md) for full configuration.

---

### `common.hostIPC`

See [Host IPC](/truecharts-common/workload#hostipc)

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `common.hostIPC` |
| Type       | `boolean`        |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Hostipc](workload/podSpec/hostIPC.md) for full configuration.

---

### `common.hostNetwork`

See [Host Network](/truecharts-common/workload#hostnetwork)

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.hostNetwork` |
| Type       | `boolean`            |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Hostnetwork](workload/podSpec/hostNetwork.md) for full configuration.

---

### `common.hostPID`

See [Host PID](/truecharts-common/workload#hostpid)

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `common.hostPID` |
| Type       | `boolean`        |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Hostpid](workload/podSpec/hostPID.md) for full configuration.

---

### `common.hostUsers`

See [Host Users](/truecharts-common/workload#hostusers)

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `common.hostUsers` |
| Type       | `boolean`          |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

See [Hostusers](workload/podSpec/hostUsers.md) for full configuration.

---

### `common.hpa`

Configuration for `hpa`.

| Field      | Value        |
| ---------- | ------------ |
| Key        | `common.hpa` |
| Type       | `map`        |
| Required   | ❌           |
| Helm `tpl` | ❌           |
| Default    | unset        |

See [Hpa](hpa.md) for full configuration.

---

### `common.image`

Defines the image details

| Field      | Value          |
| ---------- | -------------- |
| Key        | `common.image` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

See [Image](image.md) for full configuration.

---

### `common.imagePullSecret`

Define image pull secrets

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `common.imagePullSecret` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Imagepullsecret](imagePullSecret.md) for full configuration.

---

### `common.ingress`

Create Ingress objects

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `common.ingress` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Ingress](ingress/) for full configuration.

---

### `common.ingressMiddlewares`

Create Middleware objects

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `common.ingressMiddlewares` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

See [Ingressmiddlewares](ingressMiddlewares/) for full configuration.

---

### `common.kubectlImage`

Configuration for `kubectlImage`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.kubectlImage` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Kubectlimage](images.md) for full configuration.

---

### `common.lifecycle`

Not read by common. Set the lifecycle of a container in `workload.<name>.podSpec.containers.<name>.lifecycle`.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `common.lifecycle` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

---

### `common.listenerSet`

Create Gateway API ListenerSet objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.listenerSet` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Listenerset](listenerSet.md) for full configuration.

---

### `common.mariadbClientImage`

Configuration for `mariadbClientImage`.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `common.mariadbClientImage` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

See [Mariadbclientimage](images.md) for full configuration.

---

### `common.mariadbImage`

Image of the mariadb dependency, selected by its container.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.mariadbImage` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Mariadbimage](images.md) for full configuration.

---

### `common.memcachedImage`

Image of the memcached dependency, selected by its container.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `common.memcachedImage` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

See [Memcachedimage](images.md) for full configuration.

---

### `common.metrics`

Configuration for `metrics`.

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `common.metrics` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Metrics](metrics.md) for full configuration.

---

### `common.mongodbClientImage`

Configuration for `mongodbClientImage`.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `common.mongodbClientImage` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

See [Mongodbclientimage](images.md) for full configuration.

---

### `common.mongodbImage`

Image of the mongodb dependency, selected by its container.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.mongodbImage` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Mongodbimage](images.md) for full configuration.

---

### `common.namespace`

Namespace to apply to all objects, unless overridden at the object level Does not apply to chart deps, use global.namespace for that

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `common.namespace` |
| Type       | `string`           |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

See [Namespace](namespace.md) for full configuration.

---

### `common.netshootImage`

Configuration for `netshootImage`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `common.netshootImage` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Netshootimage](images.md) for full configuration.

---

### `common.networkpolicy`

Create Network Policy objects

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `common.networkpolicy` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Networkpolicy](networkpolicy/) for full configuration.

---

### `common.nodeSelector`

See [Node Selector](/truecharts-common/workload#nodeselector)

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.nodeSelector` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Nodeselector](podOptions/nodeSelector.md) for full configuration.

---

### `common.notes`

Define values for `NOTES.txt`

| Field      | Value          |
| ---------- | -------------- |
| Key        | `common.notes` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | `{}`           |

See [Notes](notes.md) for full configuration.

Example

```yaml
common:
  notes:
    {}
```

---

### `common.persistence`

Define persistence objects

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.persistence` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Persistence](persistence/) for full configuration.

---

### `common.podDisruptionBudget`

Create Pod Disruption Budget objects

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `common.podDisruptionBudget` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Poddisruptionbudget](podDisruptionBudget.md) for full configuration.

---

### `common.podOptions`

Options that apply to all pods, unless overridden at the pod level See more info about podOptions [documentation](/truecharts-common/podoptions)

| Field      | Value               |
| ---------- | ------------------- |
| Key        | `common.podOptions` |
| Type       | `map`               |
| Required   | ❌                  |
| Helm `tpl` | ❌                  |
| Default    | unset               |

See [Podoptions](podOptions/) for full configuration.

---

### `common.postgres15Image`

Configuration for `postgres15Image`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `common.postgres15Image` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Postgres15image](images.md) for full configuration.

---

### `common.postgres16Image`

Configuration for `postgres16Image`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `common.postgres16Image` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Postgres16image](images.md) for full configuration.

---

### `common.postgres17Image`

Configuration for `postgres17Image`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `common.postgres17Image` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Postgres17image](images.md) for full configuration.

---

### `common.postgres18Image`

Configuration for `postgres18Image`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `common.postgres18Image` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Postgres18image](images.md) for full configuration.

---

### `common.postgresClientImage`

Configuration for `postgresClientImage`.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `common.postgresClientImage` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Postgresclientimage](images.md) for full configuration.

---

### `common.postgresPostgis15Image`

Configuration for `postgresPostgis15Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `common.postgresPostgis15Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Postgrespostgis15image](images.md) for full configuration.

---

### `common.postgresPostgis16Image`

Configuration for `postgresPostgis16Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `common.postgresPostgis16Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Postgrespostgis16image](images.md) for full configuration.

---

### `common.postgresPostgis17Image`

Configuration for `postgresPostgis17Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `common.postgresPostgis17Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Postgrespostgis17image](images.md) for full configuration.

---

### `common.postgresPostgis18Image`

Configuration for `postgresPostgis18Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `common.postgresPostgis18Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Postgrespostgis18image](images.md) for full configuration.

---

### `common.postgresVectorchord15Image`

Configuration for `postgresVectorchord15Image`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `common.postgresVectorchord15Image` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Postgresvectorchord15image](images.md) for full configuration.

---

### `common.postgresVectorchord16Image`

Configuration for `postgresVectorchord16Image`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `common.postgresVectorchord16Image` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Postgresvectorchord16image](images.md) for full configuration.

---

### `common.postgresVectorchord17Image`

Configuration for `postgresVectorchord17Image`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `common.postgresVectorchord17Image` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Postgresvectorchord17image](images.md) for full configuration.

---

### `common.postgresVectorchord18Image`

Configuration for `postgresVectorchord18Image`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `common.postgresVectorchord18Image` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Postgresvectorchord18image](images.md) for full configuration.

---

### `common.postgresVectors15Image`

Configuration for `postgresVectors15Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `common.postgresVectors15Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Postgresvectors15image](images.md) for full configuration.

---

### `common.postgresVectors16Image`

Configuration for `postgresVectors16Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `common.postgresVectors16Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Postgresvectors16image](images.md) for full configuration.

---

### `common.postgresVectors17Image`

Configuration for `postgresVectors17Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `common.postgresVectors17Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Postgresvectors17image](images.md) for full configuration.

---

### `common.postgresql18Image`

Configuration for `postgresql18Image`.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `common.postgresql18Image` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Postgresql18image](images.md) for full configuration.

---

### `common.priorityClass`

Define priority classes

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `common.priorityClass` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Priorityclass](priorityClass.md) for full configuration.

---

### `common.priorityClassName`

See [Priority Class Name](/truecharts-common/workload#priorityclassname)

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `common.priorityClassName` |
| Type       | `string`                   |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Priorityclassname](workload/podSpec/priorityClassName.md) for full configuration.

---

### `common.probes`

Does **not** apply to `initContainers` See [probes](/truecharts-common/container/probes)

| Field      | Value           |
| ---------- | --------------- |
| Key        | `common.probes` |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |

See [Probes](workload/podSpec/containers/probes/) for full configuration.

---

### `common.rbac`

Create rbac objects

| Field      | Value         |
| ---------- | ------------- |
| Key        | `common.rbac` |
| Type       | `map`         |
| Required   | ❌            |
| Helm `tpl` | ❌            |
| Default    | unset         |

See [Rbac](rbac.md) for full configuration.

---

### `common.resources`

Define resources for all containers, unless overridden at the container level Resources apply to **EACH** container, not to the pod as a whole.

| Field      | Value              |
| ---------- | ------------------ |
| Key        | `common.resources` |
| Type       | `map`              |
| Required   | ❌                 |
| Helm `tpl` | ❌                 |
| Default    | unset              |

See [Resources](workload/podSpec/containers/resources.md) for full configuration.

---

### `common.restartPolicy`

See [Restart Policy](/truecharts-common/workload#restartpolicy)

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `common.restartPolicy` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Restartpolicy](workload/podSpec/restartPolicy.md) for full configuration.

---

### `common.route`

Configuration for `route`.

| Field      | Value          |
| ---------- | -------------- |
| Key        | `common.route` |
| Type       | `map`          |
| Required   | ❌             |
| Helm `tpl` | ❌             |
| Default    | unset          |

See [Route](route/) for full configuration.

---

### `common.runtimeClassName`

See [Runtime Class Name](/truecharts-common/workload#runtimeclassname)

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `common.runtimeClassName` |
| Type       | `string`                  |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

See [Runtimeclassname](workload/podSpec/runtimeClassName.md) for full configuration.

---

### `common.schedulerName`

See [Scheduler Name](/truecharts-common/workload#schedulername)

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `common.schedulerName` |
| Type       | `string`               |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

See [Schedulername](workload/podSpec/schedulerName.md) for full configuration.

---

### `common.secret`

Create Secret objects

| Field      | Value           |
| ---------- | --------------- |
| Key        | `common.secret` |
| Type       | `map`           |
| Required   | ❌              |
| Helm `tpl` | ❌              |
| Default    | unset           |

See [Secret](secret.md) for full configuration.

---

### `common.securityContext`

Define security context for all containers and pods, unless overridden at the container/pod level See more info about securityContext [documentation](/truecharts-common/securitycontext)

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `common.securityContext` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Securitycontext](securityContext.md) for full configuration.

---

### `common.service`

Define service objects

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `common.service` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Service](service/) for full configuration.

---

### `common.serviceAccount`

Create serviceAccount objects

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `common.serviceAccount` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

See [Serviceaccount](serviceAccount.md) for full configuration.

---

### `common.shareProcessNamespace`

See [Share Process Namespace](/truecharts-common/workload#shareprocessnamespace)

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `common.shareProcessNamespace` |
| Type       | `boolean`                      |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

See [Shareprocessnamespace](workload/podSpec/shareProcessNamespace.md) for full configuration.

---

### `common.storageClass`

Define storage classes

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `common.storageClass` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

See [Storageclass](storageClass.md) for full configuration.

---

### `common.tailscaleImage`

Configuration for `tailscaleImage`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `common.tailscaleImage` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

See [Tailscaleimage](images.md) for full configuration.

---

### `common.termination`

See [termination](/truecharts-common/container/termination)

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.termination` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Termination](workload/container/termination.md) for full configuration.

---

### `common.terminationGracePeriodSeconds`

See [Termination Grace Period Seconds](/truecharts-common/workload#terminationgraceperiodseconds)

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `common.terminationGracePeriodSeconds` |
| Type       | `integer, string`                      |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Terminationgraceperiodseconds](workload/terminationGracePeriodSeconds.md) for full configuration.

---

### `common.tolerations`

See [Tolerations](/truecharts-common/workload#tolerations)

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.tolerations` |
| Type       | `list of map`        |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Tolerations](podOptions/tolerations.md) for full configuration.

---

### `common.topologySpreadConstraints`

See [Topology Spread Constraints](/truecharts-common/workload#topologyspreadconstraints)

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `common.topologySpreadConstraints` |
| Type       | `list of map`                      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Topologyspreadconstraints](podOptions/topologySpreadConstraints.md) for full configuration.

---

### `common.ubuntuImage`

Configuration for `ubuntuImage`.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.ubuntuImage` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Ubuntuimage](images.md) for full configuration.

---

### `common.valkeyClientImage`

Configuration for `valkeyClientImage`.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `common.valkeyClientImage` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Valkeyclientimage](images.md) for full configuration.

---

### `common.valkeyExporterImage`

Image of the metrics exporter of the valkey dependency in `operator` mode, selected by `dependencies.valkey.operator.exporter.imageSelector`.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `common.valkeyExporterImage` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Valkeyexporterimage](images.md) for full configuration.

---

### `common.valkeyImage`

Image of the valkey dependency, selected by its container in `standalone` mode and by `dependencies.valkey.operator.imageSelector` in `operator` mode.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `common.valkeyImage` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

See [Valkeyimage](images.md) for full configuration.

---

### `common.volumeSnapshotClass`

Define a volume snapshot class

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `common.volumeSnapshotClass` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Volumesnapshotclass](volumeSnapshotClass.md) for full configuration.

---

### `common.volumeSnapshots`

Define a volume snapshot

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `common.volumeSnapshots` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

See [Volumesnapshots](volumeSnapshots.md) for full configuration.

---

### `common.vpa`

Configuration for `vpa`.

| Field      | Value        |
| ---------- | ------------ |
| Key        | `common.vpa` |
| Type       | `map`        |
| Required   | ❌           |
| Helm `tpl` | ❌           |
| Default    | unset        |

See [Vpa](vpa.md) for full configuration.

---

### `common.webhook`

Create webhook objects

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `common.webhook` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

See [Webhook](webhook.md) for full configuration.

---

### `common.workload`

Define workload objects

| Field      | Value             |
| ---------- | ----------------- |
| Key        | `common.workload` |
| Type       | `map`             |
| Required   | ❌                |
| Helm `tpl` | ❌                |
| Default    | unset             |

See [Workload](workload/) for full configuration.

---
