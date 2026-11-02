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
