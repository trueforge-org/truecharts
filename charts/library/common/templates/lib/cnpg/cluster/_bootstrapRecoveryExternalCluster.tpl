{{/* Recovery from externalClusters Template, called when mode is recovery */}}
{{- define "tc.v1.common.lib.cnpg.cluster.bootstrap.recovery.externalCluster" }}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- if eq $objectData.recovery.method "object_store" }}
externalClusters:
    {{- $serverName := $objectData.recovery.serverName | default $objectData.clusterName -}}
    {{- if $objectData.recovery.revision -}}
      {{- $serverName = printf "%s-r%s" $serverName $objectData.recovery.revision -}}
    {{- end }}
  - name: {{ $serverName }}
    plugin:
      name: {{ include "tc.v1.common.lib.cnpg.barman.pluginName" . }}
      parameters:
        barmanObjectName: {{ include "tc.v1.common.lib.cnpg.barman.objectStoreName" (dict "objectData" $objectData "type" "recovery") }}
        serverName: {{ $serverName }}
  {{- end -}}
{{- end -}}
