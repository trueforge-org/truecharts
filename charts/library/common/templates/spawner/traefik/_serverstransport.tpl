{{/* Traefik ServersTransport Spawner */}}
{{/* Call this template:
{{ include "tc.v1.common.spawner.traefik.serverstransport" $ -}}
*/}}

{{- define "tc.v1.common.spawner.traefik.serverstransport" -}}
  {{- $fullname := include "tc.v1.common.lib.chart.names.fullname" $ -}}

  {{/* Go over all services and get their defined ServersTransports */}}
  {{- range $name, $service := .Values.service -}}
    {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                    "rootCtx" $ "objectData" $service
                    "name" $name "caller" "Service"
                    "key" "service")) -}}

    {{/* Skip disabled services or services without traefik integration */}}
    {{- if ne $enabled "true" -}}{{- continue -}}{{- end -}}
    {{- if not $service.integrations -}}
      {{- $_ := set $service "integrations" dict -}}
    {{- end -}}
    {{- if not $service.integrations.traefik -}}
      {{- $_ := set $service.integrations "traefik" dict -}}
    {{- end -}}
    {{- $traefik := $service.integrations.traefik -}}
    {{- $enabledTraefikIntegration := "false" -}}
    {{- if and (hasKey $traefik "enabled") (kindIs "bool" $traefik.enabled) -}}
      {{- $enabledTraefikIntegration = $traefik.enabled | toString -}}
    {{- end -}}
    {{- if ne $enabledTraefikIntegration "true" }}{{- continue -}}{{- end -}}

    {{/* Init object name */}}
    {{- $objectName := $name -}}

    {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                    "rootCtx" $ "objectData" $service
                    "name" $name "caller" "Service"
                    "key" "service")) -}}

    {{- if eq $expandName "true" -}}
      {{/* Expand the name of the service if expandName resolves to true */}}
      {{- $objectName = $fullname -}}
    {{- end -}}

    {{- if and (eq $expandName "true") (not $service.primary) -}}
      {{/* If the service is not primary append its name to fullname */}}
      {{- $objectName = (printf "%s-%s" $fullname $name) -}}
    {{- end -}}

    {{/* Create a copy of the traefik integration dict */}}
    {{- $objectData := (mustDeepCopy $traefik) -}}
    {{- $_ := set $objectData "name" $objectName -}}

    {{/* Perform validations */}}
    {{- include "tc.v1.common.lib.chart.names.validation" (dict "name" $objectName) -}}
    {{- include "tc.v1.common.lib.traefik.serverstransport.validation" (dict "objectData" $objectData) -}}

    {{/* Call class to create the object */}}
    {{- include "tc.v1.common.class.traefik.serverstransport" (dict "rootCtx" $ "objectData" $objectData) -}}

  {{- end -}}
{{- end -}}
