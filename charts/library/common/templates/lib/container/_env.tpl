{{/* Returns Env */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.container.env" (dict "rootCtx" $ "objectData" $objectData) }}
rootCtx: The root context of the chart.
objectData: The object data to be used to render the container.
*/}}
{{- define "tc.v1.common.lib.container.env" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $key := .key -}}
  {{- $name := (.name | toString) -}}
  {{- $caller := .caller -}}
  {{- $dropEmpty := include "tc.v1.common.lib.util.dropEmptyKeys" (dict "rootCtx" $rootCtx "objectData" $objectData) -}}

  {{- range $k, $v := $objectData.env -}}
    {{- $skip := false -}}
    {{- if and $dropEmpty (not (kindIs "map" $v)) -}}
      {{- if include "tc.v1.common.lib.util.isEmptyValue" (dict "rootCtx" $rootCtx "value" $v) -}}
        {{- $skip = true -}}
      {{- end -}}
    {{- else if and $dropEmpty (kindIs "map" $v) -}}
      {{/* Trace single key refs to objects defined in values */}}
      {{- range $ref := (list "configMapKeyRef" "secretKeyRef") -}}
        {{- if hasKey $v $ref -}}
          {{- $obj := get $v $ref -}}
          {{- if and (kindIs "map" $obj) $obj.name $obj.key -}}
            {{- $expand := include "tc.v1.common.lib.util.expandName" (dict "rootCtx" $rootCtx "objectData" $obj "name" $k "caller" $caller "key" "env") -}}
            {{- if eq $expand "true" -}}
              {{- $item := ($ref | trimSuffix "KeyRef" | lower) -}}
              {{- $refData := get (get $rootCtx.Values $item | default dict) (tpl $obj.name $rootCtx) -}}
              {{- if and $refData (kindIs "map" $refData.data) (hasKey $refData.data $obj.key) -}}
                {{- if include "tc.v1.common.lib.util.isEmptyValue" (dict "rootCtx" $rootCtx "value" (get $refData.data $obj.key)) -}}
                  {{- $skip = true -}}
                {{- end -}}
              {{- end -}}
            {{- end -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

    {{- if not $skip -}}
    {{- include "tc.v1.common.helper.container.envDupeCheck" (dict "rootCtx" $rootCtx "objectData" $objectData "source" (printf "%s.%s.env" $key $name) "key" $k "caller" $caller) }}
- name: {{ $k | quote }}
    {{- if not (kindIs "map" $v) -}}
      {{- $value := "" -}}
      {{- if not (kindIs "invalid" $v) -}} {{/* Only tpl non-empty values */}}
        {{- $value = $v -}}
        {{- if kindIs "string" $v -}}
          {{- $value = tpl $v $rootCtx -}}
        {{- end -}}
      {{- end }}
  value: {{ include "tc.v1.common.helper.makeIntOrNoop" $value | quote }}
    {{- else if kindIs "map" $v }}
  valueFrom:
      {{- $refs := (list "configMapKeyRef" "secretKeyRef" "fieldRef") -}}
      {{- if or (ne (len ($v | keys)) 1) (not (mustHas ($v | keys | first) $refs)) -}}
        {{- fail (printf "%s - Expected [env] in [%s.%s] with a ref to have one of [%s], but got [%s]" $caller $key $name (join ", " $refs) (join ", " ($v | keys | sortAlpha))) -}}
      {{- end -}}

      {{- $refName := "" -}}


      {{- range $ref := (list "configMapKeyRef" "secretKeyRef") -}}
        {{- if hasKey $v $ref }}
    {{ $ref }}:
          {{- $obj := get $v $ref -}}
          {{- if not $obj.name -}}
            {{- fail (printf "%s - Expected non-empty [%s.%s.env.%s.name]" $caller $key $name $ref) -}}
          {{- end -}}

          {{- if not $obj.key -}}
            {{- fail (printf "%s - Expected non-empty [%s.%s.env.%s.key]" $caller $key $name $ref) -}}
          {{- end }}
      key: {{ $obj.key | quote }}

          {{- $refName = tpl $obj.name $rootCtx -}}

          {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
                          "rootCtx" $rootCtx "objectData" $obj
                          "name" $k "caller" $caller
                          "key" "env")) -}}

          {{- if eq $expandName "true" -}}
            {{- $item := ($ref | trimSuffix "KeyRef" | lower) -}}

            {{- $data := (get $rootCtx.Values $item) -}}
            {{- $data = (get $data $refName) -}}

            {{- if not $data -}}
              {{- fail (printf "%s - Expected in [%s.%s.env] the referenced %s [%s] to be defined" $caller $key $name ($item | camelcase | title) $refName) -}}
            {{- end -}}

            {{- $found := false -}}
            {{- range $k, $v := $data.data -}}
              {{- if eq $k $obj.key -}}
                {{- $found = true -}}
              {{- end -}}
            {{- end -}}

            {{- if not $found -}}
              {{- fail (printf "%s - Expected in [%s.%s.env] the referenced key [%s] in %s [%s] to be defined" $caller $key $name $obj.key ($item | camelcase | title) $refName) -}}
            {{- end -}}

            {{- $refName = (printf "%s-%s" (include "tc.v1.common.lib.chart.names.fullname" $rootCtx) $refName) -}}
          {{- end }}
      name: {{ $refName | quote }}
        {{- end -}}
      {{- end -}}

      {{- if hasKey $v "fieldRef" }}
    fieldRef:
        {{- if not $v.fieldRef.fieldPath -}}
          {{- fail (printf "%s - Expected non-empty [%s.%s.env.fieldRef.fieldPath]" $caller $key $name) -}}
        {{- end }}
      fieldPath: {{ $v.fieldRef.fieldPath | quote }}
        {{- if $v.fieldRef.apiVersion }}
      apiVersion: {{ $v.fieldRef.apiVersion | quote }}
        {{- end -}}
      {{- end -}}
    {{- end -}}
    {{- end -}}

  {{- end -}}
{{- end -}}
