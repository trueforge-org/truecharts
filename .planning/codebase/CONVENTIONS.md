---
last_mapped_commit: c71e810c627cb23e4bddb4199aa83deec403ab70
last_mapped_at: 2026-11-04
---
# Coding Conventions

**Analysis Date:** 2026-11-04

## Naming Patterns

**Files:**
- Application charts live at `charts/stable/<chart>/` or `charts/incubator/<chart>/`, lowercase, named after the app (e.g. `charts/stable/app-template/`).
- Library templates use a fixed prefix by role under `charts/library/common/templates/`:
  - Loaders: `loader/_init.tpl`, `loader/_apply.tpl`, `loader/_all.tpl`
  - Spawners: `spawner/_<kind>.tpl`, e.g. `spawner/_configmap.tpl`
  - Classes: `class/_<kind>.tpl`, e.g. `class/_configmap.tpl`, `class/_deployment.tpl`
  - Libraries: `lib/<area>/_<name>.tpl`, e.g. `lib/configmap/`, `lib/metadata/`
  - Helpers: `helpers/_<name>.tpl`, e.g. `helpers/_getPortRange.tpl`
  - Addons: `addons/_<name>.tpl`, e.g. `addons/_tailscale.tpl`
- Partial templates always start with an underscore (`_*.tpl`). Only `templates/common.yaml` and `templates/NOTES.txt` are rendered directly in app charts.
- Test suites are `tests/<area>/<topic>_test.yaml` in `charts/library/common-test/tests/`, e.g. `tests/configmap/validation_test.yaml`, `tests/configmap/data_test.yaml`, `tests/traefik/middleware_basicAuth_test.yaml`.
- Install-test values are `charts/library/common-test/ci/<feature>-values.yaml`, e.g. `cnpg-pg18-values.yaml`.
- Python tooling in `charts/library/common/` uses snake_case: `generate_docs.py`, `test_schema.py`, `check_complete_values_schema_coverage.py`.
- Generated documents are UPPERCASE in `.planning/` and `docs/` folders.

**Template names:**
- All library templates use the `tc.v1.common.` prefix followed by the role and area:
  - `tc.v1.common.loader.{init,apply,all}`
  - `tc.v1.common.spawner.<kind>`
  - `tc.v1.common.class.<kind>`
  - `tc.v1.common.lib.<area>.<name>` (e.g. `tc.v1.common.lib.util.enabled`, `tc.v1.common.lib.chart.names.fullname`)
  - `tc.v1.common.helper.*`, `tc.v1.common.values.*`, `tc.v1.common.addon.*`, `tc.v1.common.capabilities.*`
- App-chart helpers are named `<chart>.<name>`, defined in `templates/_<name>.tpl` (see `charts/stable/anonaddy` as the reference pattern, per `.github/instructions/charts.instructions.md`).
- Object kinds keep the Kubernetes casing in templates (`configmap`, `persistence`, `externalSecret`, `networkpolicy`) and are used as keys in `values.yaml`.

**Functions and variables (Go templates):**
- Template variables are `$camelCase`, with the root context named `$rootCtx` inside helpers and `$` at the top level, e.g. `$objectData`, `$objectName`, `$expandName`, `$fullname`, `$enabled`.
- Values for a helper are passed as `dict` keys in camelCase: `"rootCtx"`, `"objectData"`, `"caller"`, `"name"`, `"key"`, `"length"` (see `spawner/_configmap.tpl`).
- Variables holding rendered YAML are suffixed with nothing and produced with `include ... | fromYaml`, e.g. `{{- $secrets := include "<chart>.secrets" . | fromYaml -}}`.

**Values keys (YAML):**
- camelCase for keys: `podSpec`, `runAsUser`, `readOnlyRootFilesystem`, `imageSelector`, `expandObjectName`, `postgresqlUsername`.
- The primary workload, container, service and port are named `main`.
- Extra images are named `<name>Image` (e.g. `postgresImage`, `configImage`, `ubuntuImage` in `charts/library/common-test/values.yaml`).
- Name-keyed collections (`configmap.<name>`, `workload.<name>`, `service.<name>`, `ingress.<name>`) use the object name as key.

**Dependencies (`dependencies.<name>`):**
- Predefined dependencies are `valkey`, `mariadb` and `postgresql`. Their credentials Secret is `<release>-<name>creds` and their settings live in `depconfig`.

## Code Style

**Formatting:**
- EditorConfig is the source of truth, defined in `.editorconfig`:
  - `charset = utf-8`, `insert_final_newline = true`, `trim_trailing_whitespace = true`
  - 2-space indentation for YAML, Go templates and Markdown
  - 4-space indentation for `*.sh` and `*.json` files
  - `max_line_length` is off for Markdown
- Go template whitespace control is used heavily. The house style is `{{-` on the left of tags that produce no output and `-}}` on the right. Example from `charts/library/common/templates/class/_configmap.tpl`:

  ```gotemplate
  {{- $labels := (mustMerge ($objectData.labels | default dict) (include "tc.v1.common.lib.metadata.allLabels" $rootCtx | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "labels" $labels) | trim) }}
  labels:
    {{- . | nindent 4 }}
  {{- end -}}
  ```

- Follow the whitespace pattern of the file being edited; the rendered YAML must not contain stray blank lines.
- Some class files intentionally end with a no-op comment such as `{{/* This comment is here to add a new line */}}` to keep the rendered output tidy. Keep that pattern when editing class templates.
- Markdown: `-` for unordered lists (`MD004: style: dash`), line length is not enforced (`MD013: line_length: 999`). Config in `.markdownlint.yaml`. Markdownlint is not run by any hook or CI job, so run it manually.
- YAML: config in `.github/yaml-lint-conf.yaml`. Key rules: `document-start: disable`, `colons: max-spaces-after: 1`, `braces` and `brackets` with no inner spaces, `comments: min-spaces-from-content: 2`, `anchors: forbid-undeclared-aliases: true`.

**Linting and hooks:**
- Pre-commit (`.pre-commit-config.yaml`) runs generic hooks: `remove-tabs`, `trailing-whitespace`, `end-of-file-fixer`, `fix-byte-order-marker`, `mixed-line-ending`, `check-merge-conflict`, `check-case-conflict`, `check-yaml`, `check-added-large-files`, `detect-private-key`, `text-unicode-replacement-char`, `rst-backticks`.
- Chart lint is `.github/scripts/tc-lint.sh`, which runs `helm lint`, the `Chart.yaml` schema check, `yamllint` and the version-bump check against `master`.
- Schema validation is `charts/library/common/test_schema.py`. The bundled `values.schema.json` must match the output of `generate_bundled_schema.py`.
- Commit and PR titles use conventional-commit style: `fix(common): ...`, `feat(<chart>): ...`, `chore(<scope>): ...`, `BREAKING CHANGE(<scope>): ...`.

## Import Organization

Helm templates have no import statements. Shared code is reached by named templates and is loaded with `include`:

**Order inside a spawner (`charts/library/common/templates/spawner/_configmap.tpl`):**
1. Compute the enabled state with `tc.v1.common.lib.util.enabled`
2. Copy the object with `mustDeepCopy`
3. Expand the name with `tc.v1.common.lib.util.expandName`
4. Merge meta with `tc.v1.common.lib.util.metaListToDict`
5. Validate the name and the object
6. Set `name` and `shortName`
7. Call the class template

**Helm chart dependencies:** `common` is the only chart dependency of an application chart (`charts/stable/<chart>/Chart.yaml`), in the full format with `condition`, `alias`, `tags` and `import-values` keys. Use `dependencies.<name>` in values for databases and caches, never subcharts.

**Path aliases:** Not applicable. Charts reference `.Values.<key>` and `$.Values` directly.

## Error Handling

**Library validation pattern:**
- Validate with `fail` and a message in the format `"<Caller> - Expected [<key>] to be <expectation>, but got [%v]"`. Example from `charts/library/common/templates/spawner/` and the `lib/*/_validation.tpl` files:

  ```gotemplate
  {{- fail (printf "ConfigMap - Expected [data] to be a dictionary, but got [%v]" (kindOf $objectData.data)) -}}
  ```

- Name validation goes through the shared helper `tc.v1.common.lib.chart.names.validation` with a `length` argument (253 for configmaps, 63 for namespaces), e.g. `"Name [%s] is not valid. Must start and end with an alphanumeric lowercase character. It can contain '-'. And must be at most %d characters."`.
- Removed or moved keys fail through `charts/library/common/templates/values/_deprecations.tpl` with a migration message, e.g. `"Expected no [%s] key, it is replaced by [dependencies.%s]. Move [enabled] to [dependencies.%s]"`. This is the only place for these errors.
- Use `must*` sprig functions (`mustMerge`, `mustDeepCopy`, `mustToJson`) so that errors fail the render rather than silently producing empty values.
- Do not print credentials in `fail` messages, notes or logs.

**Schema-first validation:**
- Keys whose type or enum can be expressed in JSON schema are validated in `charts/library/common/schemas/**/*.json` (bundled into `values.schema.json`). Helm rejects bad types before templates run, with messages like `at '/configmap/my-configmap/labels': got string, want object`.
- Templates keep checks that the schema cannot express: names, formats, `tpl` values, and keys that depend on each other.

**Chart-side:**
- App charts do not add error handling. They express configuration through values and only add templates when values are not enough.

## Logging

**Framework:** None. Helm templates do not log. Diagnostic output goes through `NOTES.txt` (`tc.v1.common.lib.chart.notes`, rendered by `templates/NOTES.txt` in each chart).

**Patterns:**
- Credentials are shown in notes only when `notes.showCredentials` is enabled, which defaults to `false`.
- Python tooling (`charts/library/common/*.py`, `.github/scripts/*.sh`) prints plain status lines. `run_common_tests.sh` prefixes messages with emoji (`🧹 Cleaning up...`, `❌ ...`) as an existing convention for shell output, and `fail()` exits with the code.

## Comments

**When to Comment:**
- Every `define` in the library starts with a header comment block that names the template, shows the `include` call, and documents the parameters. Example from `charts/library/common/templates/class/_configmap.tpl`:

  ```gotemplate
  {{/* Configmap Class */}}
  {{/* Call this template:
  {{ include "tc.v1.common.class.configmap" (dict "rootCtx" $ "objectData" $objectData) }}

  rootCtx: The root context of the chart.
  objectData:
    name: The name of the configmap.
  */}}
  ```

- Use `{{/* ... */}}` for template comments. Inline notes in templates are rare; explain non-obvious reasons only.
- In `values.yaml`, keep comments short and useful. Existing explanatory comments are never removed. Example: `charts/library/common-test/values.yaml` starts with `# This file disables all defaults for the common-test chart.`
- The first line of every chart `values.yaml` must be `# yaml-language-server: $schema=./values.schema.json`.
- In Go, comments are not used for tests; test intent is in the `it:` string.

**JSDoc/TSDoc:** Not applicable. The repository contains no TypeScript or JavaScript source.

**Python docstrings:** Scripts start with a module docstring (`check-docstring-first` is a pre-commit hook).

## Function Design

**Size:** Templates are split by role. A spawner loops and validates, a class renders one object, a lib template handles one concern (e.g. `lib/metadata/`, `lib/util/`, `lib/chart/`).

**Parameters:**
- Pass a single `dict` with named keys. Always include `rootCtx` (or `$`) and `objectData`. Add `caller` where error messages need a prefix, and `key` where the value came from a named values path (see `tc.v1.common.lib.util.enabled`).
- Do not rely on `.` being the root context inside helpers. Pass `$rootCtx` explicitly.

**Return Values:**
- Templates return strings. Callers that need structured data use `| fromYaml` or `| fromJson`, and empty strings mean "nothing rendered".
- Boolean results are returned as the string `"true"` or `"false"` and compared with `eq $enabled "true"`.

## Module Design

**Exports:** Not applicable. Every `define` is global within the chart scope, so template names must be unique and carry the full `tc.v1.common.*` prefix.

**Barrel Files:** Not applicable. Entry points are the loaders: `tc.v1.common.loader.all`, `tc.v1.common.loader.init`, and `tc.v1.common.loader.apply`. `loader/_apply.tpl` calls every spawner in order, so a new object kind must be registered there.

**New object kinds need, in order:**
1. A spawner in `charts/library/common/templates/spawner/_<kind>.tpl`
2. A class in `charts/library/common/templates/class/_<kind>.tpl`
3. Validation in `lib/<kind>/_validation.tpl`
4. A `tc.v1.common.capabilities.*` apiVersion if the kind is not core (`lib/_tc_capabilities.tpl`)
5. An entry in `loader/_apply.tpl`
6. A default in `charts/library/common/values.yaml` and a schema in `charts/library/common/schemas/`
7. Docs, unit tests and, if needed, a `ci/` install values file

## Values and Schema Conventions

- Keep the schema closed. Use `"additionalProperties": false` on every fixed object. `"additionalProperties": true` is allowed only on the values root (`charts/library/common/values.schema.source.json`).
- Name-keyed collections use `"properties": {}` with the object schema under `additionalProperties`, as in `charts/library/common/schemas/`.
- Share schemas with `$ref` inside `allOf`, e.g. `"allOf": [{ "$ref": "special/labels.json" }]`. Reuse `special/labels.json`, `special/annotations.json`, `special/labelSelector.json`, `image.json` and `workload/podSpec/containers/*.json`.
- Every property has a `description` and a `default` matching `charts/library/common/values.yaml`.
- Keys that accept Helm `tpl` strings allow both types, e.g. `"type": ["boolean", "string"]`.
- `required` is used only for keys without a default in `values.yaml`.
- App chart `values.yaml` sets only overrides of `common` defaults. Do not copy defaults. Example from `charts/stable/app-template/values.yaml`:

  ```yaml
  # yaml-language-server: $schema=./values.schema.json
  image:
    repository: ghcr.io/miguelndecarvalho/speedtest-exporter
    tag: v3.5.4@sha256:f1064d49124c7fc45faabb87c6c876a2fd04e92b3dc14d4b871301217ba30fed
    pullPolicy: IfNotPresent

  workload:
    main:
      podSpec:
        containers:
          main:
            probes:
              liveness:
                type: tcp
  ```

- Images are always pinned by digest: `tag: <version>@sha256:<digest>`. Renovate maintains both.
- Security defaults in `common` follow the Pod Security Standard "restricted" (UID/GID `568`, `readOnlyRootFilesystem: true`, no privilege escalation, all capabilities dropped, `RuntimeDefault` seccomp). Relax only with a short comment explaining why.

## Versioning Conventions

- Application charts and `common` bump `version` in `Chart.yaml` once per PR into `master`, following SemVer: major for breaking, minor for features, patch for fixes and digest or metadata changes.
- `charts/library/common-test` stays at `1.0.0`.
- Generated files are never edited by hand: chart `README.md`, `CHANGELOG.md`, `.helmignore`, `icon*.webp`, `values.schema.json` (bundled), `docs/**` (generated pages, except `docs/dependencies.md`), `complete-values-structure.yaml`, `template-keys-structure.yaml`.

---

*Convention analysis: 2026-11-04*
