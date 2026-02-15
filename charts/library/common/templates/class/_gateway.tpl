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

{{- $fullName := include "tc.v1.common.lib.chart.names.fullname" . -}}
{{- if and (hasKey $values "nameOverride") $values.nameOverride -}}
  {{- $fullName = printf "%v-%v" $fullName $values.nameOverride -}}
{{- end -}}

{{/* Handle targetSelector for automatic gatewayClass linking */}}
{{- $gatewayClassName := $values.gatewayClassName -}}
{{- if and (hasKey $values "targetSelector") $values.targetSelector -}}
  {{- $targetGatewayClassName := $values.targetSelector -}}
  {{- if hasKey $.Values.gatewayClass $targetGatewayClassName -}}
    {{- $targetGatewayClass := get $.Values.gatewayClass $targetGatewayClassName -}}
    {{- if $targetGatewayClass.enabled -}}
      {{- $gatewayClassName = include "tc.v1.common.lib.util.gatewayclass.getFullName" (dict "rootCtx" $ "gatewayClass" $targetGatewayClass) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

---
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: {{ $fullName }}
  namespace: {{ $.Values.namespace | default $.Values.global.namespace | default $.Release.Namespace }}
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
  listeners:
  {{- range $values.listeners }}
  - name: {{ required (printf "listener name is required for Gateway %v" $fullName) .name }}
    {{- if .hostname }}
    hostname: {{ .hostname }}
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
        name: {{ required (printf "certificateRef name is required for Gateway %v listener %v" $fullName $.name) .name }}
        {{- if .namespace }}
        namespace: {{ .namespace }}
        {{- end }}
      {{- end }}
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
        kind: {{ required (printf "allowedRoute kind is required for Gateway %v listener %v" $fullName $.name) .kind }}
      {{- end }}
      {{- end }}
    {{- end }}
  {{- end }}
{{- end }}
