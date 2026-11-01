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
*/}}
{{- define "tc.v1.common.lib.dependencies.primaryService" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $depName := .depName -}}

  {{- $result := dict -}}
  {{- $dep := get ($rootCtx.Values.dependencies | default dict) $depName -}}

  {{- if and (kindIs "map" $dep) (kindIs "map" $dep.service) -}}
    {{- range $svcName, $svc := $dep.service -}}
      {{- if not (kindIs "map" $svc) -}}{{- continue -}}{{- end -}}
      {{- if not $svc.primary -}}{{- continue -}}{{- end -}}

      {{- $mergedKey := printf "%s-%s" $depName $svcName -}}
      {{- $mergedSvc := get $rootCtx.Values.service $mergedKey -}}
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
        {{- if not $mergedSvc.primary -}}
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
