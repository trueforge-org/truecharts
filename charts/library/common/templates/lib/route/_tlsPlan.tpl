{{/* Plans the listeners and certificates of all routes of this chart.
Listeners with the same hostname and port conflict on a gateway, and the oldest one wins. So routes
that share a hostname, for example with different paths, must share one listener and one certificate.
*/}}
{{- define "tc.v1.common.lib.route.tlsPlan" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $chartName := include "tc.v1.common.lib.chart.names.fullname" $rootCtx -}}

  {{- $listenerSets := dict -}}
  {{- $certificates := dict -}}
  {{- $routeParents := dict -}}
  {{- $seenHosts := dict -}}

  {{- range $name, $route := ($rootCtx.Values.route | default dict) -}}
    {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $route "name" $name "key" "route" "caller" "Route")) "true" -}}
      {{- continue -}}
    {{- end -}}

    {{- $fullName := include "tc.v1.common.lib.route.getFullName" (dict "rootCtx" $rootCtx "objectData" $route "name" $name) -}}
    {{- $listeners := (include "tc.v1.common.lib.route.listeners" (dict "rootCtx" $rootCtx "objectData" $route "fullName" $chartName) | fromYaml).listeners -}}
    {{- if not $listeners -}}{{- continue -}}{{- end -}}

    {{- $gatewayRef := include "tc.v1.common.lib.route.gatewayRef" (dict "rootCtx" $rootCtx "objectData" $route "fullName" $fullName) | fromYaml -}}
    {{- $port := ($route.listenerPort | default $rootCtx.Values.global.fallbackDefaults.routeListenerPort) | int -}}
    {{- $namespace := include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $route "caller" "Route") -}}
    {{- $parents := list -}}

    {{- range $listener := $listeners -}}
      {{/* One issuer annotation per ListenerSet, so each issuer gets its own */}}
      {{- $setName := printf "%s-%s-%d" $chartName $gatewayRef.name $port -}}
      {{- with $listener.issuer -}}
        {{- $setName = printf "%s-%s" $setName . -}}
      {{- end -}}

      {{- $hostKey := printf "%s/%s/%d/%s" $gatewayRef.namespace $gatewayRef.name $port $listener.host -}}
      {{- $seen := get $seenHosts $hostKey -}}
      {{- if $seen -}}
        {{- if or (ne $seen.secretName $listener.secretName) (ne ($seen.issuer | default "") ($listener.issuer | default "")) (ne $seen.namespace $namespace) -}}
          {{- fail (printf "Route - Routes [%s] and [%s] use hostname [%s] on the same gateway and port, so they share a listener, but with different TLS settings. Set the same TLS on both" $seen.route $name $listener.host) -}}
        {{- end -}}
      {{- else -}}
        {{- $_ := set $seenHosts $hostKey (dict "route" $name "secretName" $listener.secretName "issuer" ($listener.issuer | default "") "namespace" $namespace) -}}

        {{- $setKey := printf "%s/%s" $namespace $setName -}}
        {{- $set := get $listenerSets $setKey -}}
        {{- if not $set -}}
          {{- $set = dict "name" $setName "namespace" $namespace "gatewayRef" $gatewayRef "port" $port "issuer" ($listener.issuer | default "") "labels" dict "listeners" list -}}
        {{- end -}}
        {{- if ne $set.gatewayRef.namespace $gatewayRef.namespace -}}
          {{- fail (printf "Route - Route [%s] selects gateway [%s] in namespace [%s], but another route selects a gateway with that name in namespace [%s]. Use one of them per chart" $name $gatewayRef.name $gatewayRef.namespace $set.gatewayRef.namespace) -}}
        {{- end -}}
        {{- $_ := set $set "listeners" (mustAppend $set.listeners (dict "host" $listener.host "secretName" $listener.secretName)) -}}
        {{- $_ := set $set "labels" (mustMerge $set.labels ($route.labels | default dict)) -}}
        {{- $_ := set $listenerSets $setKey $set -}}
      {{- end -}}

      {{- if not (mustHas $setName $parents) -}}
        {{- $parents = mustAppend $parents $setName -}}
      {{- end -}}
    {{- end -}}
    {{- $_ := set $routeParents $name $parents -}}

    {{/* Routes with the same certificate only create it once */}}
    {{- if not (include "tc.v1.common.lib.route.hasCertManager" (dict "objectData" $route)) -}}
      {{- range $t := $route.tls -}}
        {{- if $t.certificateIssuer -}}
          {{- $hosts := list -}}
          {{- range $h := $t.hosts -}}
            {{- $hosts = mustAppend $hosts (tpl $h $rootCtx) -}}
          {{- end -}}
          {{- $certName := include "tc.v1.common.lib.route.secretName" (dict "chartName" $chartName "host" (first $hosts)) -}}
          {{- $existing := get $certificates $certName -}}
          {{- if and $existing (or (ne $existing.certificateIssuer $t.certificateIssuer) (not (deepEqual $existing.hosts $hosts))) -}}
            {{- fail (printf "Route - Certificate [%s] is defined with different hosts or issuers. Routes that share a hostname must set the same [tls]" $certName) -}}
          {{- end -}}
          {{- $_ := set $certificates $certName (dict "name" $certName "shortName" $name "hosts" $hosts "certificateIssuer" $t.certificateIssuer) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- dict "listenerSets" $listenerSets "certificates" $certificates "routeParents" $routeParents | toYaml -}}
{{- end -}}

{{/* A secret per hostname, so routes that share a hostname reuse the certificate */}}
{{- define "tc.v1.common.lib.route.secretName" -}}
  {{- printf "%s-tls-%s" .chartName (.host | replace "*" "wildcard" | replace "." "-") -}}
{{- end -}}
