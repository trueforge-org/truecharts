{{- define "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.s3" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $type := .type -}}
  {{- $data := .data -}}

  {{- $fullname := include "tc.v1.common.lib.chart.names.fullname" $rootCtx -}}
  {{- $secretName := (printf "%s-cnpg-%s-provider-%s-s3-creds" $fullname $objectData.shortName $type) -}}

  {{- $calcData := include "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.getData" (dict
      "rootCtx" $rootCtx "objectData" $objectData "type" $type) | fromYaml
  -}}

  {{- $serverName := $calcData.serverName -}}
  {{- $destinationPath := $calcData.destinationPath -}}
  {{- $endpointURL := $calcData.creds.url -}}
  {{- $customCA := $calcData.creds.customCA -}}
  {{- $customCASecretRef := $calcData.creds.customCASecretRef -}}
  {{- $bucket := $calcData.creds.bucket -}}
  {{- $path := $calcData.creds.path -}}
  {{- $key := $calcData.key -}}

  {{- $endpointCA := dict -}}
  {{- if $customCA }}
    {{- $endpointCA = (dict "name" (printf "%s-cnpg-%s-provider-%s-s3-ca" $fullname $objectData.shortName $type) "key" "ca.crt") -}}
  {{- else if $customCASecretRef -}}
    {{- $credName := "" -}}
    {{- if eq $type "recovery" -}}
      {{- $credName = $objectData.recovery.credentials -}}
    {{- else if eq $type "backup" -}}
      {{- $credName = $objectData.backups.credentials -}}
    {{- end -}}

    {{- $CAsecretName := $customCASecretRef.name -}}
    {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                    "rootCtx" $rootCtx "objectData" $customCASecretRef
                    "name" $CAsecretName "caller" "CNPG BarmanObjectStore"
                    "key" (printf "credentials.%s.customCA.name" $credName))) -}}
    {{- if eq $expandName "true" -}}
      {{- $CAsecretName = (printf "%s-%s" $fullname $CAsecretName) -}}
    {{- end -}}

    {{- $endpointCA = (dict "name" $CAsecretName "key" $customCASecretRef.key) -}}
  {{- end -}}

  {{- if not $destinationPath -}}
    {{- if $path -}}
      {{- $destinationPath = (printf "s3://%s/%s/%s/cnpg" $bucket ($path | trimSuffix "/") $rootCtx.Release.Name) -}}
    {{- else -}}
      {{- $destinationPath = (printf "s3://%s/%s/cnpg" $bucket $rootCtx.Release.Name) -}}
    {{- end -}}
  {{- end }}
endpointURL: {{ $endpointURL }}
{{- if $endpointCA }}
endpointCA:
  name: {{ $endpointCA.name }}
  key: {{ $endpointCA.key }}
{{- end }}
destinationPath: {{ $destinationPath }}
serverName: {{ $serverName }}
s3Credentials:
  accessKeyId:
    name: {{ $secretName }}
    key: ACCESS_KEY_ID
  secretAccessKey:
    name: {{ $secretName }}
    key: ACCESS_SECRET_KEY
{{- end -}}
