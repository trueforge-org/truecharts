FROM python:3.13-alpine@sha256:f196fd275fdad7287ccb4b0a85c2e402bb8c794d205cf6158909041c1ee9f38d

# Install dependencies
RUN pip install --no-cache-dir requests beautifulsoup4 icalendar pytz

# Create working directory
WORKDIR /app

# Copy code
COPY --chmod=775 ./containers/apps/bfics/includes/balfolk_ical.py /app/balfolk_ical.py
COPY --chmod=775 ./containers/apps/bfics/includes/crontab.txt /app/crontab.txt


# Create output dir for serving
RUN touch /app/balfolk.ics

# Setup cron
RUN apk add --no-cache bash curl busybox-suid && \
    echo "#!/bin/sh\ncrond -f -L /dev/stdout" > /start.sh && \
    chmod +x /start.sh

# Install cron job
RUN crontab /app/crontab.txt

# Start cron and HTTP server
CMD sh -c "python3 /app/balfolk_ical.py && crond -f -L /dev/stdout & python3 -m http.server 8000 --directory /app"

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
