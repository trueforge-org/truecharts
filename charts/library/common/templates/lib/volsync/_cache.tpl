{{- define "tc.v1.common.lib.volsync.cache" -}}
  {{- $creds := .creds -}}

  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $volsyncData := .volsyncData -}}
  {{- $target := get $volsyncData .target -}}

cacheCapacity: {{ $target.cacheCapacity | default "10Gi" }}

  {{- with $target.cacheStorageClassName }}
cacheStorageClassName: {{ $target.cacheStorageClassName }}
  {{- end -}}

  {{- with $target.cacheAccessModes }}
    {{- $modes := . -}}
    {{- if kindIs "string" $modes -}}
      {{- $modes = list $modes -}}
    {{- end }}
cacheAccessModes:
    {{- range $modes }}
  - {{ . }}
    {{- end }}
  {{- end -}}
{{- end -}}
