{{/* Resolves the workloads of this chart that a policy targets through [targetSelector] and [targetSelectorRegex] */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.networkpolicy.targetWorkloads" (dict "rootCtx" $ "objectData" $objectData) | fromJsonArray }}
rootCtx: The root context of the chart.
objectData:
  targetSelector: One or more workload names.
  targetSelectorRegex: One or more regular expressions matched against workload names.
Returns a JSON list with the names of the matched workloads, in the order they were matched.
*/}}
{{- define "tc.v1.common.lib.networkpolicy.targetWorkloads" -}}
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

  {{- $targetWorkloads | toJson -}}
{{- end -}}

{{/* Renders the label selector body (matchLabels / matchExpressions) for workloads of this chart */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.networkpolicy.workloadSelector" (dict "rootCtx" $ "targetWorkloads" $targetWorkloads "extraLabels" $extraLabels) | nindent 4 }}
rootCtx: The root context of the chart.
targetWorkloads: List of workload names. An empty list selects every workload of this chart.
extraLabels: Additional labels that override matching workload labels. (Optional)
*/}}
{{- define "tc.v1.common.lib.networkpolicy.workloadSelector" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $targetWorkloads := .targetWorkloads | default list -}}
  {{- $extraLabels := .extraLabels | default dict -}}
  {{- $matchLabels := dict -}}

  {{/* A single workload is selected by its own (extra) selector labels, multiple workloads share the chart labels and are narrowed down by name */}}
  {{- if eq (len $targetWorkloads) 1 -}}
    {{- $matchLabels = include "tc.v1.common.lib.metadata.selectorLabels" (dict "rootCtx" $rootCtx "objectType" "pod" "objectName" (first $targetWorkloads)) | fromYaml -}}
  {{- else -}}
    {{- $matchLabels = include "tc.v1.common.lib.metadata.selectorLabels" (dict "rootCtx" $rootCtx "objectType" "" "objectName" "") | fromYaml -}}
  {{- end -}}
  {{- $matchLabels = mustMerge $extraLabels $matchLabels -}}
matchLabels:
  {{- $matchLabels | toYaml | nindent 2 }}
  {{- if gt (len $targetWorkloads) 1 }}
matchExpressions:
  - key: pod.name
    operator: In
    values:
      {{- $targetWorkloads | toYaml | nindent 6 }}
  {{- end -}}
{{- end -}}
