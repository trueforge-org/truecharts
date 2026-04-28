{{- define "tc.v1.common.lib.networkpolicy.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{/* Validate that only one pod selection method is used */}}
  {{- $selectionCount := 0 -}}
  {{- if $objectData.podSelector -}}
    {{- $selectionCount = add1 $selectionCount -}}
  {{- end -}}
  {{- if $objectData.targetSelector -}}
    {{- $selectionCount = add1 $selectionCount -}}
  {{- end -}}
  {{- if $objectData.targetAllPods -}}
    {{- $selectionCount = add1 $selectionCount -}}
  {{- end -}}
  {{- if gt $selectionCount 1 -}}
    {{- fail "NetworkPolicy - Only one of [podSelector, targetSelector, targetAllPods] can be specified" -}}
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

  {{/* Validate targetSelector is a string */}}
  {{- if and $objectData.targetSelector (not (kindIs "string" $objectData.targetSelector)) -}}
    {{- fail (printf "NetworkPolicy - Expected [targetSelector] to be [string], but got [%s]" (kindOf $objectData.targetSelector)) -}}
  {{- end -}}

{{- end -}}
