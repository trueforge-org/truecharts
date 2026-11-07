{{/* Renders the listeners of a Gateway or ListenerSet */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.gateway.listeners" (dict "rootCtx" $ "listeners" $listeners "caller" "Gateway" "name" $fullName) | nindent 2 }}
rootCtx: The root context of the chart.
listeners: The list of listeners to render.
caller: The kind of the object the listeners belong to, used in error messages.
name: The name of the object the listeners belong to, used in error messages.
*/}}
{{- define "tc.v1.common.lib.gateway.listeners" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $caller := .caller -}}
  {{- $name := .name -}}
  {{- range $listener := .listeners }}
- name: {{ required (printf "listener name is required for %s %v" $caller $name) $listener.name }}
  {{- if $listener.hostname }}
  hostname: {{ tpl $listener.hostname $rootCtx | quote }}
  {{- end }}
  port: {{ required (printf "listener port is required for %s %v listener %v" $caller $name $listener.name) $listener.port }}
  protocol: {{ required (printf "listener protocol is required for %s %v listener %v" $caller $name $listener.name) $listener.protocol }}
  {{- with $listener.tls }}
  tls:
    {{- with .mode }}
    mode: {{ . }}
    {{- end }}
    {{- with .certificateRefs }}
    certificateRefs:
    {{- range . }}
    - group: {{ default "" .group | quote }}
      kind: {{ default "Secret" .kind }}
      name: {{ required (printf "certificateRef name is required for %s %v listener %v" $caller $name $listener.name) .name }}
      {{- with .namespace }}
      namespace: {{ . }}
      {{- end }}
    {{- end }}
    {{- end }}
    {{- with .options }}
    options:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- end }}
  {{- with $listener.allowedRoutes }}
  allowedRoutes:
    {{- with .namespaces }}
    namespaces:
      from: {{ default "Same" .from }}
      {{- with .selector }}
      selector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
    {{- end }}
    {{- with .kinds }}
    kinds:
    {{- range . }}
    - group: {{ default "gateway.networking.k8s.io" .group }}
      kind: {{ required (printf "allowedRoute kind is required for %s %v listener %v" $caller $name $listener.name) .kind }}
    {{- end }}
    {{- end }}
  {{- end }}
  {{- end }}
{{- end -}}
