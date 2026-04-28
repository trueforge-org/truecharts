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

  {{- if .Values.mariadb -}}
    {{- if .Values.mariadb.enabled -}}
      {{- $hasConnections = true -}}
      {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.mariadb" . | trim) -}}
    {{- end -}}
  {{- end -}}

  {{/* Check for valkey service from dependencies */}}
  {{- $valkeyServiceExists := false -}}
  {{- range $name, $service := .Values.service -}}
    {{- if kindIs "map" $service -}}
      {{- if hasPrefix "valkey-" $name -}}
        {{- $valkeyServiceExists = true -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  
  {{- if $valkeyServiceExists -}}
    {{- $hasConnections = true -}}
    {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.valkey" . | trim) -}}
  {{- end -}}

  {{- if .Values.mongodb -}}
    {{- if .Values.mongodb.enabled -}}
      {{- $hasConnections = true -}}
      {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.mongodb" . | trim) -}}
    {{- end -}}
  {{- end -}}

  {{- if .Values.clickhouse -}}
    {{- if .Values.clickhouse.enabled -}}
      {{- $hasConnections = true -}}
      {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.clickhouse" . | trim) -}}
    {{- end -}}
  {{- end -}}

  {{- if .Values.solr -}}
    {{- if .Values.solr.enabled -}}
      {{- $hasConnections = true -}}
      {{- $connections = append $connections (include "tc.v1.common.lib.chart.connections.solr" . | trim) -}}
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
- Connection URL: {{ $cnpg.creds.std | quote }}
  {{- end -}}
  {{- if $cnpg.creds.jdbc }}
- JDBC URL: {{ $cnpg.creds.jdbc | quote }}
  {{- end -}}
  {{- if and $cnpg.pooler $cnpg.pooler.enabled $cnpg.pooler.createRO -}}
  {{- if $cnpg.creds.stdRO }}
- Read-Only URL: {{ $cnpg.creds.stdRO | quote }}
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
## MariaDB Database
  {{- if .Values.mariadb.creds -}}
  {{- if .Values.mariadb.creds.plainhost }}
- Host: {{ .Values.mariadb.creds.plainhost }}
  {{- end -}}
  {{- if .Values.mariadb.creds.plainporthost }}
- Host:Port: {{ .Values.mariadb.creds.plainporthost }}
  {{- end -}}
  {{- if .Values.mariadb.mariadbDatabase }}
- Database: {{ .Values.mariadb.mariadbDatabase }}
  {{- end -}}
  {{- if .Values.mariadb.mariadbUsername }}
- Username: {{ .Values.mariadb.mariadbUsername }}
  {{- end -}}
  {{- if .Values.mariadb.creds.complete }}
- Connection URL: {{ .Values.mariadb.creds.complete }}
  {{- end -}}
  {{- if .Values.mariadb.creds.jdbcmariadb }}
- JDBC URL: {{ .Values.mariadb.creds.jdbcmariadb }}
  {{- end -}}
  {{- else }}
- Configuration pending (credentials will be available after initialization)
  {{- end }}
{{- end -}}

{{/*
Valkey connection information
*/}}
{{- define "tc.v1.common.lib.chart.connections.valkey" -}}
{{- $valkeyServiceName := "" -}}
{{- $valkeyPort := "6379" -}}
{{- range $name, $service := .Values.service -}}
  {{- if and (kindIs "map" $service) (hasPrefix "valkey-" $name) -}}
    {{- $valkeyServiceName = $name -}}
    {{- range $portName, $portConfig := $service.ports -}}
      {{- if $portConfig.enabled -}}
        {{- $valkeyPort = toString $portConfig.port -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- if $valkeyServiceName -}}
{{- $hostName := printf "%s-%s" .Release.Name $valkeyServiceName -}}
## Valkey Database
- Host: {{ $hostName }}
- Port: {{ $valkeyPort }}
- Host:Port: {{ $hostName }}:{{ $valkeyPort }}
{{- else }}
## Valkey Database
- Configuration pending (service will be available after initialization)
{{- end -}}
{{- end -}}

{{/*
MongoDB connection information
*/}}
{{- define "tc.v1.common.lib.chart.connections.mongodb" -}}
## MongoDB Database
  {{- if .Values.mongodb.creds -}}
  {{- if .Values.mongodb.creds.plainhost }}
- Host: {{ .Values.mongodb.creds.plainhost }}
  {{- end -}}
  {{- if .Values.mongodb.creds.plainporthost }}
- Host:Port: {{ .Values.mongodb.creds.plainporthost }}
  {{- end -}}
  {{- if .Values.mongodb.mongodbDatabase }}
- Database: {{ .Values.mongodb.mongodbDatabase }}
  {{- end -}}
  {{- if .Values.mongodb.mongodbUsername }}
- Username: {{ .Values.mongodb.mongodbUsername }}
  {{- end -}}
  {{- if .Values.mongodb.creds.complete }}
- Connection URL: {{ .Values.mongodb.creds.complete }}
  {{- end -}}
  {{- if .Values.mongodb.creds.jdbc }}
- JDBC URL: {{ .Values.mongodb.creds.jdbc }}
  {{- end -}}
  {{- else }}
- Configuration pending (credentials will be available after initialization)
  {{- end }}
{{- end -}}

{{/*
Clickhouse connection information
*/}}
{{- define "tc.v1.common.lib.chart.connections.clickhouse" -}}
## Clickhouse Database
  {{- if .Values.clickhouse.creds -}}
  {{- if .Values.clickhouse.creds.plainhost }}
- Host: {{ .Values.clickhouse.creds.plainhost }}
  {{- end -}}
  {{- if .Values.clickhouse.creds.plainporthost }}
- Host:Port: {{ .Values.clickhouse.creds.plainporthost }}
  {{- end -}}
  {{- if .Values.clickhouse.clickhouseDatabase }}
- Database: {{ .Values.clickhouse.clickhouseDatabase }}
  {{- end -}}
  {{- if .Values.clickhouse.clickhouseUsername }}
- Username: {{ .Values.clickhouse.clickhouseUsername }}
  {{- end -}}
  {{- if .Values.clickhouse.creds.complete }}
- Connection URL: {{ .Values.clickhouse.creds.complete }}
  {{- end -}}
  {{- if .Values.clickhouse.creds.jdbc }}
- JDBC URL: {{ .Values.clickhouse.creds.jdbc }}
  {{- end -}}
  {{- else }}
- Configuration pending (credentials will be available after initialization)
  {{- end }}
{{- end -}}

{{/*
Solr connection information
Note: Solr uses 'portHost' (camelCase) from the injector, unlike other deps that use 'plainporthost'
*/}}
{{- define "tc.v1.common.lib.chart.connections.solr" -}}
## Solr Search
  {{- if .Values.solr.creds -}}
  {{- if .Values.solr.creds.plainhost }}
- Host: {{ .Values.solr.creds.plainhost }}
  {{- end -}}
  {{- if .Values.solr.creds.portHost }}
- Host:Port: {{ .Values.solr.creds.portHost }}
  {{- end -}}
  {{- if .Values.solr.solrCores }}
- Cores: {{ .Values.solr.solrCores }}
  {{- end -}}
  {{- if .Values.solr.solrEnableAuthentication }}
- Authentication: {{ .Values.solr.solrEnableAuthentication }}
  {{- end -}}
  {{- if .Values.solr.creds.url }}
- Connection URL: {{ .Values.solr.creds.url }}
  {{- end -}}
  {{- else }}
- Configuration pending (credentials will be available after initialization)
  {{- end }}
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
