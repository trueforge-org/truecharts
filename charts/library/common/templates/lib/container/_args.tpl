{{/* Returns args list */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.container.args" (dict "rootCtx" $ "objectData" $objectData) }}
rootCtx: The root context of the chart.
objectData: The object data to be used to render the container.
*/}}
{{- define "tc.v1.common.lib.container.args" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $dropEmpty := include "tc.v1.common.lib.util.dropEmptyKeys" (dict "rootCtx" $rootCtx "objectData" $objectData) -}}

  {{- range $key := (list "args" "extraArgs") -}}
    {{- with (get $objectData $key) -}}
      {{- if kindIs "string" . -}}
        {{- if not (and $dropEmpty (include "tc.v1.common.lib.util.isEmptyValue" (dict "rootCtx" $rootCtx "value" .))) }}
- {{ tpl . $rootCtx | quote }}
        {{- end -}}
      {{- else if kindIs "slice" . -}}
        {{- range $arg := . -}}
          {{- if not (and $dropEmpty (include "tc.v1.common.lib.util.isEmptyValue" (dict "rootCtx" $rootCtx "value" $arg))) }}
- {{ tpl $arg $rootCtx | quote }}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
