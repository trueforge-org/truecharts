{{/*
This template serves as a blueprint for networkPolicy objects that are created
using the common library.
*/}}
{{- define "tc.v1.common.class.networkpolicy" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $targetWorkloads := list -}}

  {{- $targetSelectors := $objectData.targetSelector | default list -}}
  {{- if kindIs "string" $targetSelectors -}}
    {{- $targetSelectors = list $targetSelectors -}}
  {{- end -}}
  {{- range $targetSelectors -}}
    {{- if not (hasKey $rootCtx.Values.workload .) -}}
      {{- fail (printf "NetworkPolicy - targetSelector [%s] does not match a workload" .) -}}
    {{- end -}}
    {{- if not (mustHas . $targetWorkloads) -}}
      {{- $targetWorkloads = mustAppend $targetWorkloads . -}}
    {{- end -}}
  {{- end -}}

  {{- $targetSelectorRegexes := $objectData.targetSelectorRegex | default list -}}
  {{- if kindIs "string" $targetSelectorRegexes -}}
    {{- $targetSelectorRegexes = list $targetSelectorRegexes -}}
  {{- end -}}
  {{- range $regex := $targetSelectorRegexes -}}
    {{- range $workloadName, $_ := $rootCtx.Values.workload -}}
      {{- if and (regexMatch $regex $workloadName) (not (mustHas $workloadName $targetWorkloads)) -}}
        {{- $targetWorkloads = mustAppend $targetWorkloads $workloadName -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if and (or $objectData.targetSelector $objectData.targetSelectorRegex) (not $targetWorkloads) -}}
    {{- fail "NetworkPolicy - target selectors did not match any workloads" -}}
  {{- end -}}
---
kind: NetworkPolicy
apiVersion: {{ include "tc.v1.common.capabilities.networkpolicy.apiVersion" $ }}
metadata:
  name: {{ $objectData.name }}
  namespace: {{ include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "networkpolicy") }}
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
  {{- tpl (toYaml $objectData.podSelector) $ | nindent 4 }}
  {{/* Target all pods in namespace */}}
  {{- else if $objectData.targetAllPods }}
  podSelector: {}
  {{/* Target one or more workloads in this chart */}}
  {{- else if $targetWorkloads }}
    {{- if eq (len $targetWorkloads) 1 }}
  podSelector:
    matchLabels:
      {{- include "tc.v1.common.lib.metadata.selectorLabels" (dict "rootCtx" $rootCtx "objectType" "pod" "objectName" (first $targetWorkloads)) | nindent 6 }}
    {{- else }}
  podSelector:
    matchLabels:
      {{- include "tc.v1.common.lib.metadata.selectorLabels" (dict "rootCtx" $rootCtx "objectType" "" "objectName" "") | nindent 6 }}
    matchExpressions:
      - key: pod.name
        operator: In
        values:
          {{- $targetWorkloads | toYaml | nindent 10 }}
    {{- end }}
  {{/* Default: Target everything in this chart */}}
  {{- else }}
  podSelector:
    matchLabels:
      {{- include "tc.v1.common.lib.metadata.selectorLabels" (dict "rootCtx" $ "objectType" "" "objectName" "") | indent 8 }}
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
  -{{- if .to }} to:
    {{- range .to -}}
    {{- $nss := false -}}
    {{- $ipb := false -}}
      {{- if .ipBlock -}}
      {{- if .ipBlock.cidr -}}
      {{- $ipb = true }}
    - ipBlock:
        cidr: {{ .ipBlock.cidr }}
      {{- if .ipBlock.except }}
        except:
        {{- range .ipBlock.except }}
        - {{ . }}
        {{- end -}}
      {{- end -}}
      {{- end -}}
      {{- end -}}

      {{- if and ( .namespaceSelector ) ( not $ipb ) -}}
      {{- if or ( .namespaceSelector.matchLabels ) ( .namespaceSelector.matchExpressions ) -}}
      {{- $nss = true }}
    - namespaceSelector:
        {{- if .namespaceSelector.matchLabels }}
         matchLabels:
          {{- .namespaceSelector.matchLabels | toYaml | nindent 12 }}
        {{- end -}}
        {{- if .namespaceSelector.matchExpressions }}
         matchExpressions:
          {{- .namespaceSelector.matchExpressions | toYaml | nindent 12 }}
        {{- end -}}
      {{- end -}}
      {{- end -}}

      {{- if and ( .podSelector ) ( not $ipb ) -}}
      {{- if or ( .podSelector.matchLabels ) ( .podSelector.matchExpressions ) -}}
      {{- if $nss }}
      podSelector:
      {{- else }}
    - podSelector:
      {{- end -}}
        {{- if .podSelector.matchLabels }}
         matchLabels:
          {{- .podSelector.matchLabels | toYaml | nindent 12 }}
        {{- end -}}
        {{- if .podSelector.matchExpressions }}
         matchExpressions:
          {{- .podSelector.matchExpressions | toYaml | nindent 12 }}
        {{- end -}}
      {{- end -}}
      {{- end -}}
    {{- end }}
    {{- end -}}
  {{- with .ports }}
    ports:
    {{- . | toYaml | nindent 6 }}
  {{- end -}}
  {{- end -}}
  {{- end -}}

  {{- if $objectData.ingress }}
  ingress:
  {{- range $objectData.ingress }}
  -{{- if .from }} from:
    {{- range .from -}}
    {{- $nss := false -}}
    {{- $ipb := false -}}
      {{- if .ipBlock -}}
      {{- if .ipBlock.cidr -}}
      {{- $ipb = true }}
    - ipBlock:
        cidr: {{ .ipBlock.cidr }}
      {{- if .ipBlock.except }}
        except:
        {{- range .ipBlock.except }}
        - {{ . }}
        {{- end -}}
      {{- end -}}
      {{- end -}}
      {{- end -}}

      {{- if and ( .namespaceSelector ) ( not $ipb ) -}}
      {{- if or ( .namespaceSelector.matchLabels ) ( .namespaceSelector.matchExpressions ) -}}
      {{- $nss = true }}
    - namespaceSelector:
        {{- if .namespaceSelector.matchLabels }}
         matchLabels:
          {{- .namespaceSelector.matchLabels | toYaml | nindent 12 }}
        {{- end -}}
        {{- if .namespaceSelector.matchExpressions }}
         matchExpressions:
          {{- .namespaceSelector.matchExpressions | toYaml | nindent 12 }}
        {{- end -}}
      {{- end -}}
      {{- end -}}

      {{- if and ( .podSelector ) ( not $ipb ) -}}
      {{- if or ( .podSelector.matchLabels ) ( .podSelector.matchExpressions ) -}}
      {{- if $nss }}
      podSelector:
      {{- else }}
    - podSelector:
      {{- end }}
        {{- if .podSelector.matchLabels }}
         matchLabels:
          {{- .podSelector.matchLabels | toYaml | nindent 12 }}
        {{- end -}}
        {{- if .podSelector.matchExpressions }}
         matchExpressions:
          {{- .podSelector.matchExpressions | toYaml | nindent 12 }}
        {{- end -}}
      {{- end -}}
      {{- end -}}
    {{- end }}
    {{- end -}}
  {{- with .ports }}
    ports:
    {{- . | toYaml | nindent 6 }}
  {{- end -}}
  {{- end -}}
  {{- end -}}
{{- end -}}
