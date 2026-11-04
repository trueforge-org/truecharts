---
title: Valkey
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/valkey#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.valkey`

---

## `dependencies.valkey`

The valkey dependency. In `operator` mode a `ValkeyCluster` is spawned from `operator`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `dependencies.valkey` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `dependencies.valkey.TZ`

Timezone that is used everywhere applicable, unless overridden at the container level

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `dependencies.valkey.TZ` |
| Type       | `map`                    |
| Required   | ✅                       |
| Helm `tpl` | ❌                       |
| Default    | `"UTC"`                  |

See [Tz](../../TZ.md) for full configuration.

Example

```yaml
dependencies:
  valkey:
    TZ: UTC
```

---

### `dependencies.valkey.addons`

Addons to the workloads

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `dependencies.valkey.addons` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Addons](../../addons/) for full configuration.

---

### `dependencies.valkey.args`

See [args](/truecharts-common/workload/podSpec/containers/args#args)

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.args`    |
| Type       | `map, string, list of string` |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Args](../../workload/podSpec/containers/args.md) for full configuration.

---

### `dependencies.valkey.automountServiceAccountToken`

See [Automount Service Account Token](/truecharts-common/workload#automountserviceaccounttoken)

| Field      | Value                                              |
| ---------- | -------------------------------------------------- |
| Key        | `dependencies.valkey.automountServiceAccountToken` |
| Type       | `boolean`                                          |
| Required   | ❌                                                 |
| Helm `tpl` | ❌                                                 |
| Default    | unset                                              |

See [Automountserviceaccounttoken](../../workload/podSpec/automountServiceAccountToken.md) for full configuration.

---

### `dependencies.valkey.certificate`

Define certificates

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.certificate` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Certificate](../../certificate.md) for full configuration.

---

### `dependencies.valkey.chartContext`

Details about the release that common works out on every render.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.valkey.chartContext` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Chartcontext](../../chartContext.md) for full configuration.

---

### `dependencies.valkey.clickhouseImage`

Image of the clickhouse dependency, selected by its container.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.clickhouseImage` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Clickhouseimage](../../images.md) for full configuration.

---

### `dependencies.valkey.codeserverImage`

Image `codeserverImage`, selected by containers with `imageSelector: codeserverImage`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.codeserverImage` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Codeserverimage](../../images.md) for full configuration.

---

### `dependencies.valkey.command`

See [command](/truecharts-common/workload/podSpec/containers/command)

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.command` |
| Type       | `map, string, list of string` |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Command](../../workload/podSpec/containers/command.md) for full configuration.

---

### `dependencies.valkey.common`

Values to merge into the common chart defaults before chart-specific overrides.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `dependencies.valkey.common` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Common](../../common.md) for full configuration.

---

### `dependencies.valkey.configmap`

Create Configmap objects.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.valkey.configmap` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Configmap](../../configmap.md) for full configuration.

---

### `dependencies.valkey.containerOptions`

Options that apply to all containers, unless overridden at the container level See more info about containerOptions [documentation](/truecharts-common/containeroptions)

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.valkey.containerOptions` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Containeroptions](../../containerOptions.md) for full configuration.

---

### `dependencies.valkey.credentials`

Create credentials objects.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.credentials` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Credentials](../../credentials.md) for full configuration.

---

### `dependencies.valkey.defaultSpread`

Sets some default topology spread constraints for good spread of pods across nodes.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.valkey.defaultSpread` |
| Type       | `boolean`                           |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Defaultspread](../../workload/podSpec/defaultSpread.md) for full configuration.

---

### `dependencies.valkey.depconfig`

Configuration of the dependency itself. Never merged into the chart values.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.valkey.depconfig` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `dependencies.valkey.diagnosticMode`

Run the containers with a sleep command instead of the app, to debug them.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.valkey.diagnosticMode` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

See [Diagnosticmode](../../diagnosticMode.md) for full configuration.

---

### `dependencies.valkey.dnsConfig`

See [DNS Config](/truecharts-common/workload#dnsconfig)

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.valkey.dnsConfig` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Dnsconfig](../../podOptions/dnsConfig.md) for full configuration.

---

### `dependencies.valkey.dnsPolicy`

See [DNS Policy](/truecharts-common/workload#dnspolicy)

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.valkey.dnsPolicy` |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Dnspolicy](../../workload/podSpec/dnsPolicy.md) for full configuration.

---

### `dependencies.valkey.enableServiceLinks`

See [Enable Service Links](/truecharts-common/workload#enableservicelinks)

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.valkey.enableServiceLinks` |
| Type       | `boolean`                                |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

See [Enableservicelinks](../../workload/podSpec/enableServiceLinks.md) for full configuration.

---

### `dependencies.valkey.enabled`

Whether the dependency is enabled. Objects of disabled dependencies are not merged into the chart.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.enabled` |
| Type       | `boolean, string`             |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

### `dependencies.valkey.env`

See [env](/truecharts-common/workload/podSpec/containers/env)

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `dependencies.valkey.env` |
| Type       | `map, null`               |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

See [Env](../../workload/podSpec/containers/env.md) for full configuration.

---

### `dependencies.valkey.envFrom`

See [envFrom](/truecharts-common/workload/podSpec/containers/envFrom)

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.envFrom` |
| Type       | `list of map`                 |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Envfrom](../../workload/podSpec/containers/envFrom.md) for full configuration.

---

### `dependencies.valkey.externalSecret`

ExternalSecrets that load secrets from an external store, keyed by name.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.valkey.externalSecret` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

See [Externalsecret](../../externalSecret.md) for full configuration.

---

### `dependencies.valkey.fallbackDefaults`

The fallback defaults are used when a value is not defined in the chart. - See more info about fallbackDefaults [documentation](/truecharts-common/global/fallbackDefaults)

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.valkey.fallbackDefaults` |
| Type       | `map`                                  |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Fallbackdefaults](../../global/fallbackDefaults.md) for full configuration.

---

### `dependencies.valkey.fixedEnv`

See [fixedEnv](/truecharts-common/workload/podSpec/containers/fixedEnv)

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.valkey.fixedEnv` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

See [Fixedenv](../../workload/podSpec/containers/fixedEnv.md) for full configuration.

---

### `dependencies.valkey.gateway`

Configure Gateway API gateways

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.gateway` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Gateway](../../gateway.md) for full configuration.

---

### `dependencies.valkey.gatewayClass`

Configure Gateway API gateway classes

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.valkey.gatewayClass` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Gatewayclass](../../gatewayClass.md) for full configuration.

---

### `dependencies.valkey.global`

Global values that apply to all charts See more info about global values [documentation](/truecharts-common/global)

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `dependencies.valkey.global` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Global](../../global/) for full configuration.

---

### `dependencies.valkey.gluetunImage`

Image `gluetunImage`, selected by containers with `imageSelector: gluetunImage`.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.valkey.gluetunImage` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Gluetunimage](../../images.md) for full configuration.

---

### `dependencies.valkey.hostAliases`

See [Host Aliases](/truecharts-common/workload#hostaliases)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.hostAliases` |
| Type       | `list, string`                    |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Hostaliases](../../podOptions/hostAliases.md) for full configuration.

---

### `dependencies.valkey.hostIPC`

See [Host IPC](/truecharts-common/workload#hostipc)

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.hostIPC` |
| Type       | `boolean`                     |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Hostipc](../../workload/podSpec/hostIPC.md) for full configuration.

---

### `dependencies.valkey.hostNetwork`

See [Host Network](/truecharts-common/workload#hostnetwork)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.hostNetwork` |
| Type       | `boolean`                         |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Hostnetwork](../../workload/podSpec/hostNetwork.md) for full configuration.

---

### `dependencies.valkey.hostPID`

See [Host PID](/truecharts-common/workload#hostpid)

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.hostPID` |
| Type       | `boolean`                     |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Hostpid](../../workload/podSpec/hostPID.md) for full configuration.

---

### `dependencies.valkey.hostUsers`

See [Host Users](/truecharts-common/workload#hostusers)

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.valkey.hostUsers` |
| Type       | `boolean`                       |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Hostusers](../../workload/podSpec/hostUsers.md) for full configuration.

---

### `dependencies.valkey.hpa`

HorizontalPodAutoscalers, keyed by name.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `dependencies.valkey.hpa` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

See [Hpa](../../hpa.md) for full configuration.

---

### `dependencies.valkey.imagePullSecret`

Define image pull secrets

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.imagePullSecret` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Imagepullsecret](../../imagePullSecret.md) for full configuration.

---

### `dependencies.valkey.ingress`

Create Ingress objects.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.ingress` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Ingress](../../ingress/) for full configuration.

---

### `dependencies.valkey.kubectlImage`

Image `kubectlImage`, selected by containers with `imageSelector: kubectlImage`.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.valkey.kubectlImage` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Kubectlimage](../../images.md) for full configuration.

---

### `dependencies.valkey.lifecycle`

Not read by common. Set the lifecycle of a container in `workload.<name>.podSpec.containers.<name>.lifecycle`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.valkey.lifecycle` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `dependencies.valkey.listenerSet`

Create Gateway API ListenerSet objects

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.listenerSet` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Listenerset](../../listenerSet.md) for full configuration.

---

### `dependencies.valkey.mariadbClientImage`

Image `mariadbClientImage`, selected by containers with `imageSelector: mariadbClientImage`.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.valkey.mariadbClientImage` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

See [Mariadbclientimage](../../images.md) for full configuration.

---

### `dependencies.valkey.mariadbImage`

Image of the mariadb dependency, selected by its container.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.valkey.mariadbImage` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Mariadbimage](../../images.md) for full configuration.

---

### `dependencies.valkey.memcachedImage`

Image of the memcached dependency, selected by its container.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.valkey.memcachedImage` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

See [Memcachedimage](../../images.md) for full configuration.

---

### `dependencies.valkey.metrics`

ServiceMonitors, PodMonitors and PrometheusRules, keyed by name.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.metrics` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Metrics](../../metrics.md) for full configuration.

---

### `dependencies.valkey.mode`

How the dependency is provided. `standalone` merges and deploys it with the chart, `operator` leaves it to an operator, so its objects are not merged into the chart. The credentials, wait init container and notes still apply.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `dependencies.valkey.mode` |
| Type       | `string`                   |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | `"standalone"`             |
| Enum       | `standalone`, `operator`   |

Example

```yaml
dependencies:
  valkey:
    mode: standalone
```

---

### `dependencies.valkey.mongodbClientImage`

Image `mongodbClientImage`, selected by containers with `imageSelector: mongodbClientImage`.

| Field      | Value                                    |
| ---------- | ---------------------------------------- |
| Key        | `dependencies.valkey.mongodbClientImage` |
| Type       | `map`                                    |
| Required   | ❌                                       |
| Helm `tpl` | ❌                                       |
| Default    | unset                                    |

See [Mongodbclientimage](../../images.md) for full configuration.

---

### `dependencies.valkey.mongodbImage`

Image of the mongodb dependency, selected by its container.

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.valkey.mongodbImage` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Mongodbimage](../../images.md) for full configuration.

---

### `dependencies.valkey.namespace`

Namespace to apply to all objects, unless overridden at the object level Does not apply to chart deps, use global.namespace for that

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.valkey.namespace` |
| Type       | `string`                        |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Namespace](../../namespace.md) for full configuration.

---

### `dependencies.valkey.netshootImage`

Image `netshootImage`, selected by containers with `imageSelector: netshootImage`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.valkey.netshootImage` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Netshootimage](../../images.md) for full configuration.

---

### `dependencies.valkey.networkpolicy`

Create Network Policy objects

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.valkey.networkpolicy` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Networkpolicy](../../networkpolicy/) for full configuration.

---

### `dependencies.valkey.nodeSelector`

See [Node Selector](/truecharts-common/workload#nodeselector)

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.valkey.nodeSelector` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Nodeselector](../../podOptions/nodeSelector.md) for full configuration.

---

### `dependencies.valkey.notes`

Define values for `NOTES.txt`

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `dependencies.valkey.notes` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `{}`                        |

See [Notes](../../notes.md) for full configuration.

Example

```yaml
dependencies:
  valkey:
    notes:
      {}
```

---

### `dependencies.valkey.operator`

No description provided.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.valkey.operator` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

---

### `dependencies.valkey.persistence`

Define persistence objects

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.persistence` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Persistence](../../persistence/) for full configuration.

---

### `dependencies.valkey.podDisruptionBudget`

Create Pod Disruption Budget objects

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.valkey.podDisruptionBudget` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Poddisruptionbudget](../../podDisruptionBudget.md) for full configuration.

---

### `dependencies.valkey.podOptions`

Options that apply to all pods, unless overridden at the pod level See more info about podOptions [documentation](/truecharts-common/podoptions)

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `dependencies.valkey.podOptions` |
| Type       | `map`                            |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | unset                            |

See [Podoptions](../../podOptions/) for full configuration.

---

### `dependencies.valkey.postgres15Image`

Image `postgres15Image`, selected by containers with `imageSelector: postgres15Image`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.postgres15Image` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Postgres15image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgres16Image`

Image `postgres16Image`, selected by containers with `imageSelector: postgres16Image`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.postgres16Image` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Postgres16image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgres17Image`

Image `postgres17Image`, selected by containers with `imageSelector: postgres17Image`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.postgres17Image` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Postgres17image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgres18Image`

Image `postgres18Image`, selected by containers with `imageSelector: postgres18Image`.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.postgres18Image` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Postgres18image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresClientImage`

Image `postgresClientImage`, selected by containers with `imageSelector: postgresClientImage`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.valkey.postgresClientImage` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Postgresclientimage](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresPostgis15Image`

Image `postgresPostgis15Image`, selected by containers with `imageSelector: postgresPostgis15Image`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.postgresPostgis15Image` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Postgrespostgis15image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresPostgis16Image`

Image `postgresPostgis16Image`, selected by containers with `imageSelector: postgresPostgis16Image`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.postgresPostgis16Image` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Postgrespostgis16image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresPostgis17Image`

Image `postgresPostgis17Image`, selected by containers with `imageSelector: postgresPostgis17Image`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.postgresPostgis17Image` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Postgrespostgis17image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresPostgis18Image`

Image `postgresPostgis18Image`, selected by containers with `imageSelector: postgresPostgis18Image`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.postgresPostgis18Image` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Postgrespostgis18image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresVectorchord15Image`

Image `postgresVectorchord15Image`, selected by containers with `imageSelector: postgresVectorchord15Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.valkey.postgresVectorchord15Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgresvectorchord15image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresVectorchord16Image`

Image `postgresVectorchord16Image`, selected by containers with `imageSelector: postgresVectorchord16Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.valkey.postgresVectorchord16Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgresvectorchord16image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresVectorchord17Image`

Image `postgresVectorchord17Image`, selected by containers with `imageSelector: postgresVectorchord17Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.valkey.postgresVectorchord17Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgresvectorchord17image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresVectorchord18Image`

Image `postgresVectorchord18Image`, selected by containers with `imageSelector: postgresVectorchord18Image`.

| Field      | Value                                            |
| ---------- | ------------------------------------------------ |
| Key        | `dependencies.valkey.postgresVectorchord18Image` |
| Type       | `map`                                            |
| Required   | ❌                                               |
| Helm `tpl` | ❌                                               |
| Default    | unset                                            |

See [Postgresvectorchord18image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresVectors15Image`

Image `postgresVectors15Image`, selected by containers with `imageSelector: postgresVectors15Image`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.postgresVectors15Image` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Postgresvectors15image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresVectors16Image`

Image `postgresVectors16Image`, selected by containers with `imageSelector: postgresVectors16Image`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.postgresVectors16Image` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Postgresvectors16image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresVectors17Image`

Image `postgresVectors17Image`, selected by containers with `imageSelector: postgresVectors17Image`.

| Field      | Value                                        |
| ---------- | -------------------------------------------- |
| Key        | `dependencies.valkey.postgresVectors17Image` |
| Type       | `map`                                        |
| Required   | ❌                                           |
| Helm `tpl` | ❌                                           |
| Default    | unset                                        |

See [Postgresvectors17image](../../images.md) for full configuration.

---

### `dependencies.valkey.postgresql18Image`

Image `postgresql18Image`, selected by containers with `imageSelector: postgresql18Image`.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.valkey.postgresql18Image` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Postgresql18image](../../images.md) for full configuration.

---

### `dependencies.valkey.priorityClass`

Define priority classes

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.valkey.priorityClass` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Priorityclass](../../priorityClass.md) for full configuration.

---

### `dependencies.valkey.priorityClassName`

See [Priority Class Name](/truecharts-common/workload#priorityclassname)

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.valkey.priorityClassName` |
| Type       | `string`                                |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Priorityclassname](../../workload/podSpec/priorityClassName.md) for full configuration.

---

### `dependencies.valkey.probes`

Does **not** apply to `initContainers` See [probes](/truecharts-common/workload/podSpec/containers/probes)

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `dependencies.valkey.probes` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Probes](../../workload/podSpec/containers/probes/) for full configuration.

---

### `dependencies.valkey.rbac`

Create rbac objects.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `dependencies.valkey.rbac` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

See [Rbac](../../rbac.md) for full configuration.

---

### `dependencies.valkey.resources`

Define resources for all containers, unless overridden at the container level Resources apply to **EACH** container, not to the pod as a whole.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `dependencies.valkey.resources` |
| Type       | `map`                           |
| Required   | ✅                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

See [Resources](../../workload/podSpec/containers/resources.md) for full configuration.

---

### `dependencies.valkey.restartPolicy`

See [Restart Policy](/truecharts-common/workload#restartpolicy)

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.valkey.restartPolicy` |
| Type       | `string`                            |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Restartpolicy](../../workload/podSpec/restartPolicy.md) for full configuration.

---

### `dependencies.valkey.route`

Gateway API routes, keyed by name.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `dependencies.valkey.route` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

See [Route](../../route/) for full configuration.

---

### `dependencies.valkey.runtimeClassName`

See [Runtime Class Name](/truecharts-common/workload#runtimeclassname)

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `dependencies.valkey.runtimeClassName` |
| Type       | `string`                               |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

See [Runtimeclassname](../../workload/podSpec/runtimeClassName.md) for full configuration.

---

### `dependencies.valkey.schedulerName`

See [Scheduler Name](/truecharts-common/workload#schedulername)

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `dependencies.valkey.schedulerName` |
| Type       | `string`                            |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

See [Schedulername](../../workload/podSpec/schedulerName.md) for full configuration.

---

### `dependencies.valkey.secret`

Define the secret If this is set, the `users` key must not be set.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `dependencies.valkey.secret` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

See [Secret](../../secret.md) for full configuration.

---

### `dependencies.valkey.securityContext`

Define security context for all containers and pods, unless overridden at the container/pod level See more info about securityContext [documentation](/truecharts-common/securitycontext)

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.securityContext` |
| Type       | `map`                                 |
| Required   | ✅                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Securitycontext](../../securityContext.md) for full configuration.

---

### `dependencies.valkey.service`

Define service objects

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.service` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Service](../../service/) for full configuration.

---

### `dependencies.valkey.serviceAccount`

Create serviceAccount objects.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.valkey.serviceAccount` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

See [Serviceaccount](../../serviceAccount.md) for full configuration.

---

### `dependencies.valkey.shareProcessNamespace`

See [Share Process Namespace](/truecharts-common/workload#shareprocessnamespace)

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `dependencies.valkey.shareProcessNamespace` |
| Type       | `boolean`                                   |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | unset                                       |

See [Shareprocessnamespace](../../workload/podSpec/shareProcessNamespace.md) for full configuration.

---

### `dependencies.valkey.storageClass`

Define storage classes

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `dependencies.valkey.storageClass` |
| Type       | `map`                              |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | unset                              |

See [Storageclass](../../storageClass.md) for full configuration.

---

### `dependencies.valkey.tailscaleImage`

Image `tailscaleImage`, selected by containers with `imageSelector: tailscaleImage`.

| Field      | Value                                |
| ---------- | ------------------------------------ |
| Key        | `dependencies.valkey.tailscaleImage` |
| Type       | `map`                                |
| Required   | ❌                                   |
| Helm `tpl` | ❌                                   |
| Default    | unset                                |

See [Tailscaleimage](../../images.md) for full configuration.

---

### `dependencies.valkey.termination`

See [termination](/truecharts-common/workload/container/termination)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.termination` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Termination](../../workload/container/termination.md) for full configuration.

---

### `dependencies.valkey.terminationGracePeriodSeconds`

See [Termination Grace Period Seconds](/truecharts-common/workload#terminationgraceperiodseconds)

| Field      | Value                                               |
| ---------- | --------------------------------------------------- |
| Key        | `dependencies.valkey.terminationGracePeriodSeconds` |
| Type       | `integer, string`                                   |
| Required   | ❌                                                  |
| Helm `tpl` | ❌                                                  |
| Default    | unset                                               |

See [Terminationgraceperiodseconds](../../workload/terminationGracePeriodSeconds.md) for full configuration.

---

### `dependencies.valkey.tolerations`

See [Tolerations](/truecharts-common/workload#tolerations)

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.tolerations` |
| Type       | `list of map`                     |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Tolerations](../../podOptions/tolerations.md) for full configuration.

---

### `dependencies.valkey.topologySpreadConstraints`

See [Topology Spread Constraints](/truecharts-common/workload#topologyspreadconstraints)

| Field      | Value                                           |
| ---------- | ----------------------------------------------- |
| Key        | `dependencies.valkey.topologySpreadConstraints` |
| Type       | `list of map`                                   |
| Required   | ❌                                              |
| Helm `tpl` | ❌                                              |
| Default    | unset                                           |

See [Topologyspreadconstraints](../../podOptions/topologySpreadConstraints.md) for full configuration.

---

### `dependencies.valkey.ubuntuImage`

Image `ubuntuImage`, selected by containers with `imageSelector: ubuntuImage`.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.ubuntuImage` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Ubuntuimage](../../images.md) for full configuration.

---

### `dependencies.valkey.valkeyClientImage`

Image `valkeyClientImage`, selected by containers with `imageSelector: valkeyClientImage`.

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `dependencies.valkey.valkeyClientImage` |
| Type       | `map`                                   |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | unset                                   |

See [Valkeyclientimage](../../images.md) for full configuration.

---

### `dependencies.valkey.valkeyExporterImage`

Image of the metrics exporter of the valkey dependency in `operator` mode, selected by `dependencies.valkey.operator.exporter.imageSelector`.

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.valkey.valkeyExporterImage` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Valkeyexporterimage](../../images.md) for full configuration.

---

### `dependencies.valkey.valkeyImage`

Image of the valkey dependency, selected by its container in `standalone` mode and by `dependencies.valkey.operator.imageSelector` in `operator` mode.

| Field      | Value                             |
| ---------- | --------------------------------- |
| Key        | `dependencies.valkey.valkeyImage` |
| Type       | `map`                             |
| Required   | ❌                                |
| Helm `tpl` | ❌                                |
| Default    | unset                             |

See [Valkeyimage](../../images.md) for full configuration.

---

### `dependencies.valkey.volumeSnapshotClass`

Define a volume snapshot class

| Field      | Value                                     |
| ---------- | ----------------------------------------- |
| Key        | `dependencies.valkey.volumeSnapshotClass` |
| Type       | `map`                                     |
| Required   | ❌                                        |
| Helm `tpl` | ❌                                        |
| Default    | unset                                     |

See [Volumesnapshotclass](../../volumeSnapshotClass.md) for full configuration.

---

### `dependencies.valkey.volumeSnapshots`

Define a volume snapshot

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `dependencies.valkey.volumeSnapshots` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

See [Volumesnapshots](../../volumeSnapshots.md) for full configuration.

---

### `dependencies.valkey.vpa`

VerticalPodAutoscalers, keyed by name.

| Field      | Value                     |
| ---------- | ------------------------- |
| Key        | `dependencies.valkey.vpa` |
| Type       | `map`                     |
| Required   | ❌                        |
| Helm `tpl` | ❌                        |
| Default    | unset                     |

See [Vpa](../../vpa.md) for full configuration.

---

### `dependencies.valkey.webhook`

Create webhook objects.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `dependencies.valkey.webhook` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

See [Webhook](../../webhook.md) for full configuration.

---

### `dependencies.valkey.workload`

Define workload objects.

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `dependencies.valkey.workload` |
| Type       | `map`                          |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | unset                          |

See [Workload](../../workload/) for full configuration.

---

## Child Pages

- [Operator](operator/)

---

## Full Examples

A Valkey cache next to the app, with the connection details from the credentials secret:

```yaml
dependencies:
  valkey:
    enabled: true

workload:
  main:
    podSpec:
      containers:
        main:
          env:
            REDIS_HOST: '{{ .Values.dependencies.valkey.depconfig.creds.plainhost | trimAll "\"" }}'
            REDIS_PASSWORD:
              secretKeyRef:
                expandObjectName: false
                name: '{{ printf "%s-%s" .Release.Name "valkeycreds" }}'
                key: valkey-password
```

Another image, or more resources for the dependency only:

```yaml
valkeyImage:
  repository: oci.trueforge.org/containerforge/valkey
  tag: 9.0.4@sha256:387b5f54777a6451f73f1a49a45b5bb6d29e1e5838b7b5a9c84d80370995531e
  pullPolicy: IfNotPresent

dependencies:
  valkey:
    enabled: true
    resources:
      limits:
        memory: 1Gi
```
