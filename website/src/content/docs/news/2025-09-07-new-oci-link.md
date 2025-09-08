---
slug: "news/new-oci-link"
title: "Updated OCI Repository Link"
authors: [alfi0812]
date: 2025-09-07
tags:
  - "2025"
---

## Move OCI Registry to New Domain and Responds to Bitnami Changes

The OCI repository has been moved from tccr.io to oci.trueforge.org

### New Registry Locations

All images and charts previously hosted on tccr.io are now available under the new domain:

- Images: `oci.trueforge.org/tccr/IMAGE`
- Charts: `helm install mychart oci://oci.trueforge.org/truecharts/CHART`

This change affects only the domain; the registry remains OCI-based as before. Users are encouraged to update their Helm configurations and image references accordingly to avoid interruptions.

## Clustertool Updated for Talos 1.11.0

We’re excited to share that we now support Talos 1.11 and Kubernetes 1.34! With the recent update to clustertool, managing and deploying clusters on these versions has never been easier. This ensures smoother operations, up-to-date features, and a more reliable experience for all our users.

## Bitnami Policy Shift

Alongside the domain migration, We want to  highlight the recent upstream changes from Bitnami. The popular container provider has moved to a “latest-only” publishing model for free users, meaning older tags will no longer be maintained and soon to be removed.

In addition, Bitnami has removed some images entirely, forcing the deprecation of affected TrueCharts applications such as:

- Solr
- Matomo

## Nextcloud Update 31.0.8

addition, we’ve fixed Nextcloud image creation and released version 31.0.8 for our charts. This update ensures smoother deployments and improved reliability, so you can run Nextcloud with confidence on your clusters.

## What Users Should Do:

Update all references from tccr.io to oci.trueforge.org and update their charts and clustertool to the latest version.

Expect Bitnami-based charts to stay stable thanks to digest pinning.

Note that applications relying on deprecated Bitnami images are no longer available via TrueCharts.

We emphasize our commitment to stability and transparency, while continuing to adapt to upstream changes.
