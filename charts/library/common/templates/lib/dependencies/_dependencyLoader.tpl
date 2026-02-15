{{/*
This template loads dependencies defined under .Values.dependencies
and merges them into the main chart context
*/}}
{{- define "tc.v1.common.dependencies.loader" -}}
  {{- if .Values.dependencies -}}
    {{- range $depName, $depConfig := .Values.dependencies -}}
      {{- if and $depConfig $depConfig.enabled -}}
        {{/* Create a prefixed name to avoid conflicts */}}
        {{- $prefixedName := printf "%s-%s" $.Release.Name $depName -}}
        
        {{/* Merge dependency configuration into appropriate sections */}}
        {{/* This allows dependencies to define their own resources */}}
        {{- if $depConfig.workload -}}
          {{- range $wlName, $wlConfig := $depConfig.workload -}}
            {{- $newName := printf "%s-%s" $depName $wlName -}}
            {{- $_ := set $.Values.workload $newName $wlConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $depConfig.service -}}
          {{- range $svcName, $svcConfig := $depConfig.service -}}
            {{- $newName := printf "%s-%s" $depName $svcName -}}
            {{- $_ := set $.Values.service $newName $svcConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $depConfig.configmap -}}
          {{- range $cmName, $cmConfig := $depConfig.configmap -}}
            {{- $newName := printf "%s-%s" $depName $cmName -}}
            {{- $_ := set $.Values.configmap $newName $cmConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $depConfig.secret -}}
          {{- range $secName, $secConfig := $depConfig.secret -}}
            {{- $newName := printf "%s-%s" $depName $secName -}}
            {{- $_ := set $.Values.secret $newName $secConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $depConfig.persistence -}}
          {{- range $pvName, $pvConfig := $depConfig.persistence -}}
            {{- $newName := printf "%s-%s" $depName $pvName -}}
            {{- $_ := set $.Values.persistence $newName $pvConfig -}}
          {{- end -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
