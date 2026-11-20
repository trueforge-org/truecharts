{{/* Collect files from a folder structure */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.util.files.collectFromFolder" (dict
    "rootCtx" $
    "basePath" $basePath
    "overrides" $overrides
) }}

rootCtx: The root context of the chart.
basePath: The base path to search for folders.
overrides: The configMapsOverrides from values.

Returns: A dictionary where keys are folder names and values contain:
  - text: dict of filename -> content for text files
  - binary: dict of filename -> base64 content for binary files
  - annotations: annotations to apply to the ConfigMap
  - labels: labels to apply to the ConfigMap
  - forceRename: optional forced name for the ConfigMap
*/}}

{{- define "tc.v1.common.lib.util.files.collectFromFolder" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $basePath := trimSuffix "/" .basePath -}}
  {{- $overrides := .overrides | default dict -}}

  {{- $result := dict -}}

  {{/* Step 1: Glob once and group the files by their folder */}}
  {{- $filesByFolder := dict -}}
  {{- range $path, $_ := ($rootCtx.Files.Glob (printf "%s/**" $basePath)) -}}
    {{- $folderPath := dir $path -}}
    {{- $paths := get $filesByFolder $folderPath | default list -}}
    {{- $_ := set $filesByFolder $folderPath (append $paths $path) -}}
  {{- end -}}
  {{- $folders := keys $filesByFolder | sortAlpha -}}

  {{/* Step 2: Process each folder */}}
  {{- range $folder := $folders -}}
    {{- $folderRelativeToBasePath := trimPrefix $basePath $folder | trimPrefix "/" -}}
    {{- $sanitizedFolderRelativeToBasePath := regexReplaceAll "\\W+" (clean $folderRelativeToBasePath) "-" -}}
    {{- if eq $sanitizedFolderRelativeToBasePath "-" -}}
     {{- $sanitizedFolderRelativeToBasePath = regexReplaceAll "\\W+" (base $folder) "-" -}}
     {{- if eq $sanitizedFolderRelativeToBasePath "-" -}}
       {{- $sanitizedFolderRelativeToBasePath = "configmap" -}}
     {{- end -}}
    {{- end -}}

    {{- if hasKey $result $sanitizedFolderRelativeToBasePath -}}
      {{- fail (printf "ConfigMap From Folder - Folder [%s] results in the ConfigMap name [%s], which is already used by another folder. Rename one of the folders" $folder $sanitizedFolderRelativeToBasePath) -}}
    {{- end -}}

    {{- $textData := dict -}}
    {{- $binaryData := dict -}}
    {{- $dataSize := 0 -}}

    {{/* Extract folder-level overrides */}}
    {{- $annotations := dig $sanitizedFolderRelativeToBasePath "annotations" dict $overrides -}}
    {{- $labels := dig $sanitizedFolderRelativeToBasePath "labels" dict $overrides -}}
    {{- $forceRename := dig $sanitizedFolderRelativeToBasePath "forceRename" nil $overrides -}}

    {{/* Step 3: Process each file in the folder */}}
    {{- range $file_name := (get $filesByFolder $folder) -}}
      {{- $file := base $file_name -}}
      {{- $fileOverride := dig $sanitizedFolderRelativeToBasePath "fileAttributeOverrides" $file nil $overrides -}}
      {{/* Every file is read once, the content is passed on to the binary detection */}}
      {{- $fileContent := ($rootCtx.Files.Get $file_name) -}}

      {{/* Skip excluded files */}}
      {{- if not $fileOverride.exclude -}}
        {{/* Determine binary status: explicit override wins; else auto-detect if enabled */}}
        {{- $explicitBinarySet := and (ne $fileOverride nil) (hasKey $fileOverride "binary") -}}
        {{- $isBinary := false -}}
        {{- if $explicitBinarySet -}}
          {{- $isBinary = $fileOverride.binary -}}
        {{- else -}}
          {{- $isBinary = eq (include "tc.v1.common.lib.util.files.isBinaryFile" (dict "rootCtx" $rootCtx "filePath" $file_name "fileContent" $fileContent)) "true" -}}
        {{- end -}}

        {{/* Process file based on type */}}
        {{- if $isBinary -}}
          {{/* Binary file: base64 encode */}}
          {{- $fileContent = $fileContent | b64enc -}}
          {{- $binaryData = merge $binaryData (dict $file $fileContent) -}}
          {{- $dataSize = add $dataSize (len $fileContent) -}}

        {{- else if and (ne $fileOverride nil) $fileOverride.escaped -}}
          {{/* Escaped file: escape template delimiters */}}
          {{- $fileContent = $fileContent | replace "{{" "{{ `{{` }}" -}}
          {{- $textData = merge $textData (dict $file $fileContent) -}}
          {{- $dataSize = add $dataSize (len $fileContent) -}}

        {{- else -}}
          {{/* Regular text file */}}
          {{- $textData = merge $textData (dict $file $fileContent) -}}
          {{- $dataSize = add $dataSize (len $fileContent) -}}
        {{- end -}}
      {{- end -}}
    {{- end -}}

    {{/* A ConfigMap can hold 1 MiB of data at most */}}
    {{- if gt $dataSize 1048576 -}}
      {{- fail (printf "ConfigMap From Folder - The data of the ConfigMap for folder [%s] is [%d] bytes, which exceeds the maximum of 1048576 bytes" $folder $dataSize) -}}
    {{- end -}}

    {{/* Step 4: Store folder result */}}
    {{- $folderData := dict
      "text" $textData
      "binary" $binaryData
      "annotations" $annotations
      "labels" $labels
      "forceRename" $forceRename
    -}}
    {{- $_ := set $result $sanitizedFolderRelativeToBasePath $folderData -}}
  {{- end -}}

  {{- $result | toYaml -}}
{{- end -}}
