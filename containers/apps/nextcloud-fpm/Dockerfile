FROM public.ecr.aws/docker/library/nextcloud:32.0.0-fpm@sha256:601afbf1b540df52b2f86b735c476748e68a3e30e7aa1eb60e0e4791f0da8520

# Adds SURY PHP repository (This is a workaround because IMAP php extension is no longer available in Debian Trixie)
# https://github.com/nextcloud/docker/issues/2456
# https://www.voodoo.business/blog/2025/08/11/trixie-php8-4-imap-missing/
# https://wiki.debian.org/AdditionalPHPVersions (Quotes "The SURY repository is a reputable repository by web hosting professionals worldwide, but IT'S NOT A OFFICIAL DEBIAN REPOSITORY. You have been warned.")
RUN set -ex \
  && apt-get update \
  && apt-get install -y --no-install-recommends gnupg2 lsb-release \
  && echo "deb https://packages.sury.org/php $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list \
  && curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-php.gpg \
  \
  && apt-get update \
  # Development files for c-client mail API (used by IMAP)
  && apt-get install -y --no-install-recommends libc-client-dev \
  && apt-get dist-clean \
  \
  # Block the repository completely for future use
  && echo "Package: *" > /etc/apt/preferences.d/99-pin-sury \
  && echo "Pin: origin packages.sury.org" >> /etc/apt/preferences.d/99-pin-sury \
  && echo "Pin-Priority: -1" >> /etc/apt/preferences.d/99-pin-sury

RUN set -ex; \
    \
    echo "deb http://ftp.debian.org/debian $(cat /etc/os-release | grep VERSION_CODENAME | cut -d= -f2) non-free" >> \
    /etc/apt/sources.list.d/intel-graphics.list && \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        jq \
        nano \
        procps \
        ffmpeg \
        libheif1 \
        ocrmypdf \
        smbclient \
        libde265-0 \
        libfcgi-bin \
        heif-gdk-pixbuf \
        imagemagick-common \
        intel-media-va-driver-non-free \
    ; \
    savedAptMark="$(apt-mark showmanual)"; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libbz2-dev \
        libkrb5-dev \
        libsmbclient-dev \
        libmagickcore-dev \
    ; \
    \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
    docker-php-ext-install \
        bz2 \
        imap \
        soap \
    ; \
    pecl install smbclient; \
    docker-php-ext-enable smbclient; \
    \
    # Reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
    apt-mark auto '.*' > /dev/null; \
    apt-mark manual $savedAptMark; \
    ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so \
        | awk '/=>/ { so = $(NF-1); if (index(so, "/usr/local/") == 1) { next }; gsub("^/(usr/)?", "", so); print so }' \
        | sort -u \
        | xargs -r dpkg-query --search \
        | cut -d: -f1 \
        | sort -u \
        | xargs -rt apt-mark manual; \
    \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*

# Copy occ script to /usr/bin/occ
COPY --chmod=755 ./containers/apps/nextcloud-fpm/scripts/occ /usr/bin/occ

# Copy post-install script to a temp location so we can append it to the entrypoint.sh
COPY --chmod=755 ./containers/apps/nextcloud-fpm/scripts/post-install.sh /tmp/post-install.sh

# Copy the healthcheck
COPY --chmod=755 ./containers/apps/nextcloud-fpm/scripts/healthcheck.sh /healthcheck.sh

# Copy the configure-scripts that will be sourced by the post-install
COPY --chmod=755 ./containers/apps/nextcloud-fpm/configure-scripts /configure-scripts

RUN set -ex; \
    sed -i 's/exec "$@"//g' /entrypoint.sh; \
    cat /tmp/post-install.sh >> /entrypoint.sh

LABEL "org.opencontainers.image.source"="https://github.com/truecharts/containers"

ARG CONTAINER_NAME
ARG CONTAINER_VER
LABEL org.opencontainers.image.licenses="BSD-3-Clause"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
