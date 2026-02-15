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

  {{/* Step 1: Discover all top-level folders */}}
  {{- $folders := dict -}}
  {{- $filteredPaths := $rootCtx.Files.Glob (printf "%s/**" $basePath) -}}
  
  {{- range $path, $_ := $filteredPaths -}}
    {{- $_ := set $folders (dir $path) "" -}}
  {{- end -}}
  {{- $folders = keys $folders | uniq | sortAlpha -}}

  {{/* Step 2: Process each folder */}}
  {{- range $folder := $folders -}}
    {{- $folderRelativeToBasePath := replace $basePath "" $folder | trimPrefix "/" -}}
    {{- $sanitizedFolderRelativeToBasePath := regexReplaceAll "\\W+" (clean $folderRelativeToBasePath) "-" -}}
    {{- if eq $sanitizedFolderRelativeToBasePath "-" -}}
     {{- $sanitizedFolderRelativeToBasePath = regexReplaceAll "\\W+" (base $folder) "-" -}}
     {{- if eq $sanitizedFolderRelativeToBasePath "-" -}}
       {{- $sanitizedFolderRelativeToBasePath = "configmap" -}}
     {{- end -}}
    {{- end -}}

    {{- $textData := dict -}}
    {{- $binaryData := dict -}}
    {{- $allFilesContent := $rootCtx.Files.Glob (printf "%s/*" $folder) -}}

    {{/* Extract folder-level overrides */}}
    {{- $annotations := dig $sanitizedFolderRelativeToBasePath "annotations" dict $overrides -}}
    {{- $labels := dig $sanitizedFolderRelativeToBasePath "labels" dict $overrides -}}
    {{- $forceRename := dig $sanitizedFolderRelativeToBasePath "forceRename" nil $overrides -}}

    {{/* Step 3: Process each file in the folder */}}
    {{- range $file_name, $content := $allFilesContent -}}
      {{- $file := base $file_name -}}
      {{- $fileOverride := dig $sanitizedFolderRelativeToBasePath "fileAttributeOverrides" $file nil $overrides -}}
      {{- $fileContent := ($rootCtx.Files.Get $file_name) -}}

      {{/* Skip excluded files */}}
      {{- if not $fileOverride.exclude -}}
        {{/* Determine binary status: explicit override wins; else auto-detect if enabled */}}
        {{- $explicitBinarySet := and (ne $fileOverride nil) (hasKey $fileOverride "binary") -}}
        {{- $isBinary := false -}}
        {{- if $explicitBinarySet -}}
          {{- $isBinary = $fileOverride.binary -}}
        {{- else -}}
          {{- $isBinary = eq (include "tc.v1.common.lib.util.files.isBinaryFile" (dict "rootCtx" $rootCtx "filePath" $file_name)) "true" -}}
        {{- end -}}

        {{/* Process file based on type */}}
        {{- if $isBinary -}}
          {{/* Binary file: base64 encode */}}
          {{- $fileContent = $fileContent | b64enc -}}
          {{- $binaryData = merge $binaryData (dict $file $fileContent) -}}

        {{- else if and (ne $fileOverride nil) $fileOverride.escaped -}}
          {{/* Escaped file: escape template delimiters */}}
          {{- $fileContent = $fileContent | replace "{{" "{{ `{{` }}" -}}
          {{- $textData = merge $textData (dict $file $fileContent) -}}

        {{- else -}}
          {{/* Regular text file */}}
          {{- $textData = merge $textData (dict $file $fileContent) -}}
        {{- end -}}
      {{- end -}}
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
