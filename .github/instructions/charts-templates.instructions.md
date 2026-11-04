---
applyTo: "charts/stable/*/templates/**,charts/incubator/*/templates/**"
paths:
  - "charts/stable/*/templates/**"
  - "charts/incubator/*/templates/**"
description: "Rules for custom templates in application charts"
---

# Application chart templates

These rules apply to `templates/` of application charts. They add to [`charts.instructions.md`](charts.instructions.md) and [`AGENTS.md`](../../AGENTS.md).

Only add templates when values alone are not enough, and never hand-write Kubernetes manifests. Follow the existing pattern (see `charts/stable/anonaddy`):

```yaml
{{/* templates/common.yaml */}}
{{- include "tc.v1.common.loader.init" . -}}

{{- $secrets := include "<chart>.secrets" . | fromYaml -}}
{{- if $secrets -}}
  {{- $_ := set .Values.secret "<chart>-secrets" $secrets -}}
{{- end -}}

{{- include "tc.v1.common.loader.apply" . -}}
```

- Define helpers in `templates/_<name>.tpl`, named `<chart>.<name>`.
- Generated secrets must stay stable across upgrades. Look up the existing Secret with `lookup` and reuse its data, falling back to `randAlphaNum` only on first install.
