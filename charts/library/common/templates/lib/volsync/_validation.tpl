{{- define "tc.v1.common.lib.volsync.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- if not $objectData.name -}}
    {{- fail "VolSync - Expected non-empty [name]" -}}
  {{- end -}}

  {{- if not $objectData.type -}}
    {{- fail "VolSync - Expected non-empty [type]" -}}
  {{- end -}}

  {{- if not $objectData.credentials -}}
    {{- fail "VolSync - Expected non-empty [credentials]" -}}
  {{- end -}}

  {{- if not (kindIs "string" $objectData.credentials) -}}
    {{- fail (printf "VolSync - Expected [credentials] to be a string, but got [%s]" (kindOf $objectData.credentials)) -}}
  {{- end -}}

  {{- include "tc.v1.common.lib.credentials.validation" (dict "rootCtx" $rootCtx "caller" "VolSync" "credName" $objectData.credentials) -}}

{{- end -}}
