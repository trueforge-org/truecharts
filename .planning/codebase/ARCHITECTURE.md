---
last_mapped_commit: c71e810c627cb23e4bddb4199aa83deec403ab70
last_mapped_at: 2026-11-04
---
<!-- refreshed: 2026-11-04 -->
# Architecture

**Analysis Date:** 2026-11-04

## System Overview

```text
┌──────────────────────────────────────────────────────────────────────┐
│        Application charts (charts/stable/*, charts/incubator/*)      │
│  values.yaml only (plus optional templates/common.yaml, _<name>.tpl) │
│  e.g. `charts/stable/app-template/`                                  │
└──────────────────────────────┬───────────────────────────────────────┘
                               │ dependency: common (oci://oci.trueforge.org/truecharts)
                               ▼
┌──────────────────────────────────────────────────────────────────────┐
│                 Library chart `common` (type: library)               │
│                 `charts/library/common/`                             │
├──────────────────────────────────────────────────────────────────────┤
│ loader     `templates/loader/_all.tpl`, `_init.tpl`, `_apply.tpl`    │
│ values     `templates/values/` (init, validate, deprecations)        │
│ dependencies `templates/lib/dependencies/` (valkey, mariadb, pg)     │
│ spawner    `templates/spawner/_<kind>.tpl` (iterate .Values.<kind>)  │
│ class      `templates/class/_<kind>.tpl` (render one k8s object)     │
│ lib        `templates/lib/<area>/` (building blocks + validation)    │
│ helpers / addons / capabilities                                      │
└──────────────────────────────┬───────────────────────────────────────┘
                               │ rendered manifests
                               ▼
┌──────────────────────────────────────────────────────────────────────┐
│  Kubernetes objects: Deployment/StatefulSet/..., Service, Ingress,   │
│  Gateway API, PVC, ConfigMap, Secret, NetworkPolicy, operator CRs    │
└──────────────────────────────────────────────────────────────────────┘

Repository tooling (outside the chart path):
  `templates/` (forgetool doc templates) · `.github/scripts/` (CI, lint, release)
  `charts/library/common-test/` (helm-unittest harness for common)
```

## Pattern Overview

**Overall:** Helm library-chart architecture with a values-driven, spawner/class pipeline. Application charts contain no Kubernetes manifests; they declare intent in `values.yaml` and the `common` library renders everything.

**Key Characteristics:**
- Every application chart is a thin wrapper: `templates/common.yaml` contains only `{{ include "tc.v1.common.loader.all" . }}`. Verified in `charts/stable/app-template/templates/common.yaml`.
- Single shared library: `common` is used by ~800 stable charts (`charts/stable/`, 807 directories) and 1 incubator chart (`charts/incubator/`).
- Two-level naming for templates: `tc.v1.common.<type>.<area>` where type is `loader`, `spawner`, `class`, `lib`, `values`, `helper`, `addon`, `capabilities`.
- Values are merged with `common` defaults (`charts/library/common/values.yaml`) and validated against a JSON schema before templates run (schema source: `charts/library/common/values.schema.source.json`, bundled into `values.schema.json`).
- Secure-by-default rendering: the library defaults meet Pod Security Standard "restricted" (UID/GID 568, read-only root filesystem, no privilege escalation, dropped capabilities, RuntimeDefault seccomp). Defined in `charts/library/common/values.yaml` and `templates/lib/`.
- Dependencies (`valkey`, `mariadb`, `postgresql`, `mongodb` predefined) are injected by the library instead of Helm subcharts (`charts/library/common/templates/lib/dependencies/`).
- Name-keyed collections drive object creation: `workload.<name>`, `service.<name>`, `configmap.<name>`, `ingress.<name>`, etc. Each key becomes one object, named `<fullname>` for `primary: true` or `<fullname>-<name>` otherwise.

## Layers

**Loader (entry points):**
- Purpose: Orchestrate the full render.
- Location: `charts/library/common/templates/loader/`
- Contains: `tc.v1.common.loader.all` (calls `init` then `apply`), `init` (capability check, values merge, deprecation check, chart context, dependency injectors, CNPG/valkey operator spawners), `apply` (ordered list of spawner calls).
- Depends on: values, dependencies, spawners.
- Used by: every application chart via `templates/common.yaml`.

**Values layer:**
- Purpose: Merge chart values onto common defaults, fail on removed keys, validate.
- Location: `charts/library/common/templates/values/` (`_init.tpl`, `_validate.tpl`, `_deprecations.tpl`, `_dependencies.tpl`, `_dependenciesAddons.tpl`)
- Contains: `tc.v1.common.values.init`, `tc.v1.common.values.validate`, `tc.v1.common.values.deprecations` (single place for errors on removed and moved keys).
- Depends on: `charts/library/common/values.yaml`.
- Used by: loader.

**Dependencies layer:**
- Purpose: Provide databases/caches as `dependencies.<name>` objects; generate credentials; wait for readiness.
- Location: `charts/library/common/templates/lib/dependencies/` (injectors `_valkeyInjector.tpl`, `_mariadbInjector.tpl`, `_postgresqlInjector.tpl`, `_mongodbInjector.tpl`; operator support in `_valkeyOperator.tpl`, `_postgresqlOperator.tpl`; wait logic `_dbWait.tpl`)
- Also: `charts/library/common/templates/spawner/_valkey.tpl`, `spawner/_cnpg.tpl`, `class/valkey/`, `class/cnpg/`.
- Depends on: secrets/credentials lib.
- Used by: `loader/_init.tpl`.

**Spawner layer:**
- Purpose: Iterate over one values key, apply the enable check, deep-copy the object, expand names, validate, and call the class.
- Location: `charts/library/common/templates/spawner/` (e.g. `_workload.tpl`, `_service.tpl`, `_ingress.tpl`, `_configmap.tpl`, `_secret.tpl`, `_pvc.tpl`, `_route.tpl`, `_gateway.tpl`, `_listenerSet.tpl`, `_networkPolicy.tpl`, `_webhook.tpl`, `_metrics.tpl`, `traefik/`, `cert-manager/`).
- Pattern (from `spawner/_workload.tpl`): `range $name, $workload := .Values.workload` → `tc.v1.common.lib.util.enabled` → `mustDeepCopy` → name via `tc.v1.common.lib.chart.names.fullname` → `primaryValidation` → call class.
- Depends on: `lib/`, `class/`.
- Used by: `loader/_apply.tpl`.

**Class layer:**
- Purpose: Render exactly one Kubernetes object from a prepared `objectData` dict.
- Location: `charts/library/common/templates/class/` (about 40 files, e.g. `_deployment.tpl`, `_statefulset.tpl`, `_service.tpl`, `_ingress.tpl`, `_gateway.tpl`, `_networkPolicy.tpl`; subfolders `cert-manager/`, `cnpg/`, `metrics/`, `traefik/`, `valkey/`, `volsync/`).
- Called with: `dict "rootCtx" $ "objectData" $objectData`.
- Depends on: `lib/`, `helpers/`.
- Used by: spawners and `lib/workload/` (for `Deployment`, `StatefulSet`, `DaemonSet`, `Job`, `CronJob`).

**Lib (building blocks and validation):**
- Purpose: Reusable pieces: containers, pods, workload specs, storage, metadata, util, per-area `_validation.tpl`.
- Location: `charts/library/common/templates/lib/` (subareas include `workload/` with `_pod.tpl`, `_deploymentSpec.tpl`, `_statefulsetSpec.tpl`, `components/`, `validation/`; `container/`, `storage/`, `service/`, `ingress/`, `gateway/`, `route/`, `networkpolicy/`, `util/`, `metadata/`, `chart/`, `credentials/`, `secret/`, `vpa/`, `hpa/`, `volsync/`, `traefik/`, `cnpg/`).
- Capabilities: `charts/library/common/templates/lib/_tc_capabilities.tpl` (`tc.v1.common.capabilities.*`) selects API versions for non-core kinds; `tc.v1.common.check.capabilities` runs during init.
- Used by: all higher layers.

**Helpers and addons:**
- `charts/library/common/templates/helpers/` (`tc.v1.common.helper.*`, `tc.v1.common.lib.helpers.*`): port ranges, pod/service selection, env duplicate check, int conversion.
- `charts/library/common/templates/addons/` (`_codeserver.tpl`, `_gluetun.tpl`, `_netshoot.tpl`, `_tailscale.tpl`): sidecar/addon containers injected into the workload pod.

**Schema layer:**
- Purpose: Typed, closed validation of every values key before templates run.
- Location: `charts/library/common/values.schema.source.json` (root, draft-07) referencing `charts/library/common/schemas/**/*.json`; bundled output `values.schema.json` (generated by `generate_bundled_schema.py`, do not edit by hand).
- Used by: Helm during install/lint/template; `common-test/values.schema.json` is a symlink to the common schema.

**Docs and generators:**
- `charts/library/common/docs/` is generated from schemas by `generate_docs.py` (except `docs/dependencies.md`, handwritten). Examples in `charts/library/common/examples/`. `docs-schema-mapping.yaml` maps pages to schema files.
- `complete-values-structure.yaml` and `template-keys-structure.yaml` are generated by `generate_complete_values_structure.py` and `generate_template_keys_structure.py`.

## Data Flow

### Primary Request Path (render of an application chart)

1. Helm loads the app chart, merges its `values.yaml` on top of `charts/library/common/values.yaml` via `tc.v1.common.values.init` (`charts/library/common/templates/values/_init.tpl`).
2. The schema check runs first on the chart values (`values.schema.json` copied into the chart by `.github/scripts/add_chart_schema.sh` at release/lint time).
3. `tc.v1.common.loader.all` (`charts/library/common/templates/loader/_all.tpl`) calls `tc.v1.common.loader.init` (`loader/_init.tpl`): capability check → values init → deprecations → chart context → valkey/mariadb/postgresql/mongodb injectors → valkey and CNPG spawners.
4. `tc.v1.common.loader.apply` (`loader/_apply.tpl`) runs spawners in fixed order: extraTpl, autoperms job, values validate, configmapFromFolder, configmap, priorityclass, secret, externalSecret, imagePullSecret, serviceAccount, rbac, workload, service, storageclass, pvc, volumesnapshot(class), traefik middleware/serverstransport, ingress, gatewayclasses, gateways, listenerSet, routes, hpa, networkpolicy, and further spawners.
5. Each spawner (`charts/library/common/templates/spawner/_<kind>.tpl`) iterates `.Values.<kind>`, skips disabled entries, deep-copies, computes the object name, validates, and calls `tc.v1.common.class.<kind>`.
6. Workload class resolves `type` (Deployment, StatefulSet, DaemonSet, Job, CronJob) and renders the pod via `lib/workload/_pod.tpl` and `lib/container/` (containers, probes, env, security context, persistence mounts, addons).
7. Output: multi-document YAML emitted by Helm; NOTES come from `tc.v1.common.lib.chart.notes` in the chart's `templates/NOTES.txt`.

### Dependency Injection Path (e.g. `dependencies.postgresql`)

1. User sets `dependencies.postgresql.enabled: true` and `depconfig.postgresqlUsername`/`postgresqlDatabase` in the app chart.
2. `tc.v1.common.dependencies.postgresql.injector` (`lib/dependencies/_postgresqlInjector.tpl`) creates the `<release>-postgresqlcreds` Secret (generated once, reused via `lookup`), fills `depconfig.creds`, adds a `postgresql-wait` init container and notes.
3. In `mode: operator` (default), `tc.v1.common.spawner.cnpg` renders a single CloudNativePG `Cluster`; in `mode: standalone`, the objects are merged into the chart as `<name>-<object>`.

### Secret/Credential Flow

- Generated secrets are created by `spawner/_secret.tpl` and dependency injectors; containers receive them via `secretKeyRef`, never via ConfigMaps or plain env (enforced by `tests/dependencies/credentials_test.yaml` in common-test).

### Test and CI Flow

1. `charts/library/common-test/` renders `templates/common.yaml` with `values.yaml` (main workload/service disabled) and `unit-values.yaml`; helm-unittest suites live in `charts/library/common-test/tests/<area>/`.
2. `run_common_tests.sh` (repo root) runs unit tests in a scratch copy, then `charts/library/common/test_schema.py` against `charts/stable/*/values.yaml` and `common-test/ci/*values.yaml`.
3. `.github/workflows/common-tests.yaml` runs the matrix (Helm v3.14.0, v3.20.0, v4.1.0 on k3s v1.33–v1.35).
4. `.github/scripts/tc-lint.sh` lints changed charts and enforces the version bump against `origin/master`.

**State Management:**
- Stateless rendering: all state is in values and the cluster. Persistent data lives in `persistence` volumes (PVC spawner `spawner/_pvc.tpl`). Generated secrets persist across upgrades through `lookup`.

## Key Abstractions

**Spawner:**
- Purpose: Iterates one values key and turns each entry into zero or more objects.
- Examples: `charts/library/common/templates/spawner/_workload.tpl`, `spawner/_service.tpl`, `spawner/_configmap.tpl`, `spawner/_ingress.tpl`.
- Pattern: `range` over a name-keyed map, `tc.v1.common.lib.util.enabled`, `mustDeepCopy`, class call.

**Class:**
- Purpose: Renders one Kubernetes object.
- Examples: `charts/library/common/templates/class/_deployment.tpl`, `class/_service.tpl`, `class/_gateway.tpl`.
- Pattern: receives `dict "rootCtx" $ "objectData" $objectData`; header comment block documents the call and parameters.

**Dependency injector:**
- Purpose: Adds credentials, wait init containers and notes for a predefined service.
- Examples: `charts/library/common/templates/lib/dependencies/_valkeyInjector.tpl`, `_postgresqlInjector.tpl`.
- Pattern: mutates a `mustDeepCopy` of values in `init`; operator variants render CRs instead of merging objects.

**Addon:**
- Purpose: Optional sidecar/companion containers attached to the workload pod.
- Examples: `charts/library/common/templates/addons/_tailscale.tpl`, `_gluetun.tpl`, `_codeserver.tpl`, `_netshoot.tpl`.

**Schema file:**
- Purpose: Typed description of a values key; drives validation and docs.
- Examples: `charts/library/common/schemas/workload/podSpec/containers/env.json`, `schemas/special/labels.json`, `schemas/image.json`.

## Entry Points

**Application chart render:**
- Location: `charts/stable/<chart>/templates/common.yaml` (one line calling `tc.v1.common.loader.all`).
- Triggers: `helm install`, `helm template`, `helm lint`.
- Responsibilities: all Kubernetes object generation for the app.

**Library main entry point:**
- Location: `charts/library/common/templates/loader/_all.tpl` (`tc.v1.common.loader.all`).
- Triggers: included by application charts.

**Library init and apply:**
- Location: `charts/library/common/templates/loader/_init.tpl`, `charts/library/common/templates/loader/_apply.tpl`.

**Notes:**
- Location: `charts/stable/<chart>/templates/NOTES.txt` → `tc.v1.common.lib.chart.notes`.

**Repository tooling entry points:**
- `run_common_tests.sh`: local runner for common tests and schema checks.
- `.github/scripts/tc-lint.sh`: CI chart lint and version check.
- `.github/scripts/add_chart_schema.sh`: copies the common schema into a chart for lint/release.
- `.github/scripts/cr.sh`, `prep_helm.sh`: release and Helm preparation.
- `templates/`: forgetool templates for generated chart READMEs.

## Architectural Constraints

- **Threading:** Not applicable. Helm renders templates single-threaded; there is no runtime process in this repository.
- **Global state:** Helm template scope is per-render. Shared state is the `.Values` tree, mutated only on `mustDeepCopy` copies inside spawners, by convention (see `charts/library/common/templates/spawner/_workload.tpl`).
- **Circular imports:** Not detected at the template-include level; the layering is one-directional (loader → spawner → class → lib → helpers).
- **Root context:** Helpers must receive `rootCtx` explicitly (`dict "rootCtx" $ ...`); relying on `.` inside a helper is not allowed by the library rules.
- **Helm compatibility:** Library templates must work on Helm 3.14 as well as Helm 4 (CI matrix).
- **Schema closure:** `additionalProperties: true` is only allowed on the values root; every other fixed object is closed. Arbitrary name-keyed collections use typed `additionalProperties`.
- **Breaking-change surface:** values keys, object names, labels and selectors produced by `common` are a compatibility contract for ~800 charts.

## Anti-Patterns

### Hand-written Kubernetes manifests in application charts

**What happens:** Adding templates under `charts/stable/<chart>/templates/` that render Deployments, Services, etc.
**Why it's wrong:** Bypasses the security defaults, the schema, naming and the common test harness.
**Do this instead:** Express the object through `workload`, `service`, `persistence`, `configmap`, `ingress`, etc. in `values.yaml`. Only add `_<name>.tpl` helpers when values are not enough, following `charts/stable/anonaddy/templates/`.

### Using removed top-level dependency keys

**What happens:** Enabling top-level `redis`, `valkey`, `mariadb`, `cnpg`, `mongodb`, `solr`, `clickhouse` or `memcached` keys.
**Why it's wrong:** These fail rendering via `charts/library/common/templates/values/_deprecations.tpl`.
**Do this instead:** Use `dependencies.<name>` (`charts/library/common/docs/dependencies.md`).

### Subchart dependencies in app charts

**What happens:** Adding `valkey`, `mariadb` or similar as Helm chart dependencies in `Chart.yaml`.
**Why it's wrong:** The repository standard is that `common` is the only dependency.
**Do this instead:** Enable the `dependencies.<name>` option in `values.yaml`.

### Mutating `.Values` in place in templates

**What happens:** Calling `set` on values objects without copying inside a spawner or helper.
**Why it's wrong:** Causes cross-spawner side effects and order-dependent output.
**Do this instead:** Work on `mustDeepCopy` copies, as `spawner/_workload.tpl` does.

## Error Handling

**Strategy:** Fail fast at render time with explicit messages, and reject bad input in the JSON schema before templates run.

**Patterns:**
- `fail (printf "<Caller> - Expected [<key>] to be <expectation>, but got [%v]" ...)` in validation templates (`lib/*/_validation.tpl`, `values/_validate.tpl`).
- Removed keys fail in `values/_deprecations.tpl`.
- Schema errors are surfaced by Helm as `at '<path>': <reason>`; the common-test suites assert these with `errorPattern`.

## Cross-Cutting Concerns

**Logging:** Not applicable; output is Kubernetes manifests and Helm NOTES.
**Validation:** JSON schema (`charts/library/common/schemas/`) for types and closure; template validation (`lib/*/validation/`, `values/_validate.tpl`) for cross-key and formatted values.
**Authentication:** Not applicable at library level; secrets are created as Kubernetes Secrets, and external secrets via `spawner/_externalSecret.tpl`.
**Security defaults:** Pod Security Standard "restricted" in `charts/library/common/values.yaml`; network policies opt-in via `networkpolicy`.

---

*Architecture analysis: 2026-11-04*
