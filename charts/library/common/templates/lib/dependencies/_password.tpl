{{/* Fails when a password of an enabled dependency is not set */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.requirePassword" (dict "rootCtx" $ "dep" $dep "depName" "mariadb" "key" "rootPassword") }}
rootCtx: The root context of the chart.
dep: The values of the dependency (must be enabled).
depName: The name of the dependency.
key: The key in [depconfig] holding the password (default: password).

The password is never generated and has no default, it has to be set explicitly.
The value is rendered with tpl and written back to [depconfig], so every consumer uses the same value.
The value is never printed.
*/}}
{{- define "tc.v1.common.lib.dependencies.requirePassword" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $dep := .dep -}}
  {{- $depName := .depName -}}
  {{- $key := .key | default "password" -}}

  {{- $value := "" -}}
  {{- if kindIs "map" $dep.depconfig -}}
    {{- with (get $dep.depconfig $key) -}}
      {{- $value = tpl (toString .) $rootCtx -}}
    {{- end -}}
  {{- end -}}

  {{- if not $value -}}
    {{- fail (printf "%s - Expected [dependencies.%s.depconfig.%s] to be set" (title $depName) $depName $key) -}}
  {{- end -}}
  {{- $_ := set $dep.depconfig $key $value -}}
{{- end -}}
