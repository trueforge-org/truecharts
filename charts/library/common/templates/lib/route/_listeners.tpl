{{/* Returns the name of a route, same naming as an ingress */}}
{{- define "tc.v1.common.lib.route.getFullName" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $name := .name -}}

  {{- $fullName := include "tc.v1.common.lib.chart.names.fullname" $rootCtx -}}
  {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                  "rootCtx" $rootCtx "objectData" $objectData
                  "name" $name "caller" "Route"
                  "key" "route")) -}}

  {{- if ne $expandName "true" -}}
    {{- $fullName = $name -}}
  {{- else if $objectData.nameOverride -}}
    {{- $fullName = printf "%v-%v" $fullName $objectData.nameOverride -}}
  {{- else if ne $name (include "tc.v1.common.lib.util.route.primary" $rootCtx) -}}
    {{- $fullName = printf "%v-%v" $fullName $name -}}
  {{- end -}}
  {{- $fullName -}}
{{- end -}}

{{/* Returns the hostname and secret of each TLS listener a route needs */}}
{{- define "tc.v1.common.lib.route.listeners" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $chartName := .fullName -}}

  {{- $listeners := list -}}
  {{/* If a certificateIssuer is defined in the whole route, use that */}}
  {{- if include "tc.v1.common.lib.route.hasCertManager" (dict "objectData" $objectData) -}}
    {{- range $host := $objectData.hostnames -}}
      {{- $tplHost := tpl $host $rootCtx -}}
      {{- $listeners = mustAppend $listeners (dict
            "host" $tplHost
            "secretName" (include "tc.v1.common.lib.route.secretName" (dict "chartName" $chartName "host" $tplHost))
            "issuer" $objectData.integrations.certManager.certificateIssuer) -}}
    {{- end -}}
  {{/* else if a tls section is defined use the configuration from there */}}
  {{- else -}}
    {{- range $t := $objectData.tls -}}
      {{- $secretName := "" -}}
      {{- if $t.secretName -}}
        {{- $secretName = tpl $t.secretName $rootCtx -}}
      {{- else if $t.certificateIssuer -}}
        {{- $secretName = include "tc.v1.common.lib.route.secretName" (dict "chartName" $chartName "host" (tpl (first $t.hosts) $rootCtx)) -}}
      {{- else if $t.clusterCertificate -}}
        {{- $secretName = printf "certificate-issuer-%s" (tpl $t.clusterCertificate $rootCtx) -}}
      {{- end -}}
      {{- range $host := $t.hosts -}}
        {{- $listeners = mustAppend $listeners (dict "host" (tpl $host $rootCtx) "secretName" $secretName) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- dict "listeners" $listeners | toYaml -}}
{{- end -}}

{{- define "tc.v1.common.lib.route.hasCertManager" -}}
  {{- $integrations := .objectData.integrations | default dict -}}
  {{- if and $integrations.certManager $integrations.certManager.enabled -}}
    {{- print "true" -}}
  {{- end -}}
{{- end -}}

{{/* Returns the gateway a route selected with [gateway] or a [targetSelector] string, if any */}}
{{- define "tc.v1.common.lib.route.gatewayRef" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $namespace := include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "Route") -}}

  {{- $ref := dict -}}
  {{- if $objectData.gateway -}}
    {{- $gatewayNamespace := $namespace -}}
    {{- with $objectData.gatewayNamespace -}}
      {{- $gatewayNamespace = tpl . $rootCtx -}}
    {{- end -}}
    {{- $ref = dict "name" (tpl $objectData.gateway $rootCtx) "namespace" $gatewayNamespace -}}
  {{- else if and $objectData.targetSelector (kindIs "string" $objectData.targetSelector) -}}
    {{- $target := get ($rootCtx.Values.gateway | default dict) $objectData.targetSelector -}}
    {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $target "name" $objectData.targetSelector "key" "gateway" "caller" "Route")) "true" -}}
      {{- fail (printf "Route - Expected [targetSelector] of route [%s] to reference an enabled gateway, got [%s]" .fullName $objectData.targetSelector) -}}
    {{- end -}}
    {{- $ref = dict
          "name" (include "tc.v1.common.lib.util.gateway.getFullName" (dict "rootCtx" $rootCtx "name" $objectData.targetSelector))
          "namespace" (include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $target "caller" "Route"))
          "selector" $objectData.targetSelector -}}
  {{- end -}}
  {{- $ref | toYaml -}}
{{- end -}}
