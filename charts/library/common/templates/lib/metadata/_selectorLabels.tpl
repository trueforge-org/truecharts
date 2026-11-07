{{/* Labels that are used on selectors */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.metadata.selectorLabels" (dict "rootCtx" $rootCtx "objectType" $objectType "objectName" $objectName) }}
podName is the "shortName" of the pod. The one you define in the .Values.workload
*/}}
{{- define "tc.v1.common.lib.metadata.selectorLabels" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectType := .objectType -}}
  {{- $objectName := .objectName -}}
  {{- $selectorLabels := dict
        "app.kubernetes.io/name" (include "tc.v1.common.lib.chart.names.name" $rootCtx)
        "app.kubernetes.io/instance" $rootCtx.Release.Name -}}

  {{- if and $objectType $objectName -}}
    {{- $_ := set $selectorLabels (printf "%s.name" $objectType) $objectName -}}
  {{- end -}}

  {{- if and (eq $objectType "pod") $objectName (hasKey $rootCtx.Values.workload $objectName) -}}
    {{- $workload := get $rootCtx.Values.workload $objectName -}}
    {{- range $key, $value := $workload.extraSelectorLabels -}}
      {{- if hasKey $selectorLabels $key -}}
        {{- fail (printf "Workload - extraSelectorLabels cannot override selector label [%s]" $key) -}}
      {{- end -}}
      {{- $_ := set $selectorLabels $key (tpl (toString $value) $rootCtx) -}}
    {{- end -}}
  {{- end -}}

  {{- range $key, $value := $selectorLabels }}
{{ $key }}: {{ toString $value | quote }}
{{- end -}}
{{- end -}}
