## Full Examples

### Labels and annotations on one object

Labels and annotations are maps. The values support Helm `tpl`:

```yaml
configmap:
  my-config:
    enabled: true
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    data:
      key: value
```

### labelsList and annotationsList

The lists take a `name` and a `value`, and are merged into `labels` and `annotations`. They are useful when a name is not a plain YAML key, or when a list is easier to extend from several values files. The values support Helm `tpl`:

```yaml
configmap:
  my-config:
    enabled: true
    labelsList:
      - name: example.com/team
        value: "{{ .Values.labelValue }}"
      - name: other-key
        value: other-value
    annotationsList:
      - name: example.com/owner
        value: "{{ .Values.annotationValue }}"
    data:
      key: value
```

### Labels and annotations on all objects

`global` labels and annotations are added to every object of the chart:

```yaml
global:
  labels:
    team: platform
  annotations:
    owner: platform@example.com
```

### Namespace

Objects are created in `namespace`, unless they set their own. `global.namespace` also applies to the dependencies:

```yaml
global:
  namespace: my-namespace

namespace: my-namespace

secret:
  other-namespace-secret:
    enabled: true
    namespace: some-other-namespace
    data:
      key: value
```
