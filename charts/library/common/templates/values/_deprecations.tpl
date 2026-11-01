{{/* Fails on removed and deprecated keys, so they are not silently ignored */}}
{{/* Single place for all deprecation errors. To deprecate another key, add it to one of the lists below. */}}
{{/* Call this template:
{{ include "tc.v1.common.values.deprecations" $ }}
*/}}
{{- define "tc.v1.common.values.deprecations" -}}
  {{- $rootCtx := . -}}
  {{- $values := $rootCtx.Values -}}

  {{/* Top-level keys of dependencies that moved to [dependencies.<name>], and top-level keys that were removed without a replacement. */}}
  {{/* Their [enabled] is taken into account, a disabled one never rendered anything, so it can safely stay in the values. */}}
  {{- $movedDependencies := dict "mariadb" "mariadb" "memcached" "memcached" "mongodb" "mongodb" "redis" "valkey" "valkey" "valkey" -}}
  {{/* Dependencies without settings, like memcached, are not listed here */}}
  {{- $movedSettings := dict "mariadb" "[password], [rootPassword], [mariadbUsername] and [mariadbDatabase]" "mongodb" "[password], [rootPassword], [mongodbUsername] and [mongodbDatabase]" "valkey" "[password]" -}}
  {{- $removedKeys := list "solr" "clickhouse" -}}
  {{- range $key := (concat (keys $movedDependencies | sortAlpha) $removedKeys) -}}
    {{- $value := get $values $key -}}
    {{- if and (kindIs "map" $value) (hasKey $value "enabled") (not (kindIs "invalid" $value.enabled)) -}}
      {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                      "rootCtx" $rootCtx "objectData" $value
                      "name" $key "caller" "Deprecations"
                      "key" "values")) -}}
      {{- if eq $enabled "true" -}}
        {{- if hasKey $movedDependencies $key -}}
          {{- $dep := get $movedDependencies $key -}}
          {{- if hasKey $movedSettings $dep -}}
            {{- fail (printf "Expected no [%s] key, it is replaced by [dependencies.%s]. Move [enabled] to [dependencies.%s], and %s to [dependencies.%s.depconfig]. The connection details are available under [dependencies.%s.depconfig.creds]" $key $dep $dep (get $movedSettings $dep) $dep $dep) -}}
          {{- else -}}
            {{- fail (printf "Expected no [%s] key, it is replaced by [dependencies.%s]. Move [enabled] to [dependencies.%s]" $key $dep $dep) -}}
          {{- end -}}
        {{- else -}}
          {{- fail (printf "Expected no [%s] key, it is no longer supported and has no replacement. Remove [%s], or set [%s.enabled] to false" $key $key $key) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{/* Nothing reads this key, so its volumes would silently not exist and their data would be lost on every restart */}}
  {{- if $values.volumeClaimTemplates -}}
    {{- fail (printf "Expected no [volumeClaimTemplates], as this key is not used, so [%s] would not be persisted. Use [persistence] instead, a new volume on an existing StatefulSet can't use [type: vct]" (join ", " (keys $values.volumeClaimTemplates | sortAlpha))) -}}
  {{- end -}}

  {{/* The vpn add-on was replaced by the tailscale and gluetun add-ons */}}
  {{- if kindIs "map" $values.addons -}}
    {{- if $values.addons.vpn -}}
      {{- fail "Your current Common-Chart version does not support [.Values.addons.vpn] please use [.Values.addons.tailscale] or [.Values.addons.gluetun] instead" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
