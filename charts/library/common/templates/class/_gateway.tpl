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
  {{- range $values.listeners }}
  {{- $listenerName := .name }}
  - name: {{ required (printf "listener name is required for Gateway %v" $fullName) .name }}
    {{- if .hostname }}
    hostname: {{ tpl .hostname $ | quote }}
    {{- end }}
    port: {{ required (printf "listener port is required for Gateway %v listener %v" $fullName .name) .port }}
    protocol: {{ required (printf "listener protocol is required for Gateway %v listener %v" $fullName .name) .protocol }}
    {{- if .tls }}
    tls:
      {{- if .tls.mode }}
      mode: {{ .tls.mode }}
      {{- end }}
      {{- if .tls.certificateRefs }}
      certificateRefs:
      {{- range .tls.certificateRefs }}
      - group: {{ default "" .group | quote }}
        kind: {{ default "Secret" .kind }}
        name: {{ required (printf "certificateRef name is required for Gateway %v listener %v" $fullName $listenerName) .name }}
        {{- if .namespace }}
        namespace: {{ .namespace }}
        {{- end }}
      {{- end }}
      {{- end }}
      {{- with .tls.options }}
      options:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}
    {{- if .allowedRoutes }}
    allowedRoutes:
      {{- if .allowedRoutes.namespaces }}
      namespaces:
        from: {{ default "Same" .allowedRoutes.namespaces.from }}
        {{- if .allowedRoutes.namespaces.selector }}
        selector:
          {{- toYaml .allowedRoutes.namespaces.selector | nindent 10 }}
        {{- end }}
      {{- end }}
      {{- if .allowedRoutes.kinds }}
      kinds:
      {{- range .allowedRoutes.kinds }}
      - group: {{ default "gateway.networking.k8s.io" .group }}
        kind: {{ required (printf "allowedRoute kind is required for Gateway %v listener %v" $fullName $listenerName) .kind }}
      {{- end }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
