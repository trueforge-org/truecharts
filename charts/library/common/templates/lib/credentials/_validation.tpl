{{- define "tc.v1.common.lib.credentials.validation" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $caller := .caller -}}
  {{- $credName := .credName -}}

  {{- $credentials := get $rootCtx.Values.credentials $credName -}}

  {{- if not $credentials -}}
    {{- fail (printf "%s - Expected credentials [%s] to be defined in [credentials] which currently contains [%s] keys" $caller $credName (keys $rootCtx.Values.credentials | join ", ")) -}}
  {{- end -}}

  {{- $validCredTypes := list "s3" -}}
  {{- if $credentials.type -}} {{/* Remove this if check if more types are supported in future */}}
    {{- if not (mustHas $credentials.type $validCredTypes) -}}
      {{- fail (printf "%s - Expected [type] in [credentials.%s] to be one of [%s], but got [%s]" $caller $credName (join ", " $validCredTypes) $credentials.type) -}}
    {{- end -}}
  {{- end -}}

  {{- $reqFields := list "url" "bucket" "encrKey" "accessKey" "secretKey" -}}
  {{- range $key := $reqFields -}}
    {{- if not (get $credentials $key) -}}
      {{- fail (printf "VolSync - Expected non-empty [%s] in [credentials.%s]" $key $credName) -}}
    {{- end -}}
  {{- end -}}

  {{- $url := get $credentials "url" -}}
  {{- if and (not (hasPrefix "http://" $url)) (not (hasPrefix "https://" $url)) -}}
    {{- fail (printf "%s - Expected [url] in [credentials.%s] to start with [http://] or [https://]. It was observed that sometimes can cause issues if it does not. Got [%s]" $caller $credName $url) -}}
  {{- end -}}

  {{- $customCA := get $credentials "customCA" -}}
  {{- $customCASecretRef := get $credentials "customCASecretRef" -}}

  {{- if and $customCA $customCASecretRef -}}
    {{- fail (printf "%s - Both [customCA] and [customCASecretRef] defined in [credentials.%s]. Choose one" $caller $credName) -}}
  {{- end -}}

  {{- if and $customCA (not (kindIs "string" $customCA )) -}}
    {{- fail (printf "%s - Expected [customCA] in [credentials.%s] to be a string. Got [%s]" $caller $credName (kindOf $customCA)) -}}
  {{- end -}}

  {{- if $customCASecretRef -}}
    {{- if not (kindIs "map" $customCASecretRef) -}}
      {{- fail (printf "%s - Expected [credentials.%s.customCASecretRef] to be a dictionary. Got [%s]" $caller $credName (kindOf $customCASecretRef)) -}}
    {{- end -}}
    {{- if not $customCASecretRef.name -}}
      {{- fail (printf "%s - Expected [name] key in [credentials.%s.customCASecretRef] to exist" $caller $credName) -}}
    {{- else if not (kindIs "string" $customCASecretRef.name) -}}
      {{- fail (printf "%s - Expected [name] in [credentials.%s.customCASecretRef] to be a string. Got [%s]" $caller $credName (kindOf $customCASecretRef.name)) -}}
    {{- end -}}
    {{- if not $customCASecretRef.key -}}
      {{- fail (printf "%s - Expected [key] key in [credentials.%s.customCASecretRef] to exist" $caller $credName) -}}
    {{- else if not (kindIs "string" $customCASecretRef.key) -}}
      {{- fail (printf "%s - Expected [key] in [credentials.%s.customCASecretRef] to be a string. Got [%s]" $caller $credName (kindOf $customCASecretRef.key)) -}}
    {{- end -}}

    {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                    "rootCtx" $rootCtx "objectData" $customCASecretRef
                    "name" $customCASecretRef.name "caller" $caller
                    "key" (printf "credentials.%s.customCASecretRef.name" $credName))) -}}
    {{- if eq $expandName "true" -}}
      {{- $object := (get $rootCtx.Values.secret $customCASecretRef.name) | default dict -}}
      {{- if not $object -}}
        {{- fail (printf "%s - Expected Secret [%s] referenced in [credentials.%s.customCASecretRef.name] to exist" $caller $customCASecretRef.name $credName) -}}
      {{- end -}}
      {{- if not (hasKey $object.data $customCASecretRef.key) -}}
        {{- fail (printf "%s - Expected Secret [%s] referenced in [credentials.%s.customCASecretRef.name] to contain key [%s]" $caller $customCASecretRef.name $credName $customCASecretRef.key) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- $region := get $credentials "region" -}}
  {{- if and $region (not (kindIs "string" $region )) -}}
    {{- fail (printf "%s - Expected [region] in [credentials.%s] to be a string. Got [%s]" $caller $credName (kindOf $region)) -}}
  {{- end -}}

{{- end -}}
