{{/* ListenerSet Validation */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.listenerSet.validation" (dict "rootCtx" $ "objectData" $objectData "name" $name) -}}
rootCtx: The root context of the chart.
objectData:
  targetSelector: The name of a gateway in this chart to attach to.
  parentRef: The Gateway to attach to, when targetSelector is not used.
name: The short name of the listener set.
*/}}

{{- define "tc.v1.common.lib.listenerSet.validation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $name := .name -}}

  {{- if and (hasKey $objectData "parentRef") (not (kindIs "map" $objectData.parentRef)) -}}
    {{- fail (printf "ListenerSet - Expected [listenerSet.%s.parentRef] to be a dictionary, but got [%s]" $name (kindOf $objectData.parentRef)) -}}
  {{- end -}}

  {{- $parentRef := $objectData.parentRef | default dict -}}

  {{- if and $objectData.targetSelector $parentRef.name -}}
    {{- fail (printf "ListenerSet - Only one of [targetSelector, parentRef.name] can be specified in [listenerSet.%s]" $name) -}}
  {{- end -}}

  {{- if and (not $objectData.targetSelector) (not $parentRef.name) -}}
    {{- fail (printf "ListenerSet - Expected one of [targetSelector, parentRef.name] in [listenerSet.%s] to be non-empty" $name) -}}
  {{- end -}}

  {{- with $objectData.targetSelector -}}
    {{- $targetName := . -}}
    {{- if not (kindIs "string" .) -}}
      {{- fail (printf "ListenerSet - Expected [listenerSet.%s.targetSelector] to be a string, but got [%s]" $name (kindOf .)) -}}
    {{- end -}}

    {{- $target := get ($rootCtx.Values.gateway | default dict) . -}}
    {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $target "name" . "key" "gateway" "caller" "ListenerSet")) "true" -}}
      {{- fail (printf "ListenerSet - Expected [targetSelector] of listenerSet [%s] to reference an enabled gateway, got [%s]" $name .) -}}
    {{- end -}}

    {{/* Gateways reject ListenerSets unless allowedListeners is configured, catch that at render time */}}
    {{- $allowedNamespaces := (($target.allowedListeners | default dict).namespaces | default dict) -}}
    {{- $allowedFrom := $allowedNamespaces.from | default "None" -}}
    {{- if eq $allowedFrom "None" -}}
      {{- fail (printf "ListenerSet - Expected gateway [%s] referenced by [listenerSet.%s.targetSelector] to allow listener sets, set [gateway.%s.allowedListeners.namespaces.from] to one of [Same, All, Selector]" . $name .) -}}
    {{- end -}}
    {{- if not (mustHas $allowedFrom (list "Same" "All" "Selector")) -}}
      {{- fail (printf "ListenerSet - Expected [gateway.%v.allowedListeners.namespaces.from] to be one of [Same, All, Selector], but got [%v]" $targetName $allowedFrom) -}}
    {{- end -}}
    {{- if and (eq $allowedFrom "Selector") (not (kindIs "map" $allowedNamespaces.selector)) -}}
      {{- fail (printf "ListenerSet - Expected [gateway.%v.allowedListeners.namespaces.selector] when from is [Selector]" $targetName) -}}
    {{- end -}}
  {{- end -}}

{{- end -}}
