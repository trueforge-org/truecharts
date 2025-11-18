{{- define "wyoming-piper.args" -}}
{{- $piper := .Values.wyoming_piper -}}
args:
  - --voice
  {{- with $piper.custom_voice }}
  - {{ . | quote }}
  {{- else }}
  - {{ $piper.voice | quote }}
  {{- end }}
  - --speaker
  - {{ $piper.speaker | quote }}
  - --length-scale
  - {{ $piper.length_scale | quote }}
  - --noise-scale
  - {{ $piper.noise_scale | quote }}
  - --noise-w
  - {{ $piper.noise_w | quote }}
{{- end -}}
