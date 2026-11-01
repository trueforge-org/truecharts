{{- define "tc.v1.common.lib.chart.notes" -}}

  {{- include "tc.v1.common.lib.chart.header" . -}}

  {{- include "tc.v1.common.lib.chart.custom" . -}}

  {{- include "tc.v1.common.lib.chart.connections" . -}}

  {{- include "tc.v1.common.lib.chart.footer" . -}}

  {{- include "tc.v1.common.lib.chart.warnings" . -}}

{{- end -}}

{{- define "tc.v1.common.lib.chart.header" -}}
  {{- tpl $.Values.notes.header $ | nindent 0 }}
{{- end -}}

{{- define "tc.v1.common.lib.chart.custom" -}}
  {{- tpl $.Values.notes.custom $ | nindent 0 }}
{{- end -}}

{{- define "tc.v1.common.lib.chart.footer" -}}
  {{- tpl $.Values.notes.footer $ | nindent 0 }}
{{- end -}}

{{- define "tc.v1.common.lib.chart.warnings" -}}
  {{- range $w := $.Values.notes.warnings }}
    {{- tpl $w $ | nindent 0 }}
  {{- end }}
{{- end -}}

{{- define "add.warning" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $warn := .warn -}}

  {{- $newWarns := $rootCtx.Values.notes.warnings -}}
  {{- $newWarns = mustAppend $newWarns $warn -}}
  {{- $_ := set $rootCtx.Values.notes "warnings" $newWarns -}}
{{- end -}}

{{/*
Display the external URLs of all enabled ingresses, routes and exposed services
*/}}
{{- define "tc.v1.common.lib.chart.externalUrls" -}}
  {{- $rootCtx := . -}}
  {{- $urls := list -}}
  {{- $others := list -}}

  {{- range $name, $ingress := ($rootCtx.Values.ingress | default dict) -}}
    {{- if not (kindIs "map" $ingress) -}}{{- continue -}}{{- end -}}
    {{- $enabled := include "tc.v1.common.lib.util.enabled" (dict "rootCtx" $rootCtx "objectData" $ingress "name" $name "caller" "Ingress" "key" "ingress") -}}
    {{- if ne $enabled "true" -}}{{- continue -}}{{- end -}}

    {{- $context := include "tc.v1.common.lib.util.chartcontext.data" (dict "rootCtx" $rootCtx "objectData" (dict "override" dict "targetSelector" (dict "ingress" $name) "path" "")) | fromYaml -}}
    {{- range $host := $ingress.hosts -}}
      {{- if not $host.host -}}{{- continue -}}{{- end -}}
      {{- range $path := ($host.paths | default (list (dict "path" "/"))) -}}
        {{- $urls = mustAppend $urls (include "tc.v1.common.lib.chart.externalUrls.url" (dict "protocol" $context.appProtocol "host" (tpl $host.host $rootCtx) "port" $context.appPort "path" (tpl ($path.path | default "/") $rootCtx))) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- range $name, $route := ($rootCtx.Values.route | default dict) -}}
    {{- if ne (include "tc.v1.common.lib.gateway.enabled" (dict "rootCtx" $rootCtx "objectData" $route "name" $name "key" "route" "caller" "Route")) "true" -}}
      {{- continue -}}
    {{- end -}}

    {{- $kind := $route.kind | default "HTTPRoute" -}}
    {{- $hosts := list -}}
    {{- range $host := $route.hostnames -}}
      {{- $hosts = mustAppend $hosts (tpl $host $rootCtx) -}}
    {{- end -}}
    {{- $openable := list -}}
    {{- range $host := $hosts -}}
      {{- if not (hasPrefix "*" $host) -}}
        {{- $openable = mustAppend $openable $host -}}
      {{- end -}}
    {{- end -}}

    {{/* Only a HTTPRoute with a full hostname can be opened in a browser */}}
    {{- if or (ne $kind "HTTPRoute") (not $openable) -}}
      {{- $other := printf "%s `%s`" $kind $name -}}
      {{- with $hosts -}}
        {{- $other = printf "%s: %s" $other (join ", " .) -}}
      {{- end -}}
      {{- $others = mustAppend $others $other -}}
      {{- continue -}}
    {{- end -}}

    {{- $endpoint := include "tc.v1.common.lib.route.endpoint" (dict "rootCtx" $rootCtx "objectData" $route) | fromYaml -}}
    {{- range $path := (include "tc.v1.common.lib.chart.externalUrls.routePaths" (dict "rootCtx" $rootCtx "objectData" $route) | fromYaml).paths -}}
      {{- range $host := $openable -}}
        {{- $urls = mustAppend $urls (include "tc.v1.common.lib.chart.externalUrls.url" (dict "protocol" $endpoint.protocol "host" $host "port" $endpoint.port "path" $path)) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- $exposed := (include "tc.v1.common.lib.chart.externalUrls.services" $rootCtx | fromYaml).exposed -}}

  {{- if and (not $urls) (not $others) (not $exposed) -}}
    {{- $urls = list $rootCtx.Values.chartContext.appUrl -}}
  {{- end -}}

  {{- with $urls }}
## Connecting externally
You can use this Chart by opening the following links in your browser:
    {{- range $url := (. | uniq) }}
- {{ $url }}
    {{- end }}
  {{- end -}}
  {{- with $others }}

## Other routes
These routes are reached through the address of their gateway:
    {{- range $other := . }}
- {{ $other }}
    {{- end }}
  {{- end -}}
  {{- with $exposed }}

## Exposed services
These services can be reached from outside the cluster:
    {{- range $service := . }}
- {{ $service }}
    {{- end }}
  {{- end -}}
{{- end -}}

{{/* LoadBalancer, NodePort, hostPort and externalIPs. Follows the service class, which forces ClusterIP with hostNetwork, hostPort or stopAll */}}
{{- define "tc.v1.common.lib.chart.externalUrls.services" -}}
  {{- $rootCtx := . -}}
  {{- $exposed := list -}}

  {{- if not (include "tc.v1.common.lib.util.stopAll" $rootCtx) -}}
    {{- range $name, $service := ($rootCtx.Values.service | default dict) -}}
      {{- if not (kindIs "map" $service) -}}{{- continue -}}{{- end -}}
      {{- $enabled := include "tc.v1.common.lib.util.enabled" (dict "rootCtx" $rootCtx "objectData" $service "name" $name "caller" "Service" "key" "service") -}}
      {{- if ne $enabled "true" -}}{{- continue -}}{{- end -}}

      {{- $type := $service.type | default $rootCtx.Values.global.fallbackDefaults.serviceType -}}
      {{- if mustHas $type (list "ExternalName" "ExternalIP") -}}{{- continue -}}{{- end -}}

      {{- $objectData := mustDeepCopy $service -}}
      {{- $_ := set $objectData "shortName" $name -}}
      {{- $podValues := fromJson (include "tc.v1.common.lib.helpers.getSelectedPodValues" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "Service")) -}}
      {{- if $podValues -}}
        {{- if eq (include "tc.v1.common.lib.pod.hostNetwork" (dict "rootCtx" $rootCtx "objectData" $podValues) | toString) "true" -}}
          {{- continue -}}
        {{- end -}}
      {{- end -}}

      {{- $hasHostPort := false -}}
      {{- range $port := $service.ports -}}
        {{- if and $port.enabled $port.hostPort -}}
          {{- $hasHostPort = true -}}
        {{- end -}}
      {{- end -}}

      {{- $addresses := list -}}
      {{- if and (eq $type "LoadBalancer") (not $hasHostPort) -}}
        {{- range $ip := (ternary (list $service.loadBalancerIP) ($service.loadBalancerIPs | default list) (not (empty $service.loadBalancerIP))) -}}
          {{- $addresses = mustAppend $addresses (tpl $ip $rootCtx) -}}
        {{- end -}}
        {{- if not $addresses -}}
          {{- $addresses = list "<load-balancer-ip>" -}}
        {{- end -}}
      {{- end -}}

      {{- range $ip := $service.externalIPs -}}
        {{- $addresses = mustAppend $addresses (tpl $ip $rootCtx) -}}
      {{- end -}}

      {{- range $portName, $port := $service.ports -}}
        {{- $portEnabled := include "tc.v1.common.lib.util.enabled" (dict "rootCtx" $rootCtx "objectData" $port "name" $portName "caller" "Service" "key" "port") -}}
        {{- if ne $portEnabled "true" -}}{{- continue -}}{{- end -}}

        {{- $protocol := tpl ($port.protocol | default $rootCtx.Values.global.fallbackDefaults.serviceProtocol) $rootCtx -}}
        {{- $endpoints := list -}}
        {{- $portNumber := tpl ($port.port | toString) $rootCtx -}}
        {{- range $address := $addresses -}}
          {{- $endpoints = mustAppend $endpoints (dict "host" $address "port" $portNumber) -}}
        {{- end -}}

        {{- $label := $type -}}
        {{- if $hasHostPort -}}
          {{- $label = "hostPort" -}}
          {{- if $port.hostPort -}}
            {{- $endpoints = mustAppend $endpoints (dict "host" "<node-ip>" "port" (tpl ($port.hostPort | toString) $rootCtx)) -}}
          {{- end -}}
        {{- else if and (eq $type "NodePort") $port.nodePort -}}
          {{- $endpoints = mustAppend $endpoints (dict "host" "<node-ip>" "port" (tpl ($port.nodePort | toString) $rootCtx)) -}}
        {{- end -}}

        {{- range $endpoint := $endpoints -}}
          {{- $host := $endpoint.host -}}
          {{- if contains ":" $host -}}
            {{- $host = printf "[%s]" $host -}}
          {{- end -}}
          {{- $address := printf "%s:%s/%s" $host $endpoint.port ($protocol | upper) -}}
          {{- if mustHas $protocol (list "http" "https") -}}
            {{- $address = include "tc.v1.common.lib.chart.externalUrls.url" (dict "protocol" $protocol "host" $host "port" $endpoint.port "path" "/") -}}
          {{- end -}}
          {{- $exposed = mustAppend $exposed (printf "`%s` port `%s` (%s): %s" $name $portName $label $address) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- dict "exposed" $exposed | toYaml -}}
{{- end -}}

{{/* Standard ports are left out, as is the path if it is the root */}}
{{- define "tc.v1.common.lib.chart.externalUrls.url" -}}
  {{- $url := printf "%s://%s" .protocol .host -}}
  {{- if not (mustHas (.port | toString) (list "80" "443")) -}}
    {{- $url = printf "%s:%s" $url (.port | toString) -}}
  {{- end -}}
  {{- if ne .path "/" -}}
    {{- $url = printf "%s%s" $url .path -}}
  {{- end -}}
  {{- $url -}}
{{- end -}}

{{/* The first path of each rule that forwards traffic. Rules that only redirect, and regular expressions, can't be opened */}}
{{- define "tc.v1.common.lib.chart.externalUrls.routePaths" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $paths := list -}}
  {{- $rules := .objectData.rules | default (list dict) -}}
  {{- range $rule := $rules -}}
    {{- if and $rule.filters (not $rule.backendRefs) -}}{{- continue -}}{{- end -}}
    {{- $path := dict "type" "PathPrefix" "value" "/" -}}
    {{- if and $rule.matches (first $rule.matches).path -}}
      {{- $path = mustMerge (dict) (first $rule.matches).path $path -}}
    {{- end -}}
    {{- if ne $path.type "RegularExpression" -}}
      {{- $paths = mustAppend $paths (tpl $path.value $rootCtx) -}}
    {{- end -}}
  {{- end -}}
  {{- dict "paths" $paths | toYaml -}}
{{- end -}}

{{/*
Returns the given credential, or HIDDEN unless notes.showCredentials is enabled
Call this template:
{{ include "tc.v1.common.lib.chart.notes.credential" (dict "rootCtx" $ "value" $value) }}
*/}}
{{- define "tc.v1.common.lib.chart.notes.credential" -}}
  {{- $notes := .rootCtx.Values.notes | default dict -}}
  {{- if $notes.showCredentials -}}
    {{- .value -}}
  {{- else -}}
    HIDDEN
  {{- end -}}
{{- end -}}

{{/*
Display connection information for enabled dependencies and addons
*/}}
{{- define "tc.v1.common.lib.chart.connections" -}}
  {{- $hasConnections := false -}}
  {{- $connections := list -}}

  {{- /* Check for enabled databases */ -}}
  {{- if .Values.cnpg -}}
    {{- range $name, $cnpg := .Values.cnpg -}}
      {{- if $cnpg.enabled -}}
        {{- $hasConnections = true -}}
        {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.cnpg" (dict "name" $name "cnpg" $cnpg "rootCtx" $) | trim) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* MariaDB from the dependencies */}}
  {{- $mariadb := get (.Values.dependencies | default dict) "mariadb" -}}
  {{- if kindIs "map" $mariadb -}}
    {{- $mariadbEnabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $mariadb
                    "name" "mariadb" "caller" "Dependencies"
                    "key" "dependencies")) -}}
    {{- if eq $mariadbEnabled "true" -}}
      {{- $hasConnections = true -}}
      {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.mariadb" . | trim) -}}
    {{- end -}}
  {{- end -}}

  {{/* Valkey from the dependencies */}}
  {{- $valkey := get (.Values.dependencies | default dict) "valkey" -}}
  {{- if kindIs "map" $valkey -}}
    {{- $valkeyEnabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $valkey
                    "name" "valkey" "caller" "Dependencies"
                    "key" "dependencies")) -}}
    {{- if eq $valkeyEnabled "true" -}}
      {{- $hasConnections = true -}}
      {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.valkey" . | trim) -}}
    {{- end -}}
  {{- end -}}

  {{/* MongoDB from the dependencies */}}
  {{- $mongodb := get (.Values.dependencies | default dict) "mongodb" -}}
  {{- if kindIs "map" $mongodb -}}
    {{- $mongodbEnabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $mongodb
                    "name" "mongodb" "caller" "Dependencies"
                    "key" "dependencies")) -}}
    {{- if eq $mongodbEnabled "true" -}}
      {{- $hasConnections = true -}}
      {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.mongodb" . | trim) -}}
    {{- end -}}
  {{- end -}}

  {{/* ClickHouse from the dependencies */}}
  {{- $clickhouse := get (.Values.dependencies | default dict) "clickhouse" -}}
  {{- if kindIs "map" $clickhouse -}}
    {{- $clickhouseEnabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $clickhouse
                    "name" "clickhouse" "caller" "Dependencies"
                    "key" "dependencies")) -}}
    {{- if eq $clickhouseEnabled "true" -}}
      {{- $hasConnections = true -}}
      {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.clickhouse" . | trim) -}}
    {{- end -}}
  {{- end -}}

  {{- /* Check for enabled addons */ -}}
  {{- if .Values.addons -}}
    {{- if .Values.addons.tailscale -}}
      {{- if .Values.addons.tailscale.enabled -}}
        {{- $hasConnections = true -}}
        {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.tailscale" . | trim) -}}
      {{- end -}}
    {{- end -}}
    {{- if .Values.addons.codeserver -}}
      {{- if .Values.addons.codeserver.enabled -}}
        {{- $hasConnections = true -}}
        {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.codeserver" . | trim) -}}
      {{- end -}}
    {{- end -}}
    {{- if .Values.addons.netshoot -}}
      {{- if .Values.addons.netshoot.enabled -}}
        {{- $hasConnections = true -}}
        {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.netshoot" . | trim) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if $hasConnections -}}
# Connection Information
{{ join "\n\n" $connections }}
  {{- end -}}
{{- end -}}

{{/*
CNPG connection information
*/}}
{{- define "tc.v1.common.lib.chart.connections.cnpg" -}}
  {{- $name := .name -}}
  {{- $cnpg := .cnpg -}}
  {{- $rootCtx := .rootCtx -}}
## CNPG Database: {{ $name }}
  {{- if $cnpg.creds -}}
  {{- if $cnpg.creds.host }}
- Host: {{ $cnpg.creds.host | quote }}
  {{- end -}}
  {{- if $cnpg.creds.porthost }}
- Host:Port: {{ $cnpg.creds.porthost | quote }}
  {{- end -}}
  {{- if $cnpg.database }}
- Database: {{ $cnpg.database }}
  {{- end -}}
  {{- if $cnpg.user }}
- Username: {{ $cnpg.user }}
  {{- end -}}
  {{- if $cnpg.creds.std }}
- Connection URL: {{ include "tc.v1.common.lib.chart.notes.credential" (dict "rootCtx" $rootCtx "value" $cnpg.creds.std) | quote }}
  {{- end -}}
  {{- if $cnpg.creds.jdbc }}
- JDBC URL: {{ $cnpg.creds.jdbc | quote }}
  {{- end -}}
  {{- if and $cnpg.pooler $cnpg.pooler.enabled $cnpg.pooler.createRO -}}
  {{- if $cnpg.creds.stdRO }}
- Read-Only URL: {{ include "tc.v1.common.lib.chart.notes.credential" (dict "rootCtx" $rootCtx "value" $cnpg.creds.stdRO) | quote }}
  {{- end -}}
  {{- end -}}
  {{- else }}
- Configuration pending (credentials will be available after initialization)
  {{- end }}
{{- end -}}

{{/*
MariaDB connection information
*/}}
{{- define "tc.v1.common.lib.chart.connections.mariadb" -}}
{{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "mariadb")) -}}
{{- $dep := get (.Values.dependencies | default dict) "mariadb" -}}
{{- $depconfig := $dep.depconfig | default dict -}}
{{- $creds := $depconfig.creds | default dict -}}
## MariaDB Database
{{- if $service -}}
{{- $service = $service | fromJson }}
- Host: {{ $service.name }}
- Port: {{ $service.port }}
- Host:Port: {{ $service.name }}:{{ $service.port }}
  {{- if $depconfig.mariadbDatabase }}
- Database: {{ $depconfig.mariadbDatabase }}
  {{- end -}}
  {{- if $depconfig.mariadbUsername }}
- Username: {{ $depconfig.mariadbUsername }}
  {{- end -}}
  {{- if $creds.complete }}
- Connection URL: {{ include "tc.v1.common.lib.chart.notes.credential" (dict "rootCtx" $ "value" $creds.complete) }}
  {{- end -}}
  {{- if $creds.jdbcmariadb }}
- JDBC URL: {{ $creds.jdbcmariadb }}
  {{- end -}}
{{- else }}
- Configuration pending (service will be available after initialization)
{{- end -}}
{{- end -}}

{{/*
Valkey connection information
*/}}
{{- define "tc.v1.common.lib.chart.connections.valkey" -}}
{{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "valkey")) -}}
## Valkey Database
{{- if $service -}}
{{- $service = $service | fromJson }}
- Host: {{ $service.name }}
- Port: {{ $service.port }}
- Host:Port: {{ $service.name }}:{{ $service.port }}
{{- else }}
- Configuration pending (service will be available after initialization)
{{- end -}}
{{- end -}}

{{/*
MongoDB connection information
*/}}
{{- define "tc.v1.common.lib.chart.connections.mongodb" -}}
{{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "mongodb")) -}}
{{- $dep := get (.Values.dependencies | default dict) "mongodb" -}}
{{- $depconfig := $dep.depconfig | default dict -}}
{{- $creds := $depconfig.creds | default dict -}}
## MongoDB Database
{{- if $service -}}
{{- $service = $service | fromJson }}
- Host: {{ $service.name }}
- Port: {{ $service.port }}
- Host:Port: {{ $service.name }}:{{ $service.port }}
  {{- if $depconfig.mongodbDatabase }}
- Database: {{ $depconfig.mongodbDatabase }}
  {{- end -}}
  {{- if $depconfig.mongodbUsername }}
- Username: {{ $depconfig.mongodbUsername }}
  {{- end -}}
  {{- if $creds.complete }}
- Connection URL: {{ include "tc.v1.common.lib.chart.notes.credential" (dict "rootCtx" $ "value" $creds.complete) }}
  {{- end -}}
  {{- if $creds.jdbc }}
- JDBC URL: {{ $creds.jdbc }}
  {{- end -}}
{{- else }}
- Configuration pending (service will be available after initialization)
{{- end -}}
{{- end -}}

{{/*
Clickhouse connection information
*/}}
{{- define "tc.v1.common.lib.chart.connections.clickhouse" -}}
{{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "clickhouse")) -}}
{{- $dep := get (.Values.dependencies | default dict) "clickhouse" -}}
{{- $depconfig := $dep.depconfig | default dict -}}
{{- $creds := $depconfig.creds | default dict -}}
## ClickHouse Database
{{- if $service -}}
{{- $service = $service | fromJson }}
- Host: {{ $service.name }}
- Port: {{ $service.port }}
- Host:Port: {{ $service.name }}:{{ $service.port }}
  {{- if $depconfig.clickhouseDatabase }}
- Database: {{ $depconfig.clickhouseDatabase }}
  {{- end -}}
  {{- if $depconfig.clickhouseUsername }}
- Username: {{ $depconfig.clickhouseUsername }}
  {{- end -}}
  {{- if $creds.complete }}
- Connection URL: {{ include "tc.v1.common.lib.chart.notes.credential" (dict "rootCtx" $ "value" $creds.complete) }}
  {{- end -}}
  {{- if $creds.jdbc }}
- JDBC URL: {{ $creds.jdbc }}
  {{- end -}}
{{- else }}
- Configuration pending (service will be available after initialization)
{{- end -}}
{{- end -}}

{{/*
Tailscale addon information
*/}}
{{- define "tc.v1.common.lib.chart.connections.tailscale" -}}
## Tailscale VPN Addon
- Status: Enabled
  {{- if .Values.addons.tailscale.settings -}}
  {{- if .Values.addons.tailscale.settings.routes }}
- Routes: {{ .Values.addons.tailscale.settings.routes }}
  {{- end -}}
  {{- if .Values.addons.tailscale.settings.dest_ip }}
- Destination IP: {{ .Values.addons.tailscale.settings.dest_ip }}
  {{- end -}}
  {{- if .Values.addons.tailscale.settings.userspace }}
- Userspace Mode: {{ .Values.addons.tailscale.settings.userspace }}
  {{- end -}}
  {{- end }}
- Note: Tailscale provides secure VPN connectivity as a sidecar container
{{- end -}}

{{/*
Code-Server addon information
*/}}
{{- define "tc.v1.common.lib.chart.connections.codeserver" -}}
## Code-Server Addon
- Status: Enabled
  {{- if .Values.addons.codeserver.service -}}
  {{- if .Values.addons.codeserver.service.main -}}
  {{- if .Values.addons.codeserver.service.main.ports -}}
  {{- if .Values.addons.codeserver.service.main.ports.codeserver -}}
  {{- if .Values.addons.codeserver.service.main.ports.codeserver.port }}
- Port: {{ .Values.addons.codeserver.service.main.ports.codeserver.port }}
  {{- end -}}
  {{- end -}}
  {{- end -}}
  {{- end -}}
  {{- end }}
- Note: Access code-server to edit files in the pod
{{- end -}}

{{/*
Netshoot addon information
*/}}
{{- define "tc.v1.common.lib.chart.connections.netshoot" -}}
## Netshoot Addon
- Status: Enabled
- Note: Netshoot provides network troubleshooting tools as a sidecar container
{{- end -}}
