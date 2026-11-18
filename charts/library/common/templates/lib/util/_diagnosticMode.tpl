{{- define "tc.v1.common.lib.util.diagnosticMode" -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $diagMode := "" -}}

  {{- $itemsToCheck := (list $rootCtx.Values $rootCtx.Values.global) -}}

  {{- range $item := $itemsToCheck -}}
    {{- if hasKey $item "diagnosticMode" -}}
      {{- if hasKey $item.diagnosticMode "enabled" -}}
        {{- $enabled := $item.diagnosticMode.enabled -}}
        {{- if kindIs "string" $enabled -}}
          {{- $enabled = tpl $enabled $rootCtx -}}
          {{- if eq $enabled "true" -}}
            {{- $enabled = true -}}
          {{- else if eq $enabled "false" -}}
            {{- $enabled = false -}}
          {{- end -}}
        {{- end -}}
        {{- if not (kindIs "bool" $enabled) -}}
          {{- fail (printf "Diagnostic Mode - Expected [diagnosticMode.enabled] to be a bool or a string resolving to [true] or [false], but got [%s]" (kindOf $enabled)) -}}
        {{- end -}}
        {{- if $enabled -}}
          {{- $diagMode = true -}}
        {{- end -}}
      {{- end -}}

      {{/* Ignore if its not true as we want any item
          that is true to apply regardless of the order
      */}}
    {{- end -}}
  {{- end -}}

  {{- $diagMode | toString -}}
{{- end -}}
