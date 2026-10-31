{{- define "tc.v1.common.lib.networkpolicy.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{/* Validate that only one pod selection method is used */}}
  {{- $selectionCount := 0 -}}
  {{- if $objectData.podSelector -}}
    {{- $selectionCount = add1 $selectionCount -}}
  {{- end -}}
  {{- if or $objectData.targetSelector $objectData.targetSelectorRegex -}}
    {{- $selectionCount = add1 $selectionCount -}}
  {{- end -}}
  {{- if $objectData.targetAllPods -}}
    {{- $selectionCount = add1 $selectionCount -}}
  {{- end -}}
  {{- if gt $selectionCount 1 -}}
    {{- fail "NetworkPolicy - Only one of [podSelector, targetSelector/targetSelectorRegex, targetAllPods] can be specified" -}}
  {{- end -}}

  {{/* Validate policyTypes if specified */}}
  {{- if $objectData.policyTypes -}}
    {{- $validTypes := (list "Ingress" "Egress") -}}
    {{- range $objectData.policyTypes -}}
      {{- if not (has . $validTypes) -}}
        {{- fail (printf "NetworkPolicy - policyTypes must be one of [Ingress, Egress], got [%s]" .) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* Validate controller target selectors */}}
  {{- range $key := (list "targetSelector" "targetSelectorRegex") -}}
    {{- if hasKey $objectData $key -}}
      {{- $selectors := get $objectData $key -}}
      {{- if kindIs "string" $selectors -}}
        {{- if ne $selectors "" -}}
          {{- $selectors = list $selectors -}}
        {{- else -}}
          {{- $selectors = list -}}
        {{- end -}}
      {{- else if not (kindIs "slice" $selectors) -}}
        {{- fail (printf "NetworkPolicy - Expected [%s] to be a [string] or [list], but got [%s]" $key (kindOf $selectors)) -}}
      {{- end -}}
      {{- range $selectors -}}
        {{- if not (kindIs "string" .) -}}
          {{- fail (printf "NetworkPolicy - Expected [%s] entries to be [string], but got [%s]" $key (kindOf .)) -}}
        {{- end -}}
        {{- if eq . "" -}}
          {{- fail (printf "NetworkPolicy - Expected [%s] entries to be non-empty" $key) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

{{- end -}}
