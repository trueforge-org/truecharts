{{/* Normalizes depconfig of the postgresql dependency, in place, for both modes */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.postgresql.depconfig" (dict "rootCtx" $ "dep" $dep) }}
rootCtx: The root context of the chart.
dep: The values of the postgresql dependency.

Makes sure [depconfig] and [depconfig.creds] exist and that the password is set.
The user and database are part of the connection urls (and of the CNPG bootstrap), so they can not be empty.
*/}}
{{- define "tc.v1.common.lib.dependencies.postgresql.depconfig" -}}
  {{- $dep := .dep -}}

  {{- if not (kindIs "map" $dep.depconfig) -}}
    {{- $_ := set $dep "depconfig" dict -}}
  {{- end -}}
  {{- if not (kindIs "map" $dep.depconfig.creds) -}}
    {{- $_ := set $dep.depconfig "creds" dict -}}
  {{- end -}}

  {{/* Use the custom-set password, or the placeholder */}}
  {{- $_ := set $dep.depconfig "password" ($dep.depconfig.password | default "PLACEHOLDERPASSWORD") -}}

  {{- range $key := (list "postgresqlUsername" "postgresqlDatabase") -}}
    {{- if not (get $dep.depconfig $key) -}}
      {{- fail (printf "Dependencies - Expected [dependencies.postgresql.depconfig.%s] to not be empty" $key) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/*
This template generates the postgresql credentials and the secret holding them
It is the same for both modes (standalone and operator), only the host differs
*/}}
{{- define "tc.v1.common.dependencies.postgresql.secret" -}}

  {{- $dep := get (.Values.dependencies | default dict) "postgresql" -}}

  {{- if kindIs "map" $dep -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $dep
                    "name" "postgresql" "caller" "Dependencies"
                    "key" "dependencies")) -}}

    {{- if eq $enabled "true" -}}
      {{- include "tc.v1.common.lib.dependencies.postgresql.depconfig" (dict "rootCtx" $ "dep" $dep) -}}

      {{/* The host is the primary service of the dependency, for both modes */}}
      {{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "postgresql")) -}}
      {{- if not $service -}}
        {{- fail "Dependencies - Expected dependency [postgresql] to have an enabled primary service" -}}
      {{- end -}}
      {{- $service = $service | fromJson -}}
      {{- if not $service.port -}}
        {{- fail "Dependencies - Expected the primary service of dependency [postgresql] to have a primary port" -}}
      {{- end -}}

      {{- $dbPass := $dep.depconfig.password -}}
      {{- $dbUser := $dep.depconfig.postgresqlUsername -}}
      {{- $dbName := $dep.depconfig.postgresqlDatabase -}}
      {{- $dbPort := $service.port -}}
      {{- $dbHost := $service.name -}}
      {{- $portHost := printf "%v:%v" $dbHost $dbPort -}}
      {{- $complete := printf "postgresql://%v:%v@%v/%v" $dbUser $dbPass $portHost $dbName -}}
      {{/* Variant for clients that connect without TLS */}}
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

      {{/* The read-only endpoint, only available in operator mode with a pooler that has [createRO] */}}
      {{- $dbHostRO := $service.nameRO | default "" -}}
      {{- $portHostRO := printf "%v:%v" $dbHostRO $dbPort -}}
      {{- $completeRO := printf "postgresql://%v:%v@%v/%v" $dbUser $dbPass $portHostRO $dbName -}}
      {{- $urlnosslRO := printf "%v?sslmode=disable" $completeRO -}}
      {{- $jdbcRO := printf "jdbc:postgresql://%v/%v" $portHostRO $dbName -}}
      {{- if $dbHostRO -}}
        {{- $_ := set $dep.depconfig.creds "plainRO" ($dbHostRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "plainhostRO" ($dbHostRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "plainportRO" ($dbPort | quote) -}}
        {{- $_ := set $dep.depconfig.creds "plainporthostRO" ($portHostRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "completeRO" ($completeRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "urlnosslRO" ($urlnosslRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "jdbcRO" ($jdbcRO | quote) -}}
      {{- end -}}

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
      {{- if $dbHostRO }}
  urlRO: {{ $completeRO | quote }}
  urlnosslRO: {{ $urlnosslRO | quote }}
  plainporthostRO: {{ $portHostRO | quote }}
  plainhostRO: {{ $dbHostRO | quote }}
  jdbcRO: {{ $jdbcRO | quote }}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.dependencies.postgresql.injector" -}}
  {{- $secret := include "tc.v1.common.dependencies.postgresql.secret" . | fromYaml -}}
  {{- if $secret -}}
    {{- $_ := set .Values.secret (printf "%s-%s" .Release.Name "postgresqlcreds") $secret -}}
  {{- end -}}
{{- end -}}
