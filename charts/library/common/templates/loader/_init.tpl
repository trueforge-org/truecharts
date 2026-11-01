{{/* Initialiaze values of the chart */}}
{{- define "tc.v1.common.loader.init" -}}

  {{- include "tc.v1.common.check.capabilities" . -}}

  {{/* Merge chart values and the common chart defaults */}}
  {{- include "tc.v1.common.values.init" . -}}

  {{/* Fail on removed and deprecated keys, instead of silently ignoring them */}}
  {{- include "tc.v1.common.values.deprecations" . -}}

  {{/* Ensure TrueCharts chart context information is available */}}
  {{- include "tc.v1.common.lib.util.chartcontext" . -}}

  {{/* Autogenerate valkey passwords and credentials if needed */}}
  {{- include "tc.v1.common.dependencies.valkey.injector" . }}

  {{/* Render the ValkeyCluster of the valkey dependency, when it is provided by the valkey-operator */}}
  {{- include "tc.v1.common.spawner.valkey" . }}

  {{/* Autogenerate mariadb passwords if needed */}}
  {{- include "tc.v1.common.dependencies.mariadb.injector" . }}

  {{/* Autogenerate postgresql passwords and credentials if needed */}}
  {{- include "tc.v1.common.dependencies.postgresql.injector" . }}

  {{/* Render the CNPG cluster of the postgresql dependency, when it is provided by the cloudnative-pg operator */}}
  {{- include "tc.v1.common.spawner.cnpg" . }}

  {{/* Autogenerate mongodb passwords if needed */}}
  {{- include "tc.v1.common.dependencies.mongodb.injector" . }}

  {{/* Autogenerate clickhouse passwords if needed */}}
  {{- include "tc.v1.common.dependencies.clickhouse.injector" . }}

  {{/* Enable code-server add-on if required */}}
  {{- if .Values.addons.codeserver.enabled }}
    {{- include "tc.v1.common.addon.codeserver" . }}
  {{- end -}}

  {{/* Enable gluetun add-on if required */}}
  {{- if and .Values.addons.gluetun .Values.addons.gluetun.enabled -}}
    {{- include "tc.v1.common.addon.gluetun" . }}
  {{- end -}}

  {{/* Enable tailscale add-on if required */}}
  {{- if and .Values.addons.tailscale .Values.addons.tailscale.enabled -}}
    {{- include "tc.v1.common.addon.tailscale" . }}
  {{- end -}}

  {{/* Enable netshoot add-on if required */}}
  {{- if and .Values.addons.netshoot .Values.addons.netshoot.enabled }}
    {{- include "tc.v1.common.addon.netshoot" . }}
  {{- end -}}

  {{/* Append database wait containers to pods */}}
  {{- include "tc.v1.common.lib.deps.wait" $ }}

{{- end -}}
