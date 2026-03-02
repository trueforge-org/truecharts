---
title: README
---

## General Info

For more information about this Chart, please check the docs on the TrueCharts [website](https://trueforge.org/truecharts/charts/incubator/rustatio)

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/trueforge-org/truecharts/issues/new/choose)**

## Installation

### Helm-Chart installation

To install TrueCharts Helm charts using Helm, you can use our OCI Repository.

`helm install mychart oci://oci.trueforge.org/truecharts/rustatio`

For more information on how to install TrueCharts Helm charts, checkout the [instructions on the website](https://trueforge.org/truecharts/guides/)

## Chart Specific Guides and information

All our charts have dedicated documentation pages.
The documentation for this chart can be found here:
https://trueforge.org/truecharts/incubator/rustatio

## Configuration Options

To view the chart specific options, please view Values.yaml included in the chart.
The most recent version of which, is available here: https://github.com/trueforge-org/truecharts/blob/master/charts/incubator/rustatio/values.yaml

All our Charts use a shared "common" library chart that contains most of the templating and options.
For the complete overview of all available options, please checkout the documentation for them on the [common docs on our website](https://trueforge.org/truecharts-common/)

For information about the common chart and all defaults included with it, please review its values.yaml file available here: https://github.com/trueforge-org/truecharts/blob/master/charts/library/common/values.yaml

## Install Steps

1. Set `rustatio.authToken` to a unique value. Installation will fail if it remains `CHANGE_ME`.
2. Keep `persistence.data` enabled for `/data`. Optionally enable `persistence.torrents` for `/torrents`.
3. Access the web UI on port `8080` (or your overridden `service.main.ports.main.port`).

## Configuration

| Key | Default | Description |
| --- | --- | --- |
| `rustatio.authToken` | `CHANGE_ME` | Required auth token for the UI/API (install is blocked if unchanged). |
| `rustatio.logLevel` | `trace` | Sets `RUST_LOG`. |
| `rustatio.watchAutoStart` | `false` | Auto-start watch folder processing. |
| `service.main.ports.main.port` | `8080` | Web UI port and `PORT` env. |
| `securityContext.container.PUID` | `1000` | PUID used for file ownership; exported as `PUID`. |
| `securityContext.pod.fsGroup` | `1000` | PGID used for file ownership; exported as `PGID`. |

Note: The container runs as root on startup so the entrypoint can chown `/app` and `/data`, then drops privileges.

## Persistence

| Name | Enabled | Mount Path | Description |
| --- | --- | --- | --- |
| `data` | `true` | `/data` | Required application data. |
| `torrents` | `false` | `/torrents` | Optional watch folder. |

## Ports

| Name | Port | Protocol | Description |
| --- | --- | --- | --- |
| `main` | `8080` | TCP | Web UI. |

## Upgrade Notes

- Keep `/data` persistent between upgrades.
- Ensure `rustatio.authToken` remains set to a non-default value.
- If enabling `/torrents`, verify host path permissions match `PUID`/`PGID`.

## Support

- See the [Website](https://trueforge.org)
- Check our [Discord](https://discord.gg/tVsPTHWTtr)
- Open a [issue](https://github.com/trueforge-org/truecharts/issues/new/choose)

---

## Sponsor TrueCharts

TrueCharts can only exist due to the incredible effort of our staff.
Please consider making a [donation](https://trueforge.org/general/sponsor/) or contributing back to the project any way you can!

_All Rights Reserved - The TrueCharts Project_
