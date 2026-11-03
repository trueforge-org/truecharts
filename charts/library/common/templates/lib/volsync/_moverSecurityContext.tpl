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

  {{- if and $rootCtx.Values.securityContext.container $rootCtx.Values.securityContext.container.seccompProfile -}}
    {{- $_ := set $sec "seccompProfile" (mustDeepCopy $rootCtx.Values.securityContext.container.seccompProfile) -}}
  {{- else -}}
    {{- $_ := set $sec "seccompProfile" (dict "type" "RuntimeDefault") -}}
  {{- end -}}

  {{- with $target.moverSecurityContext -}}
    {{- $sec = mustMergeOverwrite $sec . -}}
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
