{{/*
This template generates the clickhouse credentials and the secret holding them
*/}}
{{- define "tc.v1.common.dependencies.clickhouse.secret" -}}

  {{- $dep := get (.Values.dependencies | default dict) "clickhouse" -}}

  {{- if kindIs "map" $dep -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $dep
                    "name" "clickhouse" "caller" "Dependencies"
                    "key" "dependencies")) -}}

    {{- if eq $enabled "true" -}}
      {{- if not (kindIs "map" $dep.depconfig) -}}
        {{- $_ := set $dep "depconfig" dict -}}
      {{- end -}}
      {{- if not (kindIs "map" $dep.depconfig.creds) -}}
        {{- $_ := set $dep.depconfig "creds" dict -}}
      {{- end -}}

      {{/* Use the custom-set password, or the placeholder */}}
      {{- $dbPass := $dep.depconfig.password | default "PLACEHOLDERPASSWORD" -}}
      {{- $_ := set $dep.depconfig "password" $dbPass -}}

      {{/* The host is the primary service of the dependency */}}
      {{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "clickhouse")) -}}
      {{- if not $service -}}
        {{- fail "Dependencies - Expected dependency [clickhouse] to have an enabled primary service" -}}
      {{- end -}}
      {{- $service = $service | fromJson -}}
      {{- if not $service.port -}}
        {{- fail "Dependencies - Expected the primary service of dependency [clickhouse] to have a primary port" -}}
      {{- end -}}

      {{- $dbHost := $service.name -}}
      {{- $dbPort := $service.port -}}
      {{- $dbUser := $dep.depconfig.clickhouseUsername -}}
      {{- $dbName := $dep.depconfig.clickhouseDatabase -}}
      {{- $portHost := printf "%v:%v" $dbHost $dbPort -}}
      {{/* The primary port is the HTTP interface of ClickHouse, so these are HTTP URLs */}}
      {{- $ping := printf "http://%v/ping" $portHost -}}
      {{- $url := printf "http://%v:%v@%v/%v" $dbUser $dbPass $portHost $dbName -}}
      {{- $jdbc := printf "jdbc:ch://%v/%v" $portHost $dbName -}}

      {{/* Append values to depconfig.creds, so apps using the dependency can use them */}}
      {{- $_ := set $dep.depconfig.creds "clickhousePassword" ($dbPass | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plain" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainhost" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainport" ($dbPort | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainporthost" ($portHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "ping" ($ping | quote) -}}
      {{- $_ := set $dep.depconfig.creds "complete" ($url | quote) -}}
      {{- $_ := set $dep.depconfig.creds "jdbc" ($jdbc | quote) -}}

{{/* Create the secret (Comment also plays a role on correct formatting) */}}
enabled: true
expandObjectName: false
data:
  clickhouse-password: {{ $dbPass | quote }}
  plainhost: {{ $dbHost | quote }}
  plainporthost: {{ $portHost | quote }}
  ping: {{ $ping | quote }}
  url: {{ $url | quote }}
  jdbc: {{ $jdbc | quote }}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.dependencies.clickhouse.injector" -}}
  {{- $secret := include "tc.v1.common.dependencies.clickhouse.secret" . | fromYaml -}}
  {{- if $secret -}}
    {{- $_ := set .Values.secret (printf "%s-%s" .Release.Name "clickhousecreds") $secret -}}
  {{- end -}}
{{- end -}}
