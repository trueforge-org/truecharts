# Copilot instructions for TrueCharts

This is a condensed summary. The full, canonical instructions are in [`AGENTS.md`](../AGENTS.md). Area-specific rules are in [`.github/instructions/charts.instructions.md`](instructions/charts.instructions.md) for app charts and [`.github/instructions/common-library.instructions.md`](instructions/common-library.instructions.md) for the `common` library. Keep this file in sync with them.

## Repository

- This repository contains Helm charts under `charts/`:
  - `charts/stable/<chart>` and `charts/incubator/<chart>`: ~800 app charts
  - `charts/library/common`: the shared library chart (`tc.v1.common.*` templates)
  - `charts/library/common-test`: the library's helm-unittest harness
- App charts are thin wrappers: `templates/common.yaml` includes `tc.v1.common.loader.all`, and all configuration lives in `values.yaml` using keys that `common` understands.

## Rules

- Keep changes minimal and scoped to the requested chart or library component.
- When changing chart files (other than files in the chart's `docs/` folder), bump that chart's `version` in its `Chart.yaml`. CI fails without the bump. Use SemVer:
  - **major** for breaking changes (`BREAKING CHANGE(<chart>): ...`)
  - **minor** for features or minor app upgrades (`feat(<chart>): ...`)
  - **patch** for fixes, patch upgrades and digests (`fix(<chart>): ...` / `chore(<chart>): ...`)
- Don't manually alter chart READMEs, changelogs, `.helmignore` or icons; they are generated.
- Don't hand-edit the `Chart.yaml` fields managed by `forgetool`: helm/kube version annotations, `kubeVersion`, `maintainers`, `home`, `icon`, `sources` and `appVersion`.
- Pin images as `tag: <version>@sha256:<digest>`. Renovate handles image, digest and `common` dependency updates.
- `common` (`oci://oci.trueforge.org/truecharts`) is the only chart dependency. Databases and caches use `cnpg` (PostgreSQL) or `dependencies.valkey` / `dependencies.mariadb` in `values.yaml`, not Helm subcharts. Don't commit `charts/` dependency folders, `Chart.lock` or `__snapshot__/`.
- Chart values must be valid for the `common` values schema (`charts/library/common/values.schema.json`).
- No default passwords; user data must be stored on persistent volumes.
- Security:
  - Never commit secrets, tokens, private keys or real credentials.
  - Give credentials to containers with `secretKeyRef` to a Secret, never as plain `env` values or in ConfigMaps, and don't print them in notes or logs.
  - Keep the "restricted" Pod Security defaults of `common` (UID/GID 568, read-only root filesystem, no privilege escalation, all capabilities dropped). Relax them only when the app needs it, as little as possible, with a comment explaining why.
  - Report vulnerabilities privately to <info@truecharts.org>, not in public issues or PRs.
- When editing `charts/library/common`:
  - also update the Helm unit tests in `charts/library/common-test/tests`
  - update the JSON schema in `schemas/` for every added, changed or removed key, and fail on removed keys in `templates/values/_deprecations.tpl`
  - don't edit the generated `docs/` pages (except `docs/dependencies.md`); change the schema or `examples/` and run `generate_docs.py`, and regenerate `complete-values-structure.yaml` and `template-keys-structure.yaml`
  - keep the CI path in the `$id` of `values.schema.json`
  - bump `common`'s version, but never `common-test`'s
  - keep it compatible with Helm 3.14+ and Kubernetes 1.33+

## Tooling and validation

- Use the latest Helm 4 release and the latest helm-unittest plugin, never an older version. On Helm 4, install the plugin with `helm plugin install https://github.com/helm-unittest/helm-unittest --verify=false`.
- Run `pre-commit` on your changes before finalizing.
- For app charts:
  - `helm dependency build`, `helm lint --strict` and `helm template` on the chart
  - `result_file=/tmp/lint_result.txt .github/scripts/tc-lint.sh '["charts/stable/<chart>"]' origin/master`
- For common library changes, run `./run_common_tests.sh`. It installs Helm and helm-unittest when missing (always the latest), runs the unit tests in a scratch copy, then runs the schema checks. `UNITTEST_FILES='tests/<area>/*.yaml' SKIP_SCHEMA_TESTS=1` runs a single area.
- Use conventional-commit PR titles with the chart name as the scope, e.g. `fix(plex): ...`, and target `master`.
- Tell the user that contributions need a signed [Contributor License Agreement](https://cla-assistant.io/trueforge-org/truecharts), which only they can sign. The `license/cla` check on the PR shows the status.
- Fill in the [organization's PR template](https://github.com/trueforge-org/.github/blob/main/.github/PULL_REQUEST_TEMPLATE.md), and add the notice `🤖 This PR is AI generated.` to its Notes section when an AI agent wrote the PR. Use it instead of a "Generated with ..." line.
