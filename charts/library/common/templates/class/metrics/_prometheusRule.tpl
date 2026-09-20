{{- define "tc.v1.common.class.prometheusrule" -}}
  {{- $fullName := include "tc.v1.common.lib.chart.names.fullname" . -}}
  {{- $prometheusruleName := $fullName -}}
  {{- $values := .Values.prometheusRule -}}

  {{- if hasKey . "ObjectValues" -}}
    {{- with .ObjectValues.metrics -}}
      {{- $values = . -}}
    {{- end -}}
  {{- end -}}

  {{- $totalRulesCount := 0 -}}
  {{- range $id, $groupValues := $values.prometheusRule.groups }}
    {{- $g := (kindIs "map" $groupValues | ternary $groupValues dict) -}}
    {{- $totalRulesCount = add $totalRulesCount (len ($g.rules | default list)) (len ($g.additionalrules | default list)) -}}
  {{- end }}
  {{- range $id, $groupValues := $values.prometheusRule.additionalgroups }}
    {{- $g := (kindIs "map" $groupValues | ternary $groupValues dict) -}}
    {{- $totalRulesCount = add $totalRulesCount (len ($g.rules | default list)) (len ($g.additionalrules | default list)) -}}
  {{- end }}

{{- if gt $totalRulesCount 0 -}}
  {{- $prometheusruleLabels := $values.labels -}}
  {{- $prometheusruleAnnotations := $values.annotations -}}

  {{- if and (hasKey $values "nameOverride") $values.nameOverride -}}
    {{- $prometheusruleName = printf "%v-%v" $prometheusruleName $values.nameOverride -}}
  {{- end }}
---
apiVersion: {{ include "tc.v1.common.capabilities.prometheusrule.apiVersion" $ }}
kind: PrometheusRule
metadata:
  name: {{ $prometheusruleName }}
  namespace: {{ $.Values.namespace | default $.Values.global.namespace | default $.Release.Namespace }}
  {{- $labels := (mustMerge ($prometheusruleLabels | default dict) (include "tc.v1.common.lib.metadata.allLabels" $ | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $ "labels" $labels) | trim) }}
  labels:
    {{- . | nindent 4 }}
  {{- end }}
  {{- $annotations := (mustMerge ($prometheusruleAnnotations | default dict) (include "tc.v1.common.lib.metadata.allAnnotations" $ | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $ "annotations" $annotations) | trim) }}
  annotations:
    {{- . | nindent 4 }}
  {{- end }}
spec:
  groups:
    {{- range $id, $groupValues := $values.prometheusRule.groups }}
      {{- $g := (kindIs "map" $groupValues | ternary $groupValues dict) -}}
      {{- $rulesCount := add (len ($g.rules | default list)) (len ($g.additionalrules | default list)) -}}
      {{- if gt $rulesCount 0 }}
        {{- $name := $groupValues.name | default (toString $id) -}}
        {{- include "tc.v1.common.class.prometheusrule.rendergroup" (dict "name" (printf "%v-%v" $prometheusruleName $name) "groupValues" $g) | nindent 4 }}
      {{- end }}
    {{- end }}

    {{- range $id, $groupValues := $values.prometheusRule.additionalgroups }}
      {{- $g := (kindIs "map" $groupValues | ternary $groupValues dict) -}}
      {{- $rulesCount := add (len ($g.rules | default list)) (len ($g.additionalrules | default list)) -}}
      {{- if gt $rulesCount 0 }}
        {{- $name := $groupValues.name | default (toString $id) -}}
        {{- include "tc.v1.common.class.prometheusrule.rendergroup" (dict "name" (printf "%v-%v" $prometheusruleName $name) "groupValues" $g) | nindent 4 }}
      {{- end }}
    {{- end }}
{{- end -}}
{{- end -}}

{{/* Helper function to format and render rule vectors */}}
{{- define "tc.v1.common.class.prometheusrule.rendergroup" -}}
- name: {{ .name }}
  rules:
    {{- with .groupValues.rules }}
      {{- toYaml . | nindent 4 }}
    {{- end }}
    {{- with .groupValues.additionalrules }}
      {{- toYaml . | nindent 4 }}
    {{- end }}
{{- end -}}
