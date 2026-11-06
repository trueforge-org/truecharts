---
applyTo: "charts/library/common/values.yaml,charts/library/common/templates/lib/dependencies/**,charts/library/common/docs/dependencies.md"
paths:
  - "charts/library/common/values.yaml"
  - "charts/library/common/templates/lib/dependencies/**"
  - "charts/library/common/docs/dependencies.md"
description: "Rules for the common library dependencies.<name> system: predefined dependencies, modes, injectors and credentials"
---

# Common library dependencies

These rules apply to the `dependencies` section of `charts/library/common/values.yaml`, `templates/lib/dependencies/` (including the injectors) and the hand-written `docs/dependencies.md`. They add to the library rules in [`common-library.instructions.md`](common-library.instructions.md) and the general rules in [`AGENTS.md`](../../AGENTS.md).

`dependencies.<name>` replaces Helm chart dependencies (subcharts) for the services an app needs. `docs/dependencies.md` describes it in full.

- Each dependency is a complete chart values structure. Its objects are merged into the chart as `<name>-<object>`, and its images as `<name>Image`. They are not primary unless they set `primary: true`. `depconfig` holds the settings of the dependency itself and is never merged.
- `valkey`, `mariadb` and `postgresql` are predefined in `values.yaml` and disabled by default. Their injectors (`_valkeyInjector.tpl`, `_mariadbInjector.tpl`, `_postgresqlInjector.tpl`) create the `<release>-<name>creds` Secret, fill `depconfig.creds`, add a `<name>-wait` init container and add the connection details to the notes.
- `mode` is `standalone` (objects merged into the chart) or `operator` (an operator provides it, nothing is merged), and defaults to `standalone`, except for `postgresql` which defaults to `operator`. `valkey` and `postgresql` have operator support: common spawns a `ValkeyCluster` or a single CNPG `Cluster`, configured in `dependencies.<name>.operator`. Both resolve the host and port of the operator service with `primaryService`, so the credentials, the wait init container and the notes always agree. Keep the structure of the two the same.
- A new predefined dependency needs its defaults under `dependencies.<name>` in `values.yaml`, an injector when it provides credentials, the schema (see [`common-library-schema.instructions.md`](common-library-schema.instructions.md)), a section in `docs/dependencies.md`, tests in `common-test/tests/dependencies/` and a `common-test/ci/<name>-values.yaml` install test (see [`common-library-tests.instructions.md`](common-library-tests.instructions.md)).

## Credentials

- Render credentials into Secrets only, never into ConfigMaps or plain `env` values. Containers get them with `secretKeyRef`, e.g. to the `<release>-postgresqlcreds` or `<release>-valkeycreds` Secret. `tests/dependencies/credentials_test.yaml` checks this. Extend it when you add credentials.
- Only show credentials in the notes when the user enables `notes.showCredentials`, which defaults to `false`.
