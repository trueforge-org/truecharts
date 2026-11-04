{{/* Everything except the target and the serverName lives in the ObjectStore */}}
{{- define "tc.v1.common.lib.cnpg.cluster.backup" -}}
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
