{{/* Define the secrets */}}
{{- define "wg.env.configmap" -}}
enabled: true
data:
  SEPARATOR: ";"
  IPTABLES_BACKEND: nft
  KILLSWITCH: {{ .Values.wg.killswitch | quote }}
  {{- if .Values.wg.killswitch }}
    {{- $excludedIP4Networks := prepend .Values.wg.excludedIP4networks .Values.chartContext.podCIDR }}
    {{- $excludedIP4net := (join ";" $excludedIP4Networks) }}
  KILLSWITCH_EXCLUDEDNETWORKS_IPV4: {{ $excludedIP4net | quote }}
    {{- $excludedIP6net := (join ";" .Values.wg.excludedIP6networks) }}
  KILLSWITCH_EXCLUDEDNETWORKS_IPV6: {{ $excludedIP6net | quote }}
  {{- end }}
{{- end -}}
