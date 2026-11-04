{{/* ExternalSecret Class */}}
{{/* Call this template:
{{ include "tc.v1.common.class.externalSecret" (dict "rootCtx" $ "objectData" $objectData) }}

rootCtx: The root context of the chart.
objectData:
  name: The name of the external secret.
  labels: The labels of the external secret.
  annotations: The annotations of the external secret.
  namespace: The namespace of the external secret. (Optional)
  refreshInterval: How often the data is synced from the provider. (Optional)
  refreshPolicy: When the data is synced from the provider. (Optional)
  secretStoreRef: The SecretStore or ClusterSecretStore the data is fetched from.
  target: The Kubernetes Secret that External Secrets Operator creates. (Optional)
  data: Individual keys to fetch from the provider. (Optional)
  dataFrom: Bulk fetch definitions. (Optional)
*/}}

{{- define "tc.v1.common.class.externalSecret" -}}

  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $secretStoreRef := $objectData.secretStoreRef -}}
  {{- $target := $objectData.target | default dict -}}
---
apiVersion: {{ include "tc.v1.common.capabilities.externalsecret.apiVersion" $rootCtx }}
kind: ExternalSecret
metadata:
  name: {{ $objectData.name }}
  namespace: {{ include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "ExternalSecret") }}
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
  {{- with $objectData.refreshInterval }}
  refreshInterval: {{ tpl (toString .) $rootCtx }}
  {{- end }}
  {{- with $objectData.refreshPolicy }}
  refreshPolicy: {{ . }}
  {{- end }}
  secretStoreRef:
    name: {{ tpl (toString $secretStoreRef.name) $rootCtx }}
    kind: {{ $secretStoreRef.kind | default "SecretStore" }}
  target:
    {{- /* Default to the name of the ExternalSecret, so the created Secret is predictable */}}
    name: {{ tpl (toString ($target.name | default $objectData.name)) $rootCtx }}
    creationPolicy: {{ $target.creationPolicy | default "Owner" }}
    {{- with $target.deletionPolicy }}
    deletionPolicy: {{ . }}
    {{- end }}
    {{- if hasKey $target "immutable" }}
    immutable: {{ $target.immutable }}
    {{- end }}
    {{- /* Not passed through tpl, External Secrets Operator evaluates its own Go templates in here */}}
    {{- with $target.template }}
    template:
      {{- toYaml . | nindent 6 }}
    {{- end }}
  {{- with $objectData.data }}
  data:
    {{- tpl (toYaml .) $rootCtx | nindent 4 }}
  {{- end }}
  {{- /* Not passed through tpl, rewrite transforms contain External Secrets Operator Go templates */}}
  {{- with $objectData.dataFrom }}
  dataFrom:
    {{- toYaml . | nindent 4 }}
  {{- end }}
{{- end -}}
