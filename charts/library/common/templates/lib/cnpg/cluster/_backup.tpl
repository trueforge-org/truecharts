{{- define "tc.v1.common.lib.cnpg.cluster.backup" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData }}
backup:
  {{- with $objectData.backups.target }}
  target: {{ . }}
  {{- end }}
  {{- with $objectData.backups.retentionPolicy }}
  retentionPolicy: {{ . }}
  {{- end }}
  barmanObjectStore:
    {{- include "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.dataWal" (dict "objectData" $objectData) | nindent 4 -}}
  {{/* Fetch provider data */}}
  {{/* Get the creds defined in backup.$provider */}}
  {{- $creds := (get $rootCtx.Values.credentials $objectData.backups.credentials) -}}
  {{- include "tc.v1.common.lib.credentials.validation" (dict "rootCtx" $rootCtx "caller" "CNPG Backup" "credName" $objectData.backups.credentials) -}}

  {{- include (printf "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.%s" $creds.type) (dict "rootCtx" $rootCtx "objectData" $objectData "data" $creds "type" "backup") | nindent 4 -}}
{{- end -}}

{{/* Same as above, for the Barman Cloud plugin. Everything except the target and the serverName lives in the ObjectStore */}}
{{- define "tc.v1.common.lib.cnpg.cluster.backup.plugin" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- $calcData := include "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.getData" (dict
      "rootCtx" $rootCtx "objectData" $objectData "type" "backup") | fromYaml
  -}}
  {{- with $objectData.backups.target }}
backup:
  target: {{ . }}
  {{- end }}
plugins:
  - name: {{ include "tc.v1.common.lib.cnpg.barman.pluginName" . }}
    isWALArchiver: true
    parameters:
      barmanObjectName: {{ include "tc.v1.common.lib.cnpg.barman.objectStoreName" (dict "objectData" $objectData "type" "backup") }}
      serverName: {{ $calcData.serverName }}
{{- end -}}
