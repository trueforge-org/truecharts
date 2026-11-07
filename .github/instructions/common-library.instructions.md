---
applyTo: "charts/library/**"
paths:
  - "charts/library/**"
description: "Library-wide rules for the TrueCharts common chart and common-test harness: compatibility, security, change checklist. Area rules are in common-library-*.instructions.md."
---

# Common library instructions

These rules apply to the whole of `charts/library/` (`common` and `common-test`). They add to the general rules in [`AGENTS.md`](../../AGENTS.md). `common` is used by ~800 charts, so be conservative, keep backwards compatibility and test thoroughly.

Area rules live in separate files. Read the matching one before editing:

| Paths | Read |
| --- | --- |
| `charts/library/common/templates/**` | [`common-library-templates.instructions.md`](common-library-templates.instructions.md) |
| `charts/library/common/schemas/**`, `values.schema.source.json`, `values.schema.json` | [`common-library-schema.instructions.md`](common-library-schema.instructions.md) |
| `charts/library/common/values.yaml`, `templates/lib/dependencies/**`, `docs/dependencies/index.md` | [`common-library-dependencies.instructions.md`](common-library-dependencies.instructions.md) |
| `charts/library/common/docs/**`, `examples/**`, `*.py`, structure files | [`common-library-docs.instructions.md`](common-library-docs.instructions.md) |
| `charts/library/common-test/**` | [`common-library-tests.instructions.md`](common-library-tests.instructions.md) |

## Compatibility

- **Helm**: supports Helm **3.14** up to the latest Helm 4. The CI `common-tests.yaml` matrix lints, unit-tests and installs `common-test` with Helm v3.14.0, v3.20.0 and v4.1.0. Develop and test locally with the **latest** Helm 4 and helm-unittest (see `AGENTS.md` → Toolchain). Do not use template functions that are missing in Helm 3.14.
- **Kubernetes**: `kubeVersion: '>=1.33.0-0'`; CI installs on k3s v1.33, v1.34 and v1.35.
- **Backwards compatibility**: existing values keys, defaults, object names, labels and selectors must keep working. Renaming or removing keys, or changing generated names/selectors, is a **breaking change**: it needs a major `common` version bump and must be called out in the PR. Removed or moved keys must also fail with a clear message, see [Deprecations](common-library-templates.instructions.md#deprecations).
- Changing a default in `values.yaml` changes every chart.

## Security

The general rules are in [`AGENTS.md`](../../AGENTS.md#security). In the library:

- Keep the defaults compatible with the Pod Security Standard "restricted". Templates must not loosen the security context on their own.
- New features that widen access, such as host ports, host paths, RBAC rules or service account tokens, are disabled by default.
- Credentials go into Secrets only, see [Credentials](common-library-dependencies.instructions.md#credentials).

## Change checklist

1. Bump `version` in `charts/library/common/Chart.yaml` (only in a PR that targets `master`) following the SemVer rules in `AGENTS.md`: patch for fixes, minor for new features or options, major for breaking changes. **Do not bump `charts/library/common-test`**, which stays at `1.0.0`.
2. Templates and new object kinds: [templates file](common-library-templates.instructions.md).
3. Defaults in `values.yaml`: keep the existing comment style. Dependency defaults: [dependencies file](common-library-dependencies.instructions.md).
4. Schema in `schemas/` (and `values.schema.source.json` for a new top-level key), for every added, changed or removed key: [schema file](common-library-schema.instructions.md).
5. Docs and structure files: [docs file](common-library-docs.instructions.md).
6. Unit tests and install tests: [tests file](common-library-tests.instructions.md).
7. Run `./run_common_tests.sh`, which runs the unit tests and the schema checks.
8. Do not update the `common` version in app charts in the same PR. After release, Renovate bumps all charts (`fix(helm-deps): update chart common ...`).
