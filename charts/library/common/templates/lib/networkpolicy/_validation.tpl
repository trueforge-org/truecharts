{{/* Returns the type of a networkpolicy, [kubernetes] (default) or [cilium] */}}
{{- define "tc.v1.common.lib.networkpolicy.type" -}}
  {{- $type := .objectData.type | default "kubernetes" -}}
  {{- if kindIs "string" $type -}}
    {{- $type = tpl $type .rootCtx -}}
  {{- end -}}
  {{- $type -}}
{{- end -}}

{{/* Returns whether a cilium networkpolicy is clusterwide, as a string */}}
{{- define "tc.v1.common.lib.networkpolicy.clusterwide" -}}
  {{- $clusterwide := .objectData.clusterwide | default false -}}
  {{- if kindIs "string" $clusterwide -}}
    {{- $clusterwide = tpl $clusterwide .rootCtx -}}
  {{- end -}}
  {{- $clusterwide -}}
{{- end -}}

{{- define "tc.v1.common.lib.networkpolicy.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{/* Validate the policy type */}}
  {{- $type := include "tc.v1.common.lib.networkpolicy.type" (dict "rootCtx" $rootCtx "objectData" $objectData) -}}
  {{- if not (mustHas $type (list "kubernetes" "cilium")) -}}
    {{- fail (printf "NetworkPolicy - Expected [type] to be one of [kubernetes, cilium], but got [%s]" $type) -}}
  {{- end -}}

  {{- $clusterwide := include "tc.v1.common.lib.networkpolicy.clusterwide" (dict "rootCtx" $rootCtx "objectData" $objectData) -}}
  {{- if not (mustHas $clusterwide (list "true" "false")) -}}
    {{- fail (printf "NetworkPolicy - Expected [clusterwide] to be [true] or [false], but got [%s]" $clusterwide) -}}
  {{- end -}}

  {{/* Keys that only make sense for one of the policy types */}}
  {{- if eq $type "kubernetes" -}}
    {{- range $key := (list "endpointSelector" "nodeSelector" "ingressDeny" "egressDeny" "enableDefaultDeny" "description") -}}
      {{- if hasKey $objectData $key -}}
        {{- fail (printf "NetworkPolicy - Key [%s] is only supported when [type] is [cilium]" $key) -}}
      {{- end -}}
    {{- end -}}
    {{- if eq $clusterwide "true" -}}
      {{- fail "NetworkPolicy - Key [clusterwide] is only supported when [type] is [cilium]" -}}
    {{- end -}}
  {{- else -}}
    {{- if hasKey $objectData "podSelector" -}}
      {{- fail "NetworkPolicy - Key [podSelector] is not supported when [type] is [cilium], use [endpointSelector] instead" -}}
    {{- end -}}
    {{- if hasKey $objectData "policyTypes" -}}
      {{- fail "NetworkPolicy - Key [policyTypes] is not supported when [type] is [cilium], Cilium derives the policy types from the defined rules" -}}
    {{- end -}}
    {{- if and (hasKey $objectData "nodeSelector") (ne $clusterwide "true") -}}
      {{- fail "NetworkPolicy - Key [nodeSelector] requires [clusterwide: true]" -}}
    {{- end -}}
    {{- if and (hasKey $objectData "enableDefaultDeny") (not (kindIs "map" $objectData.enableDefaultDeny)) -}}
      {{- fail (printf "NetworkPolicy - Expected [enableDefaultDeny] to be a dictionary, but got [%s]" (kindOf $objectData.enableDefaultDeny)) -}}
    {{- end -}}
  {{- end -}}

  {{/* Validate that only one pod selection method is used */}}
  {{- $selectionCount := 0 -}}
  {{- range $key := (list "podSelector" "endpointSelector" "nodeSelector") -}}
    {{- if or (and (eq $key "podSelector") (get $objectData $key)) (and (ne $key "podSelector") (hasKey $objectData $key)) -}}
      {{- $selectionCount = add1 $selectionCount -}}
    {{- end -}}
  {{- end -}}
  {{- if or $objectData.targetSelector $objectData.targetSelectorRegex -}}
    {{- $selectionCount = add1 $selectionCount -}}
  {{- end -}}
  {{- if $objectData.targetAllPods -}}
    {{- $selectionCount = add1 $selectionCount -}}
  {{- end -}}
  {{- if gt $selectionCount 1 -}}
    {{- if eq $type "cilium" -}}
      {{- fail "NetworkPolicy - Only one of [endpointSelector, nodeSelector, targetSelector/targetSelectorRegex, targetAllPods] can be specified" -}}
    {{- else -}}
      {{- fail "NetworkPolicy - Only one of [podSelector, targetSelector/targetSelectorRegex, targetAllPods] can be specified" -}}
    {{- end -}}
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
