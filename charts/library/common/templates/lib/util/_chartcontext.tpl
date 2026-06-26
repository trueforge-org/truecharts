{{/* Returns the primary Workload object */}}
{{- define "tc.v1.common.lib.util.chartcontext" -}}

  {{/* Prepare an empty object so it the chartcontext.data util behave properly */}}
  {{- $objectData := (dict
    "override" dict
    "targetSelector" dict
    "path" ""
  ) -}}

  {{- $context := (include "tc.v1.common.lib.util.chartcontext.data" (dict "rootCtx" $ "objectData" $objectData) | fromYaml) -}}

  {{- $_ := set $.Values "chartContext" $context -}}

  {{/* This flag is only used in CI/Unit Tests so we can confirm that $context is correctly generated */}}
  {{- if $.Values.createChartContextConfigmap -}}
    {{- $_ := set $.Values.configmap "chart-context" (dict
      "enabled" true
      "data" $context
    ) -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.lib.util.chartcontext.data" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{/* Create defaults */}}
  {{- $protocol := "http" -}}
  {{- $host := "127.0.0.1" -}}
  {{- $port := "443" -}}
  {{- $path := "/" -}}
  {{- $podCIDR := "172.16.0.0/16" -}}
  {{- $svcCIDR := "172.17.0.0/16" -}}

  {{- if $rootCtx.Values.global.podCIDR -}}
    {{- $podCIDR = $rootCtx.Values.global.podCIDR -}}
  {{- end -}}

  {{- if $rootCtx.Values.global.svcCIDR -}}
    {{- $svcCIDR = $rootCtx.Values.global.svcCIDR -}}
  {{- end -}}

  {{/* TODO: Find ways to implement CIDR detection */}}

  {{/* If there is ingress/route, get data from the primary */}}
  {{- $primaryIngressName := include "tc.v1.common.lib.util.ingress.primary" (dict "rootCtx" $rootCtx) -}}
  {{- $selectedIngress := (get $rootCtx.Values.ingress $primaryIngressName) -}}

  {{- $primaryRouteName := include "tc.v1.common.lib.util.route.primary" (dict "rootCtx" $rootCtx) -}}
  {{- $selectedRoute := dict -}}
  {{- if $rootCtx.Values.route -}}
    {{- $selectedRoute = (get $rootCtx.Values.route $primaryRouteName) -}}
  {{- end -}}

  {{- with $objectData.targetSelector -}}
    {{- if .ingress -}}
      {{- $ing := (get $rootCtx.Values.ingress .ingress) -}}
      {{- if $ing -}}
        {{- $selectedIngress = $ing -}}
      {{- end -}}
    {{- end -}}

    {{- if .route -}}
      {{- $route := (get $rootCtx.Values.route .route) -}}
      {{- if $route -}}
        {{- $selectedRoute = $route -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- with $selectedIngress -}}
    {{- $firstHost := list -}}
    {{- if (kindIs "slice" .hosts) -}}
      {{- $firstHost = ((.hosts | default list) | mustFirst) -}}
    {{- end -}}
    {{- if $firstHost -}}
      {{- if $firstHost.host -}}
        {{- $host = tpl $firstHost.host $rootCtx -}}
      {{- end -}}

      {{- $firstPath := list -}}
      {{- if (kindIs "slice" $firstHost.paths) -}}
        {{- $firstPath = (($firstHost.paths | default list) | mustFirst) -}}
      {{- end -}}
      {{- if $firstPath -}}
        {{- $path = $firstPath.path -}}
      {{- end -}}
    {{- end -}}

    {{- if and .integrations .integrations.traefik -}}
      {{- $enabled := true -}}
      {{- if and (hasKey .integrations.traefik "enabled") (kindIs "bool" .integrations.traefik.enabled) -}}
        {{- $enabled = .integrations.traefik.enabled -}}
      {{- end -}}

      {{- if $enabled -}}
        {{- $entrypoints := (.integrations.traefik.entrypoints | default (list "websecure")) -}}
        {{- if kindIs "slice" $entrypoints -}}
          {{- if mustHas "websecure" $entrypoints -}}
            {{- $port = "443" -}}
          {{- else if mustHas "web" $entrypoints -}}
            {{- $port = "80" -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

    {{- if and .integrations .integrations.certManager .integrations.certManager.enabled -}}
      {{- $protocol = "https" -}}
      {{- $port = "443" -}}
    {{- end -}}

    {{- $tls := ((.tls | default list) | mustFirst) -}}
    {{- if (or $tls.secretName $tls.certificateIssuer $tls.clusterCertificate) -}}
      {{- $protocol = "https" -}}
      {{- $port = "443" -}}
    {{- end -}}
  {{- end -}}

  {{- if and (not $selectedIngress) $selectedRoute -}}
    {{- with $selectedRoute -}}
      {{- if and (kindIs "slice" .hostnames) (gt (len .hostnames) 0) -}}
        {{- $host = tpl ((.hostnames | default list) | mustFirst) $rootCtx -}}
      {{- end -}}

      {{- if and (eq (.kind | default "HTTPRoute") "HTTPRoute") (kindIs "slice" .rules) (gt (len .rules) 0) -}}
        {{- $firstRule := ((.rules | default list) | mustFirst) -}}
        {{- if and (kindIs "slice" $firstRule.matches) (gt (len $firstRule.matches) 0) -}}
          {{- $firstMatch := (($firstRule.matches | default list) | mustFirst) -}}
          {{- with $firstMatch.path.value -}}
            {{- $path = tpl . $rootCtx -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* If there is no ingress/route, we have to use service */}}
  {{- if and (not $selectedIngress) (not $selectedRoute) -}}
    {{- $primaryServiceName := include "tc.v1.common.lib.util.service.primary" (dict "rootCtx" $rootCtx) -}}
    {{- $selectedService := (get $rootCtx.Values.service $primaryServiceName) -}}

    {{- with $objectData.targetSelector -}}
      {{- if .service -}}
        {{- $svc := (get $rootCtx.Values.service .service) -}}
        {{- if $svc -}}
          {{- $selectedService = $svc -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

    {{- $primaryPort := dict -}}
    {{- if $selectedService -}}
      {{- $primaryPortName := include "tc.v1.common.lib.util.service.ports.primary" (dict "rootCtx" $rootCtx "svcValues" $selectedService) -}}
      {{- $selectedPort := dict -}}
      {{- if $selectedService.ports -}} {{/* eg, ExternalName does not require ports */}}
        {{- $selectedPort = (get $selectedService.ports $primaryPortName) -}}
      {{- end -}}

      {{- with $objectData.targetSelector -}}
        {{- if .port -}}
          {{- $port := (get $selectedService.ports .port) -}}
          {{- if $port -}}
            {{- $selectedPort = $port -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}

      {{- if not $selectedPort -}}
        {{- $portName := ($selectedService.ports | keys | sortAlpha | mustFirst) -}}
        {{- if $selectedService.ports -}} {{/* eg, ExternalName does not require ports */}}
          {{- $selectedPort = (get $selectedService.ports $portName) -}}
        {{- end -}}
      {{- end -}}

      {{- $port = tpl ($selectedPort.port | toString) $rootCtx -}}

      {{- if mustHas $selectedPort.protocol (list "http" "https") -}}
        {{- $protocol = $selectedPort.protocol -}}
      {{- else -}}
        {{- $protocol = "http" -}}
      {{- end -}}

      {{- if eq $selectedService.type "LoadBalancer" -}}
        {{- if (kindIs "string" $selectedService.loadBalancerIP) -}}
          {{- with $selectedService.loadBalancerIP -}}
            {{- $host = tpl . $rootCtx | toString -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* Overrides */}}
  {{- with $objectData.override -}}
    {{- if .protocol -}}
      {{- $protocol = .protocol -}}
    {{- end -}}

    {{- if .host -}}
      {{- $host = .host -}}
    {{- end -}}

    {{- if .port -}}
      {{- $port = .port -}}
    {{- end -}}
  {{- end -}}

  {{- with $objectData.path -}}
    {{- $path = . -}}
  {{- end -}}

  {{/* URL Will not include the path. */}}
  {{- $url := printf "%s://%s:%s" $protocol $host $port -}}
  {{- $urlWithPortAndPath := printf "%s://%s:%s%s" $protocol $host $port $path -}}

  {{/* Clean up the URL */}}
  {{- $port = $port | toString -}}
  {{- if eq $port "443" -}}
    {{- $url = $url | trimSuffix ":443" -}}
    {{- $url = $url | replace $protocol "https" -}}
    {{- $urlWithPortAndPath = $urlWithPortAndPath | replace $protocol "https" -}}
    {{- $protocol = "https" -}}
  {{- end -}}

  {{- if eq $port "80" -}}
    {{- $url = $url | trimSuffix ":80" -}}
    {{- $url = $url | replace $protocol "http" -}}
    {{- $urlWithPortAndPath = $urlWithPortAndPath | replace $protocol "http" -}}
    {{- $protocol = "http" -}}
  {{- end -}}

  {{- $context := (dict
    "podCIDR" $podCIDR "svcCIDR" $svcCIDR
    "appUrl" $url "appUrlWithPortAndPath" $urlWithPortAndPath
    "appHost" $host "appPort" $port
    "appPath" $path "appProtocol" $protocol
  ) -}}

  {{- $context | toJson -}}
{{- end -}}
