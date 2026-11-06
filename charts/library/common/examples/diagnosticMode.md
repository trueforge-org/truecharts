## Full Examples

Runs the containers with a sleep command instead of the app, so you can `exec` into them. The probes are disabled meanwhile:

```yaml
diagnosticMode:
  enabled: true
```

To do the same for the chart and all of its dependencies, use `global.diagnosticMode.enabled`.
