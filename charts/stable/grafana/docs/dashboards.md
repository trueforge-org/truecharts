---
title: Grafana Dashboards
---

There are multiple options how to add dashboard to Grafana.
From chart version 21, this is extended with the option `dashboards`, which allows automatically loading dashboards from the Grafana marketplace or any other URL that returns a JSON with a Grafana dashboard. Scraping dashboards from configmaps continues to be possible and hasn't changed.

## Adding a dashboard via marketplace

Add the following part to your `.Values`:

```yaml
dashboards:
  grafana:
    volsync:
      enabled: true
      failOnError: false
      b64content: false
      datasource:
        - name: "${DS_PROMETHEUS}"
          value: Prometheus
        - name: "${VAR_REPLICATIONDESTNAME}"
          value: ".*-dst|.*-bootstrap"
      marketplace:
        id: 21356
        revision: 3
```

## Adding a dashboard via url

Add the following part to your `.Values`:

```yaml
dashboards:
  grafana:
    truenas:
      enabled: true
      failOnError: false
      b64content: false
      datasource:
        - name: "${DS_MIMIR}"
          value: Prometheus
      url: https://raw.githubusercontent.com/Supporterino/truenas-graphite-to-prometheus/refs/heads/main/dashboards/truenas_scale.json
```


### Some explanation of the values:
- `enabled` turn on/off the dashboard
- `failOnError` if enabled any failure during the download, decoding, or provisioning of the dashboard will cause the Grafana deployment to stop and error out, preventing Grafana from deploying.
- `b64content` automaticly decodes base64 encoded dashboards
- `datasource: { name: "", value: "" }` defines a list of mappings used to replace specific variables within a dashboard's JSON file. You must consult the dashboard's JSON structure to identify which variables need replacement. The variable substitutions must match their exact appearance in the JSON, including any brackets (e.g., `${...}`). Be aware that specific deployment environments, such as Flux, might require escaping certain characters.
- `id` numbered id from https://grafana.com/grafana/dashboards/.
- `revision` numbered revision from https://grafana.com/grafana/dashboards/.
- `url` url where to download the dashboard from.

Note: It have to be `marketplace:` or `url:` both cannot be set at a time per dashboard.
