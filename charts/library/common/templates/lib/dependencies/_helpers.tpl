{{/* Returns details about the primary service of a dependency, as json */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "valkey") | fromJson }}
rootCtx: The root context of the chart.
depName: The name of the dependency.

Returns an empty string when the dependency has no enabled primary service, otherwise:
key: The name of the service within the dependency (eg main)
mergedKey: The name of the service in the chart values (eg valkey-main)
name: The name of the Service object, as rendered (eg release-chart-valkey-main)
port: The port number of the primary port of the service

In operator mode the service is not merged into the chart, as the operator provides it.
The name is then the one it would have in standalone mode (never the primary name), so the operator has to create the Service with that name.
*/}}
{{- define "tc.v1.common.lib.dependencies.primaryService" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $depName := .depName -}}

  {{- $result := dict -}}
  {{- $dep := get ($rootCtx.Values.dependencies | default dict) $depName -}}
  {{- $operator := eq (include "tc.v1.common.lib.dependencies.mode" (dict "objectData" $dep "depName" $depName)) "operator" -}}

  {{- if and (kindIs "map" $dep) (kindIs "map" $dep.service) -}}
    {{- range $svcName, $svc := $dep.service -}}
      {{- if not (kindIs "map" $svc) -}}{{- continue -}}{{- end -}}
      {{- if not $svc.primary -}}{{- continue -}}{{- end -}}

      {{- $mergedKey := printf "%s-%s" $depName $svcName -}}
      {{- $mergedSvc := get $rootCtx.Values.service $mergedKey -}}
      {{/* In operator mode the service is not merged, so the (normalized) service of the dependency is used */}}
      {{- if $operator -}}
        {{- $mergedSvc = $svc -}}
      {{- end -}}
      {{- if not (kindIs "map" $mergedSvc) -}}{{- continue -}}{{- end -}}

      {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                      "rootCtx" $rootCtx "objectData" $mergedSvc
                      "name" $mergedKey "caller" "Dependencies"
                      "key" "service")) -}}
      {{- if ne $enabled "true" -}}{{- continue -}}{{- end -}}

      {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                      "rootCtx" $rootCtx "objectData" $mergedSvc
                      "name" $mergedKey "caller" "Dependencies"
                      "key" "service")) -}}

      {{/* Services of dependencies are only the primary of the release when they are explicitly set to primary, otherwise the expanded name is suffixed */}}
      {{- $name := $mergedKey -}}
      {{- if eq $expandName "true" -}}
        {{- $name = include "tc.v1.common.lib.chart.names.fullname" $rootCtx -}}
        {{- if or $operator (not $mergedSvc.primary) -}}
          {{- $name = printf "%s-%s" $name $mergedKey -}}
        {{- end -}}
      {{- end -}}

      {{- $port := "" -}}
      {{- range $portName, $portData := ($svc.ports | default dict) -}}
        {{- if and (kindIs "map" $portData) $portData.primary -}}
          {{- $port = tpl (toString $portData.port) $rootCtx -}}
        {{- end -}}
      {{- end -}}

      {{- $result = dict "key" $svcName "mergedKey" $mergedKey "name" $name "port" $port -}}
    {{- end -}}
  {{- end -}}

  {{- if $result -}}
    {{- $result | toJson -}}
  {{- end -}}
{{- end -}}

{{/* Returns the mode of a dependency: standalone (default) or operator */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.mode" (dict "objectData" $dep "depName" "valkey") }}
objectData: The values of the dependency.
depName: The name of the dependency.

standalone: The objects of the dependency are merged into the chart, and deployed with the chart.
operator: The dependency is provided by an operator. Its objects are not merged into the chart, but the credentials, wait init container and notes still apply.
*/}}
{{- define "tc.v1.common.lib.dependencies.mode" -}}
  {{- $objectData := .objectData -}}
  {{- $depName := .depName -}}

  {{- $validModes := (list "standalone" "operator") -}}
  {{- $mode := "standalone" -}}
  {{- if and (kindIs "map" $objectData) (hasKey $objectData "mode") -}}
    {{- $mode = $objectData.mode -}}
  {{- end -}}

  {{- if or (not (kindIs "string" $mode)) (not (has $mode $validModes)) -}}
    {{- fail (printf "Dependencies - Expected [dependencies.%s.mode] to be one of [%s], but got [%v]" $depName (join ", " $validModes) $mode) -}}
  {{- end -}}

  {{- $mode -}}
{{- end -}}
