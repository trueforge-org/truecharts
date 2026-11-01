---
applyTo: "charts/library/**"
description: "Rules for the TrueCharts common library chart and its common-test harness"
---

# Common library instructions

These rules apply to `charts/library/common/` (the `common` library chart that every TrueCharts app depends on) and `charts/library/common-test/` (its test harness). They add to the general rules in [`AGENTS.md`](../../AGENTS.md).

`common` is used by ~800 charts. Any change here affects all of them, so be conservative, keep backwards compatibility, and test thoroughly.

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
| `templates/lib/dependencies/` | `tc.v1.common.lib.dependencies.*` | The `dependencies.<name>` system, with an injector per predefined dependency (`_valkeyInjector.tpl`, `_mariadbInjector.tpl`). |
| `templates/values/_deprecations.tpl` | `tc.v1.common.values.deprecations` | The single place for errors on removed and moved keys. |
| `values.yaml` | — | Defaults for every chart. Changing a default changes all charts. |
| `values.schema.json`, `schemas/**/*.json` | — | JSON schema of all values, see [Values schema](#values-schema). |
| `docs/` | — | User documentation, published at <https://trueforge.org/truecharts-common>. Generated from the schema, except `docs/dependencies.md`. |
| `examples/**/*.md` | — | The `## Full Examples` sections of the generated docs pages. |
| `docs-schema-mapping.yaml` | — | Maps each docs page to its schema files. |
| `complete-values-structure.yaml`, `template-keys-structure.yaml` | — | Generated lists of the keys used in values files and templates, for the schema coverage check. |
| `*.py` | — | Generators and checks for the docs, structure files and schema. |

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
  - a default (usually `{}`) in `values.yaml`, and a schema
  - docs and tests

## Compatibility

- **Helm**: supports Helm **3.14** up to the latest Helm 4. The CI `common-tests.yaml` matrix lints, unit-tests and installs `common-test` with Helm v3.14.0, v3.20.0 and v4.1.0. Develop and test locally with the **latest** Helm 4 and helm-unittest (see `AGENTS.md` → Toolchain). Do not use template functions that are missing in Helm 3.14.
- **Kubernetes**: `kubeVersion: '>=1.33.0-0'`; CI installs on k3s v1.33, v1.34 and v1.35.
- **Backwards compatibility**: existing values keys, defaults, object names, labels and selectors must keep working. Renaming or removing keys, or changing generated names/selectors, is a **breaking change**: it needs a major `common` version bump and must be called out in the PR. Removed or moved keys must also fail with a clear message, see [Deprecations](#deprecations).

## Change checklist

1. Bump `version` in `charts/library/common/Chart.yaml` following the SemVer rules in `AGENTS.md`: patch for fixes, minor for new features or options, major for breaking changes. **Do not bump `charts/library/common-test`**, which stays at `1.0.0` and depends on `common` via `file://../common/`.
2. Add or update helm-unittest suites in `charts/library/common-test/tests/<area>/*_test.yaml`. Cover both the happy path and the validation (`failedTemplate`) paths.
3. Update `charts/library/common/values.yaml` if you add or change defaults. Keep the existing comment style.
4. Update the schema in `schemas/` (and `values.schema.json` for a new top-level key) for every added, changed or removed key. See [Values schema](#values-schema).
5. Update the docs by changing the schema or `examples/`, and regenerate them. Regenerate the structure files too. See [Generated files](#generated-docs-and-structure-files).
6. If the change should be install-tested, add or update `charts/library/common-test/ci/<feature>-values.yaml` and add it to the `install` matrix in `.github/workflows/common-tests.yaml` (only files listed there are installed). During install CI, that file **replaces** `common-test/values.yaml`, so it must be self-contained.
7. Run `./run_common_tests.sh`, which runs the unit tests and the schema checks.
8. Do not update the `common` version in app charts in the same PR. After release, Renovate bumps all charts (`fix(helm-deps): update chart common ...`).

## Values schema

- `values.schema.json` (JSON Schema draft-07) is the root. Each top-level key has a `$ref` to its own file in `schemas/`, e.g. `schemas/configmap.json` or `schemas/workload/podSpec/containers/env.json`.
- Its `$id` holds the path of the CI checkout (`file:///home/runner/work/truecharts/truecharts/...`), and the `$ref`s resolve relative to it. Keep it that way, and never commit a local path. See [Unit tests](#unit-tests) for running tests locally.
- Every key in `values.yaml` and every key the templates read must be in the schema. When you add, rename or remove a key, change the schema in the same PR.
- Follow the patterns of the existing schema files:
  - Collections of named objects (`configmap.<name>`, `workload.<name>`, ...) use `"properties": {}`, with the object schema in `additionalProperties`.
  - Use relative `$ref`s for shared parts, wrapped in `allOf`, e.g. `"allOf": [{ "$ref": "special/labels.json" }]`. A file must not `$ref` itself, which `test_schema.py` rejects.
  - Keys that take a Helm `tpl` string instead of a boolean or number allow both, e.g. `"type": ["boolean", "string"]`.
  - Give every property a `description`, and a `default` that matches `values.yaml`.
- The docs are built from the schema. They use `description`, `default`, `examples` (or `default` when there are none), `x-helm-tpl: true` for the Helm `tpl` column, and on top-level keys the `x-docs-required`, `x-docs-helmTpl` and `x-docs-defaultRaw` fields.
- A change to the schema can break the values of app charts. Keep the schema accepting all existing chart values unless the change is meant to be breaking. `test_schema.py` checks this, see [Schema checks](#schema-checks).

## Generated docs and structure files

- `docs/**` is generated from the schemas by `generate_docs.py`, except `docs/dependencies.md`, which is written by hand. Generated pages say "This page is generated from JSON schema". Do not edit them by hand.
  - Change the schema, or the `## Full Examples` section in `examples/<page>.md`, which mirrors the path of the page in `docs/`.
  - Then run `python3 charts/library/common/generate_docs.py`. By default it also checks the structure and formatting of the pages.
  - List new pages with their schema files in `docs-schema-mapping.yaml`.
- `complete-values-structure.yaml` lists the keys of all chart, `common-test/ci` and `common` values files. `template-keys-structure.yaml` lists the keys the templates read. Regenerate them after changing values or templates:

  ```bash
  pip install PyYAML ruamel.yaml
  python3 charts/library/common/generate_complete_values_structure.py
  python3 charts/library/common/generate_template_keys_structure.py
  ```

- The generated files are not always up to date. Commit only the generated changes that belong to your change. Mention unrelated changes from a generator, or a generator check that already fails, in your summary or PR, instead of fixing them in the same PR.

## Dependencies

`dependencies.<name>` replaces Helm chart dependencies (subcharts) for the services an app needs. `docs/dependencies.md` describes it in full.

- Each dependency is a complete chart values structure. Its objects are merged into the chart as `<name>-<object>`, and its images as `<name>Image`. They are not primary unless they set `primary: true`. `depconfig` holds the settings of the dependency itself and is never merged.
- `valkey` and `mariadb` are predefined in `values.yaml` and disabled by default. Their injectors create the `<release>-<name>creds` Secret, fill `depconfig.creds`, add a `<name>-wait` init container and add the connection details to the notes.
- A new predefined dependency needs its defaults under `dependencies.<name>` in `values.yaml`, an injector when it provides credentials, the schema, a section in `docs/dependencies.md`, tests in `common-test/tests/dependencies/` and a `common-test/ci/<name>-values.yaml` install test.

## Deprecations

Removed or moved keys must fail with a clear message instead of being silently ignored. Add them to the lists in `templates/values/_deprecations.tpl` (`tc.v1.common.values.deprecations`), which is the single place for these errors, and add a `failedTemplate` test for them.

- The top-level `redis`, `valkey` and `mariadb` keys fail when enabled, pointing to `dependencies.<name>`.
- `solr`, `mongodb`, `clickhouse` and `memcached` were removed without a replacement, and fail when enabled.
- `volumeClaimTemplates` and `addons.vpn` fail too. Use `persistence`, and the `tailscale` or `gluetun` addons.

## Security

The general rules are in [`AGENTS.md`](../../AGENTS.md#security). In the library:

- Render credentials into Secrets only, never into ConfigMaps or plain `env` values. Containers get them with `secretKeyRef`, e.g. to the `cnpg-main-urls` or `<release>-valkeycreds` Secret. `tests/dependencies/credentials_test.yaml` checks this. Extend it when you add credentials.
- Only show credentials in the notes when the user enables `notes.showCredentials`, which defaults to `false`.
- Keep the defaults compatible with the Pod Security Standard "restricted". Templates must not loosen the security context on their own. For example, do not force `runAsNonRoot: false` when the user did not set it.
- New features that widen access, such as host ports, host paths, RBAC rules or service account tokens, are disabled by default.

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
          errorMessage: ConfigMap - Expected non-empty [data] or [binaryData]
```

Run the tests from the repository root:

```bash
# Everything CI runs: the unit tests, then the schema checks. Installs Helm and helm-unittest when missing.
./run_common_tests.sh

# A single area while iterating
UNITTEST_FILES='tests/configmap/*.yaml' SKIP_SCHEMA_TESTS=1 ./run_common_tests.sh
```

Outside GitHub Actions, the `$id` of `values.schema.json` does not point to your checkout. Unit tests, `helm lint` and `helm template` of `common` and `common-test` then fail with `failing loading "file:///home/runner/work/truecharts/...`. `./run_common_tests.sh` avoids this by running the unit tests in a scratch copy, which also keeps build artifacts out of the repository. Run other Helm commands in a scratch copy too, and never commit the rewritten file:

```bash
scratch="$(mktemp -d)"
cp -r charts/library "$scratch/"
sed -i "s#file:///home/runner/work/truecharts/truecharts/charts/library#file://$scratch/library#" "$scratch/library/common/values.schema.json"
cd "$scratch/library/common-test"
helm dependency update
helm unittest -f "tests/configmap/*.yaml" . -v ./unit-values.yaml
helm lint --strict .
helm template test . -f ci/<feature>-values.yaml >/dev/null
```

Never commit `common-test/charts/`, `common-test/Chart.lock` or `__snapshot__/` directories.

## Schema checks

`./run_common_tests.sh` runs these after the unit tests, the same as the `schema-validation` job in CI. They need Python 3 with PyYAML.

- `test_schema.py` runs `helm lint` on `common` with every `charts/stable/*/values.yaml` and `common-test/ci/*values.yaml`. That is about 850 files and takes a few minutes. It handles the `$id` itself, and writes the results to `stable_schema_validation.log`. Set `SCHEMA_MAX_FAILURES=<n>` to stop after `n` failures.
- `check_complete_values_schema_coverage.py` must report 100% coverage of both structure files.
