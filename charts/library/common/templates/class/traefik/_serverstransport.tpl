{{/* Traefik ServersTransport Class */}}
{{/* Call this template:
{{ include "tc.v1.common.class.traefik.serverstransport" (dict "rootCtx" $ "objectData" $objectData) }}

rootCtx: The root context of the chart.
objectData:
  name: The name of the serverstransport.
  labels: The labels of the serverstransport.
  annotations: The annotations of the serverstransport.
  data: The data of the serverstransport. Supported keys: serverName, insecureSkipVerify, rootCAs
  namespace: The namespace of the serverstransport. (Optional)
*/}}

{{- define "tc.v1.common.class.traefik.serverstransport" -}}

  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData }}
---
apiVersion: traefik.io/v1alpha1
kind: ServersTransport
metadata:
  name: {{ $objectData.name }}
  namespace: {{ include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "ServersTransport") }}
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
  {{- if $objectData.serverName }}
  serverName: {{ $objectData.serverName }}
  {{- end }}
  insecureSkipVerify: {{ $objectData.insecureSkipVerify | default false }}
  {{- if $objectData.rootCAs }}
    {{- with (include "tc.v1.common.class.traefik.rootCARefs" (dict "rootCtx" $rootCtx "objectData" $objectData) | trim) }}
  rootCAs:
    {{- . | nindent 4 }}
    {{- end }}
  {{- end }}
{{- end -}}
