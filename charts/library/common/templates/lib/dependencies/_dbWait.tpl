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

  {{- if .Values.mongodb.enabled -}}
    {{- $container := include "tc.v1.common.lib.deps.wait.mongodb" $ | fromYaml -}}
    {{- include "tc.v1.common.lib.deps.wait.add" (dict "rootCtx" $ "name" "mongodb-wait" "container" $container) -}}
  {{- end -}}

  {{- if .Values.clickhouse.enabled -}}
    {{- $container := include "tc.v1.common.lib.deps.wait.clickhouse" $ | fromYaml -}}
    {{- include "tc.v1.common.lib.deps.wait.add" (dict "rootCtx" $ "name" "clickhouse-wait" "container" $container) -}}
  {{- end -}}

  {{- if .Values.solr.enabled -}}
    {{- $container := include "tc.v1.common.lib.deps.wait.solr" $ | fromYaml -}}
    {{- include "tc.v1.common.lib.deps.wait.add" (dict "rootCtx" $ "name" "solr-wait" "container" $container) -}}
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
  MONGODB_HOST:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "mongodbcreds" }}'
      key: plainhost
  MONGODB_DATABASE: "{{ .Values.mongodb.mongodbDatabase }}"
command:
  - "/bin/sh"
  - "-c"
  - |
    /bin/bash <<'EOF'
    echo "Executing DB waits..."
    until
      HOME=/config && echo "db.runCommand(\"ping\")" | mongosh --host ${MONGODB_HOST} --port 27017 ${MONGODB_DATABASE} --quiet;
      do sleep 2;
    done
    EOF
{{- end -}}

{{- define "tc.v1.common.lib.deps.wait.clickhouse" -}}
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
  CLICKHOUSE_PING:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "clickhousecreds" }}'
      key: ping
command:
  - "/bin/sh"
args:
  - "-c"
  - |
    echo "Executing DB waits..."
    until wget --quiet --tries=1 --spider "${CLICKHOUSE_PING}"; do
      echo "ClickHouse - no response. Sleeping 2 seconds..."
      sleep 2
    done
    echo "ClickHouse - accepting connections"
{{- end -}}

{{- define "tc.v1.common.lib.deps.wait.solr" -}}
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
  SOLR_HOST:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "solrcreds" }}'
      key: plainhost
  SOLR_CORES: "{{ .Values.solr.solrCores }}"
  SOLR_ENABLE_AUTHENTICATION: "{{ .Values.solr.solrEnableAuthentication }}"
  SOLR_ADMIN_USERNAME: "{{ .Values.solr.solrUsername }}"
  SOLR_ADMIN_PASSWORD:
    secretKeyRef:
      expandObjectName: false
      name: '{{ printf "%s-%s" .Release.Name "solrcreds" }}'
      key: solr-password

command:
  - "/bin/sh"
args:
  - "-c"
  - |
    echo "Executing DB waits..."
    if [ "$SOLR_ENABLE_AUTHENTICATION" == "yes" ]; then
      until curl --fail --user "${SOLR_ADMIN_USERNAME}":"${SOLR_ADMIN_PASSWORD}" "${SOLR_HOST}":8983/solr/"${SOLR_CORES}"/admin/ping; do
        echo "Solr is not responding... Sleeping 2 seconds..."
        sleep 2
      done
    else
      until curl --fail "${SOLR_HOST}":8983/solr/"${SOLR_CORES}"/admin/ping; do
        echo "Solr is not responding... Sleeping 2 seconds..."
        sleep 2
      done
    fi
{{- end -}}

{{- define "tc.v1.common.lib.deps.wait.cnpg" -}}
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
{{- range $name, $cnpg := .Values.cnpg -}}
  {{- if $cnpg.enabled }}
    echo "Executing DB waits..."
    {{- $cnpgName := include "tc.v1.common.lib.chart.names.fullname" $ -}}
    {{- $cnpgName = printf "%v-cnpg-%v" $cnpgName $name -}}

    {{/* Wait RW CNPG */}}
    {{- include "cnpg.wait.script" (dict "url" (printf "%s-rw" $cnpgName) "user" .user "db" .database "on" "CNPG RW") | nindent 4 -}}

    {{- if and $cnpg.pooler $cnpg.pooler.enabled -}}
      {{/* Wait RW Pooler */}}
      {{- include "cnpg.wait.script" (dict "url" (printf "%s-pooler-rw" $cnpgName) "user" .user "db" .database "on" "CNPG Pooler RW") | nindent 4 -}}

      {{/* Wait RO Pooler */}}
      {{- if $cnpg.pooler.createRO -}}
        {{- include "cnpg.wait.script" (dict "url" (printf "%s-pooler-ro" $cnpgName) "user" .user "db" .database "on" "CNPG Pooler RO") | nindent 4 -}}
      {{- end -}}

    {{- end -}}
  {{- end -}}
{{- end }}
    echo "Done executing DB waits..."
    EOF
{{- end -}}

{{- define "cnpg.wait.script" -}}
  {{- $url := .url -}}
  {{- $user := .user -}}
  {{- $db := .db -}}
  {{- $on := .on -}}
echo "Testing Database availability on [{{ $on }}]"
until
  echo "Testing database on url: [{{ $url }}]"
  pg_isready -U {{ $user }} -d {{ $db }} -h {{ $url }}
  do sleep 5
done
echo "Database available on url: [{{ $url }}]"
{{- end -}}
