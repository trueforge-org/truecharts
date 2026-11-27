---
title: Volume group snapshot upgrades
---

## Chart 8.0.0

This release fixes the snapshot controller's VolumeGroupSnapshot RBAC and bundles the three group snapshot CRDs exactly as published with external-snapshotter v8.7.1. The controller image remains v8.7.1.

The controller uses the `v1` group snapshot API. The updated CRDs serve that API and the ClusterRole grants the upstream permissions for group snapshots, their contents, classes and status subresources. The controller also needs permission to create and delete the individual VolumeSnapshots associated with a group.

| API version | Served | Storage |
| --- | --- | --- |
| `v1` | Yes | No |
| `v1beta1` (deprecated) | Yes | No |
| `v1beta2` | Yes | Yes |

## Existing group snapshots

The previous chart stored group snapshot objects as `v1beta1`. The updated CRDs store newly created or updated objects as `v1beta2`. Existing objects are not automatically rewritten when the CRD is updated.

The `v1` and `v1beta2` schemas match. However, `v1beta1` VolumeGroupSnapshotContent uses `status.volumeSnapshotHandlePairList`, whereas the newer versions use `status.volumeSnapshotInfoList`. Keeping `v1beta1` served does not provide this field conversion.

If your cluster has existing `v1beta1` group snapshot contents or clients that use that API, plan conversion before applying this upgrade. Follow the [upstream conversion webhook documentation for v8.7.1](https://github.com/kubernetes-csi/external-snapshotter/blob/v8.7.1/deploy/kubernetes/webhook-example/README.md). The upstream CRDs bundled here do not configure a conversion webhook, and this chart does not deploy one.

Do not roll back to the old CRDs after objects have been stored as `v1beta2` without a storage-version migration plan. Retain every version recorded in `status.storedVersions` until migration is complete. See [Kubernetes CRD versioning and storage migration](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definition-versioning/#upgrade-existing-objects-to-a-new-stored-version).

The three ordinary VolumeSnapshot CRDs are unchanged. Actual group snapshot creation also requires support from the CSI driver and its snapshotter sidecar.

## Upstream references

- [CRDs at v8.7.1](https://github.com/kubernetes-csi/external-snapshotter/tree/v8.7.1/client/config/crd)
- [Snapshot controller RBAC at v8.7.1](https://github.com/kubernetes-csi/external-snapshotter/blob/v8.7.1/deploy/kubernetes/snapshot-controller/rbac-snapshot-controller.yaml)
