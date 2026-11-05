## Full Examples

`common` is merged into the defaults of the library before the values of the chart. In a chart that depends on `common`, Helm puts the values for the library under this key, and it takes the same values as the chart itself:

```yaml
common:
  TZ: Europe/Amsterdam
  podOptions:
    enableServiceLinks: false
  securityContext:
    pod:
      fsGroup: 1000
```
