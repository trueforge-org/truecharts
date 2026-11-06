## Full Examples

### Basic class

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
```

### Default class with parameters

The `driver` can be read from other values, and `parameters` can be numbers and booleans:

```yaml
volumeSnapshotClass:
  class2:
    enabled: true
    isDefault: true
    driver: "{{ .Values.some_driver }}"
    deletionPolicy: Retain
    parameters:
      "{{ .Values.some_key }}": "{{ .Values.some_value }}"
      parameter2: 5
      parameter3: true
```
