{{/* Configmap rendered data */}}
{{/* Returns the data of a configmap as YAML, after dropEmptyKeys and tpl are applied.
Shared by the configmap class and the checksum helpers, so both always agree.
Call this template:
{{ include "tc.v1.common.lib.configmap.renderData" (dict "rootCtx" $ "objectData" $objectData) }}
*/}}
{{- define "tc.v1.common.lib.configmap.renderData" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $dropped := false -}}
  {{- $data := $objectData.data -}}
  {{- if include "tc.v1.common.lib.util.dropEmptyKeys" (dict "rootCtx" $rootCtx "objectData" $objectData) -}}
    {{- $dropped = true -}}
    {{- $data = dict -}}
    {{- range $k, $v := $objectData.data -}}
      {{- if not (include "tc.v1.common.lib.util.isEmptyValue" (dict "rootCtx" $rootCtx "value" $v)) -}}
        {{- $_ := set $data $k $v -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  {{- if and (not $data) $dropped -}}
    {{- print "{}" -}}
  {{- else -}}
    {{- $dataYaml := toYaml $data -}}
    {{/* Only run tpl on data that has template delimiters */}}
    {{- if contains "{{" $dataYaml -}}
      {{- $dataYaml = tpl $dataYaml $rootCtx -}}
    {{- end -}}
    {{- $dataYaml -}}
  {{- end -}}
{{- end -}}
