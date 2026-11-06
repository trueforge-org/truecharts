{{- define "tc.v1.common.lib.volsync.moversecuritycontext" -}}
  {{- $creds := .creds -}}

  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $volsyncData := .volsyncData -}}
  {{- $target := get $volsyncData .target -}}

  {{- $sec := dict
      "runAsUser" $rootCtx.Values.securityContext.container.runAsUser
      "runAsGroup" $rootCtx.Values.securityContext.container.runAsGroup
      "fsGroup" $rootCtx.Values.securityContext.pod.fsGroup
  -}}

  {{- if and (hasKey $rootCtx.Values.securityContext.container "runAsNonRoot") (not (kindIs "invalid" (get $rootCtx.Values.securityContext.container "runAsNonRoot"))) -}}
    {{- $_ := set $sec "runAsNonRoot" $rootCtx.Values.securityContext.container.runAsNonRoot -}}
  {{- end -}}

  {{/* Translate the common seccompProfile format ("profile") to the Kubernetes one ("localhostProfile") */}}
  {{- $seccomp := dict "type" "RuntimeDefault" -}}
  {{- with $rootCtx.Values.securityContext.container.seccompProfile -}}
    {{- with .type -}}
      {{- $_ := set $seccomp "type" . -}}
    {{- end -}}
    {{- if and (eq $seccomp.type "Localhost") .profile -}}
      {{- $_ := set $seccomp "localhostProfile" .profile -}}
    {{- end -}}
  {{- end -}}
  {{- $_ := set $sec "seccompProfile" $seccomp -}}

  {{/* Top-level keys of the mover context replace the defaults, so nested objects (e.g. seccompProfile) are not merged */}}
  {{- with $target.moverSecurityContext -}}
    {{- range $key, $value := (mustDeepCopy .) -}}
      {{- $_ := set $sec $key $value -}}
    {{- end -}}
  {{- end -}}

  {{- if or (not (hasKey $sec "runAsNonRoot")) (kindIs "invalid" (get $sec "runAsNonRoot")) -}}
    {{- if eq (int $sec.runAsUser) 0 -}}
      {{- $_ := set $sec "runAsNonRoot" false -}}
    {{- else -}}
      {{- $_ := set $sec "runAsNonRoot" true -}}
    {{- end -}}
  {{- end -}}

  {{- if or (not (hasKey $sec "seccompProfile")) (kindIs "invalid" (get $sec "seccompProfile")) -}}
    {{- $_ := set $sec "seccompProfile" (dict "type" "RuntimeDefault") -}}
  {{- end }}

moverSecurityContext:
  {{- toYaml $sec | nindent 2 }}
{{- end -}}
