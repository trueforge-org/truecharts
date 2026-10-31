{{/* Fails if more than one enabled object in the given key is primary */}}
{{- define "tc.v1.common.lib.gateway.primaryValidation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $key := .key -}}
  {{- $caller := .caller -}}

  {{- $primaries := list -}}
  {{- range $name, $object := (get $rootCtx.Values $key) -}}
    {{- if and (kindIs "map" $object) $object.primary (eq (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $object "name" $name "key" $key "caller" $caller)) "true") -}}
      {{- $primaries = mustAppend $primaries $name -}}
    {{- end -}}
  {{- end -}}

  {{- if gt (len $primaries) 1 -}}
    {{- fail (printf "%s - Only one [%s] can be primary, got [%s]" $caller $key (join ", " $primaries)) -}}
  {{- end -}}
{{- end -}}

{{/* Same as util.enabled, but an object without [enabled] counts as disabled */}}
{{- define "tc.v1.common.lib.gateway.enabled" -}}
  {{- if or (not (kindIs "map" .objectData)) (kindIs "invalid" .objectData.enabled) -}}
    {{- print "false" -}}
  {{- else -}}
    {{- include "tc.v1.common.lib.util.enabled" (dict
          "rootCtx" .rootCtx "objectData" .objectData
          "name" .name "caller" .caller "key" .key) -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.lib.gateway.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $name := .name -}}

  {{- if not $objectData.listeners -}}
    {{- fail (printf "Gateway - Expected non-empty [gateway.%s.listeners]" $name) -}}
  {{- end -}}

  {{- $listenerNames := list -}}
  {{- range $objectData.listeners -}}
    {{- if mustHas .name $listenerNames -}}
      {{- fail (printf "Gateway - Expected listener names in [gateway.%s.listeners] to be unique, but [%s] is defined more than once" $name .name) -}}
    {{- end -}}
    {{- $listenerNames = mustAppend $listenerNames .name -}}
  {{- end -}}
{{- end -}}
