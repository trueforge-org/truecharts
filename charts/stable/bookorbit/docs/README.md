# Bookorbit chart

This chart provides a Bookorbit deployment using the shared TrueCharts common chart, with persistence, routing, and other common TrueCharts options available through the shared values and templates.

## Common chart options

Most deployment options are defined by the shared TrueCharts common library. For the full list of available values, see:

- https://github.com/trueforge-org/truecharts/blob/master/charts/library/common/values.yaml

If you want to inspect the available values locally from a Helm chart checkout, you can run:

```bash
helm show values oci://oci.trueforge.org/truecharts/common
```

For the Bookorbit chart itself, see the installation notes in [installation_notes.md](installation_notes.md).
