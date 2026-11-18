{{/*
This template serves as a blueprint for networkPolicy objects that are created
using the common library.
*/}}
{{- define "tc.v1.common.class.networkpolicy" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $targetWorkloads := include "tc.v1.common.lib.networkpolicy.targetWorkloads" (dict "rootCtx" $rootCtx "objectData" $objectData) | fromJsonArray -}}
---
kind: NetworkPolicy
apiVersion: {{ include "tc.v1.common.capabilities.networkpolicy.apiVersion" $rootCtx }}
metadata:
  name: {{ $objectData.name }}
  namespace: {{ include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "networkPolicy") }}
  {{- $labels := (mustMerge ($objectData.labels | default dict) (include "tc.v1.common.lib.metadata.allLabels" $rootCtx | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "labels" $labels) | trim) }}
  labels:
    {{- . | nindent 4 }}
  {{- end -}}
  {{- $annotations := (mustMerge ($objectData.annotations | default dict) (include "tc.v1.common.lib.metadata.allAnnotations" $rootCtx | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "annotations" $annotations) | trim) }}
  annotations:
    {{- . | nindent 4 }}
  {{- end }}
spec:
  {{- if $objectData.podSelector }}
  podSelector:
  {{- tpl (toYaml $objectData.podSelector) $rootCtx | nindent 4 }}
  {{/* Target all pods in namespace */}}
  {{- else if $objectData.targetAllPods }}
  podSelector: {}
  {{/* Target one or more workloads in this chart, or everything in this chart by default */}}
  {{- else }}
  podSelector:
    {{- include "tc.v1.common.lib.networkpolicy.workloadSelector" (dict "rootCtx" $rootCtx "targetWorkloads" $targetWorkloads) | nindent 4 }}
  {{- end }}

  {{- if $objectData.policyTypes }}
  policyTypes:
    {{- $objectData.policyTypes | toYaml | nindent 4 }}
  {{- else }}
    {{- $hasingress := false -}}
    {{- $hasegress := false -}}
    {{- if $objectData.ingress -}}
      {{- $hasingress = true -}}
    {{- end -}}
    {{- if $objectData.egress -}}
      {{- $hasegress = true -}}
    {{- end -}}
    {{- if or $hasingress $hasegress }}
  policyTypes:
      {{- if $hasingress }}
    - Ingress
      {{- end }}
      {{- if $hasegress }}
    - Egress
      {{- end }}
    {{- end -}}
  {{- end }}

  {{- if $objectData.egress }}
  egress:
    {{- range $objectData.egress }}
    {{- include "tc.v1.common.lib.networkpolicy.rule" (dict "rule" . "peerKey" "to" "dir" "egress") | nindent 2 }}
    {{- end }}
  {{- end }}

  {{- if $objectData.ingress }}
  ingress:
    {{- range $objectData.ingress }}
    {{- include "tc.v1.common.lib.networkpolicy.rule" (dict "rule" . "peerKey" "from" "dir" "ingress") | nindent 2 }}
    {{- end }}
  {{- end }}
{{- end -}}

{{/* Renders one list item of a Kubernetes NetworkPolicy rule: its peers, and ports */}}
{{- define "tc.v1.common.lib.networkpolicy.rule" -}}
  {{- $rule := .rule -}}
  {{- $peerKey := .peerKey -}}
  {{- $dir := .dir -}}

  {{- $out := dict -}}
  {{- $peerList := (get $rule $peerKey) | default list -}}
  {{- if $peerList -}}
    {{- $peers := list -}}
    {{- range $peer := $peerList -}}
      {{- $result := dict -}}
      {{- if and (kindIs "map" $peer.ipBlock) $peer.ipBlock.cidr -}}
        {{- $ipBlock := dict "cidr" $peer.ipBlock.cidr -}}
        {{- if $peer.ipBlock.except -}}
          {{- $_ := set $ipBlock "except" $peer.ipBlock.except -}}
        {{- end -}}
        {{- $_ := set $result "ipBlock" $ipBlock -}}
      {{- else -}}
        {{- range $sel := (list "namespaceSelector" "podSelector") -}}
          {{- $selData := get $peer $sel -}}
          {{- if kindIs "map" $selData -}}
            {{- $rendered := dict -}}
            {{- range $k := (list "matchLabels" "matchExpressions") -}}
              {{- if get $selData $k -}}
                {{- $_ := set $rendered $k (get $selData $k) -}}
              {{- end -}}
            {{- end -}}
            {{- $_ := set $result $sel $rendered -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
      {{- if $result -}}
        {{- $peers = mustAppend $peers $result -}}
      {{- end -}}
    {{- end -}}
    {{- if not $peers -}}
      {{- fail (printf "NetworkPolicy - Expected [%s.%s] entries to define at least one of [ipBlock.cidr, namespaceSelector, podSelector]" $dir $peerKey) -}}
    {{- end -}}
    {{- $_ := set $out $peerKey $peers -}}
  {{- end -}}
  {{- with $rule.ports -}}
    {{- $_ := set $out "ports" . -}}
  {{- end -}}
  {{- if $out -}}
    {{- printf "- %s" (toYaml $out | indent 2 | trimPrefix "  ") -}}
  {{- else -}}
    {{- print "- {}" -}}
  {{- end -}}
{{- end -}}
