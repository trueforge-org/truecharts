{{/* Envoy Gateway Policy Class */}}
{{/* Call this template:
{{ include "tc.v1.common.class.envoy.policy" (dict "rootCtx" $ "objectData" $objectData) }}

rootCtx: The root context of the chart.
objectData:
  name: The name of the policy.
  kind: The kind of the policy.
  labels: The labels of the policy.
  targetKind: The kind of the route it targets.
  spec: The spec of the policy, without the target.
*/}}
{{- define "tc.v1.common.class.envoy.policy" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}

  {{- $api := printf "gateway.envoyproxy.io/v1alpha1/%s" $objectData.kind -}}
  {{- if not ($rootCtx.Capabilities.APIVersions.Has $api) -}}
    {{- fail (printf "Route - [integrations.envoy] needs API [%s], which was not found. Install Envoy Gateway. When rendering without access to a cluster, pass it with [--api-versions]" $api) -}}
  {{- end -}}

  {{- $spec := mustDeepCopy $objectData.spec -}}
  {{- $_ := set $spec "targetRefs" (list (dict "group" "gateway.networking.k8s.io" "kind" $objectData.targetKind "name" $objectData.name)) }}
---
apiVersion: gateway.envoyproxy.io/v1alpha1
kind: {{ $objectData.kind }}
metadata:
  name: {{ $objectData.name }}
  namespace: {{ include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "Envoy Policy") }}
  {{- $labels := (mustMerge ($objectData.labels | default dict) (include "tc.v1.common.lib.metadata.allLabels" $rootCtx | fromYaml)) -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "labels" $labels) | trim) }}
  labels:
    {{- . | nindent 4 }}
  {{- end -}}
  {{- with (include "tc.v1.common.lib.metadata.render" (dict "rootCtx" $rootCtx "annotations" (include "tc.v1.common.lib.metadata.allAnnotations" $rootCtx | fromYaml)) | trim) }}
  annotations:
    {{- . | nindent 4 }}
  {{- end }}
spec:
  {{- toYaml $spec | nindent 2 }}
{{- end -}}
