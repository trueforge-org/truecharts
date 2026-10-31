---
title: How-To
---

This is a quick setup-guide to run Docusaurus on your own server.

## Requirements

None necessary, a domain name is recommended for usage but not required.

## Docusaurus Chart Setup

### Environment variables

- WEBSITE_NAME: Your website name
- TEMPLATE: Docusaurus Default Template is generally `classic` unless you've manually installed another
- RUN_MODE: Choose between `production` and `development` mode

```yaml
workload:
  main:
    podSpec:
      containers:
        main:
          env:
            WEBSITE_NAME: "Docusaurus HomeLab Website"
            TEMPLATE: classic
            RUN_MODE: development
```

### Storage and Persistance

This chart uses PVC for storage, as do most of our charts. However, some users may need to frequently edit certain files or directories.
A simple way to edit files inside the container is by using our [CodeServer](/truecharts/guides/addons/code-server) Add-on. It provides a web-based file editor and is intended for temporary use, allowing you to add or remove it at any time.

While it is possible to mount a specific folder to an external storage location, such as an NFS share, this approach is not recommended as it adds complexity. By default, the PVC mounts **/config**, and the site is created in **/config/WEBSITE_NAME** (with **/config/website** as a symlink to it), meaning all files in **/config/WEBSITE_NAME/docs** are stored within the PVC. If you choose to mount an external share, mount it on the site directory rather than the `website` symlink, and only after the site has been created on first start. You must ensure that the required files are manually placed in the new location, as they will not be copied over automatically.

```yaml
persistence:
  docs:
    enabled: true
    type: nfs
    path: ${NFS_PATH}
    server: ${SERVER_IP}
    mountPath: "/config/Docusaurus HomeLab Website/docs"
```

## Upgrading to 13.0.0

Version 13.0.0 replaces the unmaintained `awesometic/docusaurus` image with the TrueCharts `containerforge/docusaurus` image:

- The container runs as the non-root `apps` user (568) instead of root
- Data is stored in **/config** instead of **/docusaurus**; the existing PVC is reused with the same directory structure
- Docusaurus listens on port 3000 inside the container; the service port is unchanged
- `TARGET_UID`/`TARGET_GID` are no longer used; use the pod `securityContext` instead
- Sites created by the old image keep using yarn, new sites use npm

## Support

If you need more details or have a more customized setup, the documentation on the [upstream](https://github.com/facebook/docusaurus) repository is very comprehensive. Check the descriptions of the available options there for further guidance.
