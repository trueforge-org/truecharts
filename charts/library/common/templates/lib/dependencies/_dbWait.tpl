{{- define "tc.v1.common.lib.deps.wait" -}}
  {{- $valkeyEnabled := false -}}
  {{- $valkey := get (.Values.dependencies | default dict) "valkey" -}}
  {{- if kindIs "map" $valkey -}}
    {{- $valkeyEnabled = eq (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $valkey
                    "name" "valkey" "caller" "Dependencies"
                    "key" "dependencies")) "true" -}}
  {{- end -}}

  {{- if $valkeyEnabled -}}
    {{- $container := include "tc.v1.common.lib.deps.wait.valkey" $ | fromYaml -}}
    {{- include "tc.v1.common.lib.deps.wait.add" (dict "rootCtx" $ "name" "valkey-wait" "container" $container) -}}

  {{- end -}}

  {{- $mariadbEnabled := false -}}
  {{- $mariadb := get (.Values.dependencies | default dict) "mariadb" -}}
  {{- if kindIs "map" $mariadb -}}
    {{- $mariadbEnabled = eq (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $mariadb
                    "name" "mariadb" "caller" "Dependencies"
                    "key" "dependencies")) "true" -}}
  {{- end -}}

  {{- if $mariadbEnabled -}}
    {{- $container := include "tc.v1.common.lib.deps.wait.mariadb" $ | fromYaml -}}
    {{- include "tc.v1.common.lib.deps.wait.add" (dict "rootCtx" $ "name" "mariadb-wait" "container" $container) -}}
  {{- end -}}

  {{- $postgresqlEnabled := false -}}
  {{- $postgresql := get (.Values.dependencies | default dict) "postgresql" -}}
  {{- if kindIs "map" $postgresql -}}
    {{- $postgresqlEnabled = eq (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $postgresql
                    "name" "postgresql" "caller" "Dependencies"
                    "key" "dependencies")) "true" -}}
  {{- end -}}

  {{- if $postgresqlEnabled -}}
    {{- $container := include "tc.v1.common.lib.deps.wait.postgresql" $ | fromYaml -}}
    {{- include "tc.v1.common.lib.deps.wait.add" (dict "rootCtx" $ "name" "postgresql-wait" "container" $container) -}}
  {{- end -}}

  {{- $mongodbEnabled := false -}}
  {{- $mongodb := get (.Values.dependencies | default dict) "mongodb" -}}
  {{- if kindIs "map" $mongodb -}}
    {{- $mongodbEnabled = eq (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $mongodb
                    "name" "mongodb" "caller" "Dependencies"
                    "key" "dependencies")) "true" -}}
  {{- end -}}

  {{- if $mongodbEnabled -}}
    {{- $container := include "tc.v1.common.lib.deps.wait.mongodb" $ | fromYaml -}}
    {{- include "tc.v1.common.lib.deps.wait.add" (dict "rootCtx" $ "name" "mongodb-wait" "container" $container) -}}
  {{- end -}}

  {{- $clickhouseEnabled := false -}}
  {{- $clickhouse := get (.Values.dependencies | default dict) "clickhouse" -}}
  {{- if kindIs "map" $clickhouse -}}
    {{- $clickhouseEnabled = eq (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $clickhouse
                    "name" "clickhouse" "caller" "Dependencies"
                    "key" "dependencies")) "true" -}}
  {{- end -}}

  {{- if $clickhouseEnabled -}}
    {{- $container := include "tc.v1.common.lib.deps.wait.clickhouse" $ | fromYaml -}}
    {{- include "tc.v1.common.lib.deps.wait.add" (dict "rootCtx" $ "name" "clickhouse-wait" "container" $container) -}}
  {{- end -}}

  {{- $result := false -}}
  {{- range .Values.cnpg -}}
    {{- if .enabled -}}
      {{- $result = true -}}
    {{- end -}}
  {{- end -}}

  {{- if $result -}}
    {{- $container := include "tc.v1.common.lib.deps.wait.cnpg" $ | fromYaml -}}
    {{- include "tc.v1.common.lib.deps.wait.add" (dict "rootCtx" $ "name" "cnpg-wait" "container" $container) -}}
  {{- end -}}
{{- end -}}

{{/* Adds a wait init container to all workloads that wait for the dependencies */}}
{{/* Workloads with [dbWait: false] (eg the workloads of a dependency) are skipped */}}
{{- define "tc.v1.common.lib.deps.wait.add" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $name := .name -}}
  {{- $container := .container -}}

  {{- if $container -}}
    {{- range $wlName, $workload := $rootCtx.Values.workload -}}
      {{- if not (kindIs "map" $workload) -}}{{- continue -}}{{- end -}}

      {{- $dbWait := true -}}
      {{- if hasKey $workload "dbWait" -}}
        {{- $dbWait = $workload.dbWait -}}
        {{- if kindIs "string" $dbWait -}}
          {{- $dbWait = (tpl $dbWait $rootCtx) -}}
        {{- end -}}
        {{- $dbWait = (ne (toString $dbWait) "false") -}}
      {{- end -}}
      {{- if not $dbWait -}}{{- continue -}}{{- end -}}

      {{- if not (kindIs "map" $workload.podSpec) -}}
        {{- $_ := set $workload "podSpec" dict -}}
      {{- end -}}
      {{- if not (kindIs "map" $workload.podSpec.initContainers) -}}
        {{- $_ := set $workload.podSpec "initContainers" dict -}}
      {{- end -}}
      {{- $_ := set $workload.podSpec.initContainers $name (mustDeepCopy $container) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{- define "tc.v1.common.lib.deps.wait.valkey" -}}
{{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "valkey")) -}}
{{- if not $service -}}
  {{- fail "Dependencies - Expected dependency [valkey] to have an enabled primary service" -}}
{{- end -}}
{{- $service = $service | fromJson -}}
enabled: true
type: system
imageSelector: valkeyClientImage
securityContext:
  runAsUser: 568
  runAsGroup: 568
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  allowPrivilegeEscalation: false
  privileged: false
  seccompProfile:
    type: RuntimeDefault
  capabilities:
    add: []
    drop:
      - ALL
resources:
  excludeExtra: true
  requests:
    cpu: 10m
    memory: 50Mi
  limits:
    cpu: 500m
    memory: 512Mi
env:
  VALKEY_HOST: {{ $service.name | quote }}
  VALKEY_PORT: {{ $service.port | default 6379 | quote }}
  VALKEY_PASSWORD:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "valkeycreds" }}'
      key: valkey-password
command:
  - "/bin/sh"
  - "-c"
  - |
    /bin/bash <<'EOF'
    echo "Executing Valkey wait..."
    [[ -n "$VALKEY_PASSWORD" ]] && export REDISCLI_AUTH="$VALKEY_PASSWORD";
    export LIVE=false;
    until "$LIVE";
    do
      response=$(
          timeout -s 3 2 \
          valkey-cli \
            -h "$VALKEY_HOST" \
            -p "$VALKEY_PORT" \
            ping
        )
      # NOAUTH is a response too, this only waits for the server and has no password
      if [ "$response" == "PONG" ] || [ "$response" == "LOADING Valkey is loading the dataset in memory" ] || [[ "$response" == NOAUTH* ]]; then
        LIVE=true
        echo "$response"
        echo "Valkey Responded, ending initcontainer and starting main container(s)..."
      else
        echo "$response"
        echo "Valkey not responding... Sleeping for 10 sec..."
        sleep 10
      fi;
    done
    EOF
{{- end -}}

{{- define "tc.v1.common.lib.deps.wait.mariadb" -}}
{{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "mariadb")) -}}
{{- if not $service -}}
  {{- fail "Dependencies - Expected dependency [mariadb] to have an enabled primary service" -}}
{{- end -}}
{{- $service = $service | fromJson -}}
enabled: true
type: system
imageSelector: mariadbClientImage
securityContext:
  runAsUser: 568
  runAsGroup: 568
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  allowPrivilegeEscalation: false
  privileged: false
  seccompProfile:
    type: RuntimeDefault
  capabilities:
    add: []
    drop:
      - ALL
resources:
  excludeExtra: true
  requests:
    cpu: 10m
    memory: 50Mi
  limits:
    cpu: 500m
    memory: 512Mi
env:
  MARIADB_HOST: {{ $service.name | quote }}
  MARIADB_PORT: {{ $service.port | default 3306 | quote }}
  MARIADB_ROOT_PASSWORD:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "mariadbcreds" }}'
      key: mariadb-root-password
command:
  - "/bin/sh"
  - "-c"
  - |
    /bin/bash <<'EOF'
    echo "Executing MariaDB wait..."
    until
      mysqladmin -uroot -h"${MARIADB_HOST}" -P"${MARIADB_PORT}" -p"${MARIADB_ROOT_PASSWORD}" ping \
      && mysqladmin -uroot -h"${MARIADB_HOST}" -P"${MARIADB_PORT}" -p"${MARIADB_ROOT_PASSWORD}" status;
      do sleep 2;
    done
    EOF
{{- end -}}

{{- define "tc.v1.common.lib.deps.wait.mongodb" -}}
{{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "mongodb")) -}}
{{- if not $service -}}
  {{- fail "Dependencies - Expected dependency [mongodb] to have an enabled primary service" -}}
{{- end -}}
{{- $service = $service | fromJson -}}
enabled: true
type: system
imageSelector: mongodbClientImage
securityContext:
  runAsUser: 568
  runAsGroup: 568
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  allowPrivilegeEscalation: false
  privileged: false
  seccompProfile:
    type: RuntimeDefault
  capabilities:
    add: []
    drop:
      - ALL
resources:
  excludeExtra: true
  requests:
    cpu: 10m
    memory: 50Mi
  limits:
    cpu: 500m
    memory: 512Mi
env:
  MONGODB_HOST: {{ $service.name | quote }}
  MONGODB_PORT: {{ $service.port | default 27017 | quote }}
  MONGODB_DATABASE: "{{ .Values.dependencies.mongodb.depconfig.mongodbDatabase }}"
command:
  - "/bin/sh"
  - "-c"
  - |
    /bin/bash <<'EOF'
    echo "Executing MongoDB wait..."
    until
      HOME=/config && echo "db.runCommand(\"ping\")" | mongosh --host ${MONGODB_HOST} --port ${MONGODB_PORT} ${MONGODB_DATABASE} --quiet;
      do sleep 2;
    done
    EOF
{{- end -}}

{{- define "tc.v1.common.lib.deps.wait.clickhouse" -}}
{{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "clickhouse")) -}}
{{- if not $service -}}
  {{- fail "Dependencies - Expected dependency [clickhouse] to have an enabled primary service" -}}
{{- end -}}
{{- $service = $service | fromJson -}}
enabled: true
type: system
imageSelector: ubuntuImage
securityContext:
  runAsUser: 568
  runAsGroup: 568
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  allowPrivilegeEscalation: false
  privileged: false
  seccompProfile:
    type: RuntimeDefault
  capabilities:
    add: []
    drop:
      - ALL
resources:
  excludeExtra: true
  requests:
    cpu: 10m
    memory: 50Mi
  limits:
    cpu: 500m
    memory: 512Mi
env:
  CLICKHOUSE_HOST: {{ $service.name | quote }}
  CLICKHOUSE_PORT: {{ $service.port | default 8123 | quote }}
command:
  - "/bin/sh"
  - "-c"
  - |
    echo "Executing ClickHouse wait..."
    until wget --quiet --tries=1 --timeout=5 --spider "http://${CLICKHOUSE_HOST}:${CLICKHOUSE_PORT}/ping"; do
      echo "ClickHouse - no response. Sleeping 2 seconds..."
      sleep 2
    done
    echo "ClickHouse - accepting connections"
{{- end -}}

{{/* The wait container for PostgreSQL, shared by the CNPG clusters and the postgresql dependency */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.deps.wait.postgres" (dict "script" $script) }}
script: The shell script that waits for the databases, see [cnpg.wait.script].
*/}}
{{- define "tc.v1.common.lib.deps.wait.postgres" -}}
enabled: true
type: system
imageSelector: postgresClientImage
securityContext:
  runAsUser: 568
  runAsGroup: 568
  readOnlyRootFilesystem: true
  runAsNonRoot: true
  allowPrivilegeEscalation: false
  privileged: false
  seccompProfile:
    type: RuntimeDefault
  capabilities:
    add: []
    drop:
      - ALL
resources:
  excludeExtra: true
  requests:
    cpu: 10m
    memory: 50Mi
  limits:
    cpu: 500m
    memory: 512Mi
command:
  - "/bin/sh"
  - "-c"
  - |
    /bin/sh <<'EOF'
{{- .script | nindent 4 }}
    EOF
{{- end -}}

{{- define "tc.v1.common.lib.deps.wait.cnpg" -}}
  {{- $lines := list -}}
  {{- range $name, $cnpg := .Values.cnpg -}}
    {{- if $cnpg.enabled -}}
      {{- $lines = append $lines "echo \"Executing DB waits...\"" -}}
      {{- $cnpgName := include "tc.v1.common.lib.chart.names.fullname" $ -}}
      {{- $cnpgName = printf "%v-cnpg-%v" $cnpgName $name -}}

      {{/* Wait RW CNPG */}}
      {{- $lines = append $lines (include "cnpg.wait.script" (dict "url" (printf "%s-rw" $cnpgName) "user" $cnpg.user "db" $cnpg.database "on" "CNPG RW")) -}}

      {{- if and $cnpg.pooler $cnpg.pooler.enabled -}}
        {{/* Wait RW Pooler */}}
        {{- $lines = append $lines (include "cnpg.wait.script" (dict "url" (printf "%s-pooler-rw" $cnpgName) "user" $cnpg.user "db" $cnpg.database "on" "CNPG Pooler RW")) -}}

        {{/* Wait RO Pooler */}}
        {{- if $cnpg.pooler.createRO -}}
          {{- $lines = append $lines (include "cnpg.wait.script" (dict "url" (printf "%s-pooler-ro" $cnpgName) "user" $cnpg.user "db" $cnpg.database "on" "CNPG Pooler RO")) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  {{- $lines = append $lines "echo \"Done executing DB waits...\"" -}}

  {{- include "tc.v1.common.lib.deps.wait.postgres" (dict "script" (join "\n" $lines)) -}}
{{- end -}}

{{- define "tc.v1.common.lib.deps.wait.postgresql" -}}
  {{- $service := (include "tc.v1.common.lib.dependencies.primaryService" (dict "rootCtx" $ "depName" "postgresql")) -}}
  {{- if not $service -}}
    {{- fail "Dependencies - Expected dependency [postgresql] to have an enabled primary service" -}}
  {{- end -}}
  {{- $service = $service | fromJson -}}

  {{- $dep := get (.Values.dependencies | default dict) "postgresql" -}}
  {{- $depconfig := $dep.depconfig | default dict -}}

  {{- $lines := list "echo \"Executing DB waits...\"" -}}
  {{- $lines = append $lines (include "cnpg.wait.script" (dict
        "url" $service.name "port" $service.port
        "user" $depconfig.postgresqlUsername "db" $depconfig.postgresqlDatabase
        "on" "PostgreSQL")) -}}
  {{- $lines = append $lines "echo \"Done executing DB waits...\"" -}}

  {{- include "tc.v1.common.lib.deps.wait.postgres" (dict "script" (join "\n" $lines)) -}}
{{- end -}}

{{/* The wait script of a single PostgreSQL service, [port] is optional */}}
{{- define "cnpg.wait.script" -}}
  {{- $url := .url -}}
  {{- $port := .port -}}
  {{- $user := .user -}}
  {{- $db := .db -}}
  {{- $on := .on -}}
echo "Testing Database availability on [{{ $on }}]"
until
  echo "Testing database on url: [{{ $url }}]"
  pg_isready -U {{ $user }} -d {{ $db }} -h {{ $url }}{{ with $port }} -p {{ . }}{{ end }}
  do sleep 5
done
echo "Database available on url: [{{ $url }}]"
{{- end -}}
