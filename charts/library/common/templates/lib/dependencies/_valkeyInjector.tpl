{{/*
This template generates valkey credentials and ensures they persist across updates
*/}}
{{- define "tc.v1.common.dependencies.valkey.secret" -}}

{{- range $depName, $depConfig := .Values.dependencies -}}
  {{- if and (eq $depName "valkey") $depConfig $depConfig.enabled -}}
    {{/* Use custom-set password or generate one */}}
    {{- $dbPass := "" -}}
    {{- if $depConfig.depconfig -}}
      {{- $dbPass = $depConfig.depconfig.password | default "PLACEHOLDERPASSWORD" -}}
    {{- else -}}
      {{- $dbPass = "PLACEHOLDERPASSWORD" -}}
    {{- end -}}

    {{/* Prepare data - service name is prefixed */}}
    {{- $serviceName := printf "%s-main" $depName -}}
    {{- $dbHost := printf "%v-%v" $.Release.Name $serviceName -}}
    {{- $portHost := printf "%v:6379" $dbHost -}}
    {{- $url := printf "redis://:%v@%v/0" $dbPass $portHost -}}
    {{- $hostPass := printf "%v:%v" $dbHost $dbPass -}}

    {{/* Initialize depconfig if not exists */}}
    {{- if not $depConfig.depconfig -}}
      {{- $_ := set $depConfig "depconfig" dict -}}
    {{- end -}}
    
    {{/* Initialize creds under depconfig if not exists */}}
    {{- if not $depConfig.depconfig.creds -}}
      {{- $_ := set $depConfig.depconfig "creds" dict -}}
    {{- end -}}

    {{/* Append values to dependency depconfig.creds for apps to use */}}
    {{- $_ := set $depConfig.depconfig.creds "valkey-password" ($dbPass | quote) -}}
    {{- $_ := set $depConfig.depconfig.creds "redis-password" ($dbPass | quote) -}}
    {{- $_ := set $depConfig.depconfig.creds "plain" ($dbHost | quote) -}}
    {{- $_ := set $depConfig.depconfig.creds "plainhost" ($dbHost | quote) -}}
    {{- $_ := set $depConfig.depconfig.creds "plainporthost" ($portHost | quote) -}}
    {{- $_ := set $depConfig.depconfig.creds "url" ($url | quote) -}}
    {{- $_ := set $depConfig.depconfig.creds "plainhostpass" ($hostPass | quote) -}}

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
