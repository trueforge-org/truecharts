{{/*
Template to render VPN addon
It will include / inject the required templates based on the given values.
*/}}
{{- define "tc.v1.common.addon.tailscale" -}}
  {{- $ts := $.Values.addons.tailscale -}}
  {{- if $ts.enabled -}}
    {{- $settings := $ts.settings | default dict -}}
    
    {{/* Merge settings into environment variables */}}
    {{- $env := $ts.container.env | default dict -}}
    {{- if $settings.config -}}
      {{- $_ := set $env "TS_CONFIG" $settings.config -}}
    {{- end -}}
    {{- if $settings.authkey -}}
      {{- $_ := set $env "TS_AUTH_KEY" $settings.authkey -}}
    {{- end -}}
    {{- if hasKey $settings "userspace" -}}
      {{- $_ := set $env "TS_USERSPACE" $settings.userspace -}}
    {{- end -}}
    {{- if hasKey $settings "auth_once" -}}
      {{- $_ := set $env "TS_AUTH_ONCE" $settings.auth_once -}}
    {{- end -}}
    {{- if hasKey $settings "accept_dns" -}}
      {{- $_ := set $env "TS_ACCEPT_DNS" $settings.accept_dns -}}
    {{- end -}}
    {{- if $settings.routes -}}
      {{- $_ := set $env "TS_ROUTES" $settings.routes -}}
    {{- end -}}
    {{- if $settings.dest_ip -}}
      {{- $_ := set $env "TS_DEST_IP" $settings.dest_ip -}}
    {{- end -}}
    {{- if $settings.sock5_server -}}
      {{- $_ := set $env "TS_SOCKS5_SERVER" $settings.sock5_server -}}
    {{- end -}}
    {{- if $settings.extra_args -}}
      {{- $_ := set $env "TS_EXTRA_ARGS" $settings.extra_args -}}
    {{- end -}}
    {{- if $settings.daemon_extra_args -}}
      {{- $_ := set $env "TS_TAILSCALED_EXTRA_ARGS" $settings.daemon_extra_args -}}
    {{- end -}}
    {{- if $settings.outbound_http_proxy_listen -}}
      {{- $_ := set $env "TS_OUTBOUND_HTTP_PROXY_LISTEN" $settings.outbound_http_proxy_listen -}}
    {{- end -}}
    {{- $_ := set $ts.container "env" $env -}}

    {{- $secContext := dict -}}
    {{- $_ := set $secContext "runAsUser" 0 -}}
    {{- $_ := set $secContext "runAsGroup" 0 -}}
    {{- $_ := set $secContext "runAsNonRoot" true -}}
    {{- $_ := set $secContext "readOnlyRootFilesystem" false -}}

    {{- if and $env ($env.TS_USERSPACE) -}}
      {{- $_ := set $secContext "runAsUser" 1000 -}}
      {{- $_ := set $secContext "runAsGroup" 1000 -}}
      {{- $_ := set $secContext "runAsNonRoot" false -}}
      {{- $_ := set $secContext "readOnlyRootFilesystem" true -}}
    {{- end -}}

    {{- $newSecContext := $ts.container.securityContext -}}
    {{- $newSecContext = mustMergeOverwrite $newSecContext $secContext -}}
    {{- $_ := set $ts.container "securityContext" $newSecContext -}}

    {{- $targetSelector := list "main" -}}
    {{- if $ts.targetSelector -}}
      {{- $targetSelector = $ts.targetSelector -}}
    {{- end -}}

    {{/* Append the vpn container to the workloads */}}
    {{- range $targetSelector -}}
      {{/* FIXME: https://github.com/tailscale/tailscale/issues/8188 */}}
      {{- $workload := get $.Values.workload . -}}
      {{- $_ := set $workload.podSpec "automountServiceAccountToken" true -}}
      {{- $_ := set $workload.podSpec.containers "tailscale" $ts.container -}}
    {{- end -}}

    {{- $persistence := $.Values.persistence.tailscalestate | default dict -}}
    {{- $_ := set $persistence "enabled" true -}}
    {{- if not $persistence.type -}}
      {{- $_ := set $persistence "type" "emptyDir" -}}
    {{- end -}}
    {{- if not $persistence.targetSelector -}}
      {{- $_ := set $persistence "targetSelector" dict -}}
    {{- end -}}

    {{- $selectorValue := (dict "tailscale" (dict "mountPath" "/var/lib/tailscale")) -}}
    {{- range $targetSelector -}}
      {{- $_ := set $persistence.targetSelector . $selectorValue -}}
    {{- end -}}

    {{/* Append the empty dir tailscale to the persistence */}}
    {{- $_ := set $.Values.persistence "tailscalestate" $persistence -}}
  {{- end -}}

{{- end -}}
