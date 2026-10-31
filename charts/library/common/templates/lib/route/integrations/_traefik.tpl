{{/* Returns the Middlewares to create, and the filters that attach them and the others to the route */}}
{{- define "tc.v1.common.lib.route.integration.traefik" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $fullName := .fullName -}}
  {{- $routeKind := .routeKind -}}
  {{- $name := .name -}}

  {{- $traefik := $objectData.integrations.traefik -}}
  {{- $chartName := include "tc.v1.common.lib.chart.names.fullname" $rootCtx -}}
  {{- $namespace := include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "Route") -}}

  {{- include "tc.v1.common.lib.route.integration.validation" (dict "integration" $traefik "key" "traefik") -}}

  {{/* The listener decides these on a route, so they would do nothing */}}
  {{- range $key := (list "entrypoints" "forceTLS") -}}
    {{- if hasKey $traefik $key -}}
      {{- fail (printf "Route - [route.%s.integrations.traefik.%s] is not supported, a route uses the entrypoint of its listener" $name $key) -}}
    {{- end -}}
  {{- end -}}

  {{- $middlewares := list -}}

  {{- with $traefik.ipWhitelist -}}
    {{- $data := dict "sourceRange" . -}}
    {{- with $traefik.ipStrategy -}}
      {{- $_ := set $data "ipStrategy" . -}}
    {{- end -}}
    {{- $middlewares = mustAppend $middlewares (dict "name" (printf "%s-ip-whitelist" $fullName) "type" "ip-allow-list" "data" $data) -}}
  {{- end -}}

  {{- if and $traefik.auth $traefik.auth.type -}}
    {{- $headers := (include "tc.v1.common.lib.route.integration.authHeaders" (dict "auth" $traefik.auth) | fromYaml).headers -}}
    {{- $path := "api/authz/forward-auth" -}}
    {{- if eq $traefik.auth.type "authentik" -}}
      {{- $path = "outpost.goauthentik.io/auth/traefik" -}}
    {{- end -}}
    {{- $middlewares = mustAppend $middlewares (dict "name" (printf "%s-auth" $fullName) "type" "forward-auth" "data" (dict
          "address" (printf "http://%s/%s" (tpl $traefik.auth.internalHost $rootCtx) $path)
          "trustForwardHeader" true
          "authResponseHeaders" $headers)) -}}
  {{- end -}}

  {{- if and $traefik.themePark $traefik.themePark.enabled -}}
    {{- if ne $routeKind "HTTPRoute" -}}
      {{- fail (printf "Route - [route.%s.integrations.traefik.themePark] is only supported by kind [HTTPRoute]" $name) -}}
    {{- end -}}
    {{- $middlewares = mustAppend $middlewares (dict "name" (printf "%s-themepark" $fullName) "type" "plugin-theme-park" "data" (omit $traefik.themePark "enabled")) -}}
  {{- end -}}

  {{/* A redirect gets its own rule, as a filter on the other rules only sees what those match */}}
  {{- $redirects := list -}}
  {{- range $idx, $redirect := $traefik.redirectRegex -}}
    {{- if ne $routeKind "HTTPRoute" -}}
      {{- fail (printf "Route - [route.%s.integrations.traefik.redirectRegex] is only supported by kind [HTTPRoute]" $name) -}}
    {{- end -}}
    {{/* The rule matches the path, but the middleware sees the whole URL. No new groups, so ${1} stays the same */}}
    {{- $path := $redirect.regex | trimPrefix "^" | trimSuffix "$" -}}
    {{- $redirectName := printf "%s-redirect-%d" $fullName ($idx | int) -}}
    {{- $data := dict "regex" (printf "^https?://[^/]+%s(?:\\?.*)?$" $path) "replacement" $redirect.replacement -}}
    {{- if hasKey $redirect "permanent" -}}
      {{- $_ := set $data "permanent" $redirect.permanent -}}
    {{- end -}}
    {{- $middlewares = mustAppend $middlewares (dict "name" $redirectName "type" "redirect-regex" "data" $data) -}}
    {{- $redirects = mustAppend $redirects (dict "name" $redirectName "path" (printf "^%s$" $path)) -}}
  {{- end -}}

  {{- $names := list -}}
  {{- range $middlewares -}}
    {{- if not (eq .type "redirect-regex") -}}
      {{- $names = mustAppend $names .name -}}
    {{- end -}}
  {{- end -}}

  {{/* Add the common, chart and user middlewares, same as an ingress */}}
  {{- $defined := dict -}}
  {{- with $rootCtx.Values.ingressMiddlewares -}}
    {{- $defined = .traefik | default dict -}}
  {{- end -}}
  {{- $others := concat ($rootCtx.Values.global.traefik.commonMiddlewares | default list) ($traefik.chartMiddlewares | default list) ($traefik.middlewares | default list) -}}
  {{- range $mid := $others -}}
    {{/* The filter of a route can only reference a Middleware in its own namespace */}}
    {{- $midNamespace := include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $mid "caller" "Traefik Integration") -}}
    {{- if ne $midNamespace $namespace -}}
      {{- fail (printf "Route - Traefik Middleware [%s] is in namespace [%s], but a route can only use one in its own namespace [%s]" $mid.name $midNamespace $namespace) -}}
    {{- end -}}

    {{- $midName := $mid.name -}}
    {{- $expandName := (include "tc.v1.common.lib.util.expandName" (dict
              "rootCtx" $rootCtx "objectData" $mid
              "name" $mid.name "caller" "Traefik Integration"
              "key" "middlewares")) -}}
    {{- if eq $expandName "true" -}}
      {{- if not (hasKey $defined $mid.name) -}}
        {{- fail (printf "Route - Traefik Middleware [%s] is not defined under [ingressMiddlewares.traefik]" $mid.name) -}}
      {{- end -}}
      {{- $midName = printf "%s-%s" $chartName $mid.name -}}
    {{- end -}}
    {{- $names = mustAppend $names $midName -}}
  {{- end -}}

  {{- if not (deepEqual (mustUniq $names) $names) -}}
    {{- fail (printf "Route - Combined traefik middlewares contain duplicates [%s]" (join ", " $names)) -}}
  {{- end -}}

  {{- $filters := list -}}
  {{- range $names -}}
    {{- $filters = mustAppend $filters (dict "type" "ExtensionRef" "extensionRef" (dict "group" "traefik.io" "kind" "Middleware" "name" .)) -}}
  {{- end -}}

  {{/* The other filters also run on these, same as a policy of Envoy Gateway applies to all rules */}}
  {{- $extraRules := list -}}
  {{- range $redirects -}}
    {{- $extraRules = mustAppend $extraRules (dict
          "matches" (list (dict "path" (dict "type" "RegularExpression" "value" .path)))
          "filters" (mustAppend $filters (dict "type" "ExtensionRef" "extensionRef" (dict "group" "traefik.io" "kind" "Middleware" "name" .name)))) -}}
  {{- end -}}

  {{- dict "middlewares" $middlewares "filters" $filters "extraRules" $extraRules | toYaml -}}
{{- end -}}
