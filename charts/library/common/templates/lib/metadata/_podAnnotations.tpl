{{/* Annotations that are added to podSpec */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.metadata.podAnnotations" $ }}
*/}}
{{- define "tc.v1.common.lib.metadata.podAnnotations" -}}
checksum/persistence: {{ toJson $.Values.persistence | sha256sum }}
checksum/services: {{ toJson $.Values.service | sha256sum }}
checksum/configmaps: {{ include "tc.v1.common.lib.checksum.configmaps" $ }}
checksum/secrets: {{ include "tc.v1.common.lib.checksum.secrets" $ }}
checksum/dependencies: {{ toJson $.Values.dependencies | sha256sum }}
{{- end -}}
