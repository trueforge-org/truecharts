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
| Type       | `string`                     |
| Required   | ✅                           |
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

See [args](/truecharts-common/workload/podSpec/containers/args#args)

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

Details about the release that common works out on every render.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.chartContext` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Chartcontext](../../chartContext.md) for full configuration.

---

### `dependencies.postgresql.clickhouseImage`

Image of the clickhouse dependency, selected by its container.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.postgresql.clickhouseImage` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Clickhouseimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.codeserverImage`

Image `codeserverImage`, selected by containers with `imageSelector: codeserverImage`.

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

See [command](/truecharts-common/workload/podSpec/containers/command)

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

### `dependencies.postgresql.configmap`

Create Configmap objects.

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

Create credentials objects.

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

No description provided.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.depconfig` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `dependencies.postgresql.diagnosticMode`

Run the containers with a sleep command instead of the app, to debug them.

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

### `dependencies.postgresql.enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.enabled` |
| Type       | `boolean, string`                 |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

---

### `dependencies.postgresql.env`

See [env](/truecharts-common/workload/podSpec/containers/env)

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

See [envFrom](/truecharts-common/workload/podSpec/containers/envFrom)

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

ExternalSecrets that load secrets from an external store, keyed by name.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.postgresql.externalSecret` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

See [Externalsecret](../../externalSecret.md) for full configuration.

---

### `dependencies.postgresql.fallbackDefaults`

The fallback defaults are used when a value is not defined in the chart. - See more info about fallbackDefaults [documentation](/truecharts-common/global/fallbackDefaults)

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

See [fixedEnv](/truecharts-common/workload/podSpec/containers/fixedEnv)

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

Image `gluetunImage`, selected by containers with `imageSelector: gluetunImage`.

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

HorizontalPodAutoscalers, keyed by name.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.postgresql.hpa` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Hpa](../../hpa.md) for full configuration.

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

Create Ingress objects.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.postgresql.ingress` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Ingress](../../ingress/) for full configuration.

---

### `dependencies.postgresql.kubectlImage`

Image `kubectlImage`, selected by containers with `imageSelector: kubectlImage`.

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

Not read by common. Set the lifecycle of a container in `workload.<name>.podSpec.containers.<name>.lifecycle`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.postgresql.lifecycle` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

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

### `dependencies.postgresql.mariadbClientImage`

Image `mariadbClientImage`, selected by containers with `imageSelector: mariadbClientImage`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.postgresql.mariadbClientImage` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Mariadbclientimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.mariadbImage`

Image of the mariadb dependency, selected by its container.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.mariadbImage` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Mariadbimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.memcachedImage`

Image of the memcached dependency, selected by its container.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.postgresql.memcachedImage` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

See [Memcachedimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.metrics`

ServiceMonitors, PodMonitors and PrometheusRules, keyed by name.

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

No description provided.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.postgresql.mode` |
| Type       | `string`                       |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `"standalone"`                 |
| Enum       | `standalone`, `operator`       |

Example

```yaml
dependencies:
  postgresql:
    mode: standalone
```

---

### `dependencies.postgresql.mongodbClientImage`

Image `mongodbClientImage`, selected by containers with `imageSelector: mongodbClientImage`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.postgresql.mongodbClientImage` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Mongodbclientimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.mongodbImage`

Image of the mongodb dependency, selected by its container.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.postgresql.mongodbImage` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Mongodbimage](../../images.md) for full configuration.

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

Image `netshootImage`, selected by containers with `imageSelector: netshootImage`.

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

No description provided.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.postgresql.operator` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

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

See [Persistence](../../persistence.md) for full configuration.

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

Image `postgres15Image`, selected by containers with `imageSelector: postgres15Image`.

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

Image `postgres16Image`, selected by containers with `imageSelector: postgres16Image`.

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

Image `postgres17Image`, selected by containers with `imageSelector: postgres17Image`.

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

Image `postgres18Image`, selected by containers with `imageSelector: postgres18Image`.

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

Image `postgresClientImage`, selected by containers with `imageSelector: postgresClientImage`.

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

Image `postgresPostgis15Image`, selected by containers with `imageSelector: postgresPostgis15Image`.

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

Image `postgresPostgis16Image`, selected by containers with `imageSelector: postgresPostgis16Image`.

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

Image `postgresPostgis17Image`, selected by containers with `imageSelector: postgresPostgis17Image`.

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

Image `postgresPostgis18Image`, selected by containers with `imageSelector: postgresPostgis18Image`.

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

Image `postgresVectorchord15Image`, selected by containers with `imageSelector: postgresVectorchord15Image`.

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

Image `postgresVectorchord16Image`, selected by containers with `imageSelector: postgresVectorchord16Image`.

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

Image `postgresVectorchord17Image`, selected by containers with `imageSelector: postgresVectorchord17Image`.

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

Image `postgresVectorchord18Image`, selected by containers with `imageSelector: postgresVectorchord18Image`.

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

Image `postgresVectors15Image`, selected by containers with `imageSelector: postgresVectors15Image`.

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

Image `postgresVectors16Image`, selected by containers with `imageSelector: postgresVectors16Image`.

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

Image `postgresVectors17Image`, selected by containers with `imageSelector: postgresVectors17Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.postgresql.postgresVectors17Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgresvectors17image](../../images.md) for full configuration.

---

### `dependencies.postgresql.postgresql18Image`

Image `postgresql18Image`, selected by containers with `imageSelector: postgresql18Image`.

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

Does **not** apply to `initContainers` See [probes](/truecharts-common/workload/podSpec/containers/probes)

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

Create rbac objects.

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
| Required   | ✅                                  |
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

Gateway API routes, keyed by name.

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

Define the secret If this is set, the `users` key must not be set.

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
| Required   | ✅                                        |
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

Create serviceAccount objects.

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

Image `tailscaleImage`, selected by containers with `imageSelector: tailscaleImage`.

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

See [termination](/truecharts-common/workload/container/termination)

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

Image `ubuntuImage`, selected by containers with `imageSelector: ubuntuImage`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.ubuntuImage` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Ubuntuimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.valkeyClientImage`

Image `valkeyClientImage`, selected by containers with `imageSelector: valkeyClientImage`.

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `dependencies.postgresql.valkeyClientImage` |
| Type       | `map`                                       |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

See [Valkeyclientimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.valkeyExporterImage`

Image of the metrics exporter of the valkey dependency in `operator` mode, selected by `dependencies.valkey.operator.exporter.imageSelector`.

| Field      | Value                                         |
| ---------- | --------------------------------------------- |
| Key        | `dependencies.postgresql.valkeyExporterImage` |
| Type       | `map`                                         |
| Required   | ❌                                            |
| Helm `tpl` | ❌                                            |
| Default    | unset                                         |

See [Valkeyexporterimage](../../images.md) for full configuration.

---

### `dependencies.postgresql.valkeyImage`

Image of the valkey dependency, selected by its container in `standalone` mode and by `dependencies.valkey.operator.imageSelector` in `operator` mode.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.postgresql.valkeyImage` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Valkeyimage](../../images.md) for full configuration.

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

VerticalPodAutoscalers, keyed by name.

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

Create webhook objects.

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

Define workload objects.

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

## Full Examples

PostgreSQL provided by CloudNativePG, the default `operator` mode, with the connection details from the credentials secret:

```yaml
dependencies:
  postgresql:
    enabled: true
    depconfig:
      postgresqlUsername: app
      postgresqlDatabase: app

workload:
  main:
    podSpec:
      containers:
        main:
          env:
            DATABASE_URL:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "postgresqlcreds" }}'
                key: url
```

A plain PostgreSQL deployment in the chart instead, the `standalone` mode. It runs `postgresql18Image`:

```yaml
dependencies:
  postgresql:
    enabled: true
    mode: standalone
    depconfig:
      postgresqlUsername: app
      postgresqlDatabase: app
```
