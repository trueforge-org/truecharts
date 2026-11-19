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

{{/* Validates the listeners of a Gateway or ListenerSet. caller and key default to Gateway */}}
{{- define "tc.v1.common.lib.gateway.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $name := .name -}}
  {{- $caller := .caller | default "Gateway" -}}
  {{- $key := .key | default "gateway" -}}

  {{- if not $objectData.listeners -}}
    {{- fail (printf "%s - Expected non-empty [%s.%s.listeners]" $caller $key $name) -}}
  {{- end -}}

  {{- $listenerNames := list -}}
  {{- range $objectData.listeners -}}
    {{- if mustHas .name $listenerNames -}}
      {{- fail (printf "%s - Expected listener names in [%s.%s.listeners] to be unique, but [%s] is defined more than once" $caller $key $name .name) -}}
    {{- end -}}
    {{- $listenerNames = mustAppend $listenerNames .name -}}
  {{- end -}}
{{- end -}}
