## Full Examples

Every item of `extraTpl` is rendered as an extra Kubernetes object. An item is a YAML object or a string with a manifest, and Helm `tpl` is resolved in both:

```yaml
extraTpl:
  - apiVersion: v1
    kind: ConfigMap
    metadata:
      name: "{{ .Release.Name }}-extra"
    data:
      key: value
  - |
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: {{ .Release.Name }}-extra-string
    data:
      release: {{ .Release.Name }}
```
