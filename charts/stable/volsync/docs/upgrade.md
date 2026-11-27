---
title: Upgrade to chart 7.0.0
---

## VolSync 0.17.0

Chart 7.0.0 aligns the controller, all five data mover images, and both VolSync CRDs
with [VolSync 0.17.0](https://github.com/backube/volsync/releases/tag/v0.17.0).
The controller and movers use the same digest-pinned image from `image`.

The CRDs now include mover tolerations in `moverConfig`,
`ReplicationDestination.spec.restic.enableSparseRestore`, and the additional
Restic retention options such as `withinDaily` and `withinHourly`.
These options are available without being enabled by default.

## Before upgrading

### Rsync over SSH

Starting with VolSync 0.17.0, the legacy Rsync-over-SSH mover requires explicit
permission to use elevated privileges. Previously, it forced elevated privileges
for compatibility.

If you use `spec.rsync`, add the following annotation to each namespace containing
those ReplicationSource or ReplicationDestination resources before upgrading:

```yaml
metadata:
  annotations:
    volsync.backube/privileged-movers: "true"
```

This permission applies to movers throughout that namespace, not just Rsync over
SSH. Have the cluster administrator review the namespace's privilege policy.
The chart does not add this annotation automatically or elevate the controller.

Rsync over TLS (`spec.rsyncTLS`) remains the upstream-recommended Rsync transport.
This new SSH requirement does not require enabling privileged movers for Restic,
Rclone, Rsync-TLS, or Syncthing. Their existing data-access and security-context
requirements still apply.

See the upstream [mover permission model](https://github.com/backube/volsync/blob/v0.17.0/docs/usage/permissionmodel.rst)
and [Rsync-SSH documentation](https://github.com/backube/volsync/blob/v0.17.0/docs/usage/rsync/index.rst).

### CRD ownership

With `manageCRDs: true`, the chart renders the updated CRDs as Helm templates.
They retain `helm.sh/resource-policy: keep` and use `volsync.backube/v1alpha1`
with `served: true` and `storage: true`, matching the upstream Helm chart.

With `manageCRDs: false`, update the externally managed CRDs from the
[official 0.17.0 definitions](https://github.com/backube/volsync/tree/v0.17.0/config/crd/bases)
through their existing owner before using the new fields. An image override
alone does not update the Kubernetes API schema.

## Validation after upgrading

Check a representative replication and restore using your own storage and mover
configuration. A healthy controller pod alone does not establish that backups
and restores work.
