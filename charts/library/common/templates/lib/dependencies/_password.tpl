{{/* Fails when a password of an enabled dependency is empty */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.requirePassword" (dict "rootCtx" $ "dep" $dep "depName" "mariadb" "key" "rootPassword") }}
rootCtx: The root context of the chart.
dep: The values of the dependency (must be enabled).
depName: The name of the dependency.
key: The key in [depconfig] holding the password (default: password).

The password defaults to a visible placeholder in values, it is never generated. The render fails when it is set empty.
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
