{{- define "nextcloud.accessurl" -}}
  {{- $accessUrl := .Values.chartContext.appUrl -}}
  {{- if or (contains "127.0.0.1" $accessUrl) (contains "localhost" $accessUrl) -}}
    {{- if .Values.nextcloud.general.accessIP -}}
      {{- $prot := "http" -}}
      {{- $host := .Values.nextcloud.general.accessIP -}}
      {{- $port := .Values.service.main.ports.main.port -}}
      {{/*
        Allowing here to override protocol and port
        should be enough to make it work with any rev proxy
      */}}
      {{- $accessUrl = printf "%v://%v:%v" $prot $host $port -}}
    {{- end -}}
  {{- end -}}

  {{- $accessUrl -}}
{{- end -}}

{{- define "nextcloud.accesshost" -}}
  {{- $accessUrl := (include "nextcloud.accessurl" $) -}}
  {{- $accessHost := regexReplaceAll ".*://(.*)" $accessUrl "${1}" -}}
  {{- $accessHost = regexReplaceAll "(.*):.*" $accessHost "${1}" -}}

  {{- $accessHost -}}
{{- end -}}

{{/* Define the configmap */}}
{{- define "nextcloud.configmaps" -}}
{{- $fullname := (include "tc.v1.common.lib.chart.names.fullname" $) -}}
{{- $fqdn := (include "tc.v1.common.lib.chart.names.fqdn" $) -}}
{{- $accessUrl := (include "nextcloud.accessurl" $) -}}
{{- $accessHost := (include "nextcloud.accesshost" $) -}}
{{- $accessHostPort := regexReplaceAll ".*://(.*)" $accessUrl "${1}" -}}
{{- $accessProtocol := regexReplaceAll "(.*)://.*" $accessUrl "${1}" -}}
{{- $redisHost := .Values.redis.creds.plainhost | trimAll "\"" -}}
{{- $redisPass := .Values.redis.password | trimAll "\"" -}}
{{- $healthHost := "kube.internal.healthcheck" -}}

nextcloud-config:
  enabled: true
  data:
    {{/* Database */}}
    POSTGRES_DB: {{ .Values.cnpg.main.database | quote }}
    POSTGRES_USER: {{ .Values.cnpg.main.user | quote }}
    POSTGRES_PASSWORD: {{ .Values.cnpg.main.password | trimAll "\"" }}
    POSTGRES_HOST: {{ .Values.cnpg.main.creds.host | trimAll "\"" }}

    {{/* Compatibility Layer to support database changes */}}
    NX_POSTGRES_NAME: {{ .Values.cnpg.main.database | quote }}
    NX_POSTGRES_USER: {{ .Values.cnpg.main.user | quote }}
    NX_POSTGRES_PASSWORD: {{ .Values.cnpg.main.password | trimAll "\"" }}
    NX_POSTGRES_HOST: {{ .Values.cnpg.main.creds.host | trimAll "\"" }}

    {{/* Redis */}}
    NX_REDIS_HOST: {{ $redisHost }}
    NX_REDIS_PASS: {{ $redisPass }}

    {{/* Nextcloud INITIAL credentials */}}
    NEXTCLOUD_ADMIN_USER: {{ .Values.nextcloud.credentials.initialAdminUser | quote }}
    NEXTCLOUD_ADMIN_PASSWORD: {{ .Values.nextcloud.credentials.initialAdminPassword | quote }}

    {{/* PHP Variables */}}
    PHP_MEMORY_LIMIT: {{ .Values.nextcloud.php.memory_limit | quote }}
    PHP_UPLOAD_LIMIT: {{ .Values.nextcloud.php.upload_limit | quote }}

    {{/* Notify Push */}}
    NX_NOTIFY_PUSH: {{ .Values.nextcloud.notify_push.enabled | quote }}
    {{- if .Values.nextcloud.notify_push.enabled }}
    NX_NOTIFY_PUSH_ENDPOINT: {{ $accessUrl }}/push
    {{- end }}

    {{/* Previews */}}
    NX_PREVIEWS: {{ .Values.nextcloud.previews.enabled | quote }}
    NX_PREVIEW_PROVIDERS: {{ join " " .Values.nextcloud.previews.providers }}
    NX_PREVIEW_MAX_X: {{ .Values.nextcloud.previews.max_x | quote }}
    NX_PREVIEW_MAX_Y: {{ .Values.nextcloud.previews.max_y | quote }}
    NX_PREVIEW_MAX_MEMORY: {{ .Values.nextcloud.previews.max_memory | quote }}
    NX_PREVIEW_MAX_FILESIZE_IMAGE: {{ .Values.nextcloud.previews.max_file_size_image | quote }}
    NX_JPEG_QUALITY: {{ .Values.nextcloud.previews.jpeg_quality | quote }}
    NX_PREVIEW_SQUARE_SIZES: {{ .Values.nextcloud.previews.square_sizes | quote }}
    NX_PREVIEW_WIDTH_SIZES: {{ .Values.nextcloud.previews.width_sizes | quote }}
    NX_PREVIEW_HEIGHT_SIZES: {{ .Values.nextcloud.previews.height_sizes | quote }}

    {{/* Imaginary */}}
    NX_IMAGINARY: {{ and .Values.nextcloud.previews.enabled .Values.nextcloud.previews.imaginary | quote }}
    {{- if and .Values.nextcloud.previews.enabled .Values.nextcloud.previews.imaginary }}
    NX_IMAGINARY_URL: {{ printf "http://%v-imaginary:%v" $fullname .Values.service.imaginary.ports.imaginary.port }}
    {{- end }}

    {{/* Expirations */}}
    NX_ACTIVITY_EXPIRE_DAYS: {{ .Values.nextcloud.expirations.activity_expire_days | quote }}
    NX_TRASH_RETENTION: {{ .Values.nextcloud.expirations.trash_retention_obligation | quote }}
    NX_VERSIONS_RETENTION: {{ .Values.nextcloud.expirations.versions_retention_obligation | quote }}

    {{/* General */}}
    NX_RUN_OPTIMIZE: {{ .Values.nextcloud.general.run_optimize | quote }}
    NX_DEFAULT_PHONE_REGION: {{ .Values.nextcloud.general.default_phone_region | quote }}
    NEXTCLOUD_DATA_DIR: {{ .Values.persistence.data.targetSelector.main.main.mountPath }}
    NX_FORCE_ENABLE_ALLOW_LOCAL_REMOTE_SERVERS: {{ .Values.nextcloud.general.force_enable_allow_local_remote_servers | quote }}

    {{/* Files */}}
    NX_SHARED_FOLDER_NAME: {{ .Values.nextcloud.files.shared_folder_name | quote }}
    NX_MAX_CHUNKSIZE: {{ .Values.nextcloud.files.max_chunk_size | mul 1 | quote }}

    {{/* Logging */}}
    NX_LOG_LEVEL: {{ .Values.nextcloud.logging.log_level | quote }}
    NX_LOG_FILE: {{ .Values.nextcloud.logging.log_file | quote }}
    NX_LOG_FILE_AUDIT: {{ .Values.nextcloud.logging.log_audit_file | quote }}
    NX_LOG_DATE_FORMAT: {{ .Values.nextcloud.logging.log_date_format | quote }}
    NX_LOG_TIMEZONE: {{ .Values.TZ | quote }}

    {{/* ClamAV */}}
    NX_CLAMAV: {{ .Values.nextcloud.clamav.enabled | quote }}
    {{- if .Values.nextcloud.clamav.enabled }}
    NX_CLAMAV_HOST: {{ printf "%v-clamav" $fullname }}
    NX_CLAMAV_PORT: {{ .Values.service.clamav.ports.clamav.targetPort | quote }}
    NX_CLAMAV_STREAM_MAX_LENGTH: {{ .Values.nextcloud.clamav.stream_max_length | mul 1 | quote }}
    NX_CLAMAV_FILE_MAX_SIZE: {{ .Values.nextcloud.clamav.file_max_size | quote }}
    NX_CLAMAV_INFECTED_ACTION: {{ .Values.nextcloud.clamav.infected_action | quote }}
    {{- end }}

    {{/* Collabora */}}
    NX_COLLABORA: {{ .Values.nextcloud.collabora.enabled | quote }}
    {{- if .Values.nextcloud.collabora.enabled }}
    NX_COLLABORA_URL: {{ printf "%v/collabora" $accessUrl | quote }}
    # Ideally this would be a combo of: public ip, pod cidr, svc cidr
    # But not always people have static IP.
    NX_COLLABORA_ALLOWLIST: "0.0.0.0/0"
    {{- end }}

    {{/* Only Office */}}
    NX_ONLYOFFICE: {{ .Values.nextcloud.onlyoffice.enabled | quote }}
    {{- if .Values.nextcloud.onlyoffice.enabled }}
    NX_ONLYOFFICE_URL: {{ .Values.nextcloud.onlyoffice.url | quote }}
    NX_ONLYOFFICE_INTERNAL_URL: {{ .Values.nextcloud.onlyoffice.internal_url | quote }}
    NX_ONLYOFFICE_VERIFY_SSL: {{ .Values.nextcloud.onlyoffice.verify_ssl | quote }}
    NX_ONLYOFFICE_NEXTCLOUD_INTERNAL_URL: {{ printf "http://%v.svc.cluster.local:%v/" $fqdn .Values.service.main.ports.main.port }}
    NX_ONLYOFFICE_JWT: {{ .Values.nextcloud.onlyoffice.jwt | quote }}
    NX_ONLYOFFICE_JWT_HEADER: {{ .Values.nextcloud.onlyoffice.jwt_header | quote }}
    {{- end }}

    {{/* URLs */}}
    NX_OVERWRITE_HOST: {{ $accessHostPort }}
    NX_OVERWRITE_CLI_URL: {{ $accessUrl }}
    # Return the protocol part of the URL
    NX_OVERWRITE_PROTOCOL: {{ $accessProtocol | lower }}
    # IP (or range in this case) of the proxy(ies)
    NX_TRUSTED_PROXIES: |
      {{ .Values.chartContext.podCIDR }}
      {{ .Values.chartContext.svcCIDR }}
    # fullname-* will allow access from the
    # other services in the same namespace
    NX_TRUSTED_DOMAINS: |
      127.0.0.1
      localhost
      {{ printf "%v:%v" $fullname .Values.service.main.ports.main.port }}
      {{ printf "%v-*" $fullname }}
      {{ $healthHost }}
      {{- if not (contains "127.0.0.1" $accessHost) }}
        {{- $accessHost | nindent 6 }}
      {{- end -}}
      {{- with .Values.nextcloud.general.accessIP }}
        {{- . | nindent 6 }}
      {{- end }}

{{ end -}}
