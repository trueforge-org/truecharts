{{- define "tc.v1.common.lib.volumesnapshotclass.validation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- if not $objectData.driver -}}
    {{- fail "Volume Snapshot Class - Expected non empty [driver]" -}}
  {{- end -}}
{{- end -}}
