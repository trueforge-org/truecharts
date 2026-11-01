{{/* Validates the settings shared by all route integrations */}}
{{- define "tc.v1.common.lib.route.integration.validation" -}}
  {{- $integration := .integration -}}
  {{- $key := .key -}}

  {{- if $integration.auth -}}
    {{- if $integration.auth.type -}}
      {{- $validAuthTypes := (list "authentik" "authelia") -}}
      {{- if not (mustHas $integration.auth.type $validAuthTypes) -}}
        {{- fail (printf "Route - Expected [integrations.%s.auth.type] to be one of [%s], but got [%s]" $key (join ", " $validAuthTypes) $integration.auth.type) -}}
      {{- end -}}
      {{- if not $integration.auth.internalHost -}}
        {{- fail (printf "Route - Expected [integrations.%s.auth.internalHost] to be set" $key) -}}
      {{- end -}}
      {{- if and $integration.auth.responseHeaders (not (kindIs "slice" $integration.auth.responseHeaders)) -}}
        {{- fail (printf "Route - Expected [integrations.%s.auth.responseHeaders] to be a [slice], but got [%s]" $key (kindOf $integration.auth.responseHeaders)) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if and $integration.ipWhitelist (not (kindIs "slice" $integration.ipWhitelist)) -}}
    {{- fail (printf "Route - Expected [integrations.%s.ipWhitelist] to be a [slice], but got [%s]" $key (kindOf $integration.ipWhitelist)) -}}
  {{- end -}}

  {{- if $integration.redirectRegex -}}
    {{- if not (kindIs "slice" $integration.redirectRegex) -}}
      {{- fail (printf "Route - Expected [integrations.%s.redirectRegex] to be a [slice], but got [%s]" $key (kindOf $integration.redirectRegex)) -}}
    {{- end -}}
    {{- range $integration.redirectRegex -}}
      {{- if or (not .regex) (not .replacement) -}}
        {{- fail (printf "Route - Expected [regex] and [replacement] in [integrations.%s.redirectRegex]" $key) -}}
      {{- end -}}
      {{/* Both providers match the whole path, so a regex for a whole URL would never match */}}
      {{- if not (hasPrefix "/" (.regex | trimPrefix "^")) -}}
        {{- fail (printf "Route - Expected [regex] in [integrations.%s.redirectRegex] to match the path and start with [/] or [^/], but got [%s]" $key .regex) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/* Response headers the auth provider passes on to the app. Same defaults as an ingress */}}
{{- define "tc.v1.common.lib.route.integration.authHeaders" -}}
  {{- $auth := .auth -}}
  {{- $headers := list "Remote-User" "Remote-Groups" "Remote-Email" "Remote-Name" -}}
  {{- if eq $auth.type "authentik" -}}
    {{- $headers = list "X-authentik-username" "X-authentik-groups" "X-authentik-entitlements" "X-authentik-email" "X-authentik-name" "X-authentik-uid" -}}
  {{- end -}}
  {{- dict "headers" ($auth.responseHeaders | default $headers) | toYaml -}}
{{- end -}}
