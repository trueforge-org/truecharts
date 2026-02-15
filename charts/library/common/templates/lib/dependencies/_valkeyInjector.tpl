{{/*
This template generates a random password and ensures it persists across updates/edits to the chart
Supports both legacy .Values.redis and new .Values.dependencies.valkey
*/}}
{{- define "tc.v1.common.dependencies.valkey.secret" -}}

{{- $valkeyConfig := dict -}}
{{- $enabled := false -}}

{{/* Check for new dependencies.valkey path */}}
{{- if and .Values.dependencies .Values.dependencies.valkey .Values.dependencies.valkey.enabled -}}
  {{- $valkeyConfig = .Values.dependencies.valkey -}}
  {{- $enabled = true -}}
{{/* Fallback to legacy redis path for backward compatibility */}}
{{- else if .Values.redis.enabled -}}
  {{- $valkeyConfig = .Values.redis -}}
  {{- $enabled = true -}}
{{- end -}}

{{- if $enabled -}}
  {{- $dbIndex := $valkeyConfig.redisDatabase | default "0" -}}
  {{/* Use with custom-set password */}}
  {{- $dbPass := $valkeyConfig.password -}}

  {{- $valkeyUser := $valkeyConfig.redisUsername -}}
  {{- if not $valkeyUser -}}{{/* If you try to print a nil value it will print as [nil] */}}
    {{- $valkeyUser = "" -}}
  {{- end -}}
  
  {{/* Prepare data - use valkey for new path, redis for legacy */}}
  {{- $serviceName := "valkey" -}}
  {{- if .Values.redis.enabled -}}
    {{- $serviceName = "redis" -}}
  {{- end -}}
  {{- $dbHost := printf "%v-%v" .Release.Name $serviceName -}}
  {{- $portHost := printf "%v:6379" $dbHost -}}
  {{- $url := printf "redis://%v:%v@%v/%v" $valkeyUser $dbPass $portHost $dbIndex -}}
  {{- $hostPass := printf "%v:%v@%v" $valkeyUser $dbPass $dbHost -}}

  {{/* Append some values to creds, so apps using the dep, can use them */}}
  {{- $_ := set $valkeyConfig.creds "valkeyPassword" ($dbPass | quote) -}}
  {{- $_ := set $valkeyConfig.creds "redisPassword" ($dbPass | quote) -}}
  {{- $_ := set $valkeyConfig.creds "plain" ($dbHost | quote) -}}
  {{- $_ := set $valkeyConfig.creds "plainhost" ($dbHost | quote) -}}
  {{- $_ := set $valkeyConfig.creds "plainport" ($portHost | quote) -}}
  {{- $_ := set $valkeyConfig.creds "plainporthost" ($portHost | quote) -}}
  {{- $_ := set $valkeyConfig.creds "plainhostpass" ($hostPass | quote) -}}
  {{- $_ := set $valkeyConfig.creds "url" ($url | quote) -}}

{{/* Create the secret (Comment also plays a role on correct formatting) */}}
enabled: true
expandObjectName: false
data:
  valkey-password: {{ $dbPass }}
  redis-password: {{ $dbPass }}
  plain: {{ $dbHost }}
  url: {{ $url }}
  plainhostpass: {{ $hostPass }}
  plainporthost: {{ $portHost }}
  plainhost: {{ $dbHost }}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.dependencies.valkey.injector" -}}
  {{- $secret := include "tc.v1.common.dependencies.valkey.secret" . | fromYaml -}}
  {{- if $secret -}}
    {{/* Use valkeycreds for new path, rediscreds for legacy */}}
    {{- $secretName := "valkeycreds" -}}
    {{- if .Values.redis.enabled -}}
      {{- $secretName = "rediscreds" -}}
    {{- end -}}
    {{- $_ := set .Values.secret (printf "%s-%s" .Release.Name $secretName) $secret -}}
  {{- end -}}
{{- end -}}
