{{/* Define the configmaps */}}
{{- define "authentik.configmaps" -}}


{{/* Shared config for server and worker */}}
server-worker:
  enabled: true
  data:
    {{/* Dependencies */}}
    AUTHENTIK_POSTGRESQL__NAME: {{ .Values.cnpg.main.database }}
    AUTHENTIK_POSTGRESQL__USER: {{ .Values.cnpg.main.user }}
    AUTHENTIK_POSTGRESQL__HOST: {{ .Values.cnpg.main.creds.host }}
    AUTHENTIK_POSTGRESQL__PORT: "5432"

    {{/* Outposts */}}
    AUTHENTIK_OUTPOSTS__DISCOVER: "false"

    {{/* GeoIP */}}
    {{- $geoipPath := (printf "/geoip/%v.mmdb" .Values.authentik.geoip.editionID) -}}
    {{- if not .Values.authentik.geoip.enabled -}}
      {{- $geoipPath = "/tmp/non-existent-file" -}}
    {{- end -}}

    {{- if or .Values.authentik.geoip.enabled .Values.authentik.geoip.wipeBuiltInDb }}
    AUTHENTIK_GEOIP: {{ $geoipPath }}
    {{- end }}

    {{/* Mail */}}
    AUTHENTIK_EMAIL__USE_TLS: {{ .Values.authentik.email.useTLS | quote }}
    AUTHENTIK_EMAIL__USE_SSL: {{ .Values.authentik.email.useSSL | quote }}
    {{- with .Values.authentik.email.port }}
    AUTHENTIK_EMAIL__PORT: {{ . | quote }}
    {{- end -}}
    {{- with .Values.authentik.email.timeout }}
    AUTHENTIK_EMAIL__TIMEOUT: {{ . | quote }}
    {{- end }}

    {{/* LDAP */}}
    AUTHENTIK_LDAP__TASK_TIMEOUT_HOURS: {{ .Values.authentik.ldap.taskTimeoutHours | quote }}
    AUTHENTIK_LDAP__TLS__CIPHERS: {{ .Values.authentik.ldap.tlsCiphers | quote }}

    {{/* Logging */}}
    AUTHENTIK_LOG_LEVEL: {{ .Values.authentik.logging.logLevel }}

    {{/* Error Reporting */}}
    AUTHENTIK_ERROR_REPORTING__ENABLED: {{ .Values.authentik.errorReporting.enabled | quote }}
    AUTHENTIK_ERROR_REPORTING__SEND_PII: {{ .Values.authentik.errorReporting.sendPII | quote }}
    {{- with .Values.authentik.errorReporting.environment }}
    AUTHENTIK_ERROR_REPORTING__ENVIRONMENT: {{ . | quote }}
    {{- end -}}
    {{- with .Values.authentik.errorReporting.sentryDSN }}
    AUTHENTIK_ERROR_REPORTING__SENTRY_DSN: {{ . | quote }}
    {{- end -}}
    {{- with .Values.authentik.general.avatars }}
    AUTHENTIK_AVATARS: {{ join "," . }}
    {{- end -}}
    {{- with .Values.authentik.general.footerLinks }}
    AUTHENTIK_FOOTER_LINKS: {{ toJson . | squote }}
    {{- end }}

    {{/* General */}}
    AUTHENTIK_DISABLE_UPDATE_CHECK: {{ .Values.authentik.general.disableUpdateCheck | quote }}
    AUTHENTIK_DISABLE_STARTUP_ANALYTICS: {{ .Values.authentik.general.disableStartupAnalytics | quote }}
    AUTHENTIK_DEFAULT_USER_CHANGE_NAME: {{ .Values.authentik.general.allowUserChangeName | quote }}
    AUTHENTIK_DEFAULT_USER_CHANGE_EMAIL: {{ .Values.authentik.general.allowUserChangeEmail | quote }}
    AUTHENTIK_DEFAULT_USER_CHANGE_USERNAME: {{ .Values.authentik.general.allowUserChangeUsername | quote }}
    AUTHENTIK_GDPR_COMPLIANCE: {{ .Values.authentik.general.gdprCompliance | quote }}
    AUTHENTIK_DEFAULT_TOKEN_LENGTH: {{ .Values.authentik.general.tokenLength | quote }}
    AUTHENTIK_IMPERSONATION: {{ .Values.authentik.general.impersonation | quote }}
{{- end -}}
