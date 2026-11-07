{{- define "tc.v1.common.lib.storageclass.validation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- if not $objectData.provisioner -}}
    {{- fail "Storage Class - Expected non-empty [provisioner]" -}}
  {{- end -}}

 {{- if (hasKey $objectData "isDefault") -}}
    {{- if not (kindIs "bool" $objectData.isDefault) -}}
      {{- fail (printf "Storage Class - Expected [isDefault] to be [boolean], but got [%s]" (kindOf $objectData.isDefault)) -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
