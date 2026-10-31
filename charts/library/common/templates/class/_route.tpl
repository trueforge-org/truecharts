{{/*
This template serves as a blueprint for all Route objects that are created
within the common library.
*/}}
{{- define "tc.v1.common.class.route" -}}
{{- $values := .Values.route -}}
{{- if hasKey . "ObjectValues" -}}
  {{- with .ObjectValues.route -}}
    {{- $values = . -}}
  {{- end -}}
{{- end -}}

  {{- $routeLabels := $values.labels -}}
  {{- $routeAnnotations := $values.annotations -}}

{{- $fullName := include "tc.v1.common.lib.chart.names.fullname" . -}}
{{- if and (hasKey $values "nameOverride") $values.nameOverride -}}
  {{- $fullName = printf "%v-%v" $fullName $values.nameOverride -}}
{{- end -}}
{{- $routeKind := $values.kind | default "HTTPRoute" -}}

{{- $namespace := include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $ "objectData" $values "caller" "Route") -}}

{{/* A route level targetSelector replaces parentRefs */}}
{{- $parentRefs := $values.parentRefs -}}
{{- if $values.targetSelector -}}
  {{- $parentRefs = list (dict "targetSelector" $values.targetSelector) -}}
{{- end -}}

{{/* Validate that parentRefs is not empty */}}
{{- if not $parentRefs -}}
  {{- fail (printf "parentRef name is required for %v %v" $routeKind $fullName) -}}
{{- end -}}

{{/* Without rules, send everything to the primary service */}}
{{- $rules := $values.rules | default (list dict) -}}

---
apiVersion: {{ include "tc.v1.common.capabilities.route.apiVersion" (dict "rootCtx" $ "kind" $routeKind) }}
kind: {{ $routeKind }}
metadata:
  name: {{ $fullName }}
  namespace: {{ $namespace }}
  {{- $labels := (mustMerge ($routeLabels | default dict) (include "tc.v1.common.lib.metadata.allLabels" $ | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $ "labels" $labels) | trim) }}
  labels:
    {{- . | nindent 4 }}
  {{- end -}}
  {{- $annotations := (mustMerge ($routeAnnotations | default dict) (include "tc.v1.common.lib.metadata.allAnnotations" $ | fromYaml)) }}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $ "annotations" $annotations) | trim) }}
  annotations:
    {{- . | nindent 4 }}
  {{- end }}
spec:
  parentRefs:
  {{- range $parentRefs }}
    {{- $parentName := .name -}}
    {{- $parentNamespace := .namespace | default $namespace -}}
    {{- if .targetSelector -}}
      {{- $target := get $.Values.gateway .targetSelector -}}
      {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $ "objectData" $target "name" .targetSelector "key" "gateway" "caller" "Route")) "true" -}}
        {{- fail (printf "Route - Expected [targetSelector] of route [%s] to reference an enabled gateway, got [%s]" $fullName .targetSelector) -}}
      {{- end -}}
      {{- $parentName = include "tc.v1.common.lib.util.gateway.getFullName" (dict "rootCtx" $ "name" .targetSelector) -}}
      {{- $parentNamespace = include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $ "objectData" $target "caller" "Route") -}}
      {{- if .sectionName -}}
        {{- $sectionName := .sectionName -}}
        {{- $found := false -}}
        {{- range $target.listeners -}}
          {{- if eq .name $sectionName -}}
            {{- $found = true -}}
          {{- end -}}
        {{- end -}}
        {{- if not $found -}}
          {{- fail (printf "Route - Expected [sectionName] of route [%s] to reference a listener of gateway [%s], got [%s]" $fullName .targetSelector $sectionName) -}}
        {{- end -}}
      {{- end -}}
    {{- end }}
    - group: {{ default "gateway.networking.k8s.io" .group }}
      kind: {{ default "Gateway" .kind }}
      name: {{ required (printf "parentRef name is required for %v %v" $routeKind $fullName) $parentName }}
      namespace: {{ $parentNamespace }}
      {{- if .sectionName }}
      sectionName: {{ .sectionName | quote }}
      {{- end }}
      {{- if .port }}
      port: {{ .port }}
      {{- end }}
  {{- end }}
  {{- with $values.hostnames }}
  hostnames:
    {{- range . }}
    - {{ tpl . $ | quote }}
    {{- end }}
  {{- end }}
  rules:
  {{- range $rules }}
    {{- $rule := omit . "backendRefs" -}}
    {{- $backendRefs := .backendRefs -}}
    {{/* A rule with only filters is valid, eg a redirect. Otherwise default to the primary service */}}
    {{- if and (not $backendRefs) (not .filters) -}}
      {{- $backendRefs = list dict -}}
    {{- end -}}

    {{- $renderedBackends := list -}}
    {{- range $backendRefs -}}
      {{- $resolved := include "tc.v1.common.lib.route.backend" (dict "rootCtx" $ "backend" . "routeName" $fullName) | fromYaml -}}
      {{/* Zero is a valid weight, it stops traffic to the backend */}}
      {{- $weight := 1 -}}
      {{- if not (kindIs "invalid" .weight) -}}
        {{- $weight = .weight -}}
      {{- end -}}
      {{- $backend := dict
            "group" (.group | default "")
            "kind" (.kind | default "Service")
            "name" $resolved.name
            "namespace" (.namespace | default $namespace)
            "weight" $weight -}}
      {{- if $resolved.port -}}
        {{- $_ := set $backend "port" $resolved.port -}}
      {{- end -}}
      {{- with .filters -}}
        {{- $_ := set $backend "filters" . -}}
      {{- end -}}
      {{- $renderedBackends = mustAppend $renderedBackends $backend -}}
    {{- end -}}
    {{- if $renderedBackends -}}
      {{- $_ := set $rule "backendRefs" $renderedBackends -}}
    {{- end -}}
    {{- toYaml (list $rule) | nindent 2 }}
  {{- end }}
{{- end }}
