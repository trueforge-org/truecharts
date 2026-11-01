{{/*
This template generates the valkey credentials and the secret holding them
*/}}
{{- define "tc.v1.common.dependencies.valkey.secret" -}}
  {{- $dep := get (.Values.dependencies | default dict) "valkey" -}}

  {{- if kindIs "map" $dep -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $dep
                    "name" "valkey" "caller" "Dependencies"
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
      {{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "valkey")) -}}
      {{- if not $service -}}
        {{- fail "Dependencies - Expected dependency [valkey] to have an enabled primary service" -}}
      {{- end -}}
      {{- $service = $service | fromJson -}}
      {{- if not $service.port -}}
        {{- fail "Dependencies - Expected the primary service of dependency [valkey] to have a primary port" -}}
      {{- end -}}

      {{- $dbHost := $service.name -}}
      {{- $dbPort := $service.port -}}
      {{- $portHost := printf "%v:%v" $dbHost $dbPort -}}
      {{/* Valkey speaks the redis protocol, most clients only accept the redis:// scheme */}}
      {{- $url := printf "redis://:%v@%v/0" $dbPass $portHost -}}
      {{- $hostPass := printf "%v:%v" $dbHost $dbPass -}}

      {{/* Append values to depconfig.creds, so apps using the dependency can use them */}}
      {{- $_ := set $dep.depconfig.creds "valkey-password" ($dbPass | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plain" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainhost" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainport" ($dbPort | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainporthost" ($portHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "url" ($url | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainhostpass" ($hostPass | quote) -}}

{{/* Create the secret (Comment also plays a role on correct formatting) */}}
enabled: true
expandObjectName: false
data:
  valkey-password: {{ $dbPass | quote }}
  plain: {{ $dbHost | quote }}
  plainhost: {{ $dbHost | quote }}
  plainport: {{ $dbPort | quote }}
  plainporthost: {{ $portHost | quote }}
  url: {{ $url | quote }}
  plainhostpass: {{ $hostPass | quote }}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.dependencies.valkey.injector" -}}
  {{- $secret := include "tc.v1.common.dependencies.valkey.secret" . | fromYaml -}}
  {{- if $secret -}}
    {{- $_ := set .Values.secret (printf "%s-%s" .Release.Name "valkeycreds") $secret -}}
  {{- end -}}
{{- end -}}
