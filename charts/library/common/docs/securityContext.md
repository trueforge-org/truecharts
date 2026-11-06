---
title: Security Context
---

:::note

- See the [Full Examples](/truecharts-common/securityContext#full-examples) section for complete examples.

:::

## Appears in

- `.Values.securityContext`

---

## `securityContext`

Default security contexts for all containers and pods, unless overridden at the container or pod level. See [securityContext](/truecharts-common/securityContext).

| Field | Value |
| --- | --- |
| Key | `securityContext` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
container:
  runAsUser: 568
  runAsGroup: 568
  readOnlyRootFilesystem: true
  allowPrivilegeEscalation: false
  privileged: false
  seccompProfile:
    type: RuntimeDefault
  capabilities:
    add: []
    drop:
      - ALL
    disableS6Caps: false
  PUID: 568
  UMASK: '0022'
pod:
  fsGroup: 568
  fsGroupChangePolicy: OnRootMismatch
  supplementalGroups: []
  sysctls: []
```

---

## `container`

Security context applied to all containers, unless overridden at the container level. See [securityContext](/truecharts-common/securityContext).

See [Container Security Context](/truecharts-common/workload/podSpec/containers/securityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `securityContext.container` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | See below |

Default value:

```yaml
runAsUser: 568
runAsGroup: 568
readOnlyRootFilesystem: true
allowPrivilegeEscalation: false
privileged: false
seccompProfile:
  type: RuntimeDefault
capabilities:
  add: []
  drop:
    - ALL
  disableS6Caps: false
PUID: 568
UMASK: '0022'
```

---

## `pod`

Security context applied to all pods, unless overridden at the pod level. See [securityContext](/truecharts-common/securityContext).

See [securityContext](/truecharts-common/workload/podSpec/securityContext) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `securityContext.pod` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{"fsGroup": 568, "fsGroupChangePolicy": "OnRootMismatch", "supplementalGroups": [], "sysctls": []}` |

---

## Full Examples

### Defaults

The defaults of common, which meet the Pod Security Standard `restricted`:

```yaml
securityContext:
  container:
    runAsUser: 568
    runAsGroup: 568
    readOnlyRootFilesystem: true
    allowPrivilegeEscalation: false
    privileged: false
    seccompProfile:
      type: RuntimeDefault
    capabilities:
      add: []
      drop:
        - ALL
  pod:
    fsGroup: 568
    fsGroupChangePolicy: OnRootMismatch
    supplementalGroups: []
    sysctls: []
```

### Other user and group

Run all containers as another user, and make the volumes writable for it:

```yaml
securityContext:
  container:
    runAsUser: 1000
    runAsGroup: 1000
    PUID: 1000
    UMASK: "0002"
  pod:
    fsGroup: 1000
    supplementalGroups:
      - 44
      - 109
```

### Capabilities and a writable root filesystem

Relax a setting only when the app needs it, and as little as possible. Add one capability instead of making the container privileged:

```yaml
securityContext:
  container:
    readOnlyRootFilesystem: false
    capabilities:
      add:
        - NET_BIND_SERVICE
      drop:
        - ALL
      disableS6Caps: true
```

### Sysctls and the filesystem group policy

```yaml
securityContext:
  pod:
    fsGroupChangePolicy: Always
    sysctls:
      - name: net.ipv4.ip_unprivileged_port_start
        value: "0"
```
