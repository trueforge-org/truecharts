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
