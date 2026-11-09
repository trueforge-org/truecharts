---
applyTo: "templates/helm-release.schema.json.tpl"
paths:
  - "templates/helm-release.schema.json.tpl"
description: "Rules for the HelmRelease schema template that is published to the website for each common version"
---

# HelmRelease schema template

These rules apply to `templates/helm-release.schema.json.tpl`. They add to the general rules in [`AGENTS.md`](../../AGENTS.md).

- The template is a JSON schema for a Flux `HelmRelease`. It wraps the Flux `helmrelease_v2` schema and validates `spec.values` against the published `common` values schema.
- On release, the `Copy common schemas to website` step of `.github/workflows/charts-release.yaml` replaces `__COMMON_VERSION__` with the version from the `Chart.yaml` of `common`. It writes the result to the website repository (`trueforge-org/websites`) as `truecharts/public/schemas/helm-release/<version>.schema.json`.
- Keep `__COMMON_VERSION__` as the only placeholder, and keep the file valid JSON once it is replaced.
- The `$ref` to the `common` schema must use the same URL format as the `values.schema.json` files of the charts: `https://raw.githubusercontent.com/trueforge-org/websites/refs/heads/main/truecharts/public/schemas/common/<version>.schema.json`. Change both together.
- Do not hand-edit the published `helm-release` files, they are generated from this template.
