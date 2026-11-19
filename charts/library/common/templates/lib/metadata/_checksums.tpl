{{/* Checksums of the rendered configmaps and secrets */}}
{{/* The checksums are calculated over the data AFTER tpl is applied, so a change in any
other .Values section that a configmap/secret references changes the checksum too.
Labels and annotations are not part of the checksum, so metadata-only changes do not
restart pods. The result is cached on the root context, as every workload asks for it.
Call this template:
{{ include "tc.v1.common.lib.checksum.configmaps" $ }}
{{ include "tc.v1.common.lib.checksum.secrets" $ }}
*/}}
{{- define "tc.v1.common.lib.checksum.configmaps" -}}
  {{- $rootCtx := . -}}
  {{- if not (hasKey $rootCtx "tcChecksumCache") -}}
    {{- $_ := set $rootCtx "tcChecksumCache" dict -}}
  {{- end -}}
  {{- if not (hasKey $rootCtx.tcChecksumCache "configmap") -}}
    {{- $rendered := dict -}}
    {{- range $name, $configmap := $rootCtx.Values.configmap -}}
      {{- if not (kindIs "map" $configmap) -}}{{- continue -}}{{- end -}}
      {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                      "rootCtx" $rootCtx "objectData" $configmap
                      "name" $name "caller" "ConfigMap"
                      "key" "configmap")) -}}
      {{- if eq $enabled "true" -}}
        {{- $_ := set $rendered $name (dict
              "data" (include "tc.v1.common.lib.configmap.renderData" (dict "rootCtx" $rootCtx "objectData" $configmap))
              "binaryData" ($configmap.binaryData | default dict)) -}}
      {{- end -}}
    {{- end -}}
    {{- $_ := set $rootCtx.tcChecksumCache "configmap" (toJson $rendered | sha256sum) -}}
  {{- end -}}
  {{- get $rootCtx.tcChecksumCache "configmap" -}}
{{- end -}}

{{- define "tc.v1.common.lib.checksum.secrets" -}}
  {{- $rootCtx := . -}}
  {{- if not (hasKey $rootCtx "tcChecksumCache") -}}
    {{- $_ := set $rootCtx "tcChecksumCache" dict -}}
  {{- end -}}
  {{- if not (hasKey $rootCtx.tcChecksumCache "secret") -}}
    {{- $rendered := dict -}}
    {{- range $name, $secret := $rootCtx.Values.secret -}}
      {{- if not (kindIs "map" $secret) -}}{{- continue -}}{{- end -}}
      {{- $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                      "rootCtx" $rootCtx "objectData" $secret
                      "name" $name "caller" "Secret"
                      "key" "secret")) -}}
      {{- if eq $enabled "true" -}}
        {{- $_ := set $rendered $name (dict
              "type" ($secret.type | default "")
              "data" (include "tc.v1.common.lib.secret.renderData" (dict "rootCtx" $rootCtx "objectData" $secret))) -}}
      {{- end -}}
    {{- end -}}
    {{- $_ := set $rootCtx.tcChecksumCache "secret" (toJson $rendered | sha256sum) -}}
  {{- end -}}
  {{- get $rootCtx.tcChecksumCache "secret" -}}
{{- end -}}
