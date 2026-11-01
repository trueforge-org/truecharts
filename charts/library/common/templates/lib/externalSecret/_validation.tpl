{{/* ExternalSecret Validation */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.externalSecret.validation" (dict "rootCtx" $ "objectData" $objectData "name" $name) -}}
rootCtx: The root context of the chart.
objectData:
  secretStoreRef: The SecretStore or ClusterSecretStore the data is fetched from.
  target: The Kubernetes Secret that External Secrets Operator creates.
  data: Individual keys to fetch from the provider.
  dataFrom: Bulk fetch definitions.
name: The short name of the external secret.
*/}}

{{- define "tc.v1.common.lib.externalSecret.validation" -}}
  {{- $objectData := .objectData -}}
  {{- $name := .name -}}

  {{- if not (kindIs "map" $objectData.secretStoreRef) -}}
    {{- fail (printf "ExternalSecret - Expected [externalSecret.%s.secretStoreRef] to be a dictionary, but got [%s]" $name (kindOf $objectData.secretStoreRef)) -}}
  {{- end -}}

  {{- if not $objectData.secretStoreRef.name -}}
    {{- fail (printf "ExternalSecret - Expected non-empty [externalSecret.%s.secretStoreRef.name]" $name) -}}
  {{- end -}}

  {{- $storeKind := $objectData.secretStoreRef.kind | default "SecretStore" -}}
  {{- if not (mustHas $storeKind (list "SecretStore" "ClusterSecretStore")) -}}
    {{- fail (printf "ExternalSecret - Expected [externalSecret.%s.secretStoreRef.kind] to be one of [SecretStore, ClusterSecretStore], but got [%s]" $name $storeKind) -}}
  {{- end -}}

  {{- if and (hasKey $objectData "target") (not (kindIs "map" $objectData.target)) -}}
    {{- fail (printf "ExternalSecret - Expected [externalSecret.%s.target] to be a dictionary, but got [%s]" $name (kindOf $objectData.target)) -}}
  {{- end -}}

  {{- $target := $objectData.target | default dict -}}
  {{- $creationPolicy := $target.creationPolicy | default "Owner" -}}
  {{- if not (mustHas $creationPolicy (list "Owner" "Orphan" "Merge" "None")) -}}
    {{- fail (printf "ExternalSecret - Expected [externalSecret.%s.target.creationPolicy] to be one of [Owner, Orphan, Merge, None], but got [%s]" $name $creationPolicy) -}}
  {{- end -}}

  {{- with $target.deletionPolicy -}}
    {{- if not (mustHas . (list "Delete" "Merge" "Retain")) -}}
      {{- fail (printf "ExternalSecret - Expected [externalSecret.%s.target.deletionPolicy] to be one of [Delete, Merge, Retain], but got [%s]" $name .) -}}
    {{- end -}}
  {{- end -}}

  {{- with $objectData.refreshPolicy -}}
    {{- if not (mustHas . (list "CreatedOnce" "Periodic" "OnChange")) -}}
      {{- fail (printf "ExternalSecret - Expected [externalSecret.%s.refreshPolicy] to be one of [CreatedOnce, Periodic, OnChange], but got [%s]" $name .) -}}
    {{- end -}}
  {{- end -}}

  {{- if and (not $objectData.data) (not $objectData.dataFrom) -}}
    {{- fail (printf "ExternalSecret - Expected at least one of [data, dataFrom] in [externalSecret.%s] to be non-empty" $name) -}}
  {{- end -}}

  {{- range $key := (list "data" "dataFrom") -}}
    {{- $items := get $objectData $key -}}
    {{- if and $items (not (kindIs "slice" $items)) -}}
      {{- fail (printf "ExternalSecret - Expected [externalSecret.%s.%s] to be a list, but got [%s]" $name $key (kindOf $items)) -}}
    {{- end -}}
  {{- end -}}

  {{- range $objectData.data -}}
    {{- if not (kindIs "map" .) -}}
      {{- fail (printf "ExternalSecret - Expected entries of [externalSecret.%s.data] to be a dictionary, but got [%s]" $name (kindOf .)) -}}
    {{- end -}}
    {{- if not .secretKey -}}
      {{- fail (printf "ExternalSecret - Expected non-empty [secretKey] on all entries of [externalSecret.%s.data]" $name) -}}
    {{- end -}}
    {{- if not (and (kindIs "map" .remoteRef) .remoteRef.key) -}}
      {{- fail (printf "ExternalSecret - Expected non-empty [remoteRef.key] on entry [%s] of [externalSecret.%s.data]" .secretKey $name) -}}
    {{- end -}}
  {{- end -}}

{{- end -}}
