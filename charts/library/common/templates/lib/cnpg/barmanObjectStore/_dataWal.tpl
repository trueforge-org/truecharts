{{/* Base backup and WAL settings of the ObjectStore */}}
{{- define "tc.v1.common.lib.cnpg.cluster.barmanObjectStoreConfig.dataWal" -}}
  {{- $objectData := .objectData -}}

  {{- $compression := "bzip2" -}}
  {{- if and $objectData.backups.compression (not $objectData.backups.compression.enabled) -}}
    {{- $compression = "" -}}
  {{- end -}}

  {{- $encryption := "" -}}
  {{- if and $objectData.backups.encryption $objectData.backups.encryption.enabled -}}
    {{- $encryption = "AES256" -}}
  {{- end -}}
data:
  jobs: {{ $objectData.backups.jobs | default 2 }}
  {{- with $compression }}
  compression: {{ . }}
  {{- end -}}
  {{- with $encryption }}
  encryption: {{ . }}
  {{- end -}}
{{- if or $compression $encryption }}
wal:
  {{- with $compression }}
  compression: {{ . }}
  {{- end -}}
  {{- with $encryption }}
  encryption: {{ . }}
  {{- end -}}
{{- end -}}
{{- end -}}
