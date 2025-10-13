{{/* Returns Env From */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.container.envFrom" (dict "rootCtx" $ "objectData" $objectData) }}
rootCtx: The root context of the chart.
objectData: The object data to be used to render the container.
*/}}
{{- define "tc.v1.common.lib.container.envFrom" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $key := .key -}}
  {{- $name := (.name | toString) -}}
  {{- $caller := .caller -}}

  {{- $refs := (list "configMapRef" "secretRef") -}}
  {{- range $envFrom := $objectData.envFrom -}}
    {{- if and (not $envFrom.secretRef) (not $envFrom.configMapRef) -}}
      {{- fail (printf "%s - Expected [envFrom] entry in [%s.%s] to have one of [%s]" $caller $key $name (join ", " $refs)) -}}
    {{- end -}}

    {{- if and $envFrom.secretRef $envFrom.configMapRef -}}
      {{- fail (printf "%s - Expected [envFrom] entry in [%s.%s] to have only one of [%s], but got both" $caller $key $name (join ", " $refs)) -}}
    {{- end -}}

    {{- range $ref := $refs -}}
      {{- with (get $envFrom $ref) -}}
        {{- if not .name -}}
          {{- fail (printf "%s - Expected non-empty [%s.%s.envFrom.%s.name]" $caller $key $name $ref) -}}
        {{- end -}}

        {{- $objectName := tpl .name $rootCtx -}}

        {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                        "rootCtx" $rootCtx "objectData" .
                        "name" $ref "caller" $caller
                        "key" "envFrom")) -}}

        {{- if eq $expandName "true" -}}
          {{- $object := dict -}}
          {{- $source := "" -}}
          {{- if eq $ref "configMapRef" -}}
            {{- $object = (get $rootCtx.Values.configmap $objectName) -}}
            {{- $source = "ConfigMap" -}}
          {{- else if eq $ref "secretRef" -}}
            {{- $object = (get $rootCtx.Values.secret $objectName) -}}
            {{- $source = "Secret" -}}
          {{- end -}}

            {{- if not $object -}}
              {{- fail (printf "%s - Expected %s [%s] defined in [%s.%s.envFrom] to exist" $caller $source $objectName $key $name) -}}
            {{- end -}}
          {{- range $k, $v := $object.data -}}
            {{- include "tc.v1.common.helper.container.envDupeCheck" (dict "rootCtx" $rootCtx "objectData" $objectData "source" (printf "%s - %s" $source $objectName) "key" $k "caller" $caller) -}}
          {{- end -}}

          {{- $objectName = (printf "%s-%s" (include "tc.v1.common.lib.chart.names.fullname" $rootCtx) $objectName) -}}
        {{- end }}
- {{ $ref }}:
    name: {{ $objectName | quote }}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
