## Full Examples

### Credentials in the values

Create a pull secret and attach it to all pods:

```yaml
imagePullSecret:
  pull-secret-name:
    enabled: true
    namespace: some-namespace
    labels:
      key: value
      keytpl: "{{ .Values.some.value }}"
    annotations:
      key: value
      keytpl: "{{ .Values.some.value }}"
    data:
      registry: quay.io
      username: my_user
      password: my_pass
      email: my_mail@example.com
    targetSelectAll: true
```

### Only some workloads, with Helm tpl

`targetSelector` attaches the secret to the listed workloads only, and the credentials can be read from other values:

```yaml
imagePullSecret:
  other-pull-secret-name:
    enabled: true
    data:
      registry: "{{ .Values.my_registry }}"
      username: "{{ .Values.my_user }}"
      password: "{{ .Values.my_pass }}"
      email: "{{ .Values.my_mail }}"
    targetSelector:
      - workload-name1
      - workload-name2
```

### Existing secret

With `existingSecret`, no secret is created. Only `enabled`, `targetSelectAll` and `targetSelector` are used:

```yaml
imagePullSecret:
  existing-pull-secret:
    enabled: true
    existingSecret: my-registry-secret
    targetSelectAll: true
```
