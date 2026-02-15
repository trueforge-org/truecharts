{{/*
This template serves as a blueprint for all GatewayClass objects that are created
within the common library.
*/}}
{{- define "tc.v1.common.class.gatewayclass" -}}
{{- $values := .Values.gatewayClass -}}
{{- if hasKey . "ObjectValues" -}}
  {{- with .ObjectValues.gatewayClass -}}
    {{- $values = . -}}
  {{- end -}}
{{- end -}}

  {{- $gatewayClassLabels := $values.labels -}}
  {{- $gatewayClassAnnotations := $values.annotations -}}

{{- $fullName := include "tc.v1.common.lib.util.gatewayclass.getFullName" (dict "rootCtx" . "gatewayClass" $values) -}}

---
apiVersion: gateway.networking.k8s.io/v1
kind: GatewayClass
metadata:
  name: {{ $fullName }}
  {{- $labels := (mustMerge ($gatewayClassLabels | default dict) (include "tc.v1.common.lib.metadata.allLabels" $ | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $ "labels" $labels) | trim) }}
  labels:
    {{- . | nindent 4 }}
  {{- end -}}
  {{- $annotations := (mustMerge ($gatewayClassAnnotations | default dict) (include "tc.v1.common.lib.metadata.allAnnotations" $ | fromYaml)) }}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $ "annotations" $annotations) | trim) }}
  annotations:
    {{- . | nindent 4 }}
  {{- end }}
spec:
  controllerName: {{ required (printf "controllerName is required for GatewayClass %v" $fullName) $values.controllerName }}
  {{- if $values.description }}
  description: {{ $values.description }}
  {{- end }}
  {{- if $values.parametersRef }}
  parametersRef:
    group: {{ required (printf "parametersRef group is required for GatewayClass %v" $fullName) $values.parametersRef.group }}
    kind: {{ required (printf "parametersRef kind is required for GatewayClass %v" $fullName) $values.parametersRef.kind }}
    name: {{ required (printf "parametersRef name is required for GatewayClass %v" $fullName) $values.parametersRef.name }}
    {{- if $values.parametersRef.namespace }}
    namespace: {{ $values.parametersRef.namespace }}
    {{- end }}
  {{- end }}
{{- end }}
