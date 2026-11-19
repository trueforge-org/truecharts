{{- define "plausible.secret" -}}

{{- $plausible := .Values.plausible -}}
{{- $email := $plausible.email -}}
{{- $maxmind := $plausible.maxmind -}}
{{- $google := $plausible.google -}}

enabled: true
data:
  SECRET_KEY_BASE: {{ required "plausible.secretKeyBase must be set" $plausible.secretKeyBase | quote }}

  DATABASE_URL: {{ .Values.dependencies.postgresql.depconfig.creds.complete }}
  CLICKHOUSE_DATABASE_URL: {{ .Values.dependencies.clickhouse.depconfig.creds.complete }}

  MAILER_EMAIL: {{ $email.mailer_email | quote }}
  MAILER_NAME: {{ $email.mailer_name | quote }}
  SMTP_USER_NAME: {{ $email.smtp_user_name | quote }}
  SMTP_USER_PWD: {{ $email.smtp_user_password | quote }}
  POSTMARK_API_KEY: {{ $email.postmark_api_key | quote }}
  MAILGUN_API_KEY: {{ $email.mailgun_api_key | quote }}
  MAILGUN_DOMAIN: {{ $email.mailgun_domain | quote }}
  MANDRILL_API_KEY: {{ $email.mandrill_api_key | quote }}
  SENDGRID_API_KEY: {{ $email.sendgrid_api_key | quote }}

  MAXMIND_LICENSE_KEY: {{ $maxmind.license_key | quote }}

  GOOGLE_CLIENT_ID: {{ $google.client_id | quote }}
  GOOGLE_CLIENT_SECRET: {{ $google.client_secret | quote }}
{{- end }}
