{{/* Name of the Barman Cloud plugin, as referenced by the Cluster, Backup and ScheduledBackup objects */}}
{{- define "tc.v1.common.lib.cnpg.barman.pluginName" -}}
  {{- print "barman-cloud.cloudnative-pg.io" -}}
{{- end -}}

{{/* API that the plugin installs. Used to detect if the plugin is available in the cluster */}}
{{- define "tc.v1.common.lib.cnpg.barman.pluginAPI" -}}
  {{- print "barmancloud.cnpg.io/v1/ObjectStore" -}}
{{- end -}}

{{/* Name of the ObjectStore. There is one per type (backup/recovery), as they can use different credentials */}}
{{- define "tc.v1.common.lib.cnpg.barman.objectStoreName" -}}
  {{- printf "%s-%s" .objectData.clusterName .type -}}
{{- end -}}
