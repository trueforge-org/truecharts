{{- define "tc.v1.common.lib.volsync.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $rootCtx := .rootCtx -}}

  {{- if not $objectData.name -}}
    {{- fail "VolSync - Expected non-empty [name]" -}}
  {{- end -}}

  {{- if not $objectData.type -}}
    {{- fail "VolSync - Expected non-empty [type]" -}}
  {{- end -}}

  {{- $validTypes := (list "restic") -}}
  {{- $type := tpl (toString $objectData.type) $rootCtx -}}
  {{- if not (mustHas $type $validTypes) -}}
    {{- fail (printf "VolSync - Expected [type] to be one of [%s], but got [%s]" (join ", " $validTypes) $type) -}}
  {{- end -}}

  {{- with $objectData.copyMethod -}}
    {{- $validCopyMethods := (list "Clone" "Direct" "Snapshot") -}}
    {{- $copyMethod := tpl (toString .) $rootCtx -}}
    {{- if not (mustHas $copyMethod $validCopyMethods) -}}
      {{- fail (printf "VolSync - Expected [copyMethod] to be one of [%s], but got [%s]" (join ", " $validCopyMethods) $copyMethod) -}}
    {{- end -}}
  {{- end -}}

  {{- if not $objectData.credentials -}}
    {{- fail "VolSync - Expected non-empty [credentials]" -}}
  {{- end -}}

  {{- if not (kindIs "string" $objectData.credentials) -}}
    {{- fail (printf "VolSync - Expected [credentials] to be a string, but got [%s]" (kindOf $objectData.credentials)) -}}
  {{- end -}}

  {{- include "tc.v1.common.lib.credentials.validation" (dict "rootCtx" $rootCtx "caller" "VolSync" "credName" $objectData.credentials) -}}

{{- end -}}
