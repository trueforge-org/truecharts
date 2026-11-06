---
title: Init Containers
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/workload/podSpec/initContainers#full-examples) section for complete examples.

:::

## Appears in

- `.Values.workload.$name.podSpec.initContainers.$name`

---

## `$name`

An init container of the pod. It supports the settings of a container, except `lifecycle`, `primary` and working probes.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `type`

When the init container runs: `install` only on install, `upgrade` only on upgrade, `system` and `init` on every start. They are run in this order: `install`, `upgrade`, `system`, then `init`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.type` |
| Type | `string` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      initContainers:
        example:
          type: init
```

---

## `enabled`

Whether the init container is created.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `imageSelector`

Name of the image to use. It is a key on the root of the values that holds `repository`, `tag` and `pullPolicy`, eg `image`.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.imageSelector` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `command`

Entrypoint of the init container (`command`). A single command can be given as a string.

See [Command](/truecharts-common/workload/podSpec/containers/command) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.command` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      initContainers:
        example:
          command:
            - /bin/sh
```

---

## `args`

Arguments of the init container (`args`). A single argument can be given as a string.

See [Args](/truecharts-common/workload/podSpec/containers/args) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.args` |
| Type | `string or list of string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
workload:
  example:
    podSpec:
      initContainers:
        example:
          args:
            - --port=8080
```

---

## `env`

Environment variables of the init container, keyed by name.

See [Env](/truecharts-common/workload/podSpec/containers/env) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.env` |
| Type | `map or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `envFrom`

ConfigMaps and Secrets whose keys all become environment variables of the init container.

See [Env From](/truecharts-common/workload/podSpec/containers/envFrom) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.envFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `resources`

CPU, memory and extended resources the init container requests and may use.

See [Resources](/truecharts-common/workload/podSpec/containers/resources) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.resources` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `securityContext`

Security context of the init container. Overrides `securityContext.container`.

See [Container Security Context](/truecharts-common/workload/podSpec/containers/securityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.securityContext` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `termination`

Where the termination message of the init container is read from.

See [Termination](/truecharts-common/workload/podSpec/containers/termination) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.termination` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `probes`

Accepted for compatibility with the shared container shape. The init container spawner replaces probes with disabled probes.

See [Probes](/truecharts-common/workload/podSpec/containers/probes) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `workload.$name.podSpec.initContainers.$name.probes` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

Init containers support `command`, `args`, `env`, `envFrom`, `resources`, `securityContext` and `termination`. `lifecycle` and `probes` do not apply to them.

### Types

`type` defines when the init container runs: `init` on every start of the pod, `install` only on the first install of the chart and `upgrade` only on upgrades.

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      initContainers:
        init-name:
          enabled: true
          type: init
          imageSelector: image
          command:
            - /bin/sh
            - -c
            - echo "runs on every start"
        install-name:
          enabled: true
          type: install
          imageSelector: image
          command: /bin/seed-data
        upgrade-name:
          enabled: true
          type: upgrade
          imageSelector: image
          command: /bin/migrate
          args:
            - --yes
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```

### Env, resources and security context

```yaml
workload:
  workload-name:
    enabled: true
    primary: true
    podSpec:
      initContainers:
        init-name:
          enabled: true
          type: init
          imageSelector: image
          command:
            - /bin/sh
            - -c
            - chown -R 568:568 /config
          env:
            ENV_NAME1: ENV_VALUE
            ENV_NAME2:
              secretKeyRef:
                name: secret-name
                key: secret-key
          envFrom:
            - configMapRef:
                name: configmap-name
          resources:
            limits:
              cpu: 500m
              memory: 256Mi
            requests:
              cpu: 10m
              memory: 50Mi
          securityContext:
            runAsUser: 0
            runAsGroup: 0
            runAsNonRoot: false
            readOnlyRootFilesystem: false
            capabilities:
              add:
                - CHOWN
          termination:
            messagePath: /dev/termination-log
            messagePolicy: File
      containers:
        container-name:
          enabled: true
          primary: true
          imageSelector: image
```
