---
title: External Secret
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/externalSecret#full-examples) section for complete examples.

:::

## Appears in

- `.Values.externalSecret`

---

## `externalSecret`

ExternalSecrets, keyed by name. The External Secrets Operator syncs them into Secrets from an external store.

| Field | Value |
| --- | --- |
| Key | `externalSecret` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

An ExternalSecret.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.enabled`

Create this ExternalSecret when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.expandObjectName`

Prefix the name of the ExternalSecret with the chart fullname.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.expandObjectName` |
| Type | `bool or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `true` |

---

## `$name.namespace`

Namespace to create this object in. Overrides the chart-wide `namespace` and `global.namespace`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

---

## `$name.labels`

Additional labels for ExternalSecret

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for ExternalSecret

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.refreshInterval`

How often the data is synced from the provider, as a duration, eg `1h`. Supports Helm `tpl`. Uses the default of the External Secrets Operator when empty.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.refreshInterval` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

Example

```yaml
externalSecret:
  example:
    refreshInterval: 1h
```

---

## `$name.refreshPolicy`

When the data is synced from the provider. Uses the default of the External Secrets Operator when empty.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.refreshPolicy` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `null`, `""`, `"CreatedOnce"`, `"Periodic"`, `"OnChange"` |

---

## `$name.secretStoreRef`

The store the data is fetched from.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.secretStoreRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.secretStoreRef.name`

Name of the SecretStore or ClusterSecretStore. Supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.secretStoreRef.name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.secretStoreRef.kind`

Kind of the store the data is fetched from.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.secretStoreRef.kind` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"SecretStore"` |
| Allowed values | `"SecretStore"`, `"ClusterSecretStore"` |

---

## `$name.target`

The Kubernetes Secret created by the External Secrets Operator.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.target.name`

Name of the Secret the External Secrets Operator creates. Supports Helm `tpl`. Defaults to the name of the ExternalSecret.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.name` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ✅ |
| Default | unset |

---

## `$name.target.creationPolicy`

How the External Secrets Operator creates and owns the Secret.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.creationPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"Owner"` |
| Allowed values | `"Owner"`, `"Orphan"`, `"Merge"`, `"None"` |

---

## `$name.target.deletionPolicy`

What happens to the Secret when the data is removed from the provider.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.deletionPolicy` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |
| Allowed values | `null`, `""`, `"Delete"`, `"Merge"`, `"Retain"` |

---

## `$name.target.immutable`

Create the Secret as immutable.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.immutable` |
| Type | `null or bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.target.template`

Template for the created Secret, passed as is. External Secrets Operator evaluates its own Go templates in here.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.target.template.type`

Type of the created Secret, eg `Opaque`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.type` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.target.template.engineVersion`

Version of the template engine of the External Secrets Operator, eg `v2`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.engineVersion` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
externalSecret:
  example:
    target:
      template:
        engineVersion: v2
```

---

## `$name.target.template.mergePolicy`

How the template is merged with the fetched data, eg `Replace` or `Merge`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.mergePolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

Example

```yaml
externalSecret:
  example:
    target:
      template:
        mergePolicy: Replace
```

---

## `$name.target.template.data`

Keys of the created Secret, keyed by name. Values are Go templates evaluated by the External Secrets Operator.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.data` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.target.template.data.$name`

Template of the key.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.data.$name` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.target.template.templateFrom`

Templates loaded from ConfigMaps or Secrets, passed on as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.templateFrom` |
| Type | `list of any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.target.template.metadata`

Metadata of the created Secret.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.metadata` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.target.template.metadata.annotations`

Annotations of the created Secret.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.metadata.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.target.template.metadata.labels`

Labels of the created Secret.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.target.template.metadata.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data`

Individual keys to fetch from the provider, supports Helm `tpl`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.data[]`

A single key to fetch from the provider.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].secretKey`

Key in the created Secret.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].secretKey` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].remoteRef`

Reference to the data in the provider.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].remoteRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].remoteRef.key`

Key of the data in the provider.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].remoteRef.key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].remoteRef.property`

Property of the provider data to use, when the data is a JSON or YAML document.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].remoteRef.property` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].remoteRef.version`

Version of the provider data to use.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].remoteRef.version` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].remoteRef.conversionStrategy`

How the provider data is converted, for example `Default` or `Unicode`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].remoteRef.conversionStrategy` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].remoteRef.decodingStrategy`

How the provider data is decoded, for example `None`, `Base64`, `Base64URL` or `Auto`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].remoteRef.decodingStrategy` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].remoteRef.metadataPolicy`

Fetch the metadata of the provider data instead, for example `None` or `Fetch`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].remoteRef.metadataPolicy` |
| Type | `null or string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].sourceRef`

Override the store for this key, passed as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].sourceRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.data[].sourceRef.$name`

A setting of the store reference, passed on as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.data[].sourceRef.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom`

Fetch multiple keys from the provider at once, passed as is. External Secrets Operator evaluates its own Go templates in rewrite transforms.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `[]` |

---

## `$name.dataFrom[]`

A set of keys to fetch from the provider at once.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].extract`

Extract all keys from a single provider entry.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].extract.key`

Key of the entry in the provider.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.key` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].extract.property`

Property of the entry to extract.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.property` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].extract.version`

Version of the entry.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.version` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].extract.conversionStrategy`

How the keys are converted, passed on as is, eg `Default` or `Unicode`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.conversionStrategy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].extract.decodingStrategy`

How the values are decoded, passed on as is, eg `None`, `Base64`, `Base64URL` or `Auto`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.decodingStrategy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].extract.metadataPolicy`

Whether to fetch the metadata of the entry, eg `None` or `Fetch`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].extract.metadataPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].find`

Find provider entries by name or tags, passed on as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].find` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].find.$name`

A setting of the search, passed on as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].find.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].rewrite`

Rewrite the keys of the fetched data.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].rewrite[]`

A rule that rewrites the keys of the fetched data, either with `regexp` or with `transform`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[]` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].rewrite[].regexp`

Rewrite the keys with a regular expression.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].regexp` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].rewrite[].regexp.source`

Regular expression to match the keys.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].regexp.source` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].rewrite[].regexp.target`

Replacement of the matched part.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].regexp.target` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].rewrite[].transform`

Rewrite the keys with a template.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].transform` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].rewrite[].transform.template`

Go template that gets the key as `.value`.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].rewrite[].transform.template` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].sourceRef`

Override the store for this entry, passed as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].sourceRef` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.dataFrom[].sourceRef.$name`

A setting of the store reference, passed on as is.

| Field | Value |
| --- | --- |
| Key | `externalSecret.$name.dataFrom[].sourceRef.$name` |
| Type | `any` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

ExternalSecrets require the [External Secrets Operator](https://external-secrets.io) CRDs to be installed in the cluster.

### Fetch individual keys

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

### Fetch all keys of a provider entry

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

### Find entries and rewrite the keys

`find` selects entries of the provider, and `rewrite` changes the names of the keys:

```yaml
externalSecret:
  all-config:
    enabled: true
    refreshPolicy: Periodic
    refreshInterval: 30m
    secretStoreRef:
      name: vault
      kind: ClusterSecretStore
    dataFrom:
      - find:
          name:
            regexp: "^my-app-.*"
        rewrite:
          - regexp:
              source: "my-app-(.*)"
              target: "app_$1"
```

### Custom Secret name and template

`target.template` is passed to the ExternalSecret as is, so the External Secrets Operator can evaluate its own templates in there. Values in `data` do support Helm `tpl`:

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
