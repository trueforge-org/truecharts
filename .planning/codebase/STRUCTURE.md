---
last_mapped_commit: c71e810c627cb23e4bddb4199aa83deec403ab70
last_mapped_at: 2026-11-04
---
# Codebase Structure

**Analysis Date:** 2026-11-04

## Directory Layout

```
truecharts/                              # repository root
├── charts/                              # every chart lives under a train directory
│   ├── stable/                          # ~807 application charts (one dir per chart)
│   ├── incubator/                       # application charts not yet stable (1 chart)
│   └── library/
│       ├── common/                      # the `common` library chart (type: library)
│       └── common-test/                 # helm-unittest harness and install-test values for common
├── templates/                           # forgetool templates for generated chart READMEs
├── .github/
│   ├── workflows/                       # CI: lint, install, common tests, release, daily refresh
│   ├── scripts/                         # tc-lint.sh, cr.sh, add_chart_schema.sh, prep_helm.sh, install_dependencies.sh
│   ├── instructions/                    # scoped rules: charts.instructions.md, common-library.instructions.md
│   ├── ct-install.yaml                  # chart-testing config (excluded-charts)
│   ├── renovate.json5                   # Renovate config
│   └── yaml-lint-conf.yaml              # yamllint rules for charts
├── .devcontainer/                       # devcontainer definition
├── .planning/codebase/                  # GSD codebase maps (these documents)
├── AGENTS.md                            # canonical agent instructions
├── CLAUDE.md                            # imports AGENTS.md and scoped instructions
├── run_common_tests.sh                  # local runner: common unit tests + schema checks
├── cr.yaml                              # chart-releaser config
├── .markdownlint.yaml                   # Markdown lint rules
├── .pre-commit-config.yaml              # repository hooks
└── .editorconfig                        # 2-space YAML, final newline
```

## Directory Purposes

**`charts/stable/<chart>/`:**
- Purpose: Production application charts (one per app).
- Contains: `Chart.yaml`, `values.yaml`, `templates/common.yaml`, `templates/NOTES.txt`, optional `templates/_<name>.tpl`, optional `ci/*-values.yaml`, optional `docs/*.md`, generated `README.md`, `CHANGELOG.md`, `.helmignore`, `icon.webp`, `icon-small.webp`.
- Key files: `charts/stable/app-template/` (reference structure), `charts/stable/anonaddy/` (example of a custom helper template).

**`charts/incubator/<chart>/`:**
- Purpose: Application charts not yet promoted to stable; same layout as stable.

**`charts/library/common/`:**
- Purpose: Shared library implementing all rendering logic (`tc.v1.common.*`).
- Contains:
  - `Chart.yaml`, `values.yaml` (defaults for every chart), `values.schema.source.json` and `values.schema.json` (bundled schema).
  - `templates/`: `loader/`, `spawner/`, `class/`, `lib/`, `helpers/`, `values/`, `addons/` (see Key File Locations).
  - `schemas/`: JSON schema source split per key (e.g. `schemas/configmap.json`, `schemas/workload/`, `schemas/service/`, `schemas/dependencies/`, `schemas/special/`, `schemas/image.json`, `schemas/listener.json`).
  - `docs/`: published user docs (generated, except `docs/dependencies.md`), organised per key (e.g. `docs/configmap.md`, `docs/addons/`, `docs/dependencies/`).
  - `examples/`: `## Full Examples` sections for each docs page; mirrors `docs/` paths.
  - Generators and checks: `generate_bundled_schema.py`, `generate_docs.py`, `generate_complete_values_structure.py`, `generate_template_keys_structure.py`, `test_schema.py`, `check_complete_values_schema_coverage.py`, `improve_schemas.py`.
  - Structure files: `complete-values-structure.yaml`, `template-keys-structure.yaml`, `docs-structure.txt`, `docs-summary.txt`, `docs-schema-mapping.yaml`, `quick-reference.txt`.
  - Icons: `icon.webp`, `icon-small.webp` (generated).
  - `README.md`, `README.txt`: generated, do not edit.
- Note: `__pycache__/` appears in the working tree; it is a build artifact and must not be committed.

**`charts/library/common-test/`:**
- Purpose: Test harness for `common`.
- Contains: `Chart.yaml` (version stays `1.0.0`), `templates/common.yaml` (renders the loader), `values.yaml` (disables main workload/service), `unit-values.yaml`, `default-values.yaml`, `values.schema.json` (symlink to common's schema), `tests/<area>/*_test.yaml` (helm-unittest suites), `ci/<feature>-values.yaml` (install tests listed in `.github/workflows/common-tests.yaml`), `files/`.

**`charts/library/common/templates/loader/`:**
- Purpose: Entry points. `_all.tpl` (`tc.v1.common.loader.all`), `_init.tpl`, `_apply.tpl` (ordered spawner list; register new spawners here).

**`charts/library/common/templates/spawner/`:**
- Purpose: One file per values key that produces objects. Includes subfolders `traefik/` (middleware, serverstransport) and `cert-manager/`.

**`charts/library/common/templates/class/`:**
- Purpose: One file per Kubernetes kind. Subfolders: `cert-manager/`, `cnpg/`, `metrics/`, `traefik/`, `valkey/`, `volsync/`.

**`charts/library/common/templates/lib/`:**
- Purpose: Reusable building blocks grouped by area: `workload/` (pod and controller specs, `components/`, `validation/`), `container/`, `storage/`, `service/`, `ingress/`, `gateway/`, `route/`, `networkpolicy/`, `dependencies/`, `cnpg/`, `traefik/`, `volsync/`, `util/`, `metadata/`, `chart/`, `credentials/`, `secret/`, `configmap/`, `endpoint/`, `endpointSlice/`, `externalSecret/`, `hpa/`, `vpa/`, `rbac/`, `serviceAccount/`, `webhook/`, `imagePullSecret/`, `listenerSet/`, `podDistruptionBudget/`, `priorityClass/`, `certificate/`, `pod/`. Top-level `_tc_capabilities.tpl`.

**`charts/library/common/templates/values/`:**
- Purpose: values init (`_init.tpl`), validation (`_validate.tpl`), removed-key errors (`_deprecations.tpl`), dependency values (`_dependencies.tpl`, `_dependenciesAddons.tpl`).

**`charts/library/common/templates/helpers/`:**
- Purpose: Small shared helpers (`_envDupeCheck.tpl`, `_getPortRange.tpl`, `_getSelectedPod.tpl`, `_getSelectedService.tpl`, `_makeIntOrNoop.tpl`).

**`charts/library/common/templates/addons/`:**
- Purpose: Addon containers (`_codeserver.tpl`, `_gluetun.tpl`, `_netshoot.tpl`, `_tailscale.tpl`).

**`templates/` (repository root):**
- Purpose: Go/markdown templates used by `forgetool` to generate chart READMEs. Not a chart.

**`.github/scripts/`:**
- Purpose: CI helpers. `tc-lint.sh` (lint plus version check), `cr.sh` (chart-releaser release, copies schema), `add_chart_schema.sh` (copies common schema into a chart, not committed), `prep_helm.sh`, `install_dependencies.sh`.

**`.github/workflows/`:**
- Purpose: `charts-lint.yaml`, `charts-test.yaml`, `charts-release.yaml`, `common-tests.yaml`, `pr-validate.yaml`, `daily.yaml` (metadata refresh, icons, README regeneration), `automerge.yaml`, `stale.yaml`, `schedule-sync-labels.yaml`.

**`.devcontainer/`, `.vscode/`, `.qodo/`:**
- Purpose: Developer environment and tool configuration.

**`.planning/`:**
- Purpose: GSD planning and codebase analysis artifacts. `.planning/codebase/` holds these documents.

## Key File Locations

**Entry Points:**
- `charts/library/common/templates/loader/_all.tpl`: library entry point (`tc.v1.common.loader.all`).
- `charts/library/common/templates/loader/_apply.tpl`: spawner execution order.
- `charts/stable/<chart>/templates/common.yaml`: per-app entry point.

**Configuration:**
- `charts/library/common/values.yaml`: defaults for all charts.
- `charts/library/common/values.schema.source.json`: schema root.
- `charts/stable/<chart>/values.yaml`: per-chart overrides (first line `# yaml-language-server: $schema=./values.schema.json`).
- `charts/stable/<chart>/Chart.yaml`: chart metadata and `version` (bump on every non-docs change in a PR to master).
- `.github/renovate.json5`: dependency automation.

**Core Logic:**
- `charts/library/common/templates/spawner/`: object iteration per key.
- `charts/library/common/templates/class/`: object rendering.
- `charts/library/common/templates/lib/workload/`: pod and controller specs.
- `charts/library/common/templates/lib/dependencies/`: databases and caches.
- `charts/library/common/templates/values/_deprecations.tpl`: removed key errors.

**Schema:**
- `charts/library/common/schemas/`: per-key schema sources.
- `charts/library/common/values.schema.json`: bundled output, generated.

**Testing:**
- `charts/library/common-test/tests/`: helm-unittest suites per area (e.g. `tests/configmap/`, `tests/dependencies/`).
- `charts/library/common-test/ci/`: install-test values.
- `charts/library/common/test_schema.py`: schema checks against all stable values.
- `charts/library/common/check_complete_values_schema_coverage.py`: 100% coverage check of the structure files.

**Documentation:**
- `charts/library/common/docs/`: generated library docs (published at trueforge.org/truecharts-common).
- `charts/library/common/docs/dependencies.md`: handwritten dependency guide.
- `charts/library/common/examples/`: full examples.
- `AGENTS.md`, `.github/instructions/*.instructions.md`: contributor rules.

## Naming Conventions

**Files:**
- Library templates: `_<camelCaseKind>.tpl` (e.g. `_deployment.tpl`, `_externalSecret.tpl`, `_listenerSet.tpl`). Leading underscore marks Helm partials.
- Spawners: `spawner/_<key>.tpl`, named after the values key (e.g. `_configmapFromFolder.tpl`).
- Injectors: `_<name>Injector.tpl` (e.g. `_valkeyInjector.tpl`).
- Schema files: `schemas/<key>.json`, nested to mirror values paths (e.g. `schemas/workload/podSpec/containers/env.json`).
- Test suites: `tests/<area>/<name>_test.yaml`.
- CI values: `ci/<feature>-values.yaml`; app charts use `ci/*-values.yaml`.
- Docs: `docs/<key>.md`, mirrored by `examples/<key>.md`.
- Charts: directory name is the chart name, lowercase, used in `Chart.yaml` `name` and in commit scopes (e.g. `fix(plex): ...`).

**Template names:**
- `tc.v1.common.loader.*`, `tc.v1.common.spawner.<kind>`, `tc.v1.common.class.<kind>`, `tc.v1.common.lib.<area>.*`, `tc.v1.common.values.*`, `tc.v1.common.helper.*`, `tc.v1.common.addon.*`, `tc.v1.common.capabilities.*`, `tc.v1.common.dependencies.<name>.*`.
- Chart-specific helpers: `<chart>.<name>` in `templates/_<name>.tpl`.

**Directories:**
- Lowercase chart directories under `charts/<train>/`; no loose files directly in `charts/<train>/`.
- Library subfolders named by area (`lib/`, `class/`, `spawner/`), and kind-specific subfolders for vendor CRDs (`cnpg/`, `valkey/`, `traefik/`, `cert-manager/`, `volsync/`, `metrics/`).

## Where to Add New Code

**New application chart:**
- Copy the structure of `charts/stable/app-template/` into `charts/stable/<chart>/`.
- Primary files: `Chart.yaml`, `values.yaml`, `templates/common.yaml`, `templates/NOTES.txt`.
- Tests: `ci/<case>-values.yaml` if defaults are not enough.
- Docs: `charts/stable/<chart>/docs/*.md`.

**New feature for an existing app:**
- Values: `charts/stable/<chart>/values.yaml`.
- Custom helper (only if values are insufficient): `charts/stable/<chart>/templates/_<name>.tpl`.

**New library option (key under an existing object):**
- Default: `charts/library/common/values.yaml`.
- Schema: `charts/library/common/schemas/<key>.json`, then run `python3 charts/library/common/generate_bundled_schema.py`.
- Template: the relevant `templates/lib/<area>/` or `templates/class/_<kind>.tpl`.
- Validation: `templates/lib/<area>/validation/` or `templates/lib/<area>/_validation.tpl`.
- Unit tests: `charts/library/common-test/tests/<area>/<name>_test.yaml`.
- Docs and examples: `charts/library/common/examples/<page>.md`, then `python3 charts/library/common/generate_docs.py`.

**New Kubernetes kind in common:**
- Spawner: `charts/library/common/templates/spawner/_<kind>.tpl`.
- Class: `charts/library/common/templates/class/_<kind>.tpl`.
- Registration: `charts/library/common/templates/loader/_apply.tpl`.
- API version: `charts/library/common/templates/lib/_tc_capabilities.tpl`.
- Default (usually `{}`) in `values.yaml`, schema in `schemas/<kind>.json`, docs, and tests.

**New predefined dependency:**
- Defaults: `charts/library/common/values.yaml` under `dependencies.<name>`.
- Injector: `charts/library/common/templates/lib/dependencies/_<name>Injector.tpl`, wired in `templates/loader/_init.tpl`.
- Schema, docs section in `charts/library/common/docs/dependencies.md`, tests in `charts/library/common-test/tests/dependencies/`, install test `charts/library/common-test/ci/<name>-values.yaml`.

**New deprecation:**
- `charts/library/common/templates/values/_deprecations.tpl`, plus a `failedTemplate` test.

**Utilities:**
- Shared template helpers: `charts/library/common/templates/helpers/`.
- Shared schema parts: `charts/library/common/schemas/special/` (labels, annotations, labelSelector) and `schemas/image.json`.

## Special Directories

**`charts/<train>/<chart>/charts/`:**
- Purpose: Dependency tarballs from `helm dependency build`.
- Generated: Yes.
- Committed: No.

**`charts/<train>/<chart>/Chart.lock`:**
- Purpose: Helm dependency lock.
- Generated: Yes.
- Committed: No.

**`charts/library/common-test/charts/`, `Chart.lock`, `__snapshot__/`:**
- Purpose: Test build artifacts.
- Generated: Yes.
- Committed: No.

**`charts/library/common/__pycache__/`:**
- Purpose: Python bytecode from generator scripts.
- Generated: Yes.
- Committed: No.

**`charts/<train>/<chart>/README.md`, `CHANGELOG.md`, `.helmignore`, `icon*.webp`:**
- Purpose: Generated by `forgetool` and the daily workflow.
- Generated: Yes.
- Committed: Yes, but must not be hand-edited.

**`charts/library/common/docs/`, `complete-values-structure.yaml`, `template-keys-structure.yaml`:**
- Purpose: Generated documentation and structure lists (except `docs/dependencies.md`).
- Generated: Yes.
- Committed: Yes.

**`charts/<train>/<chart>/values.schema.json`:**
- Purpose: Copy of the common schema, added at release and lint time.
- Generated: Yes (by `.github/scripts/add_chart_schema.sh`).
- Committed: No.

---

*Structure analysis: 2026-11-04*
