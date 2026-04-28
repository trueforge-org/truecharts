---
title: Pvc Vct
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/persistence/pvc-vct#full-examples) section for complete examples.

:::

## Appears in

- `.Values.persistence.pvc-vct`

---

## `persistence.pvc-vct`

Configuration for `persistence` entries with `type: pvc` or `type: vct`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `persistence.pvc-vct` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

## Child Pages

- [Static Custom](static-custom.md) - Static provisioning settings for PVC/VCT in `custom` mode.
- [Static Nfs](static-nfs.md) - Static provisioning settings for PVC/VCT in `nfs` mode.
- [Static Smb](static-smb.md) - Static provisioning settings for PVC/VCT in `smb` mode.

---

## Full Examples

```yaml
persistence:
  pvc-vol:
    enabled: true
    type: pvc
    namespace: some-namespace
    labels:
      label1: value1
    annotations:
      annotation1: value1
    dataSource:
      kind: "PersistentVolumeClaim"
      name: "existingPVC"
    accessModes: ReadWriteOnce
    volumeName: volume-name-backing-the-pvc
    existingClaim: existing-claim-name
    retain: true
    size: 2Gi
    mountOptions:
      - key: some-key
        value: some-value
    # static:
    #   mode: custom
    #   provisioner: provisioner
    #   driver: driver
    #   csi:
    #     key: value
    volumeSnapshots:
      - name: example1
        enabled: true
        labels:
          label1: value1
        annotations:
          annotation1: value1
        volumeSnapshotClassName: some-name
    # targetSelectAll: true
    targetSelector:
      pod-name:
        container-name:
          mountPath: /path/to/mount
```
