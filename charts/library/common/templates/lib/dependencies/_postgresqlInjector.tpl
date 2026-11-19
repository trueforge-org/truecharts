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

  {{/* The password defaults to a placeholder in values, it must not be empty */}}
  {{- include "tc.v1.common.lib.dependencies.requirePassword" (dict "rootCtx" .rootCtx "dep" $dep "depName" "postgresql" "key" "password") -}}

  {{- range $key := (list "postgresqlUsername" "postgresqlDatabase") -}}
    {{- if not (get $dep.depconfig $key) -}}
      {{- fail (printf "Dependencies - Expected [dependencies.postgresql.depconfig.%s] to not be empty" $key) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/*
Extra connection strings of the postgresql dependency, for apps that need another scheme or format than [url].
Returns a json map of key -> value. The same keys are added to [depconfig.creds] and to the secret, and with the
suffix RO for the read-only endpoint. Keep the keys in sync with docs/dependencies/index.md.
user, pass: raw values (encoded here where the format needs it), host, port, db
*/}}
{{- define "tc.v1.common.lib.dependencies.postgresql.variants" -}}
  {{- $urlUser := .user | urlquery | replace "+" "%20" -}}
  {{- $urlPass := .pass | urlquery | replace "+" "%20" -}}
  {{- $portHost := printf "%v:%v" .host .port -}}
  {{- $path := printf "%v@%v/%v" (printf "%v:%v" $urlUser $urlPass) $portHost .db -}}
  {{- $variants := dict
        "urlpostgres" (printf "postgres://%v" $path)
        "urlecto" (printf "ecto://%v" $path)
        "urlpsycopg2" (printf "postgresql+psycopg2://%v" $path)
        "urlasyncpg" (printf "postgresql+asyncpg://%v" $path)
        "urlutf8" (printf "postgresql://%v?client_encoding=utf8" $path)
        "authporthost" (printf "%v:%v@%v" $urlUser $urlPass $portHost)
        "jdbcauth" (printf "jdbc:postgresql://%v/%v?user=%v&password=%v" $portHost .db $urlUser $urlPass)
        "npgsql" (printf "Host=%v;Port=%v;Database=%v;Username=%v;Password=%v" .host .port .db .user .pass) -}}
  {{- $variants | toJson -}}
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
      {{/* Credentials in urls have to be encoded, a literal "+" is already "%2B", so every remaining "+" was a space */}}
      {{- $urlUser := $dbUser | urlquery | replace "+" "%20" -}}
      {{- $urlPass := $dbPass | urlquery | replace "+" "%20" -}}
      {{- $complete := printf "postgresql://%v:%v@%v/%v" $urlUser $urlPass $portHost $dbName -}}
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
      {{/* More formats of the connection, for apps that need another scheme than [url] */}}
      {{- $variants := include "tc.v1.common.lib.dependencies.postgresql.variants" (dict "user" $dbUser "pass" $dbPass "host" $dbHost "port" $dbPort "db" $dbName) | fromJson -}}
      {{- range $key, $value := $variants -}}
        {{- $_ := set $dep.depconfig.creds $key ($value | quote) -}}
      {{- end -}}

      {{/* The read-only endpoint, only available in operator mode with a pooler that has [createRO] */}}
      {{- $dbHostRO := $service.nameRO | default "" -}}
      {{- $portHostRO := printf "%v:%v" $dbHostRO $dbPort -}}
      {{- $completeRO := printf "postgresql://%v:%v@%v/%v" $urlUser $urlPass $portHostRO $dbName -}}
      {{- $urlnosslRO := printf "%v?sslmode=disable" $completeRO -}}
      {{- $jdbcRO := printf "jdbc:postgresql://%v/%v" $portHostRO $dbName -}}
      {{- $variantsRO := dict -}}
      {{- if $dbHostRO -}}
        {{- $_ := set $dep.depconfig.creds "plainRO" ($dbHostRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "plainhostRO" ($dbHostRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "plainportRO" ($dbPort | quote) -}}
        {{- $_ := set $dep.depconfig.creds "plainporthostRO" ($portHostRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "completeRO" ($completeRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "urlnosslRO" ($urlnosslRO | quote) -}}
        {{- $_ := set $dep.depconfig.creds "jdbcRO" ($jdbcRO | quote) -}}
        {{- $variantsRO = include "tc.v1.common.lib.dependencies.postgresql.variants" (dict "user" $dbUser "pass" $dbPass "host" $dbHostRO "port" $dbPort "db" $dbName) | fromJson -}}
        {{- range $key, $value := $variantsRO -}}
          {{- $_ := set $dep.depconfig.creds (printf "%vRO" $key) ($value | quote) -}}
        {{- end -}}
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
      {{- range $key, $value := $variants }}
  {{ $key }}: {{ $value | quote }}
      {{- end }}
      {{- if $dbHostRO }}
  urlRO: {{ $completeRO | quote }}
  urlnosslRO: {{ $urlnosslRO | quote }}
  plainporthostRO: {{ $portHostRO | quote }}
  plainhostRO: {{ $dbHostRO | quote }}
  jdbcRO: {{ $jdbcRO | quote }}
        {{- range $key, $value := $variantsRO }}
  {{ $key }}RO: {{ $value | quote }}
        {{- end }}
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
