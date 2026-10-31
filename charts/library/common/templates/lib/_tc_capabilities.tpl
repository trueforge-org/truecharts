{{/* Return the appropriate apiVersion for PodMonitor */}}
{{- define "tc.v1.common.capabilities.podmonitor.apiVersion" -}}
  {{- print "monitoring.coreos.com/v1" -}}
{{- end -}}

{{/* Return the appropriate apiVersion for ServiceMonitor */}}
{{- define "tc.v1.common.capabilities.servicemonitor.apiVersion" -}}
  {{- print "monitoring.coreos.com/v1" -}}
{{- end -}}

{{/* Return the appropriate apiVersion for PrometheusRule */}}
{{- define "tc.v1.common.capabilities.prometheusrule.apiVersion" -}}
  {{- print "monitoring.coreos.com/v1" -}}
{{- end -}}

{{/* Return the appropriate apiVersion for NetworkPolicy*/}}
{{- define "tc.v1.common.capabilities.networkpolicy.apiVersion" -}}
  {{- print "networking.k8s.io/v1" -}}
{{- end -}}

{{/* Return the apiVersion for a Gateway API route. HTTPRoute and GRPCRoute are always v1.
The others graduated to v1 later, so use what the cluster serves. Falls back to v1 when rendering without a cluster */}}
{{- define "tc.v1.common.capabilities.route.apiVersion" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $kind := .kind -}}
  {{- $result := "gateway.networking.k8s.io/v1" -}}
  {{- if not ($rootCtx.Capabilities.APIVersions.Has (printf "%s/%s" $result $kind)) -}}
    {{- range $version := (list "v1alpha3" "v1alpha2") -}}
      {{- $candidate := printf "gateway.networking.k8s.io/%s" $version -}}
      {{- if and (eq $result "gateway.networking.k8s.io/v1") (mustHas $kind (list "TCPRoute" "TLSRoute" "UDPRoute")) ($rootCtx.Capabilities.APIVersions.Has (printf "%s/%s" $candidate $kind)) -}}
        {{- $result = $candidate -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}
