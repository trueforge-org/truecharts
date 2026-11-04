---
applyTo: "charts/library/common/templates/**"
paths:
  - "charts/library/common/templates/**"
description: "Rules for the common library templates: layout, template conventions, new object kinds and deprecations"
---

# Common library templates

These rules apply to `charts/library/common/templates/`. They add to the library rules in [`common-library.instructions.md`](common-library.instructions.md) and the general rules in [`AGENTS.md`](../../AGENTS.md).

## Layout and naming

| Path (`charts/library/common/templates/`) | Template names | Purpose |
| --- | --- | --- |
| `loader/` | `tc.v1.common.loader.{init,apply,all}` | Entry points. `apply` calls every spawner in order; register new spawners here. |
| `spawner/_<kind>.tpl` | `tc.v1.common.spawner.<kind>` | Iterates over `.Values.<kind>`. It checks `lib.util.enabled`, `mustDeepCopy`s the object, expands names, validates, then calls the class. |
| `class/_<kind>.tpl` | `tc.v1.common.class.<kind>` | Renders a single Kubernetes object. |
| `lib/<area>/` | `tc.v1.common.lib.<area>.*` | Building blocks and per-area validation (`_validation.tpl`). |
| `lib/_tc_capabilities.tpl` | `tc.v1.common.capabilities.*` | API versions for non-core resources. |
| `helpers/` | `tc.v1.common.helper.*`, `tc.v1.common.lib.helpers.*` | Shared helpers. |
| `values/` | `tc.v1.common.values.*` | Values initialisation and validation. |
| `values/_deprecations.tpl` | `tc.v1.common.values.deprecations` | The single place for errors on removed and moved keys, see [Deprecations](#deprecations). |
| `addons/` | `tc.v1.common.addon.*` | Addons (VPN, code-server, netshoot, etc.). |
| `lib/dependencies/` | `tc.v1.common.lib.dependencies.*` | The `dependencies.<name>` system, see [`common-library-dependencies.instructions.md`](common-library-dependencies.instructions.md). |

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
- Keep templates secure by default. Templates must not loosen the security context on their own, for example by forcing `runAsNonRoot: false` when the user did not set it. Host access, RBAC and service account tokens stay disabled unless the user enables them.

## New object kinds

A new object kind needs these pieces:

- a spawner (`spawner/_<kind>.tpl`), a class (`class/_<kind>.tpl`), validation, and a `capabilities` apiVersion in `lib/_tc_capabilities.tpl` if the kind is not core
- an entry in `loader/_apply.tpl`
- a default (usually `{}`) in `values.yaml`, and a schema, see [`common-library-schema.instructions.md`](common-library-schema.instructions.md)
- docs, see [`common-library-docs.instructions.md`](common-library-docs.instructions.md), and tests, see [`common-library-tests.instructions.md`](common-library-tests.instructions.md)

## Deprecations

Removed or moved keys must fail with a clear message instead of being silently ignored. Add them to the lists in `values/_deprecations.tpl` (`tc.v1.common.values.deprecations`), which is the single place for these errors, and add a `failedTemplate` test for them.

- The top-level `redis`, `valkey`, `mariadb` and `cnpg` keys fail when enabled, pointing to `dependencies.<name>`. `cnpg.<name>.enabled` fails too, with the migration steps.
- `solr`, `mongodb`, `clickhouse` and `memcached` were removed without a replacement, and fail when enabled.
- `volumeClaimTemplates` and `addons.vpn` fail too. Use `persistence`, and the `tailscale` or `gluetun` addons.
