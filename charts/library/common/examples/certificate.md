## Full Examples

### Basic certificate

A cert-manager `Certificate` for one or more hosts, signed by an issuer. Both can be read from other values with Helm `tpl`:

```yaml
certificate:
  my-certificate1:
    enabled: true
    hosts:
      - "{{ .Values.host }}"
    certificateIssuer: "{{ .Values.issuer }}"
```

### Multiple hosts and a secret template

`certificateSecretTemplate` sets the labels and annotations of the Secret that cert-manager creates:

```yaml
certificate:
  my-certificate2:
    enabled: true
    hosts:
      - host1.example.com
      - host2.example.com
    certificateIssuer: some-other-issuer
    certificateSecretTemplate:
      labels:
        label1: label1
        label2: label2
      annotations:
        annotation1: annotation1
        annotation2: annotation2
```

### Namespace, labels and annotations

```yaml
certificate:
  my-certificate3:
    enabled: true
    namespace: some-namespace
    hosts:
      - app.example.com
    certificateIssuer: letsencrypt-prod
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
    labelsList:
      - name: other-key
        value: other-value
    annotationsList:
      - name: other-annotation
        value: other-value
```
