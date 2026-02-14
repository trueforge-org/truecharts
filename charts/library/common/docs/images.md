---
title: Images
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/images#full-examples) section for complete examples.

:::

## Appears in

- `.Values.images`

---

## `images`

Bundled image schemas.

| Field      | Value    |
| ---------- | -------- |
| Key        | `images` |
| Type       | `map`    |
| Required   | ❌       |
| Helm `tpl` | ❌       |
| Default    | unset    |

---

### `images.codeserverImage`

Configuration for `codeserverImage`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `images.codeserverImage` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `images.gluetunImage`

Configuration for `gluetunImage`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `images.gluetunImage` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `images.kubectlImage`

Configuration for `kubectlImage`.

| Field      | Value                 |
| ---------- | --------------------- |
| Key        | `images.kubectlImage` |
| Type       | `map`                 |
| Required   | ❌                    |
| Helm `tpl` | ❌                    |
| Default    | unset                 |

---

### `images.mariadbClientImage`

Configuration for `mariadbClientImage`.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `images.mariadbClientImage` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `images.mongodbClientImage`

Configuration for `mongodbClientImage`.

| Field      | Value                       |
| ---------- | --------------------------- |
| Key        | `images.mongodbClientImage` |
| Type       | `map`                       |
| Required   | ❌                          |
| Helm `tpl` | ❌                          |
| Default    | unset                       |

---

### `images.netshootImage`

Configuration for `netshootImage`.

| Field      | Value                  |
| ---------- | ---------------------- |
| Key        | `images.netshootImage` |
| Type       | `map`                  |
| Required   | ❌                     |
| Helm `tpl` | ❌                     |
| Default    | unset                  |

---

### `images.postgres15Image`

Configuration for `postgres15Image`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `images.postgres15Image` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `images.postgres16Image`

Configuration for `postgres16Image`.

| Field      | Value                    |
| ---------- | ------------------------ |
| Key        | `images.postgres16Image` |
| Type       | `map`                    |
| Required   | ❌                       |
| Helm `tpl` | ❌                       |
| Default    | unset                    |

---

### `images.postgresClientImage`

Configuration for `postgresClientImage`.

| Field      | Value                        |
| ---------- | ---------------------------- |
| Key        | `images.postgresClientImage` |
| Type       | `map`                        |
| Required   | ❌                           |
| Helm `tpl` | ❌                           |
| Default    | unset                        |

---

### `images.postgresPostgis15Image`

Configuration for `postgresPostgis15Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `images.postgresPostgis15Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `images.postgresPostgis16Image`

Configuration for `postgresPostgis16Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `images.postgresPostgis16Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `images.postgresVectorchord15Image`

Configuration for `postgresVectorchord15Image`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `images.postgresVectorchord15Image` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `images.postgresVectorchord16Image`

Configuration for `postgresVectorchord16Image`.

| Field      | Value                               |
| ---------- | ----------------------------------- |
| Key        | `images.postgresVectorchord16Image` |
| Type       | `map`                               |
| Required   | ❌                                  |
| Helm `tpl` | ❌                                  |
| Default    | unset                               |

---

### `images.postgresVectors15Image`

Configuration for `postgresVectors15Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `images.postgresVectors15Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `images.postgresVectors16Image`

Configuration for `postgresVectors16Image`.

| Field      | Value                           |
| ---------- | ------------------------------- |
| Key        | `images.postgresVectors16Image` |
| Type       | `map`                           |
| Required   | ❌                              |
| Helm `tpl` | ❌                              |
| Default    | unset                           |

---

### `images.tailscaleImage`

Configuration for `tailscaleImage`.

| Field      | Value                   |
| ---------- | ----------------------- |
| Key        | `images.tailscaleImage` |
| Type       | `map`                   |
| Required   | ❌                      |
| Helm `tpl` | ❌                      |
| Default    | unset                   |

---

### `images.ubuntuImage`

Configuration for `ubuntuImage`.

| Field      | Value                |
| ---------- | -------------------- |
| Key        | `images.ubuntuImage` |
| Type       | `map`                |
| Required   | ❌                   |
| Helm `tpl` | ❌                   |
| Default    | unset                |

---

### `images.valkeyClientImage`

Configuration for `valkeyClientImage`.

| Field      | Value                      |
| ---------- | -------------------------- |
| Key        | `images.valkeyClientImage` |
| Type       | `map`                      |
| Required   | ❌                         |
| Helm `tpl` | ❌                         |
| Default    | unset                      |

---

## Full Examples

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

  other-pull-secret-name:
    enabled: true
    namespace: some-namespace
      data:
        registry: "{{ .Values.my_registry }}"
        username: "{{ .Values.my_user }}"
        password: "{{ .Values.my_pass }}"
        email: "{{ .Values.my_mail }}"
      targetSelector:
        - workload-name1
        - workload-name2
```
