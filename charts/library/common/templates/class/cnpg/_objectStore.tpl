{{- define "tc.v1.common.class.cnpg.objectStore" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $type := .type -}}

  {{/* Settings for this ObjectStore are read from [backups] or [recovery] */}}
  {{- $storeData := $objectData.recovery -}}
  {{- if eq $type "backup" -}}
    {{- $storeData = $objectData.backups -}}
  {{- end -}}

  {{/* Naming */}}
  {{- $storeName := include "tc.v1.common.lib.cnpg.barman.objectStoreName" (dict "objectData" $objectData "type" $type) -}}
  {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $storeName "length" 253) -}}
  {{- include "tc.v1.common.lib.metadata.validation" (dict "objectData" $objectData "caller" "CNPG ObjectStore") -}}

  {{/* Metadata */}}
  {{- $objLabels := $objectData.labels | default dict -}}
  {{- $storeLabels := $storeData.labels | default dict -}}
  {{- $storeLabels = mustMerge (dict) $storeLabels $objLabels -}}

  {{- $objAnnotations := $objectData.annotations | default dict -}}
  {{- $storeAnnotations := $storeData.annotations | default dict -}}
  {{- $storeAnnotations = mustMerge (dict) $storeAnnotations $objAnnotations -}}

  {{/* Fetch provider data */}}
  {{- $credName := $storeData.credentials -}}
  {{- $creds := (get $rootCtx.Values.credentials $credName) -}}
  {{- include "tc.v1.common.lib.credentials.validation" (dict "rootCtx" $rootCtx "caller" "CNPG ObjectStore" "credName" $credName) }}

---
apiVersion: barmancloud.cnpg.io/v1
kind: ObjectStore
metadata:
  name: {{ $storeName }}
  namespace: {{ include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "CNPG ObjectStore") }}
  labels:
    cnpg.io/cluster: {{ $objectData.clusterName }}
  {{- $labels := (mustMerge $storeLabels (include "tc.v1.common.lib.metadata.allLabels" $rootCtx | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "labels" $labels) | trim) }}
    {{- . | nindent 4 }}
  {{- end -}}
  {{- $annotations := (mustMerge $storeAnnotations (include "tc.v1.common.lib.metadata.allAnnotations" $rootCtx | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "annotations" $annotations) | trim) }}
  annotations:
    {{- . | nindent 4 }}
  {{- end }}
spec:
  {{- if eq $type "backup" -}}
    {{- with $objectData.backups.retentionPolicy }}
  retentionPolicy: {{ . }}
    {{- end -}}
  {{- end }}
  configuration:
    {{- if eq $type "backup" -}}
      {{- include "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.dataWal" (dict "objectData" $objectData) | nindent 4 -}}
    {{- end -}}
    {{- include (printf "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.%s" $creds.type) (dict "rootCtx" $rootCtx "objectData" $objectData "data" $creds "type" $type) | nindent 4 -}}
  {{- with $storeData.instanceSidecarConfiguration }}
  instanceSidecarConfiguration:
    {{- toYaml . | nindent 4 }}
  {{- end -}}
{{- end -}}
