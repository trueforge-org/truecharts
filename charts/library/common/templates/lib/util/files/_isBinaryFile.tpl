{{/* Detect if a file is binary */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.util.files.isBinaryFile" (dict "rootCtx" $ "filePath" $filePath) }}

rootCtx: The root context of the chart.
filePath: The path to the file.

Returns: "true" or "false"
*/}}

{{- define "tc.v1.common.lib.util.files.isBinaryFile" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $filePath := .filePath -}}
  {{- $looksBinary := false -}}
  
  {{/* Check common binary file extensions */}}
  {{- $binaryExtensions := list
      "png" "jpg" "jpeg" "gif" "bmp" "tiff" "ico" "svg"
      "mp4" "mp3" "wav" "flac" "avi" "mov" "mkv"
      "pdf" "doc" "docx" "xls" "xlsx" "ppt" "pptx"
      "zip" "tar" "gz" "bz2" "7z"
  -}}
  {{- $extension := lower (trimPrefix "." (base (ext $filePath))) -}}
  {{- if has $extension $binaryExtensions -}}
    {{- $looksBinary = true -}}
  {{- end -}}

  {{/* If not obviously binary by extension, check content */}}
  {{- if not $looksBinary -}}
    {{- $fileContent := ($rootCtx.Files.Get $filePath) -}}

    {{/* Check for null bytes and control characters */}}
    {{- $nul := printf "%c" 0 -}}
    {{- $hasNull := contains $nul $fileContent -}}
    {{- $hasCtl := regexMatch "[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]" $fileContent -}}
    {{- $cannotStringify := empty (toYaml $fileContent) -}}
    {{- $looksBinary = or $hasNull $hasCtl $cannotStringify -}}
  {{- end -}}

  {{- $looksBinary -}}
{{- end -}}
