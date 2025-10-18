{{/* Check Env for Duplicates */}}
{{/* Call this template:
{{ include "tc.v1.common.helper.container.envDupeCheck" (dict "rootCtx" $ "objectData" $objectData "source" $source "key" $key) }}
rootCtx: The root context of the chart.
objectData: The object data to be used to render the container.
*/}}
{{- define "tc.v1.common.helper.container.envDupeCheck" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $caller := .caller -}}

  {{- $source := .source -}}
  {{- $type := .type -}}
  {{- $key := .key -}}

  {{- $dupeEnv := (get $objectData.envDupe $key) -}}

  {{- if $dupeEnv -}}
    {{- fail (printf "%s - Environment Variable [%s] in [%s] tried to override the Environment Variable that is already defined in [%s]" $caller $key $source $dupeEnv.source) -}}
  {{- end -}}

  {{- $_ := set $objectData.envDupe $key (dict "source" $source) -}}

{{- end -}}
