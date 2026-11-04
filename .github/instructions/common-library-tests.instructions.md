---
applyTo: "charts/library/common-test/**"
paths:
  - "charts/library/common-test/**"
description: "Rules for the common-test harness: helm-unittest suites, install-test values and how to run them"
---

# Common library tests

These rules apply to `charts/library/common-test/`, the test harness of `common`. They add to the library rules in [`common-library.instructions.md`](common-library.instructions.md) and the general rules in [`AGENTS.md`](../../AGENTS.md).

- Add or update helm-unittest suites in `charts/library/common-test/tests/<area>/*_test.yaml`. Cover both the happy path and the validation (`failedTemplate`) paths.
- If a change should be install-tested, add or update `charts/library/common-test/ci/<feature>-values.yaml` and add it to the `install` matrix in `.github/workflows/common-tests.yaml`. Only files listed there are installed. During install CI, that file **replaces** `common-test/values.yaml`, so it must be self-contained.
- `charts/library/common-test` stays at version `1.0.0` and depends on `common` via `file://../common/`. Do not bump it.
- Never commit `common-test/charts/`, `common-test/Chart.lock` or `__snapshot__/` directories.

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

  - it: should fail with data as a list
    set:
      configmap:
        my-configmap:
          enabled: true
          data:
            - item
    asserts:
      - failedTemplate:
          errorPattern: 'at ''/configmap/my-configmap/data'': got array, want string or object'
```

The values of every test are validated against the schema of `common` first, as `common-test/values.schema.json` links to it:

- Use valid values in a test, unless the test is about invalid values. Test data with unknown or wrongly typed keys fails on the schema, before the templates run.
- When the schema rejects the value a test is about, assert the schema error with `errorPattern`, matching the `at '<path>': <reason>` line. When several keys are listed, their order can change, so match them with `.*`.
- Only values the schema accepts reach the templates, so keep `errorMessage` for the checks the schema can't do, like names, formats and keys that depend on each other.

## Running the tests

Run the tests from the repository root:

```bash
# Everything CI runs: the unit tests, then the schema checks. Installs Helm and helm-unittest when missing.
./run_common_tests.sh

# A single area while iterating
UNITTEST_FILES='tests/configmap/*.yaml' SKIP_SCHEMA_TESTS=1 ./run_common_tests.sh
```

`./run_common_tests.sh` runs the unit tests in a scratch copy, which keeps build artifacts out of the repository. Run other Helm commands in a scratch copy too:

```bash
scratch="$(mktemp -d)"
cp -r charts/library "$scratch/"
cd "$scratch/library/common-test"
helm dependency update
helm unittest -f "tests/configmap/*.yaml" . -v ./unit-values.yaml
helm lint --strict .
helm template test . -f ci/<feature>-values.yaml >/dev/null
```

The schema checks that run after the unit tests are described in [Schema checks](common-library-schema.instructions.md#schema-checks).
