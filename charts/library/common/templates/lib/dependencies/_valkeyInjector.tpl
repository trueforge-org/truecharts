{{/*
This template generates valkey credentials and ensures they persist across updates
*/}}
{{- define "tc.v1.common.dependencies.valkey.secret" -}}

{{- range $depName, $depConfig := .Values.dependencies -}}
  {{- if and (eq $depName "valkey") $depConfig $depConfig.enabled -}}
    {{/* Use custom-set password or generate one */}}
    {{- $dbPass := $depConfig.password | default "PLACEHOLDERPASSWORD" -}}

    {{/* Prepare data - service name is prefixed */}}
    {{- $serviceName := printf "%s-main" $depName -}}
    {{- $dbHost := printf "%v-%v" $.Release.Name $serviceName -}}
    {{- $portHost := printf "%v:6379" $dbHost -}}
    {{- $url := printf "redis://:%v@%v/0" $dbPass $portHost -}}
    {{- $hostPass := printf "%v:%v" $dbHost $dbPass -}}

    {{/* Initialize creds if not exists */}}
    {{- if not $depConfig.creds -}}
      {{- $_ := set $depConfig "creds" dict -}}
    {{- end -}}

    {{/* Append values to dependency creds for apps to use */}}
    {{- $_ := set $depConfig.creds "valkey-password" ($dbPass | quote) -}}
    {{- $_ := set $depConfig.creds "redis-password" ($dbPass | quote) -}}
    {{- $_ := set $depConfig.creds "plain" ($dbHost | quote) -}}
    {{- $_ := set $depConfig.creds "plainhost" ($dbHost | quote) -}}
    {{- $_ := set $depConfig.creds "plainporthost" ($portHost | quote) -}}
    {{- $_ := set $depConfig.creds "url" ($url | quote) -}}
    {{- $_ := set $depConfig.creds "plainhostpass" ($hostPass | quote) -}}

{{/* Create the secret */}}
enabled: true
expandObjectName: false
data:
  valkey-password: {{ $dbPass }}
  redis-password: {{ $dbPass }}
  plain: {{ $dbHost }}
  plainhost: {{ $dbHost }}
  plainporthost: {{ $portHost }}
  url: {{ $url }}
  plainhostpass: {{ $hostPass }}
  {{- end -}}
{{- end -}}
{{- end -}}

{{- define "tc.v1.common.dependencies.valkey.injector" -}}
  {{- $secret := include "tc.v1.common.dependencies.valkey.secret" . | fromYaml -}}
  {{- if $secret -}}
    {{- $_ := set .Values.secret (printf "%s-%s" .Release.Name "valkeycreds") $secret -}}
  {{- end -}}
{{- end -}}
