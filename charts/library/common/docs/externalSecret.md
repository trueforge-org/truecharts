---
title: Externalsecret
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/externalSecret#full-examples) section for complete examples.

:::

## Appears in

- `.Values.externalSecret`

---

## `externalSecret`

Create ExternalSecret objects

| Field      | Value            |
| ---------- | ---------------- |
| Key        | `externalSecret` |
| Type       | `map`            |
| Required   | ❌               |
| Helm `tpl` | ❌               |
| Default    | unset            |

---

### `externalSecret.$name.annotations`

Additional annotations for ExternalSecret

| Field      | Value                              |
| ---------- | ---------------------------------- |
| Key        | `externalSecret.$name.annotations` |
| Type       | `map, string`                      |
| Required   | ❌                                 |
| Helm `tpl` | ❌                                 |
| Default    | `{}`                               |

Example

```yaml
externalSecret:
  $name:
    annotations:
      {}
```

---

### `externalSecret.$name.data`

Individual keys to fetch from the provider, supports Helm `tpl`.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `externalSecret.$name.data` |
| Type       | `list, string`              |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | `[]`                        |

Example

```yaml
externalSecret:
  $name:
    data:
      []
```

---

### `externalSecret.$name.dataFrom`

Fetch multiple keys from the provider at once, passed as is. External Secrets Operator evaluates its own Go templates in rewrite transforms.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `externalSecret.$name.dataFrom` |
| Type       | `list, string`                  |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | `[]`                            |

Example

```yaml
externalSecret:
  $name:
    dataFrom:
      []
```

---

### `externalSecret.$name.enabled`

Enables or Disables the ExternalSecret

| Field      | Value                          |
| ---------- | ------------------------------ |
| Key        | `externalSecret.$name.enabled` |
| Type       | `boolean, string`              |
| Required   | ❌                             |
| Helm `tpl` | ❌                             |
| Default    | `false`                        |

Example

```yaml
externalSecret:
  $name:
    enabled: false
```

---

### `externalSecret.$name.expandObjectName`

Prefix the object name with the chart fullname

| Field      | Value                                   |
| ---------- | --------------------------------------- |
| Key        | `externalSecret.$name.expandObjectName` |
| Type       | `boolean, string`                       |
| Required   | ❌                                      |
| Helm `tpl` | ❌                                      |
| Default    | `true`                                  |

Example

```yaml
externalSecret:
  $name:
    expandObjectName: true
```

---

### `externalSecret.$name.labels`

Additional labels for ExternalSecret

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `externalSecret.$name.labels` |
| Type       | `map, string`                 |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | `{}`                          |

Example

```yaml
externalSecret:
  $name:
    labels:
      {}
```

---

### `externalSecret.$name.namespace`

Define the namespace for this object

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `externalSecret.$name.namespace` |
| Type       | `string`                         |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `""`                             |

Example

```yaml
externalSecret:
  $name:
    namespace: ""
```

---

### `externalSecret.$name.refreshInterval`

How often the data is synced from the provider, supports Helm `tpl`. Uses the External Secrets Operator default when empty.

| Field      | Value                                  |
| ---------- | -------------------------------------- |
| Key        | `externalSecret.$name.refreshInterval` |
| Type       | `null, string`                         |
| Required   | ❌                                     |
| Helm `tpl` | ❌                                     |
| Default    | unset                                  |

---

### `externalSecret.$name.refreshPolicy`

When the data is synced from the provider.

| Field      | Value                                             |
| ---------- | ------------------------------------------------- |
| Key        | `externalSecret.$name.refreshPolicy`              |
| Type       | `null, string`                                    |
| Required   | ❌                                                |
| Helm `tpl` | ❌                                                |
| Default    | unset                                             |
| Enum       | `null`, ``, `CreatedOnce`, `Periodic`, `OnChange` |

---

### `externalSecret.$name.secretStoreRef`

The store the data is fetched from.

| Field      | Value                                 |
| ---------- | ------------------------------------- |
| Key        | `externalSecret.$name.secretStoreRef` |
| Type       | `map`                                 |
| Required   | ❌                                    |
| Helm `tpl` | ❌                                    |
| Default    | unset                                 |

---

### `externalSecret.$name.target`

The Kubernetes Secret created by the External Secrets Operator.

| Field      | Value                         |
| ---------- | ----------------------------- |
| Key        | `externalSecret.$name.target` |
| Type       | `map`                         |
| Required   | ❌                            |
| Helm `tpl` | ❌                            |
| Default    | unset                         |

---

## Full Examples

ExternalSecrets require the [External Secrets Operator](https://external-secrets.io) CRDs to be installed in the cluster.

### Fetch Individual Keys

Create a Secret named `<fullname>-credentials` with the keys `username` and `password`, fetched from a `ClusterSecretStore`:

```yaml
externalSecret:
  credentials:
    enabled: true
    refreshInterval: 1h
    secretStoreRef:
      name: vault
      kind: ClusterSecretStore
    data:
      - secretKey: username
        remoteRef:
          key: my-app
          property: username
      - secretKey: password
        remoteRef:
          key: my-app
          property: password
```

### Fetch All Keys of a Provider Entry

Use `dataFrom` to copy every key of a provider entry into the Secret:

```yaml
externalSecret:
  config:
    enabled: true
    secretStoreRef:
      name: aws-parameter-store
    dataFrom:
      - extract:
          key: my-app/config
```

### Custom Secret Name and Template

`target.template` is passed to the ExternalSecret as is, so the External Secrets Operator can evaluate its own templates in there.
Values in `data` do support Helm `tpl`:

```yaml
externalSecret:
  database:
    enabled: true
    expandObjectName: false
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    secretStoreRef:
      name: vault
    target:
      name: database-url
      creationPolicy: Owner
      deletionPolicy: Retain
      template:
        type: Opaque
        data:
          url: "postgres://{{ .username }}:{{ .password }}@db:5432/app"
    data:
      - secretKey: username
        remoteRef:
          key: "{{ .Release.Name }}-database"
          property: username
      - secretKey: password
        remoteRef:
          key: "{{ .Release.Name }}-database"
          property: password
```
