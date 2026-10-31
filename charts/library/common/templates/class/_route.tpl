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

{{- $fullName := .ObjectValues.routeFullName -}}
{{- $listenerSetNames := .ObjectValues.listenerSetNames -}}
{{- $routeFilters := .ObjectValues.routeFilters -}}
{{- $extraRules := .ObjectValues.extraRules -}}
{{- $routeKind := $values.kind | default "HTTPRoute" -}}

{{- $namespace := include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $ "objectData" $values "caller" "Route") -}}

{{/* A gateway selection replaces parentRefs */}}
{{- $parentRefs := $values.parentRefs -}}
{{- if $values.gateway -}}
  {{- $parentRefs = list (dict "name" (tpl $values.gateway $) "namespace" (tpl ($values.gatewayNamespace | default $namespace) $)) -}}
{{- else if and $values.targetSelector (kindIs "string" $values.targetSelector) -}}
  {{- $parentRefs = list (dict "targetSelector" $values.targetSelector) -}}
{{- end -}}

{{/* TLS is on a ListenerSet of the selected gateway, so the route attaches to that */}}
{{- if $listenerSetNames -}}
  {{- $parentRefs = list -}}
  {{- range $listenerSetNames -}}
    {{- $parentRefs = mustAppend $parentRefs (dict "kind" "ListenerSet" "name" . "namespace" $namespace) -}}
  {{- end -}}
{{- end -}}

{{/* A [targetSelector] map selects the default service and port, same as an ingress */}}
{{- $defaultSelector := "" -}}
{{- if kindIs "map" $values.targetSelector -}}
  {{- $defaultSelector = $values.targetSelector -}}
{{- end -}}

{{/* Validate that parentRefs is not empty */}}
{{- if not $parentRefs -}}
  {{- fail (printf "parentRef name is required for %v %v" $routeKind $fullName) -}}
{{- end -}}

{{/* Without rules, send everything to the primary service */}}
{{- $rules := $values.rules | default (list dict) -}}

{{/* Annotations are copied, so the integration only adds them to this object */}}
{{- $routeAnnotations = mustDeepCopy ($routeAnnotations | default dict) -}}
{{- $routeIntegrations := $values.integrations | default dict -}}
{{- if and $routeIntegrations.homepage $routeIntegrations.homepage.enabled -}}
  {{/* First backend and path of the route, an ingress uses its first host and path */}}
  {{- $firstBackend := dict -}}
  {{- $firstPath := "/" -}}
  {{- $foundBackend := false -}}
  {{- range $idx, $rule := $rules -}}
    {{- if and (not $foundBackend) (or $rule.backendRefs (not $rule.filters)) -}}
      {{- $foundBackend = true -}}
      {{- if $rule.backendRefs -}}
        {{- $firstBackend = first $rule.backendRefs -}}
      {{- end -}}
    {{- end -}}
    {{- if and (eq $idx 0) $rule.matches -}}
      {{- $firstMatch := first $rule.matches -}}
      {{- if and $firstMatch.path $firstMatch.path.value -}}
        {{- $firstPath = $firstMatch.path.value -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  {{- $selectedService := include "tc.v1.common.lib.route.backend" (dict "rootCtx" $ "backend" $firstBackend "routeName" $fullName "defaultSelector" $defaultSelector) | fromYaml -}}
  {{/* The integration formats the port as a string */}}
  {{- $_ := set $selectedService "port" ($selectedService.port | int | toString) -}}

  {{- $hosts := list -}}
  {{- with $values.hostnames -}}
    {{- $hosts = list (dict "host" (first .) "paths" (list (dict "path" $firstPath))) -}}
  {{- end -}}
  {{- include "tc.v1.common.lib.ingress.integration.homepage" (dict "rootCtx" $ "caller" "Route" "objectData" (dict
        "namespace" $values.namespace "hosts" $hosts "selectedService" $selectedService
        "annotations" $routeAnnotations "integrations" (mustDeepCopy $routeIntegrations))) -}}
{{- end }}

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
  annotations:
    checksum/secrets: {{ toJson $.Values.secret | sha256sum }}
    checksum/services: {{ toJson $.Values.service | sha256sum }}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $ "annotations" $annotations) | trim) }}
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
  {{- with $extraRules }}
    {{- toYaml . | nindent 2 }}
  {{- end }}
  {{- range $rules }}
    {{- $rule := omit (mustDeepCopy .) "backendRefs" -}}
    {{- range $rule.matches -}}
      {{- if and .path .path.value -}}
        {{- $_ := set .path "value" (tpl .path.value $) -}}
      {{- end -}}
    {{- end -}}
    {{- $backendRefs := .backendRefs -}}
    {{/* A rule with only filters is valid, eg a redirect. Otherwise default to the primary service */}}
    {{- if and (not $backendRefs) (not .filters) -}}
      {{- $backendRefs = list dict -}}
    {{- end -}}

    {{/* Filters of the integrations go first, so auth runs before the filters of the rule */}}
    {{- if $routeFilters -}}
      {{- $_ := set $rule "filters" (concat $routeFilters ($rule.filters | default list)) -}}
    {{- end -}}

    {{- $renderedBackends := list -}}
    {{- range $backendRefs -}}
      {{- $resolved := include "tc.v1.common.lib.route.backend" (dict "rootCtx" $ "backend" . "routeName" $fullName "defaultSelector" $defaultSelector) | fromYaml -}}
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
