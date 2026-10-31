{{- define "tc.v1.common.lib.cnpg.cluster.validation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- $requiredKeys := (list "database" "user" "password") -}}
  {{- range $key := $requiredKeys -}}
    {{- if not (get $objectData $key) -}}
      {{- fail (printf "CNPG - Expected a non-empty [%s] key" $key) -}}
    {{- end -}}
  {{- end -}}

  {{/* Kinda imposibble to happen, as we explicitly set it to string on the spawner */}}
  {{- if not (kindIs "string" $objectData.pgVersion) -}}
    {{/* We must ensure that this is a string, as it is used in image selector that require a string */}}
    {{- fail (printf "CNPG - Expected [pgVersion] to be a string, but got [%s]" (kindOf $objectData.pgVersion)) -}}
  {{- end -}}

  {{- $validVersions := (list "15" "16" "17" "18") -}}
  {{- if not (mustHas $objectData.pgVersion $validVersions) -}}
    {{- fail (printf "CNPG - Expected [pgVersion] to be one of [%s], but got [%s]" (join ", " $validVersions) $objectData.pgVersion) -}}
  {{- end -}}

  {{- if (hasKey $objectData "hibernate") -}}
    {{- if not (kindIs "bool" $objectData.hibernate) -}}
      {{- fail (printf "CNPG - Expected [hibernate] to be a boolean, but got [%s]" (kindOf $objectData.hibernate)) -}}
    {{- end -}}
  {{- end -}}

  {{- if (hasKey $objectData "instances") -}}
    {{- if lt ($objectData.instances | int) 1 -}}
      {{- fail (printf "CNPG - Expected [instances] to be greater than 0, but got [%d]" ($objectData.instances | int)) -}}
    {{- end -}}
  {{- end -}}

  {{- if (hasKey $objectData "mode") -}}
    {{- $validModes := (list "standalone" "replica" "recovery") -}}
    {{- if not (mustHas $objectData.mode $validModes) -}}
      {{- fail (printf "CNPG Cluster - Expected [mode] to be one of [%s], but got [%s]" (join ", " $validModes) $objectData.mode) -}}
    {{- end -}}
  {{- end -}}

  {{- if (hasKey $objectData "type") -}}
    {{- $validTypes := (list "postgres" "postgis" "timescaledb" "vectors" "vectorchord") -}}
    {{- if not (mustHas $objectData.type $validTypes) -}}
      {{- fail (printf "CNPG Cluster - Expected [type] to be one of [%s], but got [%s]" (join ", " $validTypes) $objectData.type) -}}
    {{- end -}}
  {{- end -}}

  {{/* pgvecto.rs (type vectors) publishes no PostgreSQL 18 image; it is superseded by VectorChord */}}
  {{- if and (eq ($objectData.type | default "postgres") "vectors") (eq ($objectData.pgVersion | toString) "18") -}}
    {{- fail "CNPG Cluster - type [vectors] is not available for pgVersion [18]; pgvecto.rs has been superseded by VectorChord, use type [vectorchord] instead" -}}
  {{- end -}}

  {{- if (hasKey $objectData "cluster") -}}
    {{- if (hasKey $objectData.cluster "logLevel") -}}
      {{- $validLevels := (list "error" "warning" "info" "debug" "trace") -}}
      {{- if not (mustHas $objectData.cluster.logLevel $validLevels) -}}
        {{- fail (printf "CNPG Cluster - Expected [cluster.logLevel] to be one of [%s], but got [%s]" (join ", " $validLevels) $objectData.cluster.logLevel) -}}
      {{- end -}}
    {{- end -}}

    {{- if (hasKey $objectData.cluster "primaryUpdateStrategy") -}}
      {{- $validStrategies := (list "supervised" "unsupervised") -}}
      {{- if not (mustHas $objectData.cluster.primaryUpdateStrategy $validStrategies) -}}
        {{- fail (printf "CNPG Cluster - Expected [cluster.primaryUpdateStrategy] to be one of [%s], but got [%s]" (join ", " $validStrategies) $objectData.cluster.primaryUpdateStrategy) -}}
      {{- end -}}
    {{- end -}}

    {{- if (hasKey $objectData.cluster "primaryUpdateMethod") -}}
      {{- $validMethods := (list "switchover" "restart") -}}
      {{- if not (mustHas $objectData.cluster.primaryUpdateMethod $validMethods) -}}
        {{- fail (printf "CNPG Cluster - Expected [cluster.primaryUpdateMethod] to be one of [%s], but got [%s]" (join ", " $validMethods) $objectData.cluster.primaryUpdateMethod) -}}
      {{- end -}}
    {{- end -}}

    {{- if (hasKey $objectData.cluster "initdb") -}}
      {{- with $objectData.cluster.initdb.walSegmentSize -}}
        {{- if not (mustHas (kindOf .) (list "int" "int64" "float64")) -}}
          {{- fail (printf "CNPG Cluster - Expected [cluster.initdb.walSegmentSize] to be an integer, but got [%s]" (kindOf .)) -}}
        {{- end -}}
        {{- if or (lt (. | int) 1) (gt (. | int) 1024) -}}
          {{- fail (printf "CNPG Cluster - Expected [cluster.initdb.walSegmentSize] to be between 1 and 1024, but got [%d]" (. | int)) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if eq $objectData.mode "recovery" -}}
    {{- if not $objectData.recovery -}}
      {{- fail "CNPG Recovery - Expected a non-empty [recovery] key" -}}
    {{- end -}}

    {{- $validMethods := (list "object_store") -}}
    {{- if not (mustHas $objectData.recovery.method $validMethods) -}}
      {{- fail (printf "CNPG Recovery - Expected [recovery.method] to be one of [%s], but got [%s]" (join ", " $validMethods) $objectData.recovery.method) -}}
    {{- end -}}
  {{- end -}}

  {{- if and $objectData.recovery $objectData.recovery.revision -}}
    {{- if not (kindIs "string" $objectData.recovery.revision) -}}
      {{- fail (printf "CNPG Recovery - Expected [recovery.revision] to be a string, got [%s]" (kindOf $objectData.recovery.revision)) -}}
    {{- end -}}
  {{- end -}}

  {{- if and $objectData.backups $objectData.backups.revision -}}
    {{- if not (kindIs "string" $objectData.backups.revision) -}}
      {{- fail (printf "CNPG Backup - Expected [backups.revision] to be a string, got [%s]" (kindOf $objectData.backups.revision)) -}}
    {{- end -}}
  {{- end -}}

  {{/* [servername] used to be documented but never read. Do not start honoring it, as that would silently change the archive path */}}
  {{- if and $objectData.recovery $objectData.recovery.servername -}}
    {{- fail "CNPG Recovery - [recovery.servername] is not supported, use [recovery.serverName] instead. Note that the previous value was never applied" -}}
  {{- end -}}
  {{- if and $objectData.backups $objectData.backups.servername -}}
    {{- fail "CNPG Backup - [backups.servername] is not supported, use [backups.serverName] instead. Note that the previous value was never applied" -}}
  {{- end -}}

  {{- if (hasKey $objectData "backups") -}}
    {{- if $objectData.backups.enabled -}}
      {{- with $objectData.backups.target -}}
        {{- $validTargets := (list "primary" "prefer-standby") -}}
        {{- if not (mustHas . $validTargets) -}}
          {{- fail (printf "CNPG Backup - Expected [backups.target] to be one of [%s], but got [%s]" (join ", " $validTargets) .) -}}
        {{- end -}}
      {{- end -}}

      {{- with $objectData.backups.retentionPolicy -}}
        {{- $regexPolicy := "^[1-9][0-9]*[dwm]$" -}} {{/* Copied from upstream */}}
        {{- if not (mustRegexMatch $regexPolicy .) -}}
          {{- fail (printf "CNPG Backup - Expected [backups.retentionPolicy] to match regex [%s], got [%s]" $regexPolicy .) -}}
        {{- end -}}
      {{- end -}}

      {{/* Only recovering from an object store reads an archive, and missing credentials are reported by the secret spawner */}}
      {{- if and (eq $objectData.mode "recovery") (eq $objectData.recovery.method "object_store") $objectData.backups.credentials $objectData.recovery.credentials -}}
        {{- $backupStore := include "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.getData" (dict "rootCtx" $rootCtx "objectData" $objectData "type" "backup") | fromYaml -}}
        {{- $recoveryStore := include "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.getData" (dict "rootCtx" $rootCtx "objectData" $objectData "type" "recovery") | fromYaml -}}

        {{/* The same server name is fine, as long as it is on a different location */}}
        {{- if and (eq $backupStore.serverName $recoveryStore.serverName) (eq $backupStore.destinationPath $recoveryStore.destinationPath) (eq $backupStore.creds.url $recoveryStore.creds.url) -}}
          {{- if $objectData.backups.serverName -}}
            {{- fail (printf "CNPG Backup/Recovery - [backups.serverName] and [backups.revision] cannot match [recovery.serverName] and [recovery.revision] when in recovery mode and backup is enabled, for CNPG cluster [%s]" $objectData.clusterName) -}}
          {{- else -}}
            {{- fail (printf "CNPG Backup/Recovery - [backups.revision] cannot match [recovery.revision] when in recovery mode and backup is enabled, for CNPG cluster [%s]" $objectData.clusterName) -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* Clusters without backups or object store recovery do not need the plugin */}}
  {{- $backups := $objectData.backups | default dict -}}
  {{- if or $backups.enabled (eq $objectData.mode "recovery") -}}
    {{- $pluginAPI := include "tc.v1.common.lib.cnpg.barman.pluginAPI" . -}}
    {{- if not ($rootCtx.Capabilities.APIVersions.Has $pluginAPI) -}}
      {{- fail (printf "CNPG - Backups and recovery need the Barman Cloud plugin, but API [%s] was not found, for CNPG cluster [%s]. Install the plugin in the namespace of the CloudNativePG operator. When rendering without access to a cluster, pass [--api-versions %s]" $pluginAPI $objectData.clusterName $pluginAPI) -}}
    {{- end -}}
  {{- end -}}

{{- end -}}
