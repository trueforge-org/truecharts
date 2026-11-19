{{/* Returns the name of the primary [route], [gateway] or [service], computed once per render.
The result is kept in a private dict on the chartContext, which lives as long as one render.
Usage: include "tc.v1.common.lib.util.primaryCached" (dict "rootCtx" $ "kind" "route")
*/}}
{{- define "tc.v1.common.lib.util.primaryCached" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $kind := .kind -}}

  {{- $context := $rootCtx.Values.chartContext -}}
  {{- if kindIs "map" $context -}}
    {{- if not (kindIs "map" (get $context "primaryCache")) -}}
      {{- $_ := set $context "primaryCache" dict -}}
    {{- end -}}
    {{- $cache := get $context "primaryCache" -}}
    {{- if not (hasKey $cache $kind) -}}
      {{- $_ := set $cache $kind (include (printf "tc.v1.common.lib.util.%s.primary" $kind) (dict "rootCtx" $rootCtx)) -}}
    {{- end -}}
    {{- get $cache $kind -}}
  {{- else -}}
    {{- include (printf "tc.v1.common.lib.util.%s.primary" $kind) (dict "rootCtx" $rootCtx) -}}
  {{- end -}}
{{- end -}}
