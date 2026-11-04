{{/* ListenerSet Class */}}
{{/* Call this template:
{{ include "tc.v1.common.class.listenerSet" (dict "rootCtx" $ "objectData" $objectData) }}

rootCtx: The root context of the chart.
objectData:
  name: The name of the listener set.
  labels: The labels of the listener set.
  annotations: The annotations of the listener set.
  namespace: The namespace of the listener set. (Optional)
  targetSelector: The name of a gateway in this chart to attach to. (Optional)
  parentRef: The Gateway to attach to, when targetSelector is not used. (Optional)
  listeners: The listeners that are added to the Gateway.
*/}}

{{- define "tc.v1.common.class.listenerSet" -}}

  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $namespace := include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "ListenerSet") -}}

  {{/* A targetSelector replaces the parentRef with the gateway defined in this chart */}}
  {{- $parentRef := $objectData.parentRef | default dict -}}
  {{- $parentName := $parentRef.name -}}
  {{- $parentNamespace := $parentRef.namespace | default $namespace -}}
  {{- with $objectData.targetSelector -}}
    {{- $target := get $rootCtx.Values.gateway . -}}
    {{- $parentName = include "tc.v1.common.lib.util.gateway.getFullName" (dict "rootCtx" $rootCtx "name" .) -}}
    {{- $parentNamespace = include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $target "caller" "ListenerSet") -}}
  {{- end -}}
---
apiVersion: {{ include "tc.v1.common.capabilities.listenerset.apiVersion" $rootCtx }}
kind: {{ include "tc.v1.common.capabilities.listenerset.kind" $rootCtx }}
metadata:
  name: {{ $objectData.name }}
  namespace: {{ $namespace }}
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
    group: {{ default "gateway.networking.k8s.io" $parentRef.group }}
    kind: {{ default "Gateway" $parentRef.kind }}
    name: {{ tpl (toString $parentName) $rootCtx }}
    namespace: {{ tpl (toString $parentNamespace) $rootCtx }}
  listeners:
    {{- include "tc.v1.common.lib.gateway.listeners" (dict "rootCtx" $rootCtx "listeners" $objectData.listeners "caller" "ListenerSet" "name" $objectData.name) | trim | nindent 2 }}
{{- end -}}
