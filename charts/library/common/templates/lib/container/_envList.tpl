{{/* Returns Env List */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.container.envList" (dict "rootCtx" $ "objectData" $objectData) }}
rootCtx: The root context of the chart.
objectData: The object data to be used to render the container.
*/}}
{{- define "tc.v1.common.lib.container.envList" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $key := .key -}}
  {{- $name := (.name | toString) -}}
  {{- $caller := .caller -}}

  {{- range $env := $objectData.envList -}}
    {{- if not $env.name -}}
      {{- fail (printf "%s - Expected non-empty [%s.%s.envList.name]" $caller $key $name) -}}
    {{- end -}} {{/* Empty value is valid */}}
    {{- include "tc.v1.common.helper.container.envDupeCheck" (dict "rootCtx" $rootCtx "objectData" $objectData "source" (printf "%s.%s.envList" $key $name) "key" $env.name "caller" $caller) -}}
    {{- $value := $env.value -}}
    {{- if kindIs "string" $env.value -}}
      {{- $value = tpl $env.value $rootCtx -}}
    {{- end }}
- name: {{ $env.name | quote }}
  value: {{ include "tc.v1.common.helper.makeIntOrNoop" $value | quote }}
  {{- end -}}
{{- end -}}
