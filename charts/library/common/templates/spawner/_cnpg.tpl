{{/* Renders the cnpg objects of the postgresql dependency, when it is in operator mode */}}
{{- define "tc.v1.common.spawner.cnpg" -}}

  {{- $dep := get ($.Values.dependencies | default dict) "postgresql" -}}

  {{- if kindIs "map" $dep -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $dep
                    "name" "postgresql" "caller" "Dependencies"
                    "key" "dependencies")) -}}
    {{- $mode := (include "tc.v1.common.lib.dependencies.mode" (dict "objectData" $dep "depName" "postgresql")) -}}

    {{- if and (eq $enabled "true") (eq $mode "operator") -}}

      {{- include "tc.v1.common.lib.dependencies.postgresql.depconfig" (dict "rootCtx" $ "dep" $dep) -}}

      {{/* Create a copy */}}
      {{- $objectData := mustDeepCopy ($dep.operator | default dict) -}}
      {{/* Short name is "main", so the objects keep the names of the former [cnpg.main] */}}
      {{- $shortName := "main" -}}
      {{- $objectName := include "tc.v1.common.lib.dependencies.postgresql.operator.clusterName" (dict "rootCtx" $) -}}

      {{/* Set the name */}}
      {{- $_ := set $objectData "name" $objectName -}}
      {{- $_ := set $objectData "shortName" $shortName -}}
      {{/* Set the cluster name */}}
      {{- $_ := set $objectData "clusterName" $objectData.name -}}

      {{/* The database details are shared with the standalone mode */}}
      {{- $_ := set $objectData "user" $dep.depconfig.postgresqlUsername -}}
      {{- $_ := set $objectData "database" $dep.depconfig.postgresqlDatabase -}}
      {{- $_ := set $objectData "password" $dep.depconfig.password -}}

      {{/* Handle version string */}}
      {{/* pgvecto.rs has no image for PostgreSQL 18, so without a set version this type stays on 16 */}}
      {{- $pgFallback := $.Values.global.fallbackDefaults.cnpg.pgVersion -}}
      {{- if and (eq ($objectData.type | default "postgres") "vectors") (eq ($pgFallback | toString) "18") -}}
        {{- $pgFallback = 16 -}}
      {{- end -}}
      {{- $pgVersion := ($objectData.pgVersion | default $pgFallback) | toString -}}

      {{/* Set the updated pgVersion version to objectData */}}
      {{- $_ := set $objectData "pgVersion" $pgVersion -}}

      {{/* allow for injecting major upgrade code */}}
      {{- if $objectData.upgradeMajor -}}
        {{/* TODO: actually handle postgres version updates here */}}
      {{- end -}}

      {{- include "tc.v1.common.lib.util.metaListToDict" (dict "objectData" $objectData) -}}

      {{/* Handle Backups/ScheduledBackups */}}
      {{- if and (hasKey $objectData "backups") $objectData.backups.enabled -}}

        {{/* Create Backups */}}
        {{- include "tc.v1.common.lib.cnpg.spawner.backups" (dict "rootCtx" $ "objectData" $objectData) -}}

        {{/* Create ScheduledBackups */}}
        {{- include "tc.v1.common.lib.cnpg.spawner.scheduledBackups" (dict "rootCtx" $ "objectData" $objectData) -}}

        {{/* Create secret for backup store */}}
        {{- include "tc.v1.common.lib.cnpg.provider.secret.spawner" (dict "rootCtx" $ "objectData" $objectData "type" "backup") -}}

        {{/* Create ObjectStore for backups */}}
        {{- include "tc.v1.common.class.cnpg.objectStore" (dict "rootCtx" $ "objectData" $objectData "type" "backup") -}}
      {{- end -}}

      {{/* Handle Pooler(s) */}}
      {{- if and $objectData.pooler $objectData.pooler.enabled -}}
        {{- include "tc.v1.common.lib.cnpg.spawner.pooler" (dict "rootCtx" $ "objectData" $objectData) -}}
      {{- end -}}

      {{/* Handle Cluster */}}
      {{/* Validate Cluster */}}
      {{- include "tc.v1.common.lib.cnpg.cluster.validation" (dict "rootCtx" $ "objectData" $objectData) -}}

      {{- if and (eq $objectData.mode "recovery") (eq $objectData.recovery.method "object_store") -}}
        {{/* Create secret for recovery store */}}
        {{- include "tc.v1.common.lib.cnpg.provider.secret.spawner" (dict "rootCtx" $ "objectData" $objectData "type" "recovery") -}}

        {{/* Create ObjectStore for recovery */}}
        {{- include "tc.v1.common.class.cnpg.objectStore" (dict "rootCtx" $ "objectData" $objectData "type" "recovery") -}}
      {{- end -}}

      {{/* Create the Cluster object */}}
      {{- include "tc.v1.common.class.cnpg.cluster" (dict "rootCtx" $ "objectData" $objectData) -}}

      {{/* TODO: Create configmaps for cluster.monitoring.customQueries */}}

      {{/* Handle the credentials secret, the connection urls are injected by the postgresql dependency */}}
      {{- include "tc.v1.common.lib.cnpg.db.credentials.secrets" (dict "rootCtx" $ "objectData" $objectData) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
