{{/*
This template loads dependencies defined under .Values.dependencies
and merges them into the main chart context as complete values.yaml structures.
This replaces helm-dependencies.
*/}}
{{- define "tc.v1.common.dependencies.loader" -}}
  {{- if .Values.dependencies -}}
    {{- range $depName, $depConfig := .Values.dependencies -}}
      {{- if and $depConfig (not (kindIs "invalid" $depConfig.enabled)) $depConfig.enabled -}}
        {{/* Merge all top-level keys from dependency into main values with prefixed names */}}
        {{/* This allows the dependency to be a complete chart values.yaml */}}
        
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
        
        {{- if $depConfig.volumeClaimTemplates -}}
          {{- range $vctName, $vctConfig := $depConfig.volumeClaimTemplates -}}
            {{- $newName := printf "%s-%s" $depName $vctName -}}
            {{- if not $.Values.volumeClaimTemplates -}}
              {{- $_ := set $.Values "volumeClaimTemplates" dict -}}
            {{- end -}}
            {{- $_ := set $.Values.volumeClaimTemplates $newName $vctConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $depConfig.image -}}
          {{- $imageName := printf "%sImage" $depName -}}
          {{- $_ := set $.Values $imageName $depConfig.image -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
