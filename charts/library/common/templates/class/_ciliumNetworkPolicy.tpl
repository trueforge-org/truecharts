{{/*
This template serves as a blueprint for CiliumNetworkPolicy and CiliumClusterwideNetworkPolicy
objects that are created using the common library.
*/}}
{{- define "tc.v1.common.class.ciliumnetworkpolicy" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $targetWorkloads := include "tc.v1.common.lib.networkpolicy.targetWorkloads" (dict "rootCtx" $rootCtx "objectData" $objectData) | fromJsonArray -}}
  {{- $namespace := include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "networkpolicy") -}}
  {{- $clusterwide := include "tc.v1.common.lib.networkpolicy.clusterwide" (dict "rootCtx" $rootCtx "objectData" $objectData) -}}

  {{- $kind := "CiliumNetworkPolicy" -}}
  {{/* Clusterwide policies select endpoints in every namespace, so chart selectors are pinned to the chart namespace */}}
  {{- $scopeLabels := dict -}}
  {{- if eq $clusterwide "true" -}}
    {{- $kind = "CiliumClusterwideNetworkPolicy" -}}
    {{- $scopeLabels = dict "k8s:io.kubernetes.pod.namespace" $namespace -}}
  {{- end -}}
---
kind: {{ $kind }}
apiVersion: {{ include "tc.v1.common.capabilities.cilium.apiVersion" $rootCtx }}
metadata:
  name: {{ $objectData.name }}
  {{- if ne $clusterwide "true" }}
  namespace: {{ $namespace }}
  {{- end }}
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
  {{- with $objectData.description }}
  description: {{ tpl (toString .) $rootCtx | quote }}
  {{- end }}
  {{- /* Host policy, selects nodes instead of pods */}}
  {{- if hasKey $objectData "nodeSelector" }}
  nodeSelector:
    {{- tpl (toYaml $objectData.nodeSelector) $rootCtx | nindent 4 }}
  {{- /* Custom endpoint selector */}}
  {{- else if hasKey $objectData "endpointSelector" }}
  endpointSelector:
    {{- tpl (toYaml $objectData.endpointSelector) $rootCtx | nindent 4 }}
  {{- /* Target all pods in namespace */}}
  {{- else if $objectData.targetAllPods }}
    {{- if $scopeLabels }}
  endpointSelector:
    matchLabels:
      {{- $scopeLabels | toYaml | nindent 6 }}
    {{- else }}
  endpointSelector: {}
    {{- end }}
  {{- /* Target one or more workloads in this chart, or everything in this chart by default */}}
  {{- else }}
  endpointSelector:
    {{- include "tc.v1.common.lib.networkpolicy.workloadSelector" (dict "rootCtx" $rootCtx "targetWorkloads" $targetWorkloads "extraLabels" $scopeLabels) | nindent 4 }}
  {{- end }}
  {{- with $objectData.enableDefaultDeny }}
  enableDefaultDeny:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $objectData.ingress }}
  ingress:
    {{- tpl (toYaml .) $rootCtx | nindent 4 }}
  {{- end }}
  {{- with $objectData.ingressDeny }}
  ingressDeny:
    {{- tpl (toYaml .) $rootCtx | nindent 4 }}
  {{- end }}
  {{- with $objectData.egress }}
  egress:
    {{- tpl (toYaml .) $rootCtx | nindent 4 }}
  {{- end }}
  {{- with $objectData.egressDeny }}
  egressDeny:
    {{- tpl (toYaml .) $rootCtx | nindent 4 }}
  {{- end }}
{{- end -}}
