## Full Examples

`TZ` is set as the `TZ` environment variable of all containers. `namespace` is used for every object that does not set its own namespace:

```yaml
TZ: Europe/Amsterdam

namespace: my-namespace
```

A single container can override the timezone with `fixedEnv`:

```yaml
workload:
  main:
    enabled: true
    primary: true
    podSpec:
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
          fixedEnv:
            TZ: America/New_York
```
