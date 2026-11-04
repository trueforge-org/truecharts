---
last_mapped_commit: c71e810c627cb23e4bddb4199aa83deec403ab70
last_mapped_at: 2026-11-04
---
# Testing Patterns

**Analysis Date:** 2026-11-04

## Test Framework

**Runner:**
- helm-unittest (plugin for Helm), latest release v1.2.1 per `AGENTS.md`. CI pins `helmUnitVersion: 1.0.3` in `.github/workflows/common-tests.yaml`, so a suite that passes locally but fails in CI should be checked against that older version first.
- Helm: latest Helm 4 (v4.3.1 per `AGENTS.md`). The CI compatibility matrix also runs Helm v3.14.0, v3.20.0 and v4.1.0 on k3s v1.33 to v1.35.
- Config: no separate config file. Suites declare their template and release in each YAML file. The chart itself is `charts/library/common-test/Chart.yaml`.

**Assertion Library:**
- helm-unittest assertions. Frequency in `charts/library/common-test/tests/` (counts of list items, approximate):
  - `failedTemplate` (about 847), the dominant pattern for validation
  - `hasDocuments` (about 86)
  - `matchRegex` (about 51)
  - `contains` (about 14)
  - `isKind`, `equal` and `documentIndex` are used alongside these for positive assertions

**Schema validation (second layer):**
- `charts/library/common/test_schema.py` lints `common` against every `charts/stable/*/values.yaml` and `charts/library/common-test/ci/*values.yaml`. About 850 files, a few minutes, writes `stable_schema_validation.log`.
- `charts/library/common/check_complete_values_schema_coverage.py` must report 100% coverage of the structure files.

**Run Commands:**
```bash
./run_common_tests.sh                                              # Everything CI runs: unit tests, then schema checks
UPDATE_TOOLS=1 ./run_common_tests.sh                               # Reinstall latest Helm and helm-unittest first
UNITTEST_FILES='tests/configmap/*.yaml' SKIP_SCHEMA_TESTS=1 ./run_common_tests.sh   # One area while iterating
SCHEMA_MAX_FAILURES=<n> ./run_common_tests.sh                      # Stop schema checks after n failures
helm plugin install https://github.com/helm-unittest/helm-unittest --verify=false  # Helm 4 install
```

Run other Helm commands in a scratch copy so build artifacts stay out of the repository:
```bash
scratch="$(mktemp -d)"
cp -r charts/library "$scratch/"
cd "$scratch/library/common-test"
helm dependency update
helm unittest -f "tests/configmap/*.yaml" . -v ./unit-values.yaml
helm lint --strict .
helm template test . -f ci/<feature>-values.yaml >/dev/null
```

No coverage command exists. Coverage is measured by the schema coverage script, not by line or branch coverage.

## Test File Organization

**Location:**
- All unit tests live in one harness: `charts/library/common-test/tests/`. They are not co-located with templates.
- Application charts have no unit tests. Their tests are install tests (see Test Types).

**Naming:**
- One folder per area named after the object or library area, matching the template folder names: `configmap/`, `service/`, `traefik/`, `volumeSnapshot/`, `webhooks/`, `hpa/`, `imagePullSecret/`, and so on.
- Files are `<topic>_test.yaml`:
  - `name_test.yaml`: names and name expansion
  - `metadata_test.yaml`: labels and annotations
  - `data_test.yaml` or `spec_test.yaml`: rendered content
  - `validation_test.yaml`: failure paths
  - `<feature>_integration_test.yaml`: interactions, e.g. `service/cilium_integration_test.yaml`, `service/metallb_integration_test.yaml`
  - `middleware_<name>_test.yaml`: one file per Traefik middleware
  - `enabled_test.yaml`, `stop_test.yaml`: enable and disable behaviour
- Dependency tests are under `tests/dependencies/` (including `credentials_test.yaml`), which the security rules require to be extended when credentials are added.

**Structure:**
```
charts/library/common-test/
├── Chart.yaml              # version stays 1.0.0 (never bump)
├── values.schema.json      # symlink to charts/library/common/values.schema.json
├── values.yaml             # disables all defaults (workload.main, service.main, ...)
├── unit-values.yaml        # values used by helm unittest runs (-v flag)
├── templates/common.yaml   # renders the common library for the tests
├── tests/<area>/<topic>_test.yaml
└── ci/<feature>-values.yaml  # install-test values, listed in .github/workflows/common-tests.yaml
```

**Install-test values:**
- `charts/library/common-test/ci/<feature>-values.yaml` replaces `common-test/values.yaml` during install CI, so each file must be self-contained. Examples in the folder: `configmap-values.yaml`, `cnpg-pg18-values.yaml`, `clickhouse-values.yaml`, `codeserver-values.yaml`.
- Only files listed in the `install` matrix of `.github/workflows/common-tests.yaml` are installed.

## Test Structure

**Suite Organization (from `charts/library/common-test/tests/configmap/validation_test.yaml`):**
```yaml
suite: configmap validation test
templates:
  - common.yaml
release:
  name: test-release-name
  namespace: test-release-namespace
tests:
  - it: should fail with name starting with underscore
    set:
      configmap:
        _my-configmap:
          enabled: true
          data:
            foo: bar
    asserts:
      - failedTemplate:
          errorMessage: Name [test-release-name-common-test-_my-configmap] is not valid. Must start and end with an alphanumeric lowercase character. It can contain '-'. And must be at most 253 characters.
```

**Patterns:**
- Each suite header sets `suite:`, `templates: [common.yaml]` and a fixed `release:` with `name: test-release-name` and `namespace: test-release-namespace`. Expected names are built from these, e.g. `test-release-name-common-test-<object>`.
- Each test has an `it:` string that states the expected behaviour in the form "should <behaviour>", followed by `set:`, then `asserts:`.
- Setup pattern: `set:` provides only the values the test needs. Use `enabled: true` explicitly, and define custom object names (`my-workload`, `my-service`, `my-configmap`) because `common-test/values.yaml` disables `workload.main` and `service.main`.
- Teardown: none. helm-unittest renders each test in isolation.
- Assertion pattern: documents are addressed with `documentIndex`, and anchors are used to reuse an index:
  ```yaml
  asserts:
    - documentIndex: &configmapDoc 0
      isKind:
        of: ConfigMap
    - documentIndex: *configmapDoc
      equal:
        path: data
        value:
          foo: bar
  ```
- Valid values in a test, unless the test is about an invalid value. Schema-rejected values are asserted with `errorPattern` in the form `at '/<path>': got <type>, want <type>`, with `.*` between multiple keys because their order can change.

**Schema-first failures:**
- The values of every test are validated against `common` first, through `common-test/values.schema.json`. A wrong type or unknown key fails before the templates run. Example from `tests/configmap/validation_test.yaml`:
  ```yaml
  - it: should fail with labels not a dict
    set:
      configmap:
        my-configmap:
          enabled: true
          labels: "not a dict"
          data:
            foo: bar
    asserts:
      - failedTemplate:
          errorPattern: 'at ''/configmap/my-configmap/labels'': got string, want object'
  ```
- Template-only checks (names, namespaces, cross-key rules) use `errorMessage` with the exact text, as in the name-length test above.

## Mocking

**Framework:** None. helm-unittest has no mocking layer, and the library does not require one. Dependencies are represented by values in `set:` blocks.

**Patterns:**
- Simulate cluster state by setting values, not by stubbing. Example: `set:` with a complete `dependencies.<name>` block to exercise the injector, or `workload.<name>.podSpec` to test pod options.
- For API-version-dependent behaviour (Gateway, Traefik, Cilium, MetalLB), tests set the relevant values and assert the rendered `apiVersion`. Capability detection is in `charts/library/common/templates/lib/_tc_capabilities.tpl`.

**What to Mock:**
- Values that come from the chart user (e.g. `set: configmap`, `set: dependencies`).
- Release metadata (`release:` block in the suite header).

**What NOT to Mock:**
- The library templates. Tests always render the real `common.yaml` and assert on the output.
- The schema. Tests must not disable schema validation to make a case pass; if the schema rejects a valid value, the schema is fixed in `charts/library/common/schemas/`.

## Fixtures and Factories

**Test Data:**
- Inline in each suite. There are no shared fixture files for unit tests. Each test carries its own `set:` block.
- The default values for the test chart are in `charts/library/common-test/values.yaml` (defaults disabled) and `charts/library/common-test/unit-values.yaml`.

**Install-test fixtures:**
- `charts/library/common-test/ci/*.yaml` provide full install values, e.g. `ci/cnpg-pg18-values.yaml` for the CNPG operator path.

**Location:**
- Unit fixtures: inline in `charts/library/common-test/tests/**`.
- Install fixtures: `charts/library/common-test/ci/`.
- Application chart install values: `charts/stable/<chart>/ci/*-values.yaml`, one install per file.

## Coverage

**Requirements:** None enforced as a percentage. The only numeric gate is the schema coverage check, which must report 100% of the keys in `complete-values-structure.yaml` and `template-keys-structure.yaml`.

**View Coverage:**
```bash
python3 charts/library/common/check_complete_values_schema_coverage.py
python3 charts/library/common/generate_template_keys_structure.py
python3 charts/library/common/generate_complete_values_structure.py
```

Regenerate the structure files after changing values or templates. Commit only the generated changes that belong to your change.

## Test Types

**Unit Tests (helm-unittest):**
- Scope: one template class, validation, name expansion, or a dependency injector, rendered through `common-test/templates/common.yaml`.
- Approach: each area folder has a happy path and a validation (`failedTemplate`) path. A change to a template needs both.
- Run with `./run_common_tests.sh`. Individual suites with `UNITTEST_FILES`.

**Schema Tests:**
- `test_schema.py` runs `helm lint` on `common` with every `charts/stable/*/values.yaml` and every `common-test/ci/*values.yaml`. This checks that all existing chart values remain accepted.
- Results go to `stable_schema_validation.log`. Use `SCHEMA_MAX_FAILURES` to stop early.

**Install Tests (k3d / ct install):**
- CI installs each changed chart with `ct install` in a k3d cluster. It runs once per `ci/*-values.yaml` file, or with default values if the folder has none. A chart with a `test-chart/` subdirectory installs that wrapper chart instead.
- Common install tests run on k3s v1.33, v1.34 and v1.35 through the `install` matrix in `.github/workflows/common-tests.yaml`.
- Charts that cannot run in CI are listed in `.github/ct-install.yaml` under `excluded-charts`. Do not add charts there only to make CI pass.

**Chart Lint Tests:**
- `.github/scripts/tc-lint.sh` runs `helm lint --strict`, the `Chart.yaml` schema check, `yamllint`, and the version-bump check against `master`.
- Local commands for an application chart:
  ```bash
  chart=charts/stable/<chart>
  helm dependency build "$chart"
  helm lint --strict "$chart"
  helm template test "$chart" >/dev/null
  for f in "$chart"/ci/*values.yaml; do [ -f "$f" ] && helm template test "$chart" -f "$f" >/dev/null; done
  rm -rf "$chart/charts" "$chart/Chart.lock"
  ```

**E2E Tests:** Not used. Install tests against k3d or k3s are the closest equivalent.

## Common Patterns

**Async Testing:** Not applicable. Helm rendering is synchronous and deterministic.

**Error Testing:**
```yaml
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

- Use `errorMessage` for exact template messages, and `errorPattern` for schema messages or messages that contain variable parts.
- Assert the exact `fail` text the library emits, which uses the `"<Caller> - Expected [<key>] ..."` format.

**Rendering (positive) testing:**
```yaml
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
```

**Credentials testing:**
- Tests in `charts/library/common-test/tests/dependencies/credentials_test.yaml` assert that credentials appear only in Secrets, and that containers receive them through `secretKeyRef`. Extend this file when a new credential is added.
- Notes behaviour is tested with `notes.showCredentials` set to `false` by default.

**Adding a test for a new library feature (checklist):**
1. Add `tests/<area>/<topic>_test.yaml` with the happy path and a `failedTemplate` case for each validation.
2. If the feature is install-tested, add `ci/<feature>-values.yaml` and list it in the `install` matrix of `.github/workflows/common-tests.yaml`.
3. Run `./run_common_tests.sh`, then check `check_complete_values_schema_coverage.py`.
4. If the feature changes keys, update the schemas, then run `python3 charts/library/common/generate_bundled_schema.py`.

## Gaps and Notes

- No test framework exists for application charts beyond lint, template rendering and install tests. Chart behaviour is verified by install in `ci/`.
- No automated check runs markdownlint on docs, and no hook runs yamllint outside `tc-lint.sh`.
- The pinned helm-unittest version in CI (`1.0.3`) is older than the latest release used locally (`v1.2.1`). Behaviour differences are possible between the two.

---

*Testing analysis: 2026-11-04*
