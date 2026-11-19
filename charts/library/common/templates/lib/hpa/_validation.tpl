{{- define "tc.v1.common.lib.hpa.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $minReplicas := 1 -}}
  {{- with $objectData.minReplicas -}}
    {{- $minReplicas = $objectData.minReplicas -}}
  {{- end -}}

  {{- $maxReplicas := 3 -}}
  {{- with $objectData.maxReplicas -}}
    {{- $maxReplicas = $objectData.maxReplicas -}}
  {{- end -}}

  {{- $_ := set $objectData "minReplicas" $minReplicas -}}
  {{- $_ := set $objectData "maxReplicas" $maxReplicas -}}

  {{- if lt $maxReplicas $minReplicas -}}
    {{- fail (printf "Horizontal Pod Autoscaler - Expected [hpa.%s.minReplicas] to be less than [hpa.%s.maxReplicas], but got [%d] and [%d]" $objectData.hpaName $objectData.hpaName ($minReplicas | int) ($maxReplicas | int)) -}}
  {{- end -}}

  {{- if $objectData.behavior -}}
    {{- if $objectData.behavior.scaleUp -}}
      {{- include "tc.v1.common.lib.hpa.validation.behavior" (dict "objectData" $objectData "rootCtx" $rootCtx "data" $objectData.behavior.scaleUp "key" "scaleUp") -}}
    {{- end -}}
    {{- if $objectData.behavior.scaleDown -}}
      {{- include "tc.v1.common.lib.hpa.validation.behavior" (dict "objectData" $objectData "rootCtx" $rootCtx "data" $objectData.behavior.scaleDown "key" "scaleDown") -}}
    {{- end -}}
  {{- end -}}

  {{- if $objectData.metrics -}}
    {{- include "tc.v1.common.lib.hpa.validation.metrics" (dict "objectData" $objectData "rootCtx" $rootCtx "data" $objectData.metrics) -}}
  {{- end -}}

{{- end -}}

{{- define "tc.v1.common.lib.hpa.validation.behavior" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $data := .data -}}
  {{- $key := .key -}}



  {{- if $data.policies -}}

    {{- $validPolicies := list "Pods" "Percent" -}}
    {{- range $idx, $policy := $data.policies -}}
      {{- if not (kindIs "map" $policy) -}}
        {{- fail (printf "Horizontal Pod Autoscaler - Expected [hpa.%s.behavior.%s.policies.%d] to be a map, but got [%s]" $objectData.hpaName $key $idx (kindOf $policy)) -}}
      {{- end -}}

      {{- if not (mustHas $policy.type $validPolicies) -}}
        {{- fail (printf "Horizontal Pod Autoscaler - Expected [hpa.%s.behavior.%s.policies.%d.type] to be one of [%s], but got [%s]" $objectData.hpaName $key $idx (join ", " $validPolicies) $policy.type) -}}
      {{- end -}}

      {{- if not (mustHas (kindOf $policy.value) (list "int" "int64" "float64")) -}}
        {{- fail (printf "Horizontal Pod Autoscaler - Expected [hpa.%s.behavior.%s.policies.%d.value] to be an integer, but got [%s]" $objectData.hpaName $key $idx (kindOf $policy.value)) -}}
      {{- end -}}


      {{- if le ($policy.value | int) 0 -}}
        {{- fail (printf "Horizontal Pod Autoscaler - Expected [hpa.%s.behavior.%s.policies.%d.value] to be greater than 0, but got [%v]" $objectData.hpaName $key $idx $policy.value) -}}
      {{- end -}}

      {{- if or (lt ($policy.periodSeconds | int) 1) (gt ($policy.periodSeconds | int) 1800) -}}
        {{- fail (printf "Horizontal Pod Autoscaler - Expected [hpa.%s.behavior.%s.policies.%d.periodSeconds] to be between 1 and 1800, but got [%v]" $objectData.hpaName $key $idx $policy.periodSeconds) -}}
      {{- end -}}

    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.lib.hpa.validation.metrics" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}


  {{- range $idx, $metric := $objectData.metrics -}}


    {{- if eq $metric.type "Resource" -}}
      {{- include "tc.v1.common.lib.hpa.validation.metrics.resource" (dict "objectData" $objectData "rootCtx" $rootCtx "metric" $metric "idx" $idx) -}}
    {{- else if eq $metric.type "Pods" -}}
      {{- include "tc.v1.common.lib.hpa.validation.metrics.pods" (dict "objectData" $objectData "rootCtx" $rootCtx "metric" $metric "idx" $idx) -}}
    {{- else if eq $metric.type "Object" -}}
      {{- include "tc.v1.common.lib.hpa.validation.metrics.object" (dict "objectData" $objectData "rootCtx" $rootCtx "metric" $metric "idx" $idx) -}}
    {{- else if eq $metric.type "External" -}}
      {{- include "tc.v1.common.lib.hpa.validation.metrics.external" (dict "objectData" $objectData "rootCtx" $rootCtx "metric" $metric "idx" $idx) -}}
    {{- else if eq $metric.type "ContainerResource" -}}
      {{- include "tc.v1.common.lib.hpa.validation.metrics.containerResource" (dict "objectData" $objectData "rootCtx" $rootCtx "metric" $metric "idx" $idx) -}}
    {{- end -}}

  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.lib.hpa.validation.metrics.resource" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $metric := .metric -}}
  {{- $idx := .idx -}}


  {{- $validNames := list "cpu" "memory" -}}

  {{- include "tc.v1.common.lib.hpa.validation.metrics.metric.target" (dict "objectData" $objectData "rootCtx" $rootCtx "metric" $metric.resource "key" "resource" "idx" $idx) -}}
{{- end -}}

{{- define "tc.v1.common.lib.hpa.validation.metrics.containerResource" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $metric := .metric -}}
  {{- $idx := .idx -}}


  {{- $validNames := list "cpu" "memory" -}}

  {{- if not (mustHas $metric.containerResource.container $objectData.containerNames) -}}
    {{- fail (printf "Horizontal Pod Autoscaler - Expected [hpa.%s.metrics.%d.containerResource.container] to be one of [%s], but got [%s]" $objectData.hpaName $idx (join ", " $objectData.containerNames) $metric.containerResource.container) -}}
  {{- end -}}

  {{- include "tc.v1.common.lib.hpa.validation.metrics.metric.target" (dict "objectData" $objectData "rootCtx" $rootCtx "metric" $metric.containerResource "key" "containerResource" "idx" $idx) -}}
{{- end -}}

{{- define "tc.v1.common.lib.hpa.validation.metrics.pods" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $metric := .metric -}}
  {{- $idx := .idx -}}






  {{- if $metric.pods.metric.selector -}}
    {{- include "tc.v1.common.lib.hpa.validation.metric.selector" (dict "objectData" $objectData "rootCtx" $rootCtx "data" $metric.pods "key" "pods" "idx" $idx) -}}
  {{- end -}}

{{- end -}}

{{- define "tc.v1.common.lib.hpa.validation.metric.selector" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $data := .data -}}
  {{- $key := .key -}}
  {{- $idx := .idx -}}



  {{- range $k, $v := $data.metric.selector.matchLabels -}}
    {{- if not (kindIs "string" $k) -}}
      {{- fail (printf "Horizontal Pod Autoscaler - Expected [hpa.%s.metrics.%d.%s.metric.selector.matchLabels] to have string keys, but got [%s]" $objectData.hpaName $idx $key (kindOf $k)) -}}
    {{- end -}}

  {{- end -}}

{{- end -}}

{{- define "tc.v1.common.lib.hpa.validation.metrics.object" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $metric := .metric -}}
  {{- $idx := .idx -}}





  {{- $validTypes := list "AverageValue" "Value" -}}

  {{- if eq $metric.object.target.type "AverageValue" -}}
  {{- else if eq $metric.object.target.type "Value" -}}
  {{- end -}}

  {{- if $metric.object.metric.selector -}}
    {{- include "tc.v1.common.lib.hpa.validation.metric.selector" (dict "objectData" $objectData "rootCtx" $rootCtx "data" $metric.object "key" "object" "idx" $idx) -}}
  {{- end -}}




{{- end -}}

{{- define "tc.v1.common.lib.hpa.validation.metrics.external" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $metric := .metric -}}
  {{- $idx := .idx -}}





  {{- $validTypes := list "AverageValue" "Value" -}}

  {{- if eq $metric.external.target.type "AverageValue" -}}
  {{- else if eq $metric.external.target.type "Value" -}}
  {{- end -}}

  {{- if $metric.external.metric.selector -}}
    {{- include "tc.v1.common.lib.hpa.validation.metric.selector" (dict "objectData" $objectData "rootCtx" $rootCtx "data" $metric.external "key" "external" "idx" $idx) -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.lib.hpa.validation.metrics.metric.target" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $data := .metric -}}
  {{- $key := .key -}}
  {{- $idx := .idx -}}


  {{- $validTargetTypes := list "AverageValue" "Utilization" -}}
  {{- if not (mustHas $data.target.type $validTargetTypes) -}}
    {{- fail (printf "Horizontal Pod Autoscaler - Expected [hpa.%s.metrics.%d.%s.target.type] to be one of [%s], but got [%s]" $objectData.hpaName $idx $key (join ", " $validTargetTypes) $data.target.type) -}}
  {{- end -}}

  {{- if eq $data.target.type "AverageValue" -}}
  {{- else if eq $data.target.type "Utilization" -}}
  {{- end -}}


{{- end -}}
