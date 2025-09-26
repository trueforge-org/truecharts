# hadolint ignore=DL3007
FROM docker.io/renovate/renovate:41.131.2-full@sha256:f0fda5c29f6cd300a8659cb98d3d1228fa6ff1ff71ceb44031d99a43c3f40e38

ARG VERSION
ARG CONTAINER_NAME
ARG CONTAINER_VER
ARG TEST

# Download and set up the clustertool binary
RUN curl -L "https://github.com/trueforge-org/truecharts/releases/download/v${VERSION}/clustertool_${VERSION}_linux_amd64.tar.gz" -o /tmp/clustertool.tar.gz \
    && tar -xzvf /tmp/clustertool.tar.gz -C /usr/local/bin \
    && chmod +x /usr/local/bin/clustertool \
    && rm /tmp/clustertool.tar.gz


# Maintainer and metadata
LABEL "maintainer"="TrueCharts <info@truecharts.org>"
LABEL "org.opencontainers.image.source"="https://github.com/truecharts/apps"
LABEL org.opencontainers.image.title="${CONTAINER_NAME}"
LABEL org.opencontainers.image.url="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
LABEL org.opencontainers.image.version="${CONTAINER_VER}"
LABEL org.opencontainers.image.description="Container for ${CONTAINER_NAME} by TrueCharts"
LABEL org.opencontainers.image.authors="TrueCharts"
LABEL org.opencontainers.image.documentation="https://truecharts.org/docs/charts/${CONTAINER_NAME}"
