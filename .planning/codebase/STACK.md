---
last_mapped_commit: c71e810c627cb23e4bddb4199aa83deec403ab70
last_mapped_at: 2026-11-04
---
# Technology Stack

**Analysis Date:** 2026-11-04

## Languages

**Primary:**
- YAML - Helm chart metadata and values: `charts/stable/*/Chart.yaml`, `charts/stable/*/values.yaml`, `charts/library/common/values.yaml`, `charts/library/common-test/tests/**/*_test.yaml`, CI in `.github/workflows/*.yaml`
- Go template (Helm/Sprig) - All library logic: `charts/library/common/templates/**/*.tpl`, chart entry points `charts/stable/*/templates/common.yaml`

**Secondary:**
- JSON - Values schema: `charts/library/common/values.schema.source.json`, `charts/library/common/schemas/**/*.json`, bundled `charts/library/common/values.schema.json` (generated)
- Python 3 - Schema, docs and structure generators and checks in `charts/library/common/*.py` (uses `yaml` (PyYAML), `json`, `subprocess`, `argparse`, `tempfile`)
- Bash - CI and local tooling: `run_common_tests.sh`, `.github/scripts/tc-lint.sh`, `.github/scripts/add_chart_schema.sh`, `.github/scripts/cr.sh`, `.github/scripts/prep_helm.sh`, `.github/scripts/install_dependencies.sh`
- Markdown - Chart `README.md` (generated), `docs/*.md`, `charts/library/common/docs/**`
- Go - `forgetool` (generator, installed from release binaries in `.github/workflows/daily.yaml`; not vendored in this repository)

## Runtime

**Environment:**
- Kubernetes: `kubeVersion: '>=1.33.0-0'` in `charts/library/common/Chart.yaml` (CI installs on k3s v1.33, v1.34, v1.35 via k3d)
- Helm: supported floor Helm 3.14 (`trueforge.org/min_helm_version: "3.14"`), max annotation `4.1`. Latest Helm 4 is the development target (AGENTS.md: v4.3.1). CI matrix in `.github/workflows/common-tests.yaml` uses Helm v3.14.0, v3.20.0, v4.1.0.
- Dev container: `oci.trueforge.org/containerforge/devcontainer:4.1.1@sha256:...` declared in `.devcontainer/devcontainer.json`
- Python 3: CI uses `python-version: "3.10"` and `"3.11"` (`.github/workflows/*.yaml`); local tooling needs PyYAML and ruamel.yaml

**Package Manager:**
- Helm dependency manager (`helm dependency build`) for chart dependencies; the only dependency is `common` from `oci://oci.trueforge.org/truecharts`
- pip for Python tooling (`pip install pre-commit yamllint yamale PyYAML ruamel.yaml`)
- Lockfile: Helm `Chart.lock` files are generated and never committed. No Python lockfile detected (no `requirements.txt` at repo root).
- Renovate manages version updates (`.github/renovate.json5` extends `github>trueforge-org/renovate-config`)

## Frameworks and Tooling

**Core:**
- Helm chart library pattern - `common` (`type: library`, version `31.0.0`, appVersion `1.12.0`) at `charts/library/common/Chart.yaml`. Every application chart depends on it. Template entry points: `tc.v1.common.loader.{init,apply,all}` in `charts/library/common/templates/loader/`.
- Application charts - ~807 charts in `charts/stable/` (about 807 `Chart.yaml` files counted) and `charts/incubator/` (1 chart)
- helm-unittest plugin - unit tests for `common`: `charts/library/common-test/tests/`. CI pins `helmUnitVersion: 1.0.3` (`.github/workflows/common-tests.yaml`); AGENTS.md recommends latest (v1.2.1 at time of writing).
- JSON Schema draft-07 - values validation, source `charts/library/common/values.schema.source.json`
- chart-testing (`ct`) via `helm/chart-testing-action` v2.9.0 - install tests (`.github/workflows/charts-test.yaml`, `.github/workflows/common-tests.yaml`), config in `.github/ct-install.yaml`

**Testing:**
- helm-unittest - `charts/library/common-test/tests/**`, run via `run_common_tests.sh` or `helm unittest`
- Python schema checks - `charts/library/common/test_schema.py` (runs `helm lint` against ~850 values files, per AGENTS.md) and `charts/library/common/check_complete_values_schema_coverage.py`
- k3d/k3s clusters for install tests via `nolar/setup-k3d-k3s` v1.1.0 (`.github/workflows/common-tests.yaml`)

**Build/Dev:**
- Helm 4 CLI - `helm lint --strict`, `helm template`, `helm package` (`.github/workflows/charts-release.yaml`, pinned via `azure/setup-helm` v5 with `version: v4.3.1`)
- `forgetool` (trueforge-org/forgetool, Go) - generates chart `README.md`, `.helmignore`, `genmeta` for `Chart.yaml` annotations; downloaded from GitHub releases in `.github/workflows/daily.yaml`
- `cr` (Helm chart-releaser, `helm/chart-releaser`) - packages and publishes charts with GPG signing; configured in `cr.yaml` (`owner: truecharts`, `repo: charts`, `sign: true`); wrapper `.github/scripts/cr.sh`
- pre-commit - hooks in `.pre-commit-config.yaml`: `Lucas-C/pre-commit-hooks` v1.5.5, `pre-commit/pre-commit-hooks` v5.0.0, `pre-commit/pygrep-hooks` v1.10.0 and others (whitespace, EOF, YAML syntax, private-key detection)
- yamllint - config `.github/yaml-lint-conf.yaml`, used by `.github/scripts/tc-lint.sh`
- yamale - `Chart.yaml` schema check, schema at `.github/chart_schema.yaml`
- GNU `parallel`, `jq`, `go-yq` v4.26.1 (`mikefarah/yq`) - CI lint tooling (`.github/workflows/charts-lint.yaml`)
- markdownlint - config `.markdownlint.yaml` (run manually; no hook or CI job)
- Editor/devcontainer: `.devcontainer/devcontainer.json`, `.editorconfig`, `.vscode/`

**Helm chart dependencies (per chart):**
- Only `common`, declared as `dependencies:` in each app `Chart.yaml`. Helm subcharts such as valkey, redis or mariadb are not used (`charts/library/common/values.yaml` `dependencies.*` replaces them).
- `common-test` depends on `common` via `repository: file://../common/` (`charts/library/common-test/Chart.yaml`). This is the only `file://` dependency.

## Key Dependencies

**Critical (library-level, rendered by `common`):**
- `oci.trueforge.org/containerforge/valkey` and `valkey-tools`, `valkey-exporter` (`valkeyImage`, `valkeyClientImage`, `valkeyExporterImage` in `charts/library/common/values.yaml`) - Valkey for `dependencies.valkey`
- `oci.trueforge.org/containerforge/mariadb` and `mariadb-client` (`mariadbImage`, `mariadbClientImage`) - MariaDB for `dependencies.mariadb`
- `ghcr.io/cloudnative-pg/postgresql` (`postgres15Image` .. `postgres18Image`), `ghcr.io/cloudnative-pg/postgis`, `ghcr.io/tensorchord/cloudnative-pgvecto.rs`, `ghcr.io/tensorchord/cloudnative-vectorchord` - PostgreSQL images for `dependencies.postgresql`, with CloudNativePG (CNPG) operator mode
- `oci.trueforge.org/containerforge/tailscale` (`tailscaleImage`), `gluetun` (`gluetunImage`), `code-server` (`codeserverImage`), `netshoot` (`netshootImage`), `kubectl` (`kubectlImage`), `ubuntu` (`ubuntuImage`) - addon and utility images
- `oci.trueforge.org/containerforge/clickhouse`, `mongodb`, `mongosh`, `memcache`, `redis-exporter` - images still listed in `charts/library/common/values.yaml`; their dependency options are not active (see Configuration)

**Critical (CI and release):**
- `helm` v4.3.1 (`azure/setup-helm` v5) - lint, install, release
- `helm/chart-testing-action` v2.9.0 (`ct`) - install tests
- `helm/chart-releaser` (`cr`) - releases via GitHub Releases and GPG signing
- `trueforge-org/forgetool` - metadata and README generation (daily workflow)
- `cloudnative-pg` chart `0.27.1`, `snapshot-controller` `4.15.0`, `volsync` `3.15.16`, `metrics-server` `3.13.0`, `kube-prometheus-stack` `82.0.0`, `metallb` `0.15.3`, `cert-manager` `v1.19.3`, `ingress-nginx` `v4.15.1`, `valkey-operator` `0.8.0`, Gateway API `v1.7.0` - pinned in `.github/scripts/install_dependencies.sh` for CI cluster setup (Renovate-managed comments)

**Infrastructure (Kubernetes API groups rendered by `common`):**
- Core `apps`, `batch`, `networking.k8s.io`, `autoscaling`, `policy`, `rbac`, `scheduling`, `storage.k8s.io`
- `gateway.networking.k8s.io` (Gateway, HTTPRoute, ListenerSet, GatewayClass) - `charts/library/common/templates/class/_gateway.tpl`, `_route.tpl`, `_listenerSet.tpl`
- `traefik.io` (IngressRoute, Middleware) - `charts/library/common/templates/lib/`, `class/traefik`
- `cert-manager.io` (Certificate, Issuer) - `charts/library/common/templates/class/_certificate*` and `cert-manager/`
- `postgresql.cnpg.io` (Cluster), `valkey.io` (ValkeyCluster) - operator-mode dependencies
- `volsync.backube` (ReplicationSource/Destination), `snapshot.storage.k8s.io` (VolumeSnapshot, VolumeSnapshotClass)
- `monitoring.coreos.com` (ServiceMonitor, PodMonitor) - `charts/library/common/templates/class/` metrics
- `external-secrets.io` (ExternalSecret) - `class/_externalSecret.tpl`
- `cilium.io` (CiliumNetworkPolicy), `k8s.cni.cncf.io` (NetworkAttachmentDefinition), `metallb.io`, `gateway.envoyproxy.io` (EnvoyPatchPolicy)
- Full capability map is in `charts/library/common/templates/lib/_tc_capabilities.tpl` (`tc.v1.common.capabilities.*`)

**Application image sources (values in `charts/stable/*/values.yaml`, approximate counts of `repository:` prefixes):**
- `ghcr.io/linuxserver` (~66) and `lscr.io/linuxserver` (~54), `ghcr.io/ich777` (~72), `oci.trueforge.org/containerforge` (~45), `ghcr.io/itzg` (~16), `ghcr.io/jlesage` (~12), `ghcr.io/m1k1o/neko` (~10), `docker.io/localai` (~9), `quay.io/jupyter` (~8)
- Policy from `AGENTS.md`: pin every image by digest (`tag: <version>@sha256:<digest>`), prefer TrueForge or official images. Check each chart before copying an image reference; not every existing chart value is pinned by digest.

## Configuration

**Environment:**
- Charts are configured through `values.yaml` and Helm `--set`/`-f` values. Root keys are defined by `charts/library/common/values.yaml` (e.g. `image`, `workload`, `service`, `persistence`, `ingress`, `gateway`, `dependencies`, `addons`, `networkpolicy`, `metrics`, `notes`).
- Schema: `# yaml-language-server: $schema=./values.schema.json` is the first line of every chart `values.yaml`. The `values.schema.json` in a chart is copied from `common` at release/lint time (`.github/scripts/add_chart_schema.sh`), not committed.
- Dependency settings: `dependencies.<name>` with `mode` (`standalone` or `operator`), injectors in `charts/library/common/templates/lib/dependencies/`.
- Secrets are not read from environment files by this repository. The `.env*` files are forbidden to read; CI secrets are referenced by name only (e.g. `QUAY_USER`, `QUAY_SECRET` in `.github/workflows/charts-release.yaml`).
- Environment variables for local tooling: `UPDATE_TOOLS`, `UNITTEST_FILES`, `SKIP_SCHEMA_TESTS`, `SCHEMA_MAX_FAILURES`, `HELM_INSTALL_DIR`, `USE_SUDO` (read by `run_common_tests.sh`); `result_file` for `tc-lint.sh`.
- `.devcontainer/devcontainer.json` bind-mounts `~/.claude` to `/config/.claude` and sets `CLAUDE_CONFIG_DIR=/config/.claude`.

**Build and lint:**
- `.pre-commit-config.yaml` - repository hooks
- `.editorconfig` - 2-space YAML indentation, final newline
- `.github/yaml-lint-conf.yaml`, `.github/lint-conf.yaml`, `.github/ct-lint.yaml`, `.github/ct-install.yaml` (chart-testing config, `excluded-charts` list)
- `.markdownlint.yaml` - Markdown lint rules
- `.github/chart_schema.yaml` - Chart.yaml schema for `tc-lint.sh`
- `cr.yaml` - chart-releaser config
- `.helmdocsignore`, `templates/helmignore.tpl` (written to each chart's `.helmignore` by forgetool)
- `templates/README.md.tpl`, `templates/CHANGELOG.md.tpl` - forgetool templates

**Renovate:**
- `.github/renovate.json5` extends `config:recommended`, `github>trueforge-org/renovate-config` and its `autoMergeLabels.json5`. Renovate updates image tags/digests, `common` versions and the `# renovate:` annotated versions in `.github/scripts/install_dependencies.sh` and workflows.

## Platform Requirements

**Development:**
- Linux or macOS with Bash, Git, Python 3 (PyYAML, ruamel.yaml), Helm 4 (latest, `.github/workflows` pin v4.3.1), helm-unittest plugin (`helm plugin install https://github.com/helm-unittest/helm-unittest --verify=false` on Helm 4)
- Optional: Docker or a devcontainer (`oci.trueforge.org/containerforge/devcontainer`)
- For install tests: k3d with k3s v1.33 to v1.35
- Tools needed by `tc-lint.sh`: `helm`, `yamllint`, `yamale`, GNU `parallel`, `jq`, `go-yq`

**Production / distribution:**
- Charts published as Helm charts to OCI registry `oci://oci.trueforge.org/truecharts` (dependency source), and as chart-releaser GitHub Releases with GPG-signed packages in repo `truecharts/charts`. Helm login also targets `quay.io` in `.github/workflows/charts-release.yaml`.
- Target runtime: any Kubernetes cluster with `>=1.33`. Catalog metadata uses the `trueforge.org/*` and `truecharts.org/*` annotations in `Chart.yaml`.
- Documentation site: `https://truecharts.org` and `https://trueforge.org/truecharts-common` (generated from `charts/library/common/docs/`).

---

*Stack analysis: 2026-11-04*
