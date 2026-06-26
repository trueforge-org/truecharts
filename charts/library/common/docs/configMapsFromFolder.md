---
title: ConfigMaps From Folder
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/configMapsFromFolder#full-examples) section for complete examples.

:::

## Appears in

- `.Values.configMapsFromFolder`

---

## `configMapsFromFolder`

Generate ConfigMaps from a folder structure in the Helm chart's filesystem

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `configMapsFromFolder` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `configMapsFromFolder.enabled`

Enables or Disables the ConfigMaps from folder feature

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `configMapsFromFolder.enabled`   |
| Type       | `boolean`                        |
| Required   | ❌                               |
| Helm `tpl` | ❌                               |
| Default    | `false`                          |

Example

```yaml
configMapsFromFolder:
  enabled: false
```

---

### `configMapsFromFolder.basePath`

The path in your parent chart's filesystem where you can add files to be converted into individual ConfigMaps. Files should be organized two levels deep (basePath/configMapName/file)

| Field      | Value                            |
| ---------- | -------------------------------- |
| Key        | `configMapsFromFolder.basePath`  |
| Type       | `string`                         |
| Required   | ✅ (when enabled)                |
| Helm `tpl` | ❌                               |
| Default    | `""`                             |

Example

```yaml
configMapsFromFolder:
  basePath: "files/configMaps"
```

---

### `configMapsFromFolder.configMapsOverrides`

Define overrides for the generated ConfigMaps, each key is the name of a folder in basePath

| Field      | Value                                       |
| ---------- | ------------------------------------------- |
| Key        | `configMapsFromFolder.configMapsOverrides`  |
| Type       | `map`                                       |
| Required   | ❌                                          |
| Helm `tpl` | ❌                                          |
| Default    | `{}`                                        |

---

#### `configMapsFromFolder.configMapsOverrides.$folderName.forceRename`

Force a specific name for the ConfigMap instead of the auto-generated name

| Field      | Value                                                         |
| ---------- | ------------------------------------------------------------- |
| Key        | `configMapsFromFolder.configMapsOverrides.$folderName.forceRename` |
| Type       | `string, null`                                                |
| Required   | ❌                                                            |
| Helm `tpl` | ❌                                                            |
| Default    | `null`                                                        |

---

#### `configMapsFromFolder.configMapsOverrides.$folderName.annotations`

Additional annotations for the ConfigMap

| Field      | Value                                                           |
| ---------- | --------------------------------------------------------------- |
| Key        | `configMapsFromFolder.configMapsOverrides.$folderName.annotations` |
| Type       | `map`                                                           |
| Required   | ❌                                                              |
| Helm `tpl` | ❌                                                              |
| Default    | `{}`                                                            |

---

#### `configMapsFromFolder.configMapsOverrides.$folderName.labels`

Additional labels for the ConfigMap

| Field      | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| Key        | `configMapsFromFolder.configMapsOverrides.$folderName.labels` |
| Type       | `map`                                                        |
| Required   | ❌                                                           |
| Helm `tpl` | ❌                                                           |
| Default    | `{}`                                                         |

---

#### `configMapsFromFolder.configMapsOverrides.$folderName.fileAttributeOverrides`

Configure how individual files are added to the ConfigMap

| Field      | Value                                                                   |
| ---------- | ----------------------------------------------------------------------- |
| Key        | `configMapsFromFolder.configMapsOverrides.$folderName.fileAttributeOverrides` |
| Type       | `map`                                                                   |
| Required   | ❌                                                                      |
| Helm `tpl` | ❌                                                                      |
| Default    | `{}`                                                                    |

---

##### `configMapsFromFolder.configMapsOverrides.$folderName.fileAttributeOverrides.$fileName.exclude`

If true the file won't be added to the ConfigMap

| Field      | Value                                                                                  |
| ---------- | -------------------------------------------------------------------------------------- |
| Key        | `configMapsFromFolder.configMapsOverrides.$folderName.fileAttributeOverrides.$fileName.exclude` |
| Type       | `boolean`                                                                              |
| Required   | ❌                                                                                     |
| Helm `tpl` | ❌                                                                                     |
| Default    | `false`                                                                                |

---

##### `configMapsFromFolder.configMapsOverrides.$folderName.fileAttributeOverrides.$fileName.binary`

If your file is a binary file like an image, set this to true. Takes precedence over escaped

| Field      | Value                                                                                 |
| ---------- | ------------------------------------------------------------------------------------- |
| Key        | `configMapsFromFolder.configMapsOverrides.$folderName.fileAttributeOverrides.$fileName.binary` |
| Type       | `boolean`                                                                             |
| Required   | ❌                                                                                    |
| Helm `tpl` | ❌                                                                                    |
| Default    | `false`                                                                               |

---

##### `configMapsFromFolder.configMapsOverrides.$folderName.fileAttributeOverrides.$fileName.escaped`

If your file contains gotpl syntax that you don't want templated by Helm, set this to true

| Field      | Value                                                                                  |
| ---------- | -------------------------------------------------------------------------------------- |
| Key        | `configMapsFromFolder.configMapsOverrides.$folderName.fileAttributeOverrides.$fileName.escaped` |
| Type       | `boolean`                                                                              |
| Required   | ❌                                                                                     |
| Helm `tpl` | ❌                                                                                     |
| Default    | `false`                                                                                |

---

## Full Examples

### Basic Example

Your file structure:
```
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

Your values.yaml:
```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/configMaps"
```

This will create two ConfigMaps:
- `myapp-app-config` with keys: `config.json`, `settings.yaml`
- `myapp-scripts` with key: `startup.sh`

### Advanced Example with Overrides

```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/configMaps"
  configMapsOverrides:
    app-config:
      forceRename: "my-custom-config-name"
      labels:
        environment: production
        team: platform
      annotations:
        description: "Application configuration files"
      fileAttributeOverrides:
        config.json:
          exclude: false
        template.tpl:
          escaped: true  # Don't process Helm templates in this file
    scripts:
      fileAttributeOverrides:
        startup.sh:
          exclude: false
        logo.png:
          binary: true  # Treat as binary, will be base64 encoded
```

### Example with Binary Files

```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/assets"
  configMapsOverrides:
    images:
      fileAttributeOverrides:
        logo.png:
          binary: true
        icon.svg:
          binary: false  # SVG can be stored as text
        favicon.ico:
          binary: true
```
