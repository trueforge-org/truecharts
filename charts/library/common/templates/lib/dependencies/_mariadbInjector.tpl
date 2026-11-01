{{/*
This template generates the mariadb credentials and the secret holding them
*/}}
{{- define "tc.v1.common.dependencies.mariadb.secret" -}}

  {{- $dep := get (.Values.dependencies | default dict) "mariadb" -}}

  {{- if kindIs "map" $dep -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $dep
                    "name" "mariadb" "caller" "Dependencies"
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

      {{/* The image skips shorter passwords, which would leave the database without any */}}
      {{- range $key, $pass := (dict "password" $dbPass "rootPassword" $rootPass) -}}
        {{- if lt (len (toString $pass)) 4 -}}
          {{- fail (printf "Dependencies - Expected [dependencies.mariadb.depconfig.%s] to have at least 4 characters" $key) -}}
        {{- end -}}
      {{- end -}}

      {{/* The host is the primary service of the dependency */}}
      {{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "mariadb")) -}}
      {{- if not $service -}}
        {{- fail "Dependencies - Expected dependency [mariadb] to have an enabled primary service" -}}
      {{- end -}}
      {{- $service = $service | fromJson -}}
      {{- if not $service.port -}}
        {{- fail "Dependencies - Expected the primary service of dependency [mariadb] to have a primary port" -}}
      {{- end -}}

      {{- $dbHost := $service.name -}}
      {{- $dbPort := $service.port -}}
      {{- $dbUser := $dep.depconfig.mariadbUsername -}}
      {{- $dbName := $dep.depconfig.mariadbDatabase -}}
      {{- $portHost := printf "%v:%v" $dbHost $dbPort -}}
      {{- $complete := printf "mysql://%v:%v@%v/%v" $dbUser $dbPass $portHost $dbName -}}
      {{- $urlnossl := printf "%v?sslmode=disable" $complete -}}
      {{- $jdbc := printf "jdbc:mariadb://%v/%v" $portHost $dbName -}}
      {{- $jdbcMySQL := printf "jdbc:mysql://%v/%v" $portHost $dbName -}}

      {{/* Append values to depconfig.creds, so apps using the dependency can use them */}}
      {{- $_ := set $dep.depconfig.creds "mariadbPassword" ($dbPass | quote) -}}
      {{- $_ := set $dep.depconfig.creds "mariadbRootPassword" ($rootPass | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plain" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainhost" ($dbHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainport" ($dbPort | quote) -}}
      {{- $_ := set $dep.depconfig.creds "plainporthost" ($portHost | quote) -}}
      {{- $_ := set $dep.depconfig.creds "complete" ($complete | quote) -}}
      {{- $_ := set $dep.depconfig.creds "urlnossl" ($urlnossl | quote) -}}
      {{- $_ := set $dep.depconfig.creds "jdbc" ($jdbc | quote) -}}
      {{- $_ := set $dep.depconfig.creds "jdbcmysql" ($jdbcMySQL | quote) -}}
      {{- $_ := set $dep.depconfig.creds "jdbcmariadb" ($jdbc | quote) -}}

{{/* Create the secret (Comment also plays a role on correct formatting) */}}
enabled: true
expandObjectName: false
data:
  mariadb-password: {{ $dbPass | quote }}
  mariadb-root-password: {{ $rootPass | quote }}
  url: {{ $complete | quote }}
  urlnossl: {{ $urlnossl | quote }}
  plainporthost: {{ $portHost | quote }}
  plainhost: {{ $dbHost | quote }}
  jdbc: {{ $jdbc | quote }}
  jdbc-mysql: {{ $jdbcMySQL | quote }}
  jdbc-mariadb: {{ $jdbc | quote }}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.dependencies.mariadb.injector" -}}
  {{- $secret := include "tc.v1.common.dependencies.mariadb.secret" . | fromYaml -}}
  {{- if $secret -}}
    {{- $_ := set .Values.secret (printf "%s-%s" .Release.Name "mariadbcreds") $secret -}}
  {{- end -}}
{{- end -}}
