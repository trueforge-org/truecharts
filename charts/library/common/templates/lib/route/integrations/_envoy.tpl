{{/* Returns the specs of the policies to create, and the rules to add to the route.
Envoy Gateway only applies the oldest policy of a kind on a route, so there is one of each kind,
with the settings of the user and of the integration in it.
*/}}
{{- define "tc.v1.common.lib.route.integration.envoy" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- $objectData := .objectData -}}
  {{- $routeKind := .routeKind -}}
  {{- $name := .name -}}

  {{- $envoy := $objectData.integrations.envoy -}}
  {{- $namespace := include "tc.v1.common.lib.metadata.namespace" (dict "rootCtx" $rootCtx "objectData" $objectData "caller" "Route") -}}

  {{- include "tc.v1.common.lib.route.integration.validation" (dict "integration" $envoy "key" "envoy") -}}

  {{- range $key := (list "securityPolicy" "backendTrafficPolicy" "extensionPolicy") -}}
    {{- with (get $envoy $key) -}}
      {{- if not (kindIs "map" .) -}}
        {{- fail (printf "Route - Expected [route.%s.integrations.envoy.%s] to be a [map], but got [%s]" $name $key (kindOf .)) -}}
      {{- end -}}
      {{- if or (hasKey . "targetRef") (hasKey . "targetRefs") (hasKey . "targetSelectors") -}}
        {{- fail (printf "Route - [route.%s.integrations.envoy.%s] always targets the route, do not set a target" $name $key) -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- $securityPolicy := mustDeepCopy ($envoy.securityPolicy | default dict) -}}
  {{- $extensionPolicy := mustDeepCopy ($envoy.extensionPolicy | default dict) -}}
  {{- $backendTrafficPolicy := mustDeepCopy ($envoy.backendTrafficPolicy | default dict) -}}
  {{- $extraRules := list -}}

  {{- with $envoy.ipWhitelist -}}
    {{- if hasKey $securityPolicy "authorization" -}}
      {{- fail (printf "Route - Expected only one of [ipWhitelist, securityPolicy.authorization] in [route.%s.integrations.envoy]" $name) -}}
    {{- end -}}

    {{/* The API only accepts CIDRs, an ingress also accepts a single address */}}
    {{- $cidrs := list -}}
    {{- range $ip := . -}}
      {{- if contains "/" $ip -}}
        {{- $cidrs = mustAppend $cidrs $ip -}}
      {{- else if contains ":" $ip -}}
        {{- $cidrs = mustAppend $cidrs (printf "%s/128" $ip) -}}
      {{- else -}}
        {{- $cidrs = mustAppend $cidrs (printf "%s/32" $ip) -}}
      {{- end -}}
    {{- end -}}
    {{- $_ := set $securityPolicy "authorization" (dict
          "defaultAction" "Deny"
          "rules" (list (dict "name" "ip-whitelist" "action" "Allow" "principal" (dict "clientCIDRs" $cidrs)))) -}}
  {{- end -}}

  {{- if and $envoy.auth $envoy.auth.type -}}
    {{- if hasKey $securityPolicy "extAuth" -}}
      {{- fail (printf "Route - Expected only one of [auth, securityPolicy.extAuth] in [route.%s.integrations.envoy]" $name) -}}
    {{- end -}}

    {{/* The policy references a Service, not a URL */}}
    {{- $host := tpl $envoy.auth.internalHost $rootCtx -}}
    {{- $hostRegex := "^([a-z0-9-]+)(\\.([a-z0-9-]+)(\\.svc(\\.cluster\\.local)?)?)?:([0-9]+)$" -}}
    {{- if not (regexMatch $hostRegex $host) -}}
      {{- fail (printf "Route - Expected [integrations.envoy.auth.internalHost] to be [service:port] or [service.namespace.svc.cluster.local:port], but got [%s]" $host) -}}
    {{- end -}}
    {{- $authNamespace := regexReplaceAll $hostRegex $host "${3}" | default $namespace -}}
    {{- $backendRef := dict
          "name" (regexReplaceAll $hostRegex $host "${1}")
          "namespace" $authNamespace
          "port" (regexReplaceAll $hostRegex $host "${6}" | int) -}}

    {{- $path := "/api/authz/ext-authz/" -}}
    {{- $requestHeaders := list "accept" "sec-fetch-mode" "sec-fetch-dest" "x-requested-with" "cookie" "authorization" "proxy-authorization" "x-forwarded-proto" -}}
    {{- if eq $envoy.auth.type "authentik" -}}
      {{- $path = "/outpost.goauthentik.io/auth/envoy" -}}
      {{- $requestHeaders = list "cookie" "authorization" "x-forwarded-proto" -}}
    {{- end -}}
    {{- $headers := (include "tc.v1.common.lib.route.integration.authHeaders" (dict "auth" $envoy.auth) | fromYaml).headers -}}
    {{- $_ := set $securityPolicy "extAuth" (dict
          "failOpen" false
          "headersToExtAuth" $requestHeaders
          "http" (dict "backendRefs" (list $backendRef) "path" $path "headersToBackend" $headers)) -}}
  {{- end -}}

  {{/* Envoy has no theme park filter, so the stylesheet is added to the response with Lua */}}
  {{- if and $envoy.themePark $envoy.themePark.enabled -}}
    {{- if ne $routeKind "HTTPRoute" -}}
      {{- fail (printf "Route - [route.%s.integrations.envoy.themePark] is only supported by kind [HTTPRoute]" $name) -}}
    {{- end -}}
    {{- $css := tpl ($envoy.themePark.css | default "" | toString) $rootCtx -}}
    {{/* It ends up in Lua and HTML, so only allow a plain URL */}}
    {{- if not (regexMatch "^https?://[^\"'<>\\\\\\s]+$" $css) -}}
      {{- fail (printf "Route - Expected [integrations.envoy.themePark.css] to be a http(s) URL, but got [%s]" $css) -}}
    {{- end -}}
    {{- $lua := include "tc.v1.common.lib.route.integration.envoy.themePark" (dict "css" $css) -}}
    {{- $_ := set $extensionPolicy "lua" (concat ($extensionPolicy.lua | default list) (list (dict "type" "Inline" "inline" $lua))) -}}
  {{- end -}}

  {{/* A rule can only redirect to a fixed target, Gateway API has no capture groups */}}
  {{- range $redirect := $envoy.redirectRegex -}}
    {{- if ne $routeKind "HTTPRoute" -}}
      {{- fail (printf "Route - [route.%s.integrations.envoy.redirectRegex] is only supported by kind [HTTPRoute]" $name) -}}
    {{- end -}}
    {{- if contains "$" $redirect.replacement -}}
      {{- fail (printf "Route - [integrations.envoy.redirectRegex] does not support capture groups in [replacement], but got [%s]. Use a fixed target" $redirect.replacement) -}}
    {{- end -}}
    {{- $target := urlParse $redirect.replacement -}}
    {{- if or $target.query $target.fragment -}}
      {{- fail (printf "Route - [integrations.envoy.redirectRegex] does not support a query or fragment in [replacement], but got [%s]" $redirect.replacement) -}}
    {{- end -}}

    {{- $statusCode := 302 -}}
    {{- if $redirect.permanent -}}
      {{- $statusCode = 301 -}}
    {{- end -}}
    {{- $requestRedirect := dict "statusCode" $statusCode -}}
    {{- with $target.scheme -}}
      {{- $_ := set $requestRedirect "scheme" . -}}
    {{- end -}}
    {{- with $target.host -}}
      {{- $hostParts := splitList ":" . -}}
      {{- $_ := set $requestRedirect "hostname" (first $hostParts) -}}
      {{- if gt (len $hostParts) 1 -}}
        {{- $_ := set $requestRedirect "port" (last $hostParts | int) -}}
      {{- end -}}
    {{- end -}}
    {{- with $target.path -}}
      {{- $_ := set $requestRedirect "path" (dict "type" "ReplaceFullPath" "replaceFullPath" .) -}}
    {{- end -}}
    {{- $extraRules = mustAppend $extraRules (dict
          "matches" (list (dict "path" (dict "type" "RegularExpression" "value" $redirect.regex)))
          "filters" (list (dict "type" "RequestRedirect" "requestRedirect" $requestRedirect))) -}}
  {{- end -}}

  {{- dict "securityPolicy" $securityPolicy "extensionPolicy" $extensionPolicy "backendTrafficPolicy" $backendTrafficPolicy "extraRules" $extraRules | toYaml -}}
{{- end -}}

{{/* Same as the sub_filter of the nginx integration: disables compression and adds the stylesheet to <head> */}}
{{- define "tc.v1.common.lib.route.integration.envoy.themePark" -}}
function envoy_on_request(request_handle)
  request_handle:headers():remove("accept-encoding")
end

function envoy_on_response(response_handle)
  local content_type = response_handle:headers():get("content-type")
  if content_type == nil or string.find(content_type, "text/html", 1, true) == nil then
    return
  end
  local body = response_handle:body()
  if body == nil then
    return
  end
  local html = body:getBytes(0, body:length())
  local position = string.find(html, "</head>", 1, true)
  if position == nil then
    return
  end
  local link = '<link rel="stylesheet" type="text/css" href="{{ .css }}">'
  body:setBytes(string.sub(html, 1, position - 1) .. link .. string.sub(html, position))
end
{{- end -}}
