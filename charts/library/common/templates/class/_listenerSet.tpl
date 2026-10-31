{{/* ListenerSet Class */}}
{{/* Call this template:
{{ include "tc.v1.common.class.listenerset" (dict "rootCtx" $ "objectData" $objectData) }}

rootCtx: The root context of the chart.
objectData:
  name: The name of the ListenerSet.
  labels: The labels of the ListenerSet.
  annotations: The annotations of the ListenerSet.
  gatewayRef: The name and namespace of the gateway to attach to.
  port: The port of the listeners.
  listeners: The hostname and secret of each listener.
*/}}
{{- define "tc.v1.common.class.listenerset" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData }}
---
apiVersion: gateway.networking.k8s.io/v1
kind: ListenerSet
metadata:
  name: {{ $objectData.name }}
  namespace: {{ include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "ListenerSet") }}
  {{- $labels := (mustMerge ($objectData.labels | default dict) (include "tc.v1.common.lib.metadata.allLabels" $rootCtx | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "labels" $labels) | trim) }}
  labels:
    {{- . | nindent 4 }}
  {{- end -}}
  {{- $annotations := (mustMerge ($objectData.annotations | default dict) (include "tc.v1.common.lib.metadata.allAnnotations" $rootCtx | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "annotations" $annotations) | trim) }}
  annotations:
    {{- . | nindent 4 }}
  {{- end }}
spec:
  parentRef:
    group: gateway.networking.k8s.io
    kind: Gateway
    name: {{ $objectData.gatewayRef.name }}
    namespace: {{ $objectData.gatewayRef.namespace }}
  listeners:
    {{- range $idx, $listener := $objectData.listeners }}
    - name: {{ printf "https-%d" ($idx | int) }}
      hostname: {{ $listener.host | quote }}
      port: {{ $objectData.port }}
      protocol: HTTPS
      tls:
        mode: Terminate
        certificateRefs:
          - group: ""
            kind: Secret
            name: {{ $listener.secretName }}
      allowedRoutes:
        namespaces:
          from: Same
    {{- end -}}
{{- end -}}
