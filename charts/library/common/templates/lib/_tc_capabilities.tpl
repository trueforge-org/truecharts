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

{{/* Return the appropriate apiVersion for CiliumNetworkPolicy and CiliumClusterwideNetworkPolicy */}}
{{- define "tc.v1.common.capabilities.cilium.apiVersion" -}}
  {{- print "cilium.io/v2" -}}
{{- end -}}

{{/* Return the appropriate apiVersion for ExternalSecret */}}
{{- define "tc.v1.common.capabilities.externalsecret.apiVersion" -}}
  {{- print "external-secrets.io/v1" -}}
{{- end -}}

{{/* Return the apiVersion for a Gateway API ListenerSet. ListenerSet is part of the standard channel since Gateway API v1.5.
Clusters that only serve the experimental XListenerSet get that instead. Falls back to the standard channel when rendering without a cluster */}}
{{- define "tc.v1.common.capabilities.listenerset.apiVersion" -}}
  {{- $result := "gateway.networking.k8s.io/v1" -}}
  {{- if and (not (.Capabilities.APIVersions.Has "gateway.networking.k8s.io/v1/ListenerSet")) (.Capabilities.APIVersions.Has "gateway.networking.x-k8s.io/v1alpha1/XListenerSet") -}}
    {{- $result = "gateway.networking.x-k8s.io/v1alpha1" -}}
  {{- end -}}
  {{- $result -}}
{{- end -}}

{{/* Return the kind for a Gateway API ListenerSet, matching the apiVersion that is used */}}
{{- define "tc.v1.common.capabilities.listenerset.kind" -}}
  {{- if eq (include "tc.v1.common.capabilities.listenerset.apiVersion" .) "gateway.networking.x-k8s.io/v1alpha1" -}}
    {{- print "XListenerSet" -}}
  {{- else -}}
    {{- print "ListenerSet" -}}
  {{- end -}}
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
