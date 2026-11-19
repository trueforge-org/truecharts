{{- define "k8sgateway.container" -}}
enabled: true
imageSelector: k8sgatewayImage
securityContext:
  runAsUser: 0
  runAsGroup: 0
  readOnlyRootFilesystem: true
args: ["-conf", "/etc/coredns/Corefile"]
probes:
  readiness:
    enabled: true
    path: /ready
    port: 8181
  liveness:
    enabled: true
    path: /health
    port: 8080
  startup:
    enabled: true
    path: /ready
    port: 8181
{{- end -}}
