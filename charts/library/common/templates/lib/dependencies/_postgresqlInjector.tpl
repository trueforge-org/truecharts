{{/*
This template generates the postgresql credentials and the secret holding them
*/}}
{{- define "tc.v1.common.dependencies.postgresql.secret" -}}

  {{- $dep := get (.Values.dependencies | default dict) "postgresql" -}}

  {{- if kindIs "map" $dep -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $dep
                    "name" "postgresql" "caller" "Dependencies"
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

      {{/* The user and database are part of the connection urls, and the image falls back to its own defaults without them */}}
      {{- range $key := (list "postgresqlUsername" "postgresqlDatabase") -}}
        {{- if not (get $dep.depconfig $key) -}}
          {{- fail (printf "Dependencies - Expected [dependencies.postgresql.depconfig.%s] to not be empty" $key) -}}
        {{- end -}}
      {{- end -}}

      {{/* The host is the primary service of the dependency */}}
      {{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "postgresql")) -}}
      {{- if not $service -}}
        {{- fail "Dependencies - Expected dependency [postgresql] to have an enabled primary service" -}}
      {{- end -}}
      {{- $service = $service | fromJson -}}
      {{- if not $service.port -}}
        {{- fail "Dependencies - Expected the primary service of dependency [postgresql] to have a primary port" -}}
      {{- end -}}

      {{- $dbHost := $service.name -}}
      {{- $dbPort := $service.port -}}
      {{- $dbUser := $dep.depconfig.postgresqlUsername -}}
      {{- $dbName := $dep.depconfig.postgresqlDatabase -}}
      {{- $portHost := printf "%v:%v" $dbHost $dbPort -}}
      {{- $complete := printf "postgresql://%v:%v@%v/%v" $dbUser $dbPass $portHost $dbName -}}
      {{/* The image does not offer TLS */}}
      {{- $urlnossl := printf "%v?sslmode=disable" $complete -}}
      {{- $jdbc := printf "jdbc:postgresql://%v/%v" $portHost $dbName -}}

      {{/* Append values to depconfig.creds, so apps using the dependency can use them */}}
      {{- $_ := set $dep.depconfig.creds "postgresqlPassword" ($dbPass | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plain" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainhost" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainport" ($dbPort | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainporthost" ($portHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "complete" ($complete | quote) -}}
      {{- $_ := set $dep.depconfig.creds "urlnossl" ($urlnossl | quote) -}}
      {{- $_ := set $dep.depconfig.creds "jdbc" ($jdbc | quote) -}}

{{/* Create the secret (Comment also plays a role on correct formatting) */}}
enabled: true
expandObjectName: false
data:
  postgresql-password: {{ $dbPass | quote }}
  url: {{ $complete | quote }}
  urlnossl: {{ $urlnossl | quote }}
  plainporthost: {{ $portHost | quote }}
  plainhost: {{ $dbHost | quote }}
  jdbc: {{ $jdbc | quote }}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.dependencies.postgresql.injector" -}}
  {{- $secret := include "tc.v1.common.dependencies.postgresql.secret" . | fromYaml -}}
  {{- if $secret -}}
    {{- $_ := set .Values.secret (printf "%s-%s" .Release.Name "postgresqlcreds") $secret -}}
  {{- end -}}
{{- end -}}
