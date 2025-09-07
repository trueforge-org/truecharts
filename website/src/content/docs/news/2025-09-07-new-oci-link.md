---
slug: "news/new-oci-link"
title: "Updated OCI Repository Link"
authors: [alfi0812]
date: 2025-09-27
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

## Bitnami Policy Shift

Alongside the domain migration, We want to  highlight the recent upstream changes from Bitnami. The popular container provider has moved to a “latest-only” publishing model for free users, meaning older tags will no longer be maintained and soon to be removed.

In addition, Bitnami has removed some images entirely, forcing the deprecation of affected TrueCharts applications such as:

- Solr
- Matomo

### What Users Should Do:

Update all references from tccr.io to oci.trueforge.org and update their charts to the latest version.

Expect Bitnami-based charts to stay stable thanks to digest pinning.

Note that applications relying on deprecated Bitnami images are no longer available via TrueCharts.

We emphasize our commitment to stability and transparency, while continuing to adapt to upstream changes.