{{/* Initialiaze values of the chart */}}
{{- define "tc.v1.common.loader.init" -}}

  {{- include "tc.v1.common.check.capabilities" . -}}

  {{/* Merge chart values and the common chart defaults */}}
  {{- include "tc.v1.common.values.init" . -}}

  {{/* Fail on removed and deprecated keys, instead of silently ignoring them */}}
  {{- include "tc.v1.common.values.deprecations" . -}}

  {{/* Ensure TrueCharts chart context information is available */}}
  {{- include "tc.v1.common.lib.util.chartcontext" . -}}

  {{/* Autogenerate postgresql passwords if needed */}}
  {{- include "tc.v1.common.spawner.cnpg" . }}

  {{/* Autogenerate valkey passwords and credentials if needed */}}
  {{- include "tc.v1.common.dependencies.valkey.injector" . }}

  {{/* Autogenerate mariadb passwords if needed */}}
  {{- include "tc.v1.common.dependencies.mariadb.injector" . }}

  {{/* Autogenerate postgresql passwords and credentials if needed */}}
  {{- include "tc.v1.common.dependencies.postgresql.injector" . }}

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
