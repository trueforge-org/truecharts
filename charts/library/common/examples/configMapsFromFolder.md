# ConfigMaps From Folder Examples

## Basic Example

Enable the feature and specify the base path where your config files are stored:

```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/configMaps"
```

With this file structure in your chart:
```
files/
└── configMaps/
    ├── app-config/
    │   ├── config.json
    │   └── settings.yaml
    └── scripts/
        └── startup.sh
```

This will automatically create:
- A ConfigMap named `<release-name>-app-config` with `config.json` and `settings.yaml`
- A ConfigMap named `<release-name>-scripts` with `startup.sh`

## Override ConfigMap Names

```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/configMaps"
  configMapsOverrides:
    app-config:
      forceRename: "my-custom-config"
```

## Add Labels and Annotations

```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/configMaps"
  configMapsOverrides:
    app-config:
      labels:
        environment: production
        team: platform
      annotations:
        description: "Application configuration"
```

## File-Level Controls

### Exclude Files

```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/configMaps"
  configMapsOverrides:
    app-config:
      fileAttributeOverrides:
        README.md:
          exclude: true  # Don't include this file
```

### Handle Binary Files

```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/assets"
  configMapsOverrides:
    images:
      fileAttributeOverrides:
        logo.png:
          binary: true  # Will be base64 encoded
```

Binary files with common extensions (png, jpg, pdf, etc.) are automatically detected and base64 encoded.

### Escape Helm Templates

If a file contains `{{ }}` syntax that you don't want Helm to process:

```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/configMaps"
  configMapsOverrides:
    templates:
      fileAttributeOverrides:
        app.template:
          escaped: true  # Preserve {{ }} in the file
```

## Complete Example

```yaml
configMapsFromFolder:
  enabled: true
  basePath: "files/configMaps"
  configMapsOverrides:
    # Application configuration
    app-config:
      forceRename: "myapp-config"
      labels:
        app: myapp
        component: config
      annotations:
        description: "Main application configuration"
      fileAttributeOverrides:
        config.json:
          exclude: false
        .gitkeep:
          exclude: true
    
    # Scripts
    scripts:
      labels:
        app: myapp
        component: scripts
      fileAttributeOverrides:
        init.sh:
          exclude: false
        deprecated.sh:
          exclude: true
    
    # Assets with binary files
    assets:
      fileAttributeOverrides:
        logo.png:
          binary: true
        favicon.ico:
          binary: true
        style.css:
          binary: false
```
