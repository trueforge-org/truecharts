{{/* Merge chart values and the common chart defaults */}}
{{/* The ".common" is the name of the library */}}
{{/* Call this template:
{{ include "tc.v1.common.values.init" $ }}
*/}}

{{- define "tc.v1.common.values.init" -}}
  {{- if .Values.common -}}
    {{- $commonValues := mustDeepCopy .Values.common -}}
    {{- $chartValues := mustDeepCopy (omit .Values "common") -}}
    {{- $mergedValues := mustMergeOverwrite $commonValues $chartValues -}}
    {{- range $depName, $dependencyValues := .Values.dependencies -}}
      {{ $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                      "rootCtx" $ "objectData" $dependencyValues
                      "name" $depName "caller" "dependency"
                      "key" "dependencies")) }}
      {{- if eq $enabled "true" -}}
        {{- $dependencyValues := omit $dependencyValues "global" "securityContext" "podOptions" "enabled" -}}
        
        {{/* Merge dependency resources with prefixed names */}}
        {{- if $dependencyValues.workload -}}
          {{- range $wlName, $wlConfig := $dependencyValues.workload -}}
            {{- $newName := printf "%s-%s" $depName $wlName -}}
            {{- if not (hasKey $wlConfig "enabled") -}}
              {{- $_ := set $wlConfig "enabled" true -}}
            {{- end -}}
            {{- $_ := set $mergedValues.workload $newName $wlConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $dependencyValues.service -}}
          {{- range $svcName, $svcConfig := $dependencyValues.service -}}
            {{- $newName := printf "%s-%s" $depName $svcName -}}
            {{- if not (hasKey $svcConfig "enabled") -}}
              {{- $_ := set $svcConfig "enabled" true -}}
            {{- end -}}
            {{- $_ := set $mergedValues.service $newName $svcConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $dependencyValues.configmap -}}
          {{- range $cmName, $cmConfig := $dependencyValues.configmap -}}
            {{- $newName := printf "%s-%s" $depName $cmName -}}
            {{- if not (hasKey $cmConfig "enabled") -}}
              {{- $_ := set $cmConfig "enabled" true -}}
            {{- end -}}
            {{- $_ := set $mergedValues.configmap $newName $cmConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $dependencyValues.secret -}}
          {{- range $secName, $secConfig := $dependencyValues.secret -}}
            {{- $newName := printf "%s-%s" $depName $secName -}}
            {{- if not (hasKey $secConfig "enabled") -}}
              {{- $_ := set $secConfig "enabled" true -}}
            {{- end -}}
            {{- $_ := set $mergedValues.secret $newName $secConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $dependencyValues.persistence -}}
          {{- range $pvName, $pvConfig := $dependencyValues.persistence -}}
            {{- $newName := printf "%s-%s" $depName $pvName -}}
            {{- if not (hasKey $pvConfig "enabled") -}}
              {{- $_ := set $pvConfig "enabled" true -}}
            {{- end -}}
            {{- $_ := set $mergedValues.persistence $newName $pvConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $dependencyValues.volumeClaimTemplates -}}
          {{- range $vctName, $vctConfig := $dependencyValues.volumeClaimTemplates -}}
            {{- $newName := printf "%s-%s" $depName $vctName -}}
            {{- if not $mergedValues.volumeClaimTemplates -}}
              {{- $_ := set $mergedValues "volumeClaimTemplates" dict -}}
            {{- end -}}
            {{- if not (hasKey $vctConfig "enabled") -}}
              {{- $_ := set $vctConfig "enabled" true -}}
            {{- end -}}
            {{- $_ := set $mergedValues.volumeClaimTemplates $newName $vctConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $dependencyValues.image -}}
          {{- $imageName := printf "%sImage" $depName -}}
          {{- $_ := set $mergedValues $imageName $dependencyValues.image -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}
    
    {{- range $mergedValues.addons -}}
      {{- if .enabled -}}
        {{- $mergedValues = mustMergeOverwrite $mergedValues . -}}
      {{- end -}}
    {{- end -}}
    
    {{- $_ := set . "Values" (mustDeepCopy $mergedValues) -}}
  {{- end -}}
{{- end -}}
