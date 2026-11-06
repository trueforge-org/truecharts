## Full Examples

### NVIDIA capabilities

Sets the `NVIDIA_DRIVER_CAPABILITIES` of every container. The default is `all`:

```yaml
containerOptions:
  NVIDIA_CAPS:
    - compute
    - utility
```

### Video transcoding

```yaml
containerOptions:
  NVIDIA_CAPS:
    - compute
    - video
    - utility
```

A single container can override the value through `fixedEnv`:

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
            NVIDIA_CAPS:
              - graphics
```
