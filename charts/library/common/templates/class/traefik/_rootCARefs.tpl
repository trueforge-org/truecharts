{{/* Returns Env From */}}
{{/* Call this template:
{{ include "tc.v1.common.class.traefik.rootCARefs" (dict "rootCtx" $ "objectData" $objectData) }}
rootCtx: The root context of the chart.
objectData: The object data to be used to render the rootCAs section.
*/}}
{{- define "tc.v1.common.class.traefik.rootCARefs" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- $refs := (list "configMapRef" "secretRef") -}}
  {{- range $rootCAs := $objectData.rootCAs -}}
    {{- if and (not $rootCAs.secretRef) (not $rootCAs.configMapRef) -}}
      {{- fail (printf "Traefik - ServersTransport - Expected [rootCAs] entry to have one of [%s]" (join ", " $refs)) -}}
    {{- end -}}

    {{- if and $rootCAs.secretRef $rootCAs.configMapRef -}}
      {{- fail (printf "Traefik - ServersTransport - Expected [rootCAs] entry to have only one of [%s], but got both" (join ", " $refs)) -}}
    {{- end -}}

    {{- range $ref := $refs -}}
      {{- with (get $rootCAs $ref) -}}
        {{- if not .name -}}
          {{- fail (printf "Traefik - ServersTransport - Expected non-empty [rootCAs.%s.name]" $ref) -}}
        {{- end -}}

        {{- $objectName := tpl .name $rootCtx -}}

        {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                        "rootCtx" $rootCtx "objectData" .
                        "name" $ref "caller" "Traefik - ServersTransport"
                        "key" "rootCAs")) -}}

        {{- if eq $expandName "true" -}}
          {{- $object := dict -}}
          {{- $source := "" -}}
          {{- if eq $ref "configMapRef" -}}
            {{- $object = (get $rootCtx.Values.configmap $objectName) -}}
            {{- $source = "ConfigMap" -}}
          {{- else if eq $ref "secretRef" -}}
            {{- $object = (get $rootCtx.Values.secret $objectName) -}}
            {{- $source = "Secret" -}}
          {{- end -}}

          {{- if not $object -}}
            {{- fail (printf "Traefik - ServersTransport - Expected %s [%s] defined in [rootCAs] to exist" $source $objectName) -}}
          {{- end -}}

          {{/* A (not necessarily exhaustive) list of keys that are understood by Traefik to contain CAs. Taken from:
             * https://github.com/traefik/traefik/blob/6df82676aaf8186215086a1d9e934170fb5db13f/pkg/provider/kubernetes/crd/fixtures/with_servers_transport.yml
             */}}
          {{- $mandatoryKeys := list "ca.crt" "tls.ca" "tls.crt" -}}

          {{- $keyFound := false -}}
          {{- range $k, $v := $object.data -}}
            {{- if has $k $mandatoryKeys -}}
              {{- $keyFound = true -}}
            {{- end -}}
          {{- end -}}

          {{- if not $keyFound -}}
            {{- fail (printf "Traefik - ServersTransport - Expected %s [%s] defined in [rootCAs] to have one of [%s] keys" $source $objectName (join ", " $mandatoryKeys)) }}
          {{- end }}

          {{- $objectName = (printf "%s-%s" (include "tc.v1.common.lib.chart.names.fullname" $rootCtx) $objectName) -}}
        {{- end }}

        {{- if eq $ref "secretRef" }}
- secret: {{ $objectName | quote }}
        {{- else }}
- configMap: {{ $objectName | quote }}
        {{- end }}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
