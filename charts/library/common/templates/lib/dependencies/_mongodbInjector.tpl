{{/*
This template generates the mongodb credentials and the secret holding them
*/}}
{{- define "tc.v1.common.dependencies.mongodb.secret" -}}

  {{- $dep := get (.Values.dependencies | default dict) "mongodb" -}}

  {{- if kindIs "map" $dep -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $dep
                    "name" "mongodb" "caller" "Dependencies"
                    "key" "dependencies")) -}}

    {{- if eq $enabled "true" -}}
      {{- if not (kindIs "map" $dep.depconfig) -}}
        {{- $_ := set $dep "depconfig" dict -}}
      {{- end -}}
      {{- if not (kindIs "map" $dep.depconfig.creds) -}}
        {{- $_ := set $dep.depconfig "creds" dict -}}
      {{- end -}}

      {{/* Use the custom-set passwords, or the placeholders */}}
      {{- $dbPass := $dep.depconfig.password | default "PLACEHOLDERPASSWORD" -}}
      {{- $_ := set $dep.depconfig "password" $dbPass -}}
      {{- $rootPass := $dep.depconfig.rootPassword | default "PLACEHOLDERROOTPASSWORD" -}}
      {{- $_ := set $dep.depconfig "rootPassword" $rootPass -}}

      {{/* The host is the primary service of the dependency */}}
      {{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "mongodb")) -}}
      {{- if not $service -}}
        {{- fail "Dependencies - Expected dependency [mongodb] to have an enabled primary service" -}}
      {{- end -}}
      {{- $service = $service | fromJson -}}
      {{- if not $service.port -}}
        {{- fail "Dependencies - Expected the primary service of dependency [mongodb] to have a primary port" -}}
      {{- end -}}

      {{- $dbHost := $service.name -}}
      {{- $dbPort := $service.port -}}
      {{- $dbUser := $dep.depconfig.mongodbUsername -}}
      {{- $dbName := $dep.depconfig.mongodbDatabase -}}
      {{- $portHost := printf "%v:%v" $dbHost $dbPort -}}
      {{- $url := printf "mongodb://%v:%v@%v/%v" $dbUser $dbPass $portHost $dbName -}}
      {{- $urlssl := printf "%v?ssl=true" $url -}}
      {{- $urltls := printf "%v?tls=true" $url -}}
      {{- $jdbc := printf "jdbc:mongodb://%v/%v" $portHost $dbName -}}

      {{/* Append values to depconfig.creds, so apps using the dependency can use them */}}
      {{- $_ := set $dep.depconfig.creds "mongodbPassword" ($dbPass | quote) -}}
      {{- $_ := set $dep.depconfig.creds "mongodbRootPassword" ($rootPass | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plain" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainhost" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainport" ($dbPort | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainporthost" ($portHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "complete" ($url | quote) -}}
      {{- $_ := set $dep.depconfig.creds "urlssl" ($urlssl | quote) -}}
      {{- $_ := set $dep.depconfig.creds "urltls" ($urltls | quote) -}}
      {{- $_ := set $dep.depconfig.creds "jdbc" ($jdbc | quote) -}}

{{/* Create the secret (Comment also plays a role on correct formatting) */}}
enabled: true
expandObjectName: false
data:
  mongodb-password: {{ $dbPass | quote }}
  mongodb-root-password: {{ $rootPass | quote }}
  url: {{ $url | quote }}
  urlssl: {{ $urlssl | quote }}
  urltls: {{ $urltls | quote }}
  jdbc: {{ $jdbc | quote }}
  plainhost: {{ $dbHost | quote }}
  plainporthost: {{ $portHost | quote }}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.dependencies.mongodb.injector" -}}
  {{- $secret := include "tc.v1.common.dependencies.mongodb.secret" . | fromYaml -}}
  {{- if $secret -}}
    {{- $_ := set .Values.secret (printf "%s-%s" .Release.Name "mongodbcreds") $secret -}}
  {{- end -}}
{{- end -}}
