# Review: `common2026` → `master`

Review of the whole `common2026` branch against `origin/master`: 677 files, about +72k / −18k lines. The review covers the commits `889c2358675` (squashed common2026 rework) and `728dff6be00` (volsync test alignment).

It is a read-only review: nothing was fixed, and no tests, lint or helm runs were done. The review was split into five areas: routes and the Gateway API; dependencies, CNPG and valkey; NetworkPolicy and the other templates; the values schema and its tooling; and CI, Renovate and the test harness. Findings marked ✅ were checked again against the code after the area reviews. The rest were checked by the area reviewers only.

Focus: **mistakes**, **performance**, **security**.

Out of scope: the impact on `charts/stable/**` charts. They will be redone after this rework, so findings that only affect them were left out.

## Summary

| Severity | Count | Most important |
| --- | --- | --- |
| High | 5 | PostgreSQL 16 → 18 default, NetworkPolicy allow-all, route backend namespace, CI matrix > 256 jobs, new default `crontab` mount |
| Medium | 12 | runAsNonRoot inheritance, VolSync mover limits, valkey operator PSS, placeholder passwords, `tpl`-documented keys never templated |
| Low | ~23 | quoting, dead code, tooling hygiene, minor perf |

Note on validation: many runtime `kindIs` and enum checks were removed in favour of the JSON schema. This is mostly fine: app charts `$ref` the published common schema, so Helm validates user values. The remaining gap is objects that common builds at render time, see [L-12](#mistakes).

---

## High

### H-1. Default PostgreSQL major version changed 16 → 18 (silent major upgrade) ✅

- **Where:** `charts/library/common/values.yaml:71` (`global.fallbackDefaults.cnpg.pgVersion: 18`; master: `16` at `values.yaml:65` and `cnpg.main.pgVersion: 16`), `schemas/global/fallbackDefaults.json:311`, `templates/spawner/_cnpg.tpl:36-59`, `templates/values/_deprecations.tpl:48`
- **Problem:** `pgVersion` is commented out in `dependencies.postgresql.operator`, so a cluster that does not set it falls back to 18, and the image tags also move from bookworm (`16.x`) to `*-standard-trixie`. Nothing (`lookup` or validation) protects existing clusters. The `cnpg.<name>` deprecation message does not tell users to pin `pgVersion: 16`.
- **Failure scenario:** an app migrated to the new keys upgrades. `Cluster.spec.imageName` changes to `18.x-standard-trixie`, and CNPG tries an in-place major upgrade across a distro change, which the schema description itself calls unsupported. The database fails to start or the upgrade fails, and older backups no longer work for PITR.
- **Suggested fix:** keep the fallback at 16, or `lookup` the existing `Cluster` and keep its major version, or require an explicit `pgVersion` in operator mode. At minimum, put "set `pgVersion: 16`" in the deprecation message and the migration docs.

### H-2. Kubernetes NetworkPolicy rules with only Cilium keys render as allow-all ✅

- **Where:** `templates/class/_networkPolicy.tpl:64` (`-{{- if .to }} to:`) and `:126` (ingress `from`), `schemas/networkPolicy/ingressRule.json:29`, `schemas/networkPolicy/egressRule.json`
- **Problem:** one rule schema is shared by `type: kubernetes` and `type: cilium`. With the default `kubernetes` type it still accepts `fromEntities`, `fromEndpoints`, `fromCIDR(Set)`, `toPorts`, `toFQDNs`, `toServices` and `icmps`, and documents them as "ignored". A rule without `from`/`to` renders as `- ` (null) or `- ports: [...]`, and in NetworkPolicy a rule without peers matches **all** peers.
- **Failure scenarios:**
  - `ingress: [{fromEntities: [cluster], ports: [{port: 8080}]}]` without `type: cilium` opens port 8080 to everything, including traffic from outside the cluster.
  - `egress: [{toFQDNs: [...]}]` renders as `egress: [null]`, which allows all egress.
  - Related (also on master): a peer with an empty `namespaceSelector: {}` / `podSelector: {}` is dropped by the guards at `:82-83` / `:144-145`, which also leaves an empty peer list and so allows all.
  - In reverse, with `type: cilium`, Kubernetes-style `from`/`to`/`ports` keys are pruned by the API server. This fails closed, but silently.
- **Suggested fix:** in `lib/networkpolicy/_validation.tpl`, fail on Cilium-only keys for the `kubernetes` type and on `from`/`to`/`ports` for `cilium` (or split the schema with `if/then`). Render empty selectors as `{}`. Fail when `from`/`to` renders no peers.

### H-3. Route `backendRefs` use the route's namespace, not the service's ✅

- **Where:** `templates/class/_route.tpl:189` (`"namespace" (.namespace | default $namespace)`, where `$namespace` is the route's namespace) and the homepage integration call at `class/_route.tpl:84`. `common-test/tests/route/spec_test.yaml:240-282` asserts the wrong behaviour.
- **Problem:** services resolved through `targetSelector` or the primary service are created in their own namespace (`service.<n>.namespace` → `Values.namespace` → release namespace), but the backendRef points at the route's namespace.
- **Failure scenario:** with `route.main.namespace: gateway-ns`, the backendRef points at `gateway-ns/<release>-main`, which does not exist. The result is `BackendNotFound` and 500s on every request, and the homepage widget URL is wrong as well. Master used `Release.Namespace`, which was correct in the default case.
- **Suggested fix:** have `lib.route.backend` return the namespace of the resolved service. Keep the route-namespace default only for backends given by an explicit `name`. Fix the test.

### H-4. Install matrix on push to master exceeds GitHub's 256-job limit ✅

- **Where:** `.github/workflows/common-tests.yaml:302` (versions), `:303-343` (values)
- **Problem:** `values` grew from 25 to 39 entries. On non-PR events, `versions` has 9 k3s × Helm combinations, so 9 × 39 = **351 jobs**. Master was at 225.
- **Failure scenario:** the first push to master (or `workflow_dispatch`) after the merge fails at matrix expansion, so `install` never runs and "Common Tests Completed" is red. PRs (2 × 39 = 78) do not show it.
- **Suggested fix:** keep the non-PR matrix at 256 jobs or fewer. Use the full version matrix only for a core subset, use a reduced version set for dependency and operator values, or split into two install jobs.

### H-5. New default `crontab` emptyDir mounted into every container of every chart ✅

- **Where:** `charts/library/common/values.yaml:394-399` (`persistence.crontab`, `enabled: true`, `targetSelectAll: true`, `medium: Memory`). It is not on master.
- **Problem:** it mounts over `/var/spool/cron/crontabs/` in every container of every chart built on common, and hides any crontabs that images ship there.
- **Failure scenario:** images that rely on crontabs baked into the image silently stop running their cron jobs, and every pod gets an extra memory-backed volume.
- **Suggested fix:** do not enable it by default. Make it opt-in, per chart or per feature that needs it.

---

## Medium

### M-1. `runAsNonRoot` is now inherited instead of computed per container ✅

- **Where:** `templates/lib/container/_securityContext.tpl:89-95`, schema text `schemas/.../securityContext.json:64`
- **Problem:** master always derived `runAsNonRoot` from the container's final UID. Now any explicit value wins, including one inherited from the chart-wide `securityContext.container`.
- **Failure scenarios:**
  - A chart with a global `runAsNonRoot: false` and UID 0 plus an extra container with `runAsUser: 568` renders `runAsNonRoot: false`, which weakens PSS "restricted". The library templates rules say: "Templates must not loosen the security context on their own."
  - In reverse, a global `runAsNonRoot: true` plus a container with UID 0 gives `CreateContainerConfigError`.
- **Suggested fix:** respect only an explicit `runAsNonRoot` set on the container itself, or always force `false` when UID is 0 and `true` otherwise. Make the schema text match the template (it says `runAsGroup` is used, but it is not).

### M-2. VolSync movers now always get the chart's default resource limits ✅

- **Where:** `templates/class/volsync/_replicationSource.tpl:76-79` and the same block in `_replicationDestination.tpl`, through `lib/container/_resources.tpl:11`
- **Problem:** `lib.container.resources` falls back to `.Values.resources` (1500m / 2400Mi limits). Master did not render `moverResources` at all.
- **Failure scenario:** after the upgrade, restic backups, restores or prunes of large volumes are OOMKilled at 2.4Gi.
- **Test issue:** `common-test/tests/volsync/replication_dest_spec_test.yaml:73` and the following cases assert the inherited limits, which locks the regression in.
- **Suggested fix:** render `moverResources` only when `volsync[].resources` is set explicitly, with no root fallback.

### M-3. Valkey operator pods do not get the restricted security defaults

- **Where:** `templates/class/valkey/_cluster.tpl:134-144`
- **Problem:** only `podSecurityContext` (runAsNonRoot, UID/GID, fsGroup) is set. There is no `seccompProfile: RuntimeDefault` and no container securityContext (`allowPrivilegeEscalation: false`, drop ALL, `readOnlyRootFilesystem`) for the valkey and exporter containers. Of `dependencies.valkey.securityContext.container`, only `runAsUser` and `runAsGroup` are used.
- **Failure scenario:** the pods are rejected in namespaces that enforce PSS "restricted". They are also weaker than every other workload common creates, including standalone valkey.
- **Suggested fix:** add the seccomp profile, and build default container patches from `$secCtx.container`, merged under any user patches.

### M-4. Dependency passwords are still static placeholders (rewritten code keeps the old pattern)

- **Where:** `lib/dependencies/_postgresqlInjector.tpl:21`, `_valkeyInjector.tpl:184`, `_mariadbInjector.tpl:23-26`, `_mongodbInjector.tpl:113-116`, `_clickhouseInjector.tpl:194`
- **Problem:** `| default "PLACEHOLDERPASSWORD"` / `"PLACEHOLDERROOTPASSWORD"`, with no `lookup` and no `randAlphaNum`, while the comments say "Autogenerate". Master did the same, but this PR rewrites these files and breaks the AGENTS.md security rule ("No default or hard-coded passwords … reuse via `lookup`, `randAlphaNum` on first install").
- **Failure scenario:** every release that does not override the password gets its database, valkey (ACL `+@all`) and CNPG app user with a publicly known password.
- **Suggested fix:** `lookup` the existing `<release>-<dep>creds` Secret and reuse its password, generate one on first install, and write it back to `depconfig.password` so the URLs and `cnpg-main-user` stay consistent.

### M-5. Certificates from `route.tls[].certificateIssuer` ignore `route.namespace`

- **Where:** `lib/route/_tlsPlan.tpl:83` (no `namespace` in the certificate objectData). The ListenerSet is created in the route's namespace (`_tlsPlan.tpl:23,51`), and `certificateRefs` have no namespace (`spawner/_route.tpl:113`).
- **Failure scenario:** with `route.namespace` set, the Certificate and its Secret land in the release namespace, the listener reports `ResolvedRefs=False`, and HTTPS fails.
- **Suggested fix:** pass `$route.namespace` to the certificate, include it in the `$certificates` dedupe key, and add a test.

### M-6. Route integration `enabled` flags are typed `boolean|string` + `x-helm-tpl`, but only truthiness is checked

- **Where:** `spawner/_route.tpl:41,47`, `lib/route/_listeners.tpl:65`, `class/_route.tpl:62`, `lib/route/integrations/_traefik.tpl:46`, `lib/route/integrations/_envoy.tpl:76`, `spawner/traefik/_middleware.tpl:62`
- **Failure scenario:** `enabled: "false"`, or a `tpl` string that renders to false, still turns the integration on and creates unwanted ListenerSets, Envoy policies or Middlewares.
- **Suggested fix:** use `tc.v1.common.lib.util.enabled`, or drop `string` and `x-helm-tpl` from the schema.

### M-7. `route.parentRefs[]` fields are documented as `tpl` but printed raw

- **Where:** `schemas/route.json` (`name`, `namespace`, `sectionName`, `port` with `x-helm-tpl`) and `class/_route.tpl:128-137`
- **Failure scenario:** `name: '{{ .Values.gw }}'` is rendered literally, so the route never attaches.
- **Suggested fix:** run `tpl` on these fields in the class (`| int` for `port`), or remove `x-helm-tpl`.

### M-8. Service `type` accepts a `tpl` string in the schema, but the template never runs `tpl` on it

- **Where:** `schemas/service/service.json:248` (new `oneOf` with `^\{\{.*\}\}$`), `templates/class/_service.tpl:14,57,81-105`. The template check of the type was also removed.
- **Failure scenario:** `type: "{{ .Values.svcType }}"` passes the schema, no type branch matches, and the Service silently becomes a ClusterIP with no type-specific spec.
- **Suggested fix:** run `tpl` on the type once in `spawner/_service.tpl`, or drop the `tpl` branch from the schema.

### M-9. Schema drops keys that templates still read

- `secret.<name>.expandObjectName` was removed from `schemas/secret.json` (closed object), but `spawner/_secret.tpl` still calls `lib.util.expandName`. `configmap.json` and `externalSecret.json` still have it.
- `createChartContextConfigmap` was removed from `values.schema.source.json`, but `lib/util/_chartcontext.tpl:16` still reads it, and it is listed in `template-keys-structure.yaml:46`.
- `gatewayClass.json` is closed and does not list `nameOverride`, but `lib/util/_primary_gatewayclass.tpl:34` reads it.
- The coverage check cannot see top-level keys: `check_complete_values_schema_coverage.py:102-106` counts any key under the root `additionalProperties: true` as covered, which also hides `cert`, `podmonitor`, `servicemonitor` and `prometheusRule`.
- **Suggested fix:** restore the keys, and make the coverage script require root keys to be listed in `properties`.

### M-10. `diagnosticMode.enabled` accepts a string in the schema, but the template rejects it

- **Where:** `schemas/global/global.json:48-53`, `schemas/diagnosticMode.json` and `templates/lib/util/_diagnosticMode.tpl:11-13`
- **Failure scenario:** `"true"` passes the schema, then fails at render with "Expected [diagnosticMode.enabled] to be a bool".
- **Suggested fix:** go back to `boolean` in the schema, or accept and `tpl` strings in the template.

### M-11. Unrelated Renovate preset deletion

- **Where:** `.github/renovate/**` (28 files deleted, about 1,000 lines)
- **Problem:** a `common` rework deletes the whole local Renovate preset tree (golden rule 7). This repo's `.github/renovate.json5` only extends `github>trueforge-org/renovate-config`, so behaviour here does not change. But these files were referenced as `github>trueforge-org/truecharts//.github/renovate/...`, a public preset path that other org repos may still extend. Rules that only exist here are also lost (for example the minio `dependencyDashboardApproval` and `customVersioning`).
- **Suggested fix:** take this out of the PR into a separate `chore(ci)` PR, after a grep across the org for `truecharts//.github/renovate`.

### M-12. Build/debug artifact committed ✅

- **Where:** `charts/library/common-test/.debug/common-test/templates/common.yaml`
- **Problem:** this is helm-unittest `--debug` output (golden rule 5). It holds a stale render failure and is not git-ignored.
- **Suggested fix:** delete it and add `.debug/` to `.gitignore`.

---

## Low

### Mistakes

- **L-1.** `templates/class/_externalSecret.tpl:43`: `refreshInterval` is not quoted. `"0"` (ESO's way to disable refresh) renders as the int `0`, and the CRD rejects it. Add `| quote`.
- **L-2.** `templates/lib/externalSecret/_validation.tpl:25,32`: `$storeKind` and `$creationPolicy` are computed but never used. The combinations ESO rejects are not checked (`deletionPolicy: Delete` needs `creationPolicy: Owner`; `Merge` cannot go with `None`).
- **L-3.** `templates/spawner/_networkPolicy.tpl:29-37`: two NetworkPolicies with `primary: true` both get the name `$fullname` and collide. The single-primary check promised in `lib/util/_primary_networkpolicy.tpl` does not exist, and that util is never called.
- **L-4.** `templates/lib/metadata/_selectorLabels.tpl:20-24`: `extraSelectorLabels` go through `tpl` into the immutable `spec.selector`. A value that changes between releases breaks every upgrade with "field is immutable".
- **L-5.** `lib/route/integrations/_traefik.tpl:31,42,50,59`: route Middleware names (`<fullname>-auth`, `-ip-whitelist`, `-themepark`, `-redirect-N`) can collide with chart `ingressMiddlewares.traefik.<n>` (`<fullname>-<n>`).
- **L-6.** `lib/route/_validation.tpl:157-166`, `lib/listenerSet/_validation.tpl:38-48`: a `from: Same` namespace mismatch between ListenerSet and Gateway is not caught (only `None` is). It passes rendering and is rejected at runtime.
- **L-7.** `class/valkey/_cluster.tpl:89-92` and `values.yaml:2239`: the explicit `persistence.retain: false` default means `global.fallbackDefaults.pvcRetain: true` is never honoured for valkey.
- **L-8.** The mariadb password schema has no `minLength`, but `_mariadbInjector.tpl:29-32` fails below 4 characters.
- **L-9.** In `values.schema.source.json`, the defaults of `ubuntuImage`, `postgresClientImage`, `kubectlImage`, `mariadbClientImage`, `mongodbClientImage` and `valkeyClientImage` do not match `values.yaml` (docs only).
- **L-10.** `.github/instructions/charts-values.instructions.md:46` and `common-library-dependencies.instructions.md:17` say MongoDB, ClickHouse and Memcached are gone, or that only valkey, mariadb and postgresql are predefined. `values.yaml` in this PR predefines `dependencies.clickhouse`, `memcached` and `mongodb`, with injectors, tests and docs. `templates/lib/dependencies/_mariadbInjector.tpl` and the other files are fine; the instructions are out of date. Keep `.github/copilot-instructions.md` in sync.
- **L-11.** `charts/library/common/.helmignore:48` is hand-edited (generated file, golden rule 3). It adds the nonexistent `/improve_schemas.py` (also in `templates/helmignore.tpl:48-51`), but misses `/legacy_keys.py` and `/stable-legacy-keys.yaml`, which would then be packaged into the library chart.
- **L-12.** Runtime checks that were moved to the schema (CNPG `mode`/`type`/`logLevel`/`primaryUpdate*`, volsync `type`/`copyMethod`, HPA/VPA, lifecycle and seccomp types, ingress and Traefik `kindIs`) no longer cover objects that common builds itself at render time: addon containers, dependency injector output, and values that are `tpl` strings, which the schema accepts as strings before they render. User values in app charts are still validated through the `$ref`'d schema. Consider keeping template checks only for keys that select a code path (CNPG `mode`, `recovery.method`, volsync `type`, lifecycle `type`), where a bad value renders an empty or wrong block instead of failing.

### Security (low)

- **L-13.** `lib/cnpg/_dbCredentialSecrets.tpl:17-18`: the CNPG basic-auth Secret has unquoted username and password. `#abc` becomes null, and `123456` or `yes` changes type, so the bootstrap secret disagrees with `postgresqlcreds`. This was already the case on master.
- **L-14.** All injectors (for example `_postgresqlInjector.tpl:63,81`, `_valkeyInjector.tpl:201`, `_mariadbInjector.tpl:50`) put credentials into connection URLs without URL-encoding. Passwords containing `@ : / # % ?` break the `url`/`complete` values. This was already the case on master.
- **L-15.** `_dbWait.tpl:220-221`: `mysqladmin -p"${MARIADB_ROOT_PASSWORD}"` puts the root password in `/proc/<pid>/cmdline`. Use `MYSQL_PWD`. (The env now comes from `secretKeyRef`, which is an improvement.)
- **L-16.** `_dbWait.tpl:406`: the PostgreSQL wait inserts user, database and host into shell unquoted. A value with spaces or metacharacters loops forever or runs shell code. Pass them as env vars and quote them, as the valkey and mariadb waits do.
- **L-17.** Open pass-through objects (`additionalProperties: {description}`) in `route.json` (`rules[].filters[]`, `backendRefs[].filters[]`, `retry`, `sessionPersistence`, the envoy policy specs), the `route/match.json` method object, and `gateway.json` `tls.frontend`/`tls.backend`. This is effectively an open schema under golden rule 10. Type the fixed Gateway API shapes, or document the Envoy pass-through as an intended exception.
- **L-18.** `install_dependencies.sh:68`: the Gateway API CRDs are applied from a pinned-tag GitHub URL without a checksum. This is acceptable for CI; a checksum would harden it.

### Performance

- **L-19.** `configMapsFromFolder` (`lib/util/files/_collectFromFolder.tpl`, `_isBinaryFile.tpl`, `lib/configmap/_validation.tpl`):
  - The `**` glob runs twice (validation and collect), plus once per folder. Each file is read 2-3 times, and every text file gets a full-content regex and `toYaml`.
  - All text that is not marked `escaped` goes through `tpl`, which is slow and breaks on any file containing `{{`.
  - Sanitised folder names can collide (`a.b` and `a-b`), and the second silently overwrites the first.
  - `replace` should be `trimPrefix`, and the 1 MiB ConfigMap limit is not checked.
- **L-20.** Routes: each route runs O(n) scans over all routes and gateways (`util.route.primary` in `route.getFullName`, `util.gateway.primary` in `gateway.getFullName`) up to 3 times (validation, `tlsPlan`, render), and `lib.route.backend` calls `util.service.primary` per backendRef. This is O(n²), which is fine at chart scale but worth caching in one `$rootCtx` dict per render.
- **L-21.** CI cost: PR install jobs go from 50 to 78. The four CNPG variants (pg16, pg17, pg18, pg18-postgis) each run the operator with `instances: 2` and a 2-instance pooler, and differ only in the image. Use 1 instance for the image variants, or run them only on master.

### Hygiene

- **L-22.** `generate_template_keys_structure.py` has 44 lines with trailing whitespace again (0 on master), so the `trailing-whitespace` hook fails.
- **L-23.** Dead code:
  - `run_common_tests.sh:20` (`common_test_path`, always overwritten at line 94)
  - `lib/traefik/middlewares/_forwardAuth.tpl:9-11` (`$sizeKind`)
  - the unused `$validMethods` in the CNPG `primaryUpdateMethod` validation

---

## Checked, no issue found

- **Selector labels:** the `selectorLabels` rewrite keeps the same keys and values (now quoted). Deployment, StatefulSet and DaemonSet selectors do not change on upgrade.
- **Pod security defaults:** UID/GID 568, `readOnlyRootFilesystem`, no privilege escalation, drop ALL, `RuntimeDefault` seccomp and `automountServiceAccountToken: false` are unchanged.
- **Tailscale:** the auth key now goes into a Secret and is read with `secretKeyRef`, which is an improvement.
- **Credentials:** NOTES mask credentials by default. The wait containers read DB credentials through `secretKeyRef`.
- **CNPG barman-cloud plugin wiring:** `Cluster.spec.plugins`, `Backup`/`ScheduledBackup` `method: plugin`, `ObjectStore` (`barmancloud.cnpg.io/v1`) and the externalCluster plugin recovery match the plugin API. `serverName` and `destinationPath` are the same as on master, so existing archives are still found. The Cluster and `cnpg-main-user` names are kept.
- **Wait loops:** they sleep between attempts and have a bounded timeout per attempt.
- **Schema:** only the root has `additionalProperties: true`. Size grew from 379 KB to 525 KB (380 KB minified), with `$ref`s kept rather than inlined, so there is no render-time concern.
- **Python tooling:** YAML loading is safe (`safe_load` or a `SafeLoader` subclass), and the checkers exit non-zero on failure.
- **`common-test`:** `Chart.yaml` stays at `1.0.0`. The tests and ci values have no real-looking secrets, and no privileged, hostNetwork or hostPath settings.
- **Scope:** there are no changes under `charts/stable/**` or `charts/incubator/**`, and no `Chart.lock`, `*.tgz` or `__snapshot__/` files (apart from M-12).
- **Version bump:** the `common` version is not bumped. That is correct as long as this PR targets the `common2026` branch. A PR of this branch into `master` needs `32.0.0` (breaking).
