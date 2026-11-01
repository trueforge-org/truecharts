{{/*
This template serves as a blueprint for all Gateway objects that are created
within the common library.
*/}}
{{- define "tc.v1.common.class.gateway" -}}
{{- $values := .Values.gateway -}}
{{- if hasKey . "ObjectValues" -}}
  {{- with .ObjectValues.gateway -}}
    {{- $values = . -}}
  {{- end -}}
{{- end -}}

  {{- $gatewayLabels := $values.labels -}}
  {{- $gatewayAnnotations := $values.annotations -}}

{{- $gatewayName := "" -}}
{{- with .ObjectValues -}}
  {{- $gatewayName = .gatewayName -}}
{{- end -}}
{{- $fullName := include "tc.v1.common.lib.util.gateway.getFullName" (dict "rootCtx" $ "name" $gatewayName) -}}

{{/* Handle targetSelector for automatic gatewayClass linking */}}
{{- $gatewayClassName := $values.gatewayClassName -}}
{{- if $values.targetSelector -}}
  {{- $targetGatewayClass := get ($.Values.gatewayClass | default dict) $values.targetSelector -}}
  {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $ "objectData" $targetGatewayClass "name" $values.targetSelector "key" "gatewayClass" "caller" "Gateway")) "true" -}}
    {{- fail (printf "Gateway - Expected [targetSelector] of gateway [%s] to reference an enabled gatewayClass, got [%s]" $fullName $values.targetSelector) -}}
  {{- end -}}
  {{- $gatewayClassName = include "tc.v1.common.lib.util.gatewayclass.getFullName" (dict "rootCtx" $ "name" $values.targetSelector) -}}
{{- end -}}

---
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: {{ $fullName }}
  namespace: {{ include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $ "objectData" $values "caller" "Gateway") }}
  {{- $labels := (mustMerge ($gatewayLabels | default dict) (include "tc.v1.common.lib.metadata.allLabels" $ | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $ "labels" $labels) | trim) }}
  labels:
    {{- . | nindent 4 }}
  {{- end -}}
  {{- $annotations := (mustMerge ($gatewayAnnotations | default dict) (include "tc.v1.common.lib.metadata.allAnnotations" $ | fromYaml)) }}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $ "annotations" $annotations) | trim) }}
  annotations:
    {{- . | nindent 4 }}
  {{- end }}
spec:
  gatewayClassName: {{ required (printf "gatewayClassName is required for Gateway %v" $fullName) $gatewayClassName }}
  {{- with $values.addresses }}
  addresses:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $values.infrastructure }}
  infrastructure:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $values.allowedListeners }}
  allowedListeners:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  {{- with $values.tls }}
  tls:
    {{- toYaml . | nindent 4 }}
  {{- end }}
  listeners:
    {{- include "tc.v1.common.lib.gateway.listeners" (dict "rootCtx" $ "listeners" $values.listeners "caller" "Gateway" "name" $fullName) | trim | nindent 2 }}
{{- end }}
