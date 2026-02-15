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
    
    {{/* Define which top-level keys contain resource collections that need prefixing */}}
    {{- $resourceKeys := list "workload" "service" "configmap" "secret" "persistence" "volumeClaimTemplates" "podDisruptionBudget" "hpa" "vpa" "ingress" "route" "gateway" "gatewayClass" "certificate" "certificateIssuer" "serviceAccount" "rbac" "prometheusRule" "serviceMonitor" "podMonitor" "networkPolicy" "storageClass" -}}
    
    {{- range $depName, $dependencyValues := .Values.dependencies -}}
      {{ $enabled := (include "tc.v1.common.lib.util.enabled" (dict
                      "rootCtx" $ "objectData" $dependencyValues
                      "name" $depName "caller" "dependency"
                      "key" "dependencies")) }}
      {{- if eq $enabled "true" -}}
        {{- $dependencyValues := omit $dependencyValues "global" "securityContext" "podOptions" "enabled" "depconfig" -}}
        
        {{/* Process each resource type in the dependency */}}
        {{- range $resourceType, $resources := $dependencyValues -}}
          {{- if and (has $resourceType $resourceKeys) (kindIs "map" $resources) -}}
            {{/* This is a resource collection that needs prefixing */}}
            {{- range $resourceName, $resourceConfig := $resources -}}
              {{- if kindIs "map" $resourceConfig -}}
                {{- $newName := printf "%s-%s" $depName $resourceName -}}
                
                {{/* Ensure enabled is set if not explicitly defined */}}
                {{- if not (hasKey $resourceConfig "enabled") -}}
                  {{- $_ := set $resourceConfig "enabled" true -}}
                {{- end -}}
                
                {{/* Handle targetSelector prefixing */}}
                {{- if $resourceConfig.targetSelector -}}
                  {{- if kindIs "string" $resourceConfig.targetSelector -}}
                    {{- $_ := set $resourceConfig "targetSelector" (printf "%s-%s" $depName $resourceConfig.targetSelector) -}}
                  {{- else if kindIs "slice" $resourceConfig.targetSelector -}}
                    {{- $newList := list -}}
                    {{- range $resourceConfig.targetSelector -}}
                      {{- $newList = append $newList (printf "%s-%s" $depName .) -}}
                    {{- end -}}
                    {{- $_ := set $resourceConfig "targetSelector" $newList -}}
                  {{- else if kindIs "map" $resourceConfig.targetSelector -}}
                    {{- $newDict := dict -}}
                    {{- range $key, $value := $resourceConfig.targetSelector -}}
                      {{- $newKey := printf "%s-%s" $depName $key -}}
                      {{- $_ := set $newDict $newKey $value -}}
                    {{- end -}}
                    {{- $_ := set $resourceConfig "targetSelector" $newDict -}}
                  {{- end -}}
                {{- end -}}
                
                {{/* Handle objectName prefixing for persistence volumes */}}
                {{- if and (eq $resourceType "persistence") $resourceConfig.objectName -}}
                  {{- if kindIs "string" $resourceConfig.objectName -}}
                    {{- $_ := set $resourceConfig "objectName" (printf "%s-%s" $depName $resourceConfig.objectName) -}}
                  {{- end -}}
                {{- end -}}
                
                {{/* Handle nested targetSelectors in ports (for services) */}}
                {{- if and (eq $resourceType "service") $resourceConfig.ports -}}
                  {{- range $portName, $portConfig := $resourceConfig.ports -}}
                    {{- if and (kindIs "map" $portConfig) $portConfig.targetSelector -}}
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
                {{- end -}}
                
                {{/* Merge into values with prefixed name */}}
                {{- if not (hasKey $mergedValues $resourceType) -}}
                  {{- $_ := set $mergedValues $resourceType dict -}}
                {{- end -}}
                {{- $_ := set (get $mergedValues $resourceType) $newName $resourceConfig -}}
              {{- end -}}
            {{- end -}}
          {{- else if eq $resourceType "image" -}}
            {{/* Special handling for image - it's not a collection */}}
            {{- $imageName := printf "%sImage" $depName -}}
            {{- $_ := set $mergedValues $imageName $resources -}}
          {{- end -}}
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
