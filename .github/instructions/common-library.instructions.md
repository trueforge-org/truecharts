---
applyTo: "charts/library/**"
description: "Rules for the TrueCharts common library chart and its common-test harness"
---

# Common library instructions

These rules apply to `charts/library/common/` (the `common` library chart that every TrueCharts app depends on) and `charts/library/common-test/` (its test harness). They add to the general rules in [`AGENTS.md`](../../AGENTS.md).

`common` is used by ~800 charts. Any change here affects all of them, so be conservative, keep backwards compatibility, and test thoroughly.

## The `common2026` rework

The next major version of `common` is developed on the `common2026` branch, and goes to `master` with [#41017](https://github.com/trueforge-org/truecharts/pull/41017). Remove this section once that is merged.

- Target `common2026` with work on the rework. Check which branch a task is for when it is not clear, as the two differ a lot.
- The database and cache rules in the chart instructions describe `master`. On `common2026`, these use `dependencies.<name>`, and the old top-level keys fail rendering. See `docs/dependencies.md` on that branch.
- `common2026` has a `values.schema.json` with `schemas/`, plus `complete-values-structure.yaml` and `template-keys-structure.yaml`. Keep them in sync with `values.yaml`, and run `check_complete_values_schema_coverage.py` from `charts/library/common`.
- All unit tests fail outside GitHub Actions on `common2026`, with `failing loading "file:///home/runner/work/truecharts/...`. The `$id` of `values.schema.json` holds the CI path, and has to stay that way. Run the tests in a scratch copy instead, and never commit the rewritten file:

  ```bash
  scratch="$(mktemp -d)"
  cp -r charts/library "$scratch/"
  sed -i "s#file:///home/runner/work/truecharts/truecharts/charts/library#file://$scratch/library#" "$scratch/library/common/values.schema.json"
  cd "$scratch/library/common-test"
  helm dependency update
  helm unittest -f "tests/**/*.yaml" . -v ./unit-values.yaml
  ```

## Layout and naming

| Path (`charts/library/common/`) | Template names | Purpose |
| --- | --- | --- |
| `templates/loader/` | `tc.v1.common.loader.{init,apply,all}` | Entry points. `apply` calls every spawner in order; register new spawners here. |
| `templates/spawner/_<kind>.tpl` | `tc.v1.common.spawner.<kind>` | Iterates over `.Values.<kind>`. It checks `lib.util.enabled`, `mustDeepCopy`s the object, expands names, validates, then calls the class. |
| `templates/class/_<kind>.tpl` | `tc.v1.common.class.<kind>` | Renders a single Kubernetes object. |
| `templates/lib/<area>/` | `tc.v1.common.lib.<area>.*` | Building blocks and per-area validation (`_validation.tpl`). |
| `templates/lib/_tc_capabilities.tpl` | `tc.v1.common.capabilities.*` | API versions for non-core resources. |
| `templates/helpers/` | `tc.v1.common.helper.*`, `tc.v1.common.lib.helpers.*` | Shared helpers. |
| `templates/values/` | `tc.v1.common.values.*` | Values initialisation and validation. |
| `templates/addons/` | `tc.v1.common.addon.*` | Addons (VPN, code-server, netshoot, etc.). |
| `values.yaml` | — | Defaults for every chart. Changing a default changes all charts. |
| `docs/` | — | User documentation, published at <https://trueforge.org/truecharts-common>. |

## Template conventions

- Start every `define` with the header comment block used throughout the library. It names the template, shows how to call it, and documents the expected parameters:

  ```gotemplate
  {{/* Configmap Class */}}
  {{/* Call this template:
  {{ include "tc.v1.common.class.configmap" (dict "rootCtx" $ "objectData" $objectData) }}

  rootCtx: The root context of the chart.
  objectData:
    name: The name of the configmap.
  */}}
  ```

- Pass context as `dict "rootCtx" $ "objectData" $objectData` (plus `"caller"` where relevant). Do not rely on `.` being the root context inside helpers.
- Render user-provided strings with `tpl` against `$rootCtx` wherever the docs say the key supports Helm `tpl`.
- Do not change the objects of `.Values` in place inside spawners. Work on `mustDeepCopy` copies, and use the `must*` sprig functions (`mustMerge`, `mustDeepCopy`, `mustToJson`, ...) so that errors fail loudly.
- Validate input and fail with clear messages in the existing format: `"<Caller> - Expected [<key>] to be <expectation>, but got [%v]"`, e.g. `fail (printf "ConfigMap - Expected [data] to be a dictionary, but got [%v]" (kindOf $objectData.data))`.
- Keep whitespace control (`{{-` / `-}}`) consistent so the rendered YAML has no stray blank lines.
- New object kinds need these pieces:
  - a spawner, a class, validation and a `capabilities` apiVersion if the kind is not core
  - an entry in `loader/_apply.tpl`
  - a default (usually `{}`) in `values.yaml`
  - docs and tests

## Compatibility

- **Helm**: supports Helm **3.14** up to the latest Helm 4. The CI `common-tests.yaml` matrix lints, unit-tests and installs `common-test` with Helm v3.14.0, v3.20.0 and v4.1.0. Develop and test locally with the **latest** Helm 4 and helm-unittest (see `AGENTS.md` → Toolchain). Do not use template functions that are missing in Helm 3.14.
- **Kubernetes**: `kubeVersion: '>=1.33.0-0'`; CI installs on k3s v1.33, v1.34 and v1.35.
- **Backwards compatibility**: existing values keys, defaults, object names, labels and selectors must keep working. Renaming or removing keys, or changing generated names/selectors, is a **breaking change**: it needs a major `common` version bump and must be called out in the PR.

## Change checklist

1. Bump `version` in `charts/library/common/Chart.yaml` following the SemVer rules in `AGENTS.md`: patch for fixes, minor for new features or options, major for breaking changes. **Do not bump `charts/library/common-test`**, which stays at `1.0.0` and depends on `common` via `file://../common/`.
2. Add or update helm-unittest suites in `charts/library/common-test/tests/<area>/*_test.yaml`. Cover both the happy path and the validation (`failedTemplate`) paths.
3. Update `charts/library/common/values.yaml` if you add or change defaults. Keep the existing comment style.
4. Update the docs in `charts/library/common/docs/**`. Each key uses the existing table format (Key / Type / Required / Helm `tpl` / Default) followed by an example. Add new keys to the "Full Examples" section where one exists.
5. If the change should be install-tested, add or update `charts/library/common-test/ci/<feature>-values.yaml` and add it to the `install` matrix in `.github/workflows/common-tests.yaml` (only files listed there are installed). During install CI, that file **replaces** `common-test/values.yaml`, so it must be self-contained.
6. Do not update the `common` version in app charts in the same PR. After release, Renovate bumps all charts (`fix(helm-deps): update chart common ...`).

## Unit tests

Tests use [helm-unittest](https://github.com/helm-unittest/helm-unittest) and render `common-test/templates/common.yaml`. Note that `common-test/values.yaml` **disables the `main` workload and service**, so tests must define their own objects with other names (e.g. `my-workload`, `my-service`):

```yaml
suite: configmap data test
templates:
  - common.yaml
release:
  name: test-release-name
  namespace: test-release-namespace
tests:
  - it: should pass with data
    set:
      configmap:
        my-configmap:
          enabled: true
          data:
            foo: bar
    asserts:
      - documentIndex: &configmapDoc 0
        isKind:
          of: ConfigMap
      - documentIndex: *configmapDoc
        equal:
          path: data
          value:
            foo: bar

  - it: should fail with empty data
    set:
      configmap:
        my-configmap:
          enabled: true
          data: {}
    asserts:
      - failedTemplate:
          errorMessage: ConfigMap - Expected non-empty [data]
```

Run the tests from the repository root with the latest Helm 4 and helm-unittest:

```bash
# Full suite (what CI runs). Builds the common dependency, runs all tests and cleans up.
./run_common_tests.sh

# Or manually, e.g. a single suite while iterating:
cd charts/library/common-test
helm dependency update
helm unittest -f "tests/configmap/*_test.yaml" . -v ./unit-values.yaml
rm -rf charts Chart.lock && find tests -name __snapshot__ -type d -exec rm -r {} +
```

Also lint and render the harness:

```bash
helm lint --strict charts/library/common
helm dependency update charts/library/common-test
helm lint --strict charts/library/common-test
helm template test charts/library/common-test -f charts/library/common-test/ci/<feature>-values.yaml >/dev/null
rm -rf charts/library/common-test/charts charts/library/common-test/Chart.lock
```

Never commit `common-test/charts/`, `common-test/Chart.lock` or `__snapshot__/` directories.
