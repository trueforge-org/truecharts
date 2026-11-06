---
title: projected
---

:::note

- See the [Full Examples](/truecharts-common/persistence/projected#full-examples) section for complete examples.

:::

:::tip

- See all available keys of this object on the [Persistence](/truecharts-common/persistence) page.
- These options apply only when `type: projected`.

:::

## Appears in

- `.Values.persistence.$name`

---

## Full Examples

These examples are the part of the examples of other pages that is about this page.

```yaml
persistence:
  projected-vol:
    enabled: true
    type: projected
    mountPath: /projected
    sources:
      - secret:
          objectName: secret-name
          optional: false
          items:
            - key: key1
              path: secret/key1
      - configMap:
          objectName: configmap-name
          expandObjectName: true
          items:
            - key: key2
              path: config/key2
      - serviceAccountToken:
          audience: some-audience
          expirationSeconds: 3600
          path: token
      - downwardAPI:
          items:
            - path: labels
              fieldRef:
                fieldPath: metadata.labels
            - path: cpu-limit
              resourceFieldRef:
                containerName: container-name
                resource: limits.cpu
                divisor: 1m
```
