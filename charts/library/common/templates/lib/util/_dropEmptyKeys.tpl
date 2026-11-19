{{/* Returns "true" when empty keys should be dropped, otherwise an empty string */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.util.dropEmptyKeys" (dict "rootCtx" $ "objectData" $objectData) }}
rootCtx: The root context of the chart.
objectData: The object (container, secret, configmap). Its [dropEmptyKeys]
            takes precedence over [global.dropEmptyKeys].
*/}}
{{- define "tc.v1.common.lib.util.dropEmptyKeys" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- $drop := false -}}
  {{- with $rootCtx.Values.global -}}
    {{- if not (kindIs "invalid" .dropEmptyKeys) -}}
      {{- $drop = .dropEmptyKeys -}}
    {{- end -}}
  {{- end -}}

  {{- if and (kindIs "map" $objectData) (hasKey $objectData "dropEmptyKeys") -}}
    {{- if not (kindIs "invalid" $objectData.dropEmptyKeys) -}}
      {{- $drop = $objectData.dropEmptyKeys -}}
    {{- end -}}
  {{- end -}}

  {{- if kindIs "string" $drop -}}
    {{- $drop = tpl $drop $rootCtx -}}
  {{- end -}}

  {{- if eq (toString $drop) "true" -}}
    {{- print "true" -}}
  {{- end -}}
{{- end -}}

{{/* Returns "true" when the value is nil or an empty string (after tpl) */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.util.isEmptyValue" (dict "rootCtx" $ "value" $value) }}
*/}}
{{- define "tc.v1.common.lib.util.isEmptyValue" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $value := .value -}}

  {{- if kindIs "invalid" $value -}}
    {{- print "true" -}}
  {{- else if kindIs "string" $value -}}
    {{- if eq (tpl $value $rootCtx) "" -}}
      {{- print "true" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
