{{/* Define the secrets */}}
{{- define "mealie.secrets" -}}
{{- $api := .Values.mealie.api -}}

api:
  enabled: true
  data:
    API_PORT: {{ .Values.service.main.ports.main.port | quote }}
    {{/* Database */}}
  {{- if .Values.cnpg.main.enabled }}
    DB_ENGINE: "postgres"
    POSTGRES_PORT: "5432"
    POSTGRES_USER: {{ .Values.cnpg.main.user }}
    POSTGRES_PASSWORD: {{ .Values.cnpg.main.creds.password | trimAll "\"" }}
    POSTGRES_DB: {{ .Values.cnpg.main.database }}
    POSTGRES_SERVER: {{ .Values.cnpg.main.creds.host }}
  {{- end }}
    {{/* User Defined */}}
    {{/* General */}}
    ALLOW_SIGNUP: {{ $api.general.allow_signup | quote }}
    DEFAULT_GROUP: {{ $api.general.default_group }}
    DEFAULT_EMAIL: {{ $api.general.default_email }}
    BASE_URL: {{ $api.general.base_url }}
    TOKEN_TIME: {{ $api.general.token_time | quote }}
    {{/* Security */}}
    SECURITY_MAX_LOGIN_ATTEMPTS: {{ $api.security.max_login_attempts | quote }}
    SECURITY_USER_LOCKOUT_TIME: {{ $api.security.user_lockout_time | quote }}
    {{/* SMTP */}}
  {{- if $api.smtp.host }}
    SMTP_PORT: {{ $api.smtp.port | quote }}
    SMTP_HOST: {{ $api.smtp.host | quote }}
    SMTP_USER: {{ $api.smtp.user | quote }}
    SMTP_PASSWORD: {{ $api.smtp.password | quote }}
    SMTP_FROM_NAME: {{ $api.smtp.from_name | quote }}
    SMTP_AUTH_STRATEGY: {{ $api.smtp.auth_strategy | quote }}
    SMTP_FROM_EMAIL: {{ $api.smtp.from_email | quote }}
  {{- end }}
    {{/* Workers */}}
    WORKERS_PER_CORE: {{ $api.webworkers.workers_per_core | quote }}
    MAX_WORKERS: {{ $api.webworkers.max_workers | quote }}
    WEB_CONCURRENCY: {{ $api.webworkers.web_concurrency | quote }}
    {{/* LDAP */}}
  {{- if $api.ldap.auth_enabled }}
    LDAP_AUTH_ENABLED: {{ $api.ldap.auth_enabled | quote }}
    {{- with $api.ldap.server_url }}
    LDAP_SERVER_URL: {{ . }}
    {{- end }}
    LDAP_TLS_INSECURE: {{ $api.ldap.tls_insecure | quote }}
    LDAP_ENABLE_STARTTLS: {{ $api.ldap.enable_starttls | quote }}
    {{- with $api.ldap.tls_cacertfile }}
    LDAP_TLS_CACERTFILE: {{ . | quote }}
    {{- end -}}
    {{- with $api.ldap.base_dn }}
    LDAP_BASE_DN: {{ . | quote }}
    {{- end -}}
    {{- with $api.ldap.query_bind }}
    LDAP_QUERY_BIND: {{ . | quote }}
    {{- end -}}
    {{- with $api.ldap.query_password }}
    LDAP_QUERY_PASSWORD: {{ . | quote }}
    {{- end -}}
    {{- with $api.ldap.user_filter }}
    LDAP_USER_FILTER: {{ . | quote }}
    {{- end -}}
    {{- with $api.ldap.admin_filter }}
    LDAP_ADMIN_FILTER: {{ . | quote }}
    {{- end -}}
    {{- with $api.ldap.id_attribute }}
    LDAP_ID_ATTRIBUTE: {{ . | quote }}
    {{- end -}}
    {{- with $api.ldap.name_attribute }}
    LDAP_NAME_ATTRIBUTE: {{ . | quote }}
    {{- end -}}
    {{- with $api.ldap.mail_attribute }}
    LDAP_MAIL_ATTRIBUTE: {{ . | quote }}
    {{- end -}}
  {{- end -}}
  {{- if $api.oidc.auth_enabled }}
    {{- with $api.oidc.auth_enabled }}
    OIDC_AUTH_ENABLED: {{ . | quote }}
    {{- end -}}
    {{- with $api.oidc.signup_enabled }}
    OIDC_SIGNUP_ENABLED: {{ . | quote }}
    {{- end -}}
    {{- with $api.oidc.configuration_url }}
    OIDC_CONFIGURATION_URL: {{ . | quote }}
    {{- end -}}
    {{- with $api.oidc.client_id }}
    OIDC_CLIENT_ID: {{ . | quote }}
    {{- end -}}
    {{- with $api.oidc.client_secret }}
    OIDC_CLIENT_SECRET: {{ . | quote }}
    {{- end -}}
    {{- with $api.oidc.user_group }}
    OIDC_USER_GROUP: {{ . | quote }}
    {{- end -}}
    {{- with $api.oidc.admin_group }}
    OIDC_ADMIN_GROUP: {{ . | quote }}
    {{- end -}}
    {{- with $api.oidc.auto_redirect }}
    OIDC_AUTO_REDIRECT: {{ . | quote }}
    {{- end -}}
    {{- with $api.oidc.provider_name }}
    OIDC_PROVIDER_NAME: {{ . | quote }}
    {{- end -}}
    {{- with $api.oidc.remember_me }}
    OIDC_REMEMBER_ME: {{ . | quote }}
    {{- end -}}
  {{- end -}}
{{- end -}}
