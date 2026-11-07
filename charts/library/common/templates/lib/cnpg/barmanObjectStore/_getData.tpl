{{- define "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.getData" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $type := .type -}}

  {{- $serverName := $objectData.clusterName -}}
  {{- $destinationPath := "" -}}
  {{- $creds := dict -}}
  {{- $key := "" -}}

  {{- if eq $type "recovery" -}}
    {{- $creds = (get $rootCtx.Values.credentials $objectData.recovery.credentials) -}}
    {{- include "tc.v1.common.lib.credentials.validation" (dict "rootCtx" $rootCtx "caller" "CNPG BarmanObjectStore" "credName" $objectData.recovery.credentials) -}}
    {{- $destinationPath = $objectData.recovery.destinationPath -}}
    {{- $key = "recovery" -}}

    {{- if $objectData.recovery.serverName -}}
      {{- $serverName = $objectData.recovery.serverName -}}
    {{- end -}}
    {{- if $objectData.recovery.revision -}}
      {{- $serverName = printf "%s-r%s" $serverName $objectData.recovery.revision -}}
    {{- end -}}

  {{- else if eq $type "backup" -}}
    {{- $creds = (get $rootCtx.Values.credentials $objectData.backups.credentials) -}}
    {{- include "tc.v1.common.lib.credentials.validation" (dict "rootCtx" $rootCtx "caller" "CNPG BarmanObjectStore" "credName" $objectData.backups.credentials) -}}
    {{- $destinationPath = $objectData.backups.destinationPath -}}
    {{- $key = "backups" -}}

    {{- if $objectData.backups.serverName -}}
      {{- $serverName = $objectData.backups.serverName -}}
    {{- end -}}
    {{- if $objectData.backups.revision -}}
      {{- $serverName = printf "%s-r%s" $serverName $objectData.backups.revision -}}
    {{- end -}}
  {{- end -}}

  {{/* Falls back to the provider specific default path */}}
  {{- if not $destinationPath -}}
    {{- if $creds.path -}}
      {{- $destinationPath = (printf "s3://%s/%s/%s/cnpg" $creds.bucket ($creds.path | trimSuffix "/") $rootCtx.Release.Name) -}}
    {{- else -}}
      {{- $destinationPath = (printf "s3://%s/%s/cnpg" $creds.bucket $rootCtx.Release.Name) -}}
    {{- end -}}
  {{- end -}}

  {{- $data := (dict
    "serverName" $serverName
    "destinationPath" $destinationPath
    "creds" $creds
    "key" $key
  ) -}}

  {{- $data | toYaml -}}
{{- end -}}
