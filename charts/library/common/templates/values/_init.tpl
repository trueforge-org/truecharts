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
            {{/* Update targetSelector if present */}}
            {{- if $svcConfig.targetSelector -}}
              {{- if kindIs "string" $svcConfig.targetSelector -}}
                {{- $_ := set $svcConfig "targetSelector" (printf "%s-%s" $depName $svcConfig.targetSelector) -}}
              {{- else if kindIs "slice" $svcConfig.targetSelector -}}
                {{- $newList := list -}}
                {{- range $svcConfig.targetSelector -}}
                  {{- $newList = append $newList (printf "%s-%s" $depName .) -}}
                {{- end -}}
                {{- $_ := set $svcConfig "targetSelector" $newList -}}
              {{- else if kindIs "map" $svcConfig.targetSelector -}}
                {{- $newDict := dict -}}
                {{- range $key, $value := $svcConfig.targetSelector -}}
                  {{- $newKey := printf "%s-%s" $depName $key -}}
                  {{- $_ := set $newDict $newKey $value -}}
                {{- end -}}
                {{- $_ := set $svcConfig "targetSelector" $newDict -}}
              {{- end -}}
            {{- end -}}
            {{/* Update targetSelector in ports if present */}}
            {{- range $portName, $portConfig := $svcConfig.ports -}}
              {{- if $portConfig.targetSelector -}}
                {{- if kindIs "string" $portConfig.targetSelector -}}
                  {{- $_ := set $portConfig "targetSelector" (printf "%s-%s" $depName $portConfig.targetSelector) -}}
                {{- else if kindIs "slice" $portConfig.targetSelector -}}
                  {{- $newList := list -}}
                  {{- range $portConfig.targetSelector -}}
                    {{- $newList = append $newList (printf "%s-%s" $depName .) -}}
                  {{- end -}}
                  {{- $_ := set $portConfig "targetSelector" $newList -}}
                {{- else if kindIs "map" $portConfig.targetSelector -}}
                  {{- $newDict := dict -}}
                  {{- range $key, $value := $portConfig.targetSelector -}}
                    {{- $newKey := printf "%s-%s" $depName $key -}}
                    {{- $_ := set $newDict $newKey $value -}}
                  {{- end -}}
                  {{- $_ := set $portConfig "targetSelector" $newDict -}}
                {{- end -}}
              {{- end -}}
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
            {{/* Update targetSelector if present */}}
            {{- if $pvConfig.targetSelector -}}
              {{- if kindIs "string" $pvConfig.targetSelector -}}
                {{- $_ := set $pvConfig "targetSelector" (printf "%s-%s" $depName $pvConfig.targetSelector) -}}
              {{- else if kindIs "slice" $pvConfig.targetSelector -}}
                {{- $newList := list -}}
                {{- range $pvConfig.targetSelector -}}
                  {{- $newList = append $newList (printf "%s-%s" $depName .) -}}
                {{- end -}}
                {{- $_ := set $pvConfig "targetSelector" $newList -}}
              {{- else if kindIs "map" $pvConfig.targetSelector -}}
                {{- $newDict := dict -}}
                {{- range $key, $value := $pvConfig.targetSelector -}}
                  {{- $newKey := printf "%s-%s" $depName $key -}}
                  {{- $_ := set $newDict $newKey $value -}}
                {{- end -}}
                {{- $_ := set $pvConfig "targetSelector" $newDict -}}
              {{- end -}}
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
        
        {{/* Handle resources with targetSelector: podDisruptionBudget, hpa, vpa */}}
        {{- if $dependencyValues.podDisruptionBudget -}}
          {{- range $pdbName, $pdbConfig := $dependencyValues.podDisruptionBudget -}}
            {{- $newName := printf "%s-%s" $depName $pdbName -}}
            {{- if not (hasKey $pdbConfig "enabled") -}}
              {{- $_ := set $pdbConfig "enabled" true -}}
            {{- end -}}
            {{- if $pdbConfig.targetSelector -}}
              {{- if kindIs "string" $pdbConfig.targetSelector -}}
                {{- $_ := set $pdbConfig "targetSelector" (printf "%s-%s" $depName $pdbConfig.targetSelector) -}}
              {{- else if kindIs "slice" $pdbConfig.targetSelector -}}
                {{- $newList := list -}}
                {{- range $pdbConfig.targetSelector -}}
                  {{- $newList = append $newList (printf "%s-%s" $depName .) -}}
                {{- end -}}
                {{- $_ := set $pdbConfig "targetSelector" $newList -}}
              {{- else if kindIs "map" $pdbConfig.targetSelector -}}
                {{- $newDict := dict -}}
                {{- range $key, $value := $pdbConfig.targetSelector -}}
                  {{- $newKey := printf "%s-%s" $depName $key -}}
                  {{- $_ := set $newDict $newKey $value -}}
                {{- end -}}
                {{- $_ := set $pdbConfig "targetSelector" $newDict -}}
              {{- end -}}
            {{- end -}}
            {{- if not $mergedValues.podDisruptionBudget -}}
              {{- $_ := set $mergedValues "podDisruptionBudget" dict -}}
            {{- end -}}
            {{- $_ := set $mergedValues.podDisruptionBudget $newName $pdbConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $dependencyValues.hpa -}}
          {{- range $hpaName, $hpaConfig := $dependencyValues.hpa -}}
            {{- $newName := printf "%s-%s" $depName $hpaName -}}
            {{- if not (hasKey $hpaConfig "enabled") -}}
              {{- $_ := set $hpaConfig "enabled" true -}}
            {{- end -}}
            {{- if $hpaConfig.targetSelector -}}
              {{- if kindIs "string" $hpaConfig.targetSelector -}}
                {{- $_ := set $hpaConfig "targetSelector" (printf "%s-%s" $depName $hpaConfig.targetSelector) -}}
              {{- else if kindIs "slice" $hpaConfig.targetSelector -}}
                {{- $newList := list -}}
                {{- range $hpaConfig.targetSelector -}}
                  {{- $newList = append $newList (printf "%s-%s" $depName .) -}}
                {{- end -}}
                {{- $_ := set $hpaConfig "targetSelector" $newList -}}
              {{- else if kindIs "map" $hpaConfig.targetSelector -}}
                {{- $newDict := dict -}}
                {{- range $key, $value := $hpaConfig.targetSelector -}}
                  {{- $newKey := printf "%s-%s" $depName $key -}}
                  {{- $_ := set $newDict $newKey $value -}}
                {{- end -}}
                {{- $_ := set $hpaConfig "targetSelector" $newDict -}}
              {{- end -}}
            {{- end -}}
            {{- if not $mergedValues.hpa -}}
              {{- $_ := set $mergedValues "hpa" dict -}}
            {{- end -}}
            {{- $_ := set $mergedValues.hpa $newName $hpaConfig -}}
          {{- end -}}
        {{- end -}}
        
        {{- if $dependencyValues.vpa -}}
          {{- range $vpaName, $vpaConfig := $dependencyValues.vpa -}}
            {{- $newName := printf "%s-%s" $depName $vpaName -}}
            {{- if not (hasKey $vpaConfig "enabled") -}}
              {{- $_ := set $vpaConfig "enabled" true -}}
            {{- end -}}
            {{- if $vpaConfig.targetSelector -}}
              {{- if kindIs "string" $vpaConfig.targetSelector -}}
                {{- $_ := set $vpaConfig "targetSelector" (printf "%s-%s" $depName $vpaConfig.targetSelector) -}}
              {{- else if kindIs "slice" $vpaConfig.targetSelector -}}
                {{- $newList := list -}}
                {{- range $vpaConfig.targetSelector -}}
                  {{- $newList = append $newList (printf "%s-%s" $depName .) -}}
                {{- end -}}
                {{- $_ := set $vpaConfig "targetSelector" $newList -}}
              {{- else if kindIs "map" $vpaConfig.targetSelector -}}
                {{- $newDict := dict -}}
                {{- range $key, $value := $vpaConfig.targetSelector -}}
                  {{- $newKey := printf "%s-%s" $depName $key -}}
                  {{- $_ := set $newDict $newKey $value -}}
                {{- end -}}
                {{- $_ := set $vpaConfig "targetSelector" $newDict -}}
              {{- end -}}
            {{- end -}}
            {{- if not $mergedValues.vpa -}}
              {{- $_ := set $mergedValues "vpa" dict -}}
            {{- end -}}
            {{- $_ := set $mergedValues.vpa $newName $vpaConfig -}}
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
