---
applyTo: "charts/library/common/schemas/**,charts/library/common/values.schema.source.json,charts/library/common/values.schema.json"
paths:
  - "charts/library/common/schemas/**"
  - "charts/library/common/values.schema.source.json"
  - "charts/library/common/values.schema.json"
description: "Rules for the common library values JSON schema: source files, bundling, typing rules and schema checks"
---

# Common library values schema

These rules apply to `charts/library/common/schemas/`, `values.schema.source.json` and the bundled `values.schema.json`. They add to the library rules in [`common-library.instructions.md`](common-library.instructions.md) and the general rules in [`AGENTS.md`](../../AGENTS.md).

- `values.schema.source.json` is the source. Do not edit `values.schema.json` by hand, it is generated (see below).
- `values.schema.source.json` (JSON Schema draft-07) is the root. Each top-level key has a `$ref` to its own file in `schemas/`, e.g. `schemas/configmap.json` or `schemas/workload/podSpec/containers/env.json`.
- `generate_bundled_schema.py` bundles these into a single `values.schema.json`, without a `$id` and with only internal `$ref`s, because Helm only has that one file when it validates a packaged chart. CI fails when the file is not up to date. Run `python3 charts/library/common/generate_bundled_schema.py` after every added, changed or removed key.
- Helm validates a subchart's schema only against that subchart's own values, not against the values of the chart. So `.github/scripts/add_chart_schema.sh` copies the schema of the `common` version a chart depends on into the chart: on release (`cr.sh`) and while linting (`tc-lint.sh`). These copies are not committed. `common-test` has the same setup: its `values.schema.json` is a symlink to the one of `common`, so every unit test and install test validates the schema.
- On release, `.github/workflows/charts-release.yaml` copies the bundled `values.schema.json` to the website repository (`trueforge-org/websites`) as `truecharts/public/schemas/common/<version>.schema.json`, with the version from the `Chart.yaml` of `common`.
- The source and tooling of `common` are not packaged. They are listed in `templates/helmignore.tpl`, which `forgetool charts genmeta` writes to the `.helmignore` of every chart, so a new file in the root of `common` has to be added there too.
- Every key in `values.yaml` and every key the templates read must be in the schema. When you add, rename or remove a key, change the schema in the same PR.
- Only put a key in the schema when `common` itself uses it: a template reads it, or `values.yaml` defines it. Never add a key because a chart in `charts/stable` or `charts/incubator` sets it. A chart value that no common template reads is a mistake in that chart (a dead key, a misspelling, or a key in the wrong place). Fix the chart in a separate PR that targets `master`, move the value to the key that works if it was meant to do something, and keep the key out of the schema. If such a key is already in the schema, remove it once no chart sets it anymore. While charts still set it, list it in `charts/library/common/stable-legacy-keys.yaml` (path with `*` for any key, a reason, and the charts): `test_schema.py` leaves these keys out of a chart before it validates it, and `generate_complete_values_structure.py` ignores them. Remove an entry when no chart sets the key anymore, the scripts warn about stale entries.
- Validate in the schema what the schema can express (types, enums, required keys without a default) instead of in the templates. Keep template checks for values rendered with `tpl`, checks across keys, and anything the schema can not express.

## No open objects

- `"additionalProperties": true` is ONLY allowed on the values root (`values.schema.source.json`). Nowhere else: not on fixed objects, not on arbitrary keys, not on templates or leaf values.
- Set `"additionalProperties": false` on every object with a fixed set of keys, so unknown keys are rejected. A closed object must list every key the chart and the templates use, or `test_schema.py` fails. The number of known keys does not decide this, the nature of the keys does.
- Arbitrary keys are keys with any name that all share the same child structure. They are recognised by an `objectName` in the structure, or by a spawner attached to the key (the `spawner/` template iterates over it). Name-keyed collections (`configmap.<name>`, `workload.<name>`, `service.<name>`, `ingress.<name>`, ...) and the objects they spawn are arbitrary keys. Handle them like this:

  ```json
  "workload": {
    "type": "object",
    "properties": {},
    "additionalProperties": {
      "type": "object",
      "properties": {
        "enabled": { "type": "boolean", "default": true }
      },
      "additionalProperties": false
    }
  }
  ```

  The object under `additionalProperties` is typed and closed, so it lists every key it uses. A name-keyed collection whose values have a known scalar type is typed the same way, e.g. `"additionalProperties": {"type": "string"}`.

## Patterns for schema files

- Collections of named objects (`configmap.<name>`, `workload.<name>`, ...) use `"properties": {}`, with the object schema in `additionalProperties`.
- Use relative `$ref`s for shared parts, wrapped in `allOf`, e.g. `"allOf": [{ "$ref": "special/labels.json" }]`. A file must not `$ref` itself, which `test_schema.py` rejects.
- Reuse the shared schemas instead of copying them: `special/labels.json` and `special/annotations.json` for labels and annotations, `special/labelSelector.json` for label selectors, `image.json` for images, `listener.json` for the listeners of gateways and listener sets, and `workload/podSpec/containers/*.json` for containers (also for init containers and addons).
- Every schema file must be reachable from `values.schema.source.json`. Do not add files that only exist for the docs.
- Keys that take a Helm `tpl` string instead of a boolean or number allow both, e.g. `"type": ["boolean", "string"]`.
- Give every property a `description`, and a `default` that matches `values.yaml`.
- The docs are built from the schema. They use `description`, `default`, `enum`, `pattern`, `minimum`/`maximum`, `minLength`/`maxLength`, `minItems`/`maxItems`, `examples` (the first one is shown as the example of the key), and these custom keywords:
  - `x-helm-tpl` for the Helm `tpl` column: `true`, or one of `On value only`, `On entries only`, `On keys and values`. A key typed `[boolean, string]` or with a `oneOf` of an enum and the `^\{\{.*\}\}$` pattern is shown as templated.
  - `x-docs-required: true` for a key that is required but can not be in `required`: it has a default, or it is only required in some cases, for example for one `type`. A key is shown as required in the docs when it is in `required` or has `x-docs-required: true`.
  - `x-docs-appliesTo: ["<type>"]` on keys that only apply to some values of `type` (workload, persistence, service and middleware types). They get documented on the page of that type.
  - `x-docs-page` (the docs page of a key or schema file) and `x-docs-primary: true` (the key that documents a shared object). See [`common-library-docs.instructions.md`](common-library-docs.instructions.md).

  Write descriptions as plain sentences that start with a capital and end with a full stop. Link to other docs pages as `/truecharts-common/<page path>` with the exact case, see [`common-library-docs.instructions.md`](common-library-docs.instructions.md). The generator checks the links, and markdownlint rejects `[here](...)` and bare `*`.

## `required` and existing charts

- The schema of a chart sees its values before the defaults of `common` are merged. So only use `required` for keys without a default in `values.yaml`, like the items of a list. `required` also checks disabled objects. A `required` key with a default rejects any partial override of its parent.
- A key that is required, but can not be in `required`, gets `x-docs-required: true`, so the docs show it as required. That is a key with a default, and a key that is only required in some cases, for example for one `type` or when another key is set. Check the second kind in the template.
- A change to the schema can break the values of app charts. Keep the schema accepting all existing chart values unless the change is meant to be breaking, except for keys that no common template reads, see above: those are fixed in the chart. `test_schema.py` checks this, see [Schema checks](#schema-checks).

## Schema checks

`./run_common_tests.sh` runs these after the unit tests, the same as the `coverage-validation` job in CI. They need Python 3 with PyYAML.

- `test_schema.py` runs `helm lint` on `common` with every `charts/stable/*/values.yaml` and `common-test/ci/*values.yaml`. That is about 850 files and takes a few minutes, and writes the results to `stable_schema_validation.log`. Set `SCHEMA_MAX_FAILURES=<n>` to stop after `n` failures.
- `check_complete_values_schema_coverage.py` must report 100% coverage of both structure files. See [`common-library-docs.instructions.md`](common-library-docs.instructions.md) for regenerating them.
- `check_unittest_schema_coverage.py` must report 100% unittest coverage of the schema, see [Schema coverage by unittests](common-library-tests.instructions.md#schema-coverage-by-unittests).
