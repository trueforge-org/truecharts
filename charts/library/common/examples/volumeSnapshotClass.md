## Full Examples

```yaml
volumeSnapshotClass:
  class1:
    enabled: true
    driver: csi-hostpath-snapshots
    deletionPolicy: Delete
    labels:
      label1: "{{ .Values.label1 }}"
      label2: label2
    annotations:
      annotation1: "{{ .Values.annotation1 }}"
      annotation2: annotation2
  class2:
    enabled: true
    isDefault: true
    driver: "{{ .Values.some_driver }}"
    labels:
      label1: "{{ .Values.label1 }}"
      label2: label2
    annotations:
      annotation1: "{{ .Values.annotation1 }}"
      annotation2: annotation2
    parameters:
      "{{ .Values.some_key }}": "{{ .Values.some_value }}"
      parameter2: 5
```
