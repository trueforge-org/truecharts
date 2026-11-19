{{/* Secret rendered data */}}
{{/* Returns the data of a secret as YAML, after dropEmptyKeys and tpl are applied.
Certificate and imagePullSecret data is not passed through tpl.
Shared by the secret class and the checksum helpers, so both always agree.
Call this template:
{{ include "tc.v1.common.lib.secret.renderData" (dict "rootCtx" $ "objectData" $objectData) }}
*/}}
{{- define "tc.v1.common.lib.secret.renderData" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- if mustHas $objectData.type (list "certificate" "imagePullSecret") -}}
    {{- toYaml $objectData.data -}}
  {{- else -}}
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
      {{- tpl (toYaml $data) $rootCtx -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
