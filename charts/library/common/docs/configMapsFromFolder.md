---
title: ConfigMaps From Folder
---

:::note

- Examples under each key are only to be used as a placement guide
- See the [Full Examples](/truecharts-common/configMapsFromFolder#full-examples) section for complete examples.

:::

## Appears in

- `.Values.configMapsFromFolder`

---

## `configMapsFromFolder`

Generate ConfigMaps from the folders in a directory of the parent chart.

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `enabled`

Generate ConfigMaps from the folders in `basePath` when true.

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.enabled` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `basePath`

Path in the filesystem of the parent chart that holds the files to convert into ConfigMaps. Files are organised two levels deep: `basePath/configMapName/file`.

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.basePath` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `""` |

Example

```yaml
configMapsFromFolder:
  basePath: configmaps
```

---

## `configMapsOverrides`

Define overrides for the generated ConfigMaps, each key is the name of a folder in basePath.

Each override accepts:

- `forceRename`: Force a specific name for the ConfigMap instead of the auto-generated name
- `annotations`: Additional annotations for the ConfigMap
- `labels`: Additional labels for the ConfigMap
- `fileAttributeOverrides`: Configure how individual files are added to the ConfigMap, per file name
  - `exclude`: If true the file won't be added to the ConfigMap
  - `binary`: If your file is a binary file like an image, set this to true. Takes precedence over escaped
  - `escaped`: If your file contains gotpl syntax that you don't want templated by Helm, set this to true

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `configMapsOverrides.$name`

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `configMapsOverrides.$name.forceRename`

Force a specific name for the ConfigMap instead of the auto-generated name

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides.$name.forceRename` |
| Type | `string or null` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `configMapsOverrides.$name.annotations`

Additional annotations for the ConfigMap

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `configMapsOverrides.$name.labels`

Additional labels for the ConfigMap

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `configMapsOverrides.$name.fileAttributeOverrides`

Configure how individual files are added to the ConfigMap

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides.$name.fileAttributeOverrides` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `configMapsOverrides.$name.fileAttributeOverrides.$name`

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides.$name.fileAttributeOverrides.$name` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `configMapsOverrides.$name.fileAttributeOverrides.$name.exclude`

If true the file won't be added to the ConfigMap

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides.$name.fileAttributeOverrides.$name.exclude` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `configMapsOverrides.$name.fileAttributeOverrides.$name.binary`

If your file is a binary file like an image, set this to true. Takes precedence over escaped

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides.$name.fileAttributeOverrides.$name.binary` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `configMapsOverrides.$name.fileAttributeOverrides.$name.escaped`

If your file contains gotpl syntax that you don't want templated by Helm, set this to true

| Field | Value |
| --- | --- |
| Key | `configMapsFromFolder.configMapsOverrides.$name.fileAttributeOverrides.$name.escaped` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## Full Examples

### Basic example

Every folder below `basePath` becomes a ConfigMap, and every file in it a key. Your file structure:

```text
myapp/
├── Chart.yaml
├── values.yaml
└── files/
    └── configMaps/
        ├── app-config/
        │   ├── config.json
        │   └── settings.yaml
        └── scripts/
            └── startup.sh
```

Your `values.yaml`:

```yaml
configMapsFromFolder:
  enabled: true
  basePath: files/configMaps
```

This creates two ConfigMaps:

- `myapp-app-config` with the keys `config.json` and `settings.yaml`.
- `myapp-scripts` with the key `startup.sh`.

### Advanced example with overrides

Rename a ConfigMap, add labels and annotations, and change how single files are handled:

```yaml
configMapsFromFolder:
  enabled: true
  basePath: files/configMaps
  configMapsOverrides:
    app-config:
      forceRename: my-custom-config-name
      labels:
        environment: production
        team: platform
      annotations:
        description: Application configuration files
      fileAttributeOverrides:
        config.json:
          exclude: false
        template.tpl:
          # Do not process Helm templates in this file
          escaped: true
        draft.yaml:
          exclude: true
    scripts:
      fileAttributeOverrides:
        startup.sh:
          exclude: false
```

### Example with binary files

Files marked as `binary` are base64 encoded and stored as `binaryData`:

```yaml
configMapsFromFolder:
  enabled: true
  basePath: files/assets
  configMapsOverrides:
    images:
      fileAttributeOverrides:
        logo.png:
          binary: true
        icon.svg:
          # SVG can be stored as text
          binary: false
        favicon.ico:
          binary: true
```
