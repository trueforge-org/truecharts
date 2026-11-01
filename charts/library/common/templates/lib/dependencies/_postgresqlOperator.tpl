{{/* Returns the name of the CloudNativePG Cluster of the postgresql dependency */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.postgresql.operator.clusterName" (dict "rootCtx" $) }}
rootCtx: The root context of the chart.

The name is the one of the former [cnpg.main], so the objects keep their names.
*/}}
{{- define "tc.v1.common.lib.dependencies.postgresql.operator.clusterName" -}}
  {{- $rootCtx := .rootCtx -}}
  {{- printf "%s-cnpg-main" (include "tc.v1.common.lib.chart.names.fullname" $rootCtx) -}}
{{- end -}}

{{/* Returns the details of the Services of the CloudNativePG Cluster of the postgresql dependency, as json */}}
{{/* Call this template:
{{ include "tc.v1.common.lib.dependencies.postgresql.operator.service" (dict "rootCtx" $) | fromJson }}
rootCtx: The root context of the chart.

name: The name of the read/write Service. The one of the pooler when [operator.pooler.enabled], otherwise the one of the cluster.
port: The port of the Services, CloudNativePG always uses 5432.
nameCluster: The name of the read/write Service of the cluster itself.
nameRO: The name of the read-only Service of the pooler, empty unless [operator.pooler.createRO]. It uses the same port.

This is the single source of the host and port of PostgreSQL in operator mode.
The credentials, wait init container and notes all get them through [tc.v1.common.lib.dependencies.primaryService].
*/}}
{{- define "tc.v1.common.lib.dependencies.postgresql.operator.service" -}}
  {{- $rootCtx := .rootCtx -}}

  {{- $dep := get ($rootCtx.Values.dependencies | default dict) "postgresql" | default dict -}}
  {{- $pooler := (get ($dep.operator | default dict) "pooler") | default dict -}}
  {{- $clusterName := include "tc.v1.common.lib.dependencies.postgresql.operator.clusterName" (dict "rootCtx" $rootCtx) -}}

  {{- $result := dict "name" (printf "%s-rw" $clusterName) "port" "5432" "nameRO" "" -}}
  {{- $_ := set $result "nameCluster" $result.name -}}
  {{- if $pooler.enabled -}}
    {{- $_ := set $result "name" (printf "%s-pooler-rw" $clusterName) -}}
    {{- if $pooler.createRO -}}
      {{- $_ := set $result "nameRO" (printf "%s-pooler-ro" $clusterName) -}}
    {{- end -}}
  {{- end -}}
  {{- $result | toJson -}}
{{- end -}}
