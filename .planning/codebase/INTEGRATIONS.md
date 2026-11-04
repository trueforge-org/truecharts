---
last_mapped_commit: c71e810c627cb23e4bddb4199aa83deec403ab70
last_mapped_at: 2026-11-04
---
# External Integrations

**Analysis Date:** 2026-11-04

## APIs & External Services

**Container and chart registries (runtime and build):**
- `oci.trueforge.org` (TrueForge registry) - Source of the `common` chart dependency (`oci://oci.trueforge.org/truecharts`, declared in every app `Chart.yaml`), TrueForge images (`oci.trueforge.org/containerforge/...`) used by `common` defaults in `charts/library/common/values.yaml`, and the devcontainer image in `.devcontainer/devcontainer.json`
  - SDK/Client: `helm dependency build` / `helm pull` (Helm OCI support)
  - Auth: none required for pulls; retries are needed for intermittent `unexpected EOF` errors (`.github/scripts/add_chart_schema.sh`)
- `ghcr.io` (GitHub Container Registry) - CloudNativePG images (`ghcr.io/cloudnative-pg/postgresql`, `postgis`), Vectorchord/pgvecto.rs images (`ghcr.io/tensorchord/*`), and OCI charts `ghcr.io/cloudnative-pg/charts/cloudnative-pg` and `ghcr.io/prometheus-community/charts/kube-prometheus-stack` (CI cluster setup, `.github/scripts/install_dependencies.sh`)
- `quay.io` - `helm registry login` during release (`.github/workflows/charts-release.yaml`, secrets `QUAY_USER` and `QUAY_SECRET`); also `quay.io/metallb/chart`, `quay.io/jetstack/charts` (cert-manager) in `install_dependencies.sh`
- `registry.k8s.io/ingress-nginx/charts` - ingress-nginx chart for CI installs (`install_dependencies.sh`)
- `docker.io` and `public.ecr.aws` - image sources referenced by application charts (e.g. `docker.io/alpine`, `public.ecr.aws/docker/library` in `charts/stable/*/values.yaml`)
- Chart repositories used in CI (`.github/scripts/prep_helm.sh`): `https://charts.jetstack.io`, `https://grafana.github.io/helm-charts`, `https://cloudnative-pg.github.io/charts`, `https://metallb.github.io/metallb`, `https://openebs.github.io/charts`, `https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/charts`, `https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts`, `https://valkey.io/valkey-helm`, `oci://ghcr.io/home-operations/charts-mirror`

**GitHub (source, CI, releases):**
- GitHub Actions - workflows in `.github/workflows/` (`charts-lint.yaml`, `charts-test.yaml`, `charts-release.yaml`, `common-tests.yaml`, `daily.yaml`, `pr-validate.yaml`, `automerge.yaml`, `stale.yaml`, `schedule-sync-labels.yaml`). Third-party actions pinned by commit SHA (e.g. `actions/checkout`, `azure/setup-helm`, `helm/chart-testing-action`, `nolar/setup-k3d-k3s`, `dorny/paths-filter`, `dessant/lock-threads`).
  - Auth: `GITHUB_TOKEN` (workflow-scoped) and repository secrets (names only are referenced in workflows)
- GitHub REST API - `https://api.github.com/repos/trueforge-org/forgetool/releases/latest` used by `daily.yaml` to resolve the forgetool release tag
- GitHub Releases - download of `forgetool_<version>_linux_<arch>.tar.gz` (`daily.yaml`), helm-unittest plugin (`https://github.com/helm-unittest/helm-unittest`, `run_common_tests.sh`), `yq` v4.26.1 (`charts-lint.yaml`), chart-releaser packages (`charts-release.yaml`, `cr.yaml`)
- Helm install script - `https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4` (`run_common_tests.sh`)
- Gateway API release - `github.com/kubernetes-sigs/gateway-api` v1.7.0 (`install_dependencies.sh`)
- `https://github.com/trueforge-org/renovate-config` - shared Renovate preset (`.github/renovate.json5`)
- `https://github.com/trueforge-org/.github` - organisation security policy and PR template (referenced from `AGENTS.md`, not consumed by tooling)

**Dependency and automation services:**
- Renovate - automated dependency updates for image tags/digests, `common` versions and `# renovate:` annotated chart/version pins (`.github/renovate.json5`, `.github/scripts/install_dependencies.sh`). Routine bumps are handled by Renovate, not by hand (AGENTS.md).
- GitGuardian - secret scanning in CI (referenced in AGENTS.md; no workflow file was inspected for its configuration)
- CLA assistant - Contributor License Agreement check, `license/cla` status on PRs (`https://cla-assistant.io/trueforge-org/truecharts`, AGENTS.md)
- Artifact Hub - chart metadata annotations (`artifacthub.io/category`, `artifacthub.io/license`, `artifacthub.io/links` in `charts/library/common/Chart.yaml`)

**Documentation and support links (static, no API calls):**
- `https://truecharts.org`, `https://trueforge.org/truecharts-common` (published docs), `https://discord.com/invite/tVsPTHWTtr` (support), `https://trueforge.org/sponsor`
- Upstream reference docs: `https://cloudnative-pg.io/documentation/current/`, `https://gateway-api.sigs.k8s.io/reference/spec/`, `https://external-secrets.io/latest/api/externalsecret/`

## Kubernetes API Surface Rendered by `common`

The library renders resources for these API groups. They are cluster-side integrations, enabled per chart values. Capability lookup is in `charts/library/common/templates/lib/_tc_capabilities.tpl`.

| API group | Resources | Library location |
| --- | --- | --- |
| `gateway.networking.k8s.io` | Gateway, GatewayClass, HTTPRoute, ListenerSet | `templates/class/_gateway.tpl`, `_gatewayclass.tpl`, `_route.tpl`, `_listenerSet.tpl` |
| `traefik.io` | IngressRoute, Middleware | `templates/values/` ingress and `ingressMiddlewares` (`charts/library/common/values.yaml` line ~329), `templates/lib/ingress/` |
| `cert-manager.io` | Certificate | `templates/class/cert-manager/`, `templates/lib/certificate/` |
| `external-secrets.io` | ExternalSecret | `templates/class/_externalSecret.tpl`, `templates/lib/externalSecret/` |
| `postgresql.cnpg.io` | Cluster (CloudNativePG) | `templates/class/cnpg/`, `templates/lib/cnpg/`, `dependencies.postgresql` operator mode |
| `valkey.io` | ValkeyCluster | `templates/class/valkey/`, `dependencies.valkey` operator mode |
| `volsync.backube` | ReplicationSource and related | `templates/class/volsync/` |
| `snapshot.storage.k8s.io` | VolumeSnapshot, VolumeSnapshotClass | `templates/class/_volumeSnapshot*.tpl` |
| `monitoring.coreos.com` | ServiceMonitor, PodMonitor | `templates/class/metrics/`, `metrics` values |
| `cilium.io` | CiliumNetworkPolicy | `templates/class/_ciliumNetworkPolicy.tpl`, `networkpolicy` values |
| `k8s.cni.cncf.io` | NetworkAttachmentDefinition (Multus) | `templates/class/_networkAttachmentDefinition.tpl` |
| `metallb.io` | MetalLB address and advertisement resources | Only referenced by service-related values; `templates/lib/service/` (no dedicated class template confirmed) |
| `gateway.envoyproxy.io` | EnvoyPatchPolicy | `templates/class/_envoyPolicy.tpl` |
| `autoscaling` | HorizontalPodAutoscaler, VPA | `templates/class/_horizontalPodAutoscaler.tpl`, `_verticalPodAutoscaler.tpl` |
| `admissionregistration.k8s.io` | Mutating and ValidatingWebhookConfiguration | `templates/class/_mutatingWebhookConfiguration.tpl`, `_validatingWebhookConfiguration.tpl` |

Some groups (e.g. `cilium.io`, `metallb.io`, `gateway.envoyproxy.io`) are only referenced by specific values; they are not rendered by default.

## Dependency Services (provided in-cluster, not external SaaS)

The `dependencies.<name>` system in `charts/library/common/values.yaml` (line ~1672) provisions these services for charts, see `charts/library/common/docs/dependencies.md`:

- **Valkey** (Redis-compatible): `dependencies.valkey`; standalone or `ValkeyCluster` operator mode; images `valkeyImage`, `valkeyClientImage`, `valkeyExporterImage`; credentials Secret `<release>-valkeycreds` (key `valkey-password`)
- **MariaDB**: `dependencies.mariadb`; standalone; images `mariadbImage`, `mariadbClientImage`; Secret `<release>-mariadbcreds` (key `mariadb-password`)
- **PostgreSQL** (CloudNativePG): `dependencies.postgresql`; default `mode: operator` (CNPG `Cluster`), or `standalone`; images `postgres15Image`..`postgres18Image`, `postgresPostgis*`, `postgresVectors*`, `postgresVectorchord*`; Secret `<release>-postgresqlcreds` (key `postgresql-password`)
- Injector code: `charts/library/common/templates/lib/dependencies/` (`_valkeyInjector.tpl`, `_mariadbInjector.tpl`, `_postgresqlInjector.tpl`)
- Top-level `redis`, `valkey`, `mariadb`, `cnpg` keys fail when enabled; `solr`, `mongodb`, `clickhouse`, `memcached` are removed and fail when enabled (`charts/library/common/templates/values/_deprecations.tpl`)

**Addon and sidecar images (external network services used by containers):**
- Tailscale - `tailscaleImage` (`oci.trueforge.org/containerforge/tailscale`), addon template `charts/library/common/templates/addons/_tailscale.tpl`
- Gluetun (VPN gateway) - `gluetunImage`, addon `addons/_gluetun.tpl`
- code-server, netshoot, kubectl, ubuntu - `addons/_codeserver.tpl`, `addons/_netshoot.tpl`, `kubectlImage`, `ubuntuImage`

## Data Storage

**Databases:**
- No database is used by the repository tooling itself. Charts provision databases in-cluster through `dependencies.*` (see above).
- Application charts can connect to PostgreSQL, MariaDB and Valkey through `secretKeyRef` to the injected `<release>-*creds` Secrets. Host and port values come from `.Values.dependencies.<name>.depconfig.creds`.

**File Storage:**
- Persistent volumes via `persistence` values in `charts/library/common/values.yaml` (line ~364): PVC and PersistentVolume objects rendered by `templates/class/_pvc.tpl` and `_persistentVolume.tpl`
- Snapshots: `volumeSnapshots`, `volumeSnapshotClass` (`templates/class/_volumeSnapshot*.tpl`)
- Backup and replication: VolSync integration (`templates/class/volsync/`)

**Caching:**
- Valkey (see above) is the cache option offered to charts. No other external cache is integrated.

## Authentication & Identity

**Auth Provider:**
- None in the repository itself. Application charts configure their own auth.
- `common` stores credentials in Kubernetes Secrets:
  - Generated secrets reuse existing data via `lookup` and fall back to random values on first install (AGENTS.md security rules)
  - `externalSecret` (`charts/library/common/values.yaml` line ~568) loads secrets from an external store through the `external-secrets.io` ExternalSecret API
- Service accounts: `serviceAccount: {}` and `rbac: {}` (line ~618-621); `automountServiceAccountToken` defaults to `false`
- Pod identity: UID/GID `568`, see `securityContext` in `charts/library/common/values.yaml` (line ~101)

## Monitoring & Observability

**Error Tracking:**
- None detected

**Metrics:**
- `metrics` values (`charts/library/common/values.yaml` line ~1417) create ServiceMonitor or PodMonitor resources for the `monitoring.coreos.com` API. Prometheus is provided by the cluster (CI installs `kube-prometheus-stack` 82.0.0 in `install_dependencies.sh`).
- Metrics exporters: `valkeyExporterImage`, and `redis-exporter` image listed in `common` values

**Logs:**
- Container stdout/stderr; no log shipping integration in the repository

**Notes and diagnostics:**
- `notes` values and `templates/lib/chart/` render NOTES.txt; credentials are shown only when `notes.showCredentials` is enabled (default `false`)
- `diagnosticMode` (`charts/library/common/values.yaml` line ~211) for debugging workloads

## CI/CD & Deployment

**Hosting / Distribution:**
- Chart source and releases: GitHub `trueforge-org/truecharts` (this repository), with chart-releaser publishing to the `truecharts/charts` repository (`cr.yaml`)
- Helm OCI registry: `oci://oci.trueforge.org/truecharts` for `common` and other chart dependencies
- Docs: `https://trueforge.org/truecharts-common`, `https://truecharts.org`

**CI Pipeline:**
- GitHub Actions (`.github/workflows/`):
  - `charts-lint.yaml` - lint with `tc-lint.sh`, `go-yq` v4.26.1
  - `charts-test.yaml` - `ct install` of changed charts on k3d (config `.github/ct-install.yaml`, `excluded-charts` list)
  - `common-tests.yaml` - helm-unittest (pinned `helmUnitVersion: 1.0.3`), schema validation, install matrix across Helm v3.14.0, v3.20.0, v4.1.0 and k3s v1.33, v1.34, v1.35
  - `charts-release.yaml` - Helm v4.3.1 packaging and release with `cr`, GPG signing, Quay login
  - `daily.yaml` - forgetool metadata and README regeneration, icon conversion
  - `pr-validate.yaml`, `automerge.yaml`, `schedule-sync-labels.yaml`, `stale.yaml` - PR automation
- Pre-commit hooks via `.pre-commit-config.yaml`

## Environment Configuration

**Required env vars for local tooling (from `run_common_tests.sh`, `tc-lint.sh`):**
- `UPDATE_TOOLS`, `UNITTEST_FILES`, `SKIP_SCHEMA_TESTS`, `SCHEMA_MAX_FAILURES`, `HELM_INSTALL_DIR`, `USE_SUDO`
- `result_file` for `.github/scripts/tc-lint.sh`

**Required CI secrets (names only; values are never recorded here):**
- `QUAY_USER`, `QUAY_SECRET` - Quay registry login in `.github/workflows/charts-release.yaml`
- GitHub token and any GPG signing key material used by `cr` (`cr.yaml`, `sign: true`, key identity `info@truecharts.org`)

**Secrets location:**
- GitHub Actions repository secrets. No secret files are stored in this repository. `.env*`, `*.pem`, `*.key` and similar files are excluded by policy and were not read.

## Webhooks & Callbacks

**Incoming:**
- GitHub webhooks drive the workflows (`pull_request`, `push`, `schedule`, `workflow_dispatch`, `issue` events). No application webhook endpoints are exposed by this repository.
- Application charts may define `webhook` values for admission webhooks (`charts/library/common/values.yaml` line ~1269), rendering `MutatingWebhookConfiguration` and `ValidatingWebhookConfiguration`.

**Outgoing:**
- None detected in repository tooling beyond the registry, GitHub API and release downloads listed above

---

*Integration audit: 2026-11-04*
