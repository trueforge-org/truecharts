{{/* Define the configmap */}}
{{- define "nocodb.configmap" -}}

{{- $pgPass := .Values.dependencies.postgresql.depconfig.creds.postgresqlPassword | trimAll "\"" }}
{{- $pgUser := .Values.dependencies.postgresql.depconfig.postgresqlUsername }}
{{- $pgDB := .Values.dependencies.postgresql.depconfig.postgresqlDatabase }}
{{- $pgHost := (.Values.dependencies.postgresql.depconfig.creds.plainhost | trimAll "\"") }}
enabled: true
data:
  NC_DB: "{{ printf "pg://%v:5432?u=%v&p=%v&d=%v" $pgHost $pgUser $pgPass $pgDB }}"
  NC_MIN: "{{ ternary "true" "" .Values.workload.main.podSpec.containers.main.env.DISABLE_SPLASH_SCREEN }}"
{{- end -}}
