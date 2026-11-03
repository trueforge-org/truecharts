---
title: Certificates
---

:::note

- This page is generated from JSON schema.
- See the [Full Examples](/truecharts-common/dependencies/postgresql/operator/cluster/certificates#full-examples) section for complete examples.

:::

## Appears in

- `.Values.dependencies.postgresql.operator.cluster.certificates`

---

## `dependencies.postgresql.operator.cluster.certificates`

The CA and TLS certificates of the CNPG cluster. The chart does not render this key yet, so it currently has no effect.

| Field      | Value                                                   |
| ---------- | ------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.certificates` |
| Type       | `map, null`                                             |
| Required   | ❌                                                      |
| Helm `tpl` | ❌                                                      |
| Default    | unset                                                   |

---

### `dependencies.postgresql.operator.cluster.certificates.clientCASecret`

Name of the secret that contains the CA certificate for the client certificates.

| Field      | Value                                                                  |
| ---------- | ---------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.certificates.clientCASecret` |
| Type       | `string`                                                               |
| Required   | ❌                                                                     |
| Helm `tpl` | ❌                                                                     |
| Default    | unset                                                                  |

---

### `dependencies.postgresql.operator.cluster.certificates.replicationTLSSecret`

Name of the secret that contains the TLS certificate for streaming replication.

| Field      | Value                                                                        |
| ---------- | ---------------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.certificates.replicationTLSSecret` |
| Type       | `string`                                                                     |
| Required   | ❌                                                                           |
| Helm `tpl` | ❌                                                                           |
| Default    | unset                                                                        |

---

### `dependencies.postgresql.operator.cluster.certificates.serverAltDNSNames`

Additional DNS names to add to the server certificate.

| Field      | Value                                                                     |
| ---------- | ------------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.certificates.serverAltDNSNames` |
| Type       | `list of string`                                                          |
| Required   | ❌                                                                        |
| Helm `tpl` | ❌                                                                        |
| Default    | unset                                                                     |

---

### `dependencies.postgresql.operator.cluster.certificates.serverCASecret`

Name of the secret that contains the CA certificate for the server certificates.

| Field      | Value                                                                  |
| ---------- | ---------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.certificates.serverCASecret` |
| Type       | `string`                                                               |
| Required   | ❌                                                                     |
| Helm `tpl` | ❌                                                                     |
| Default    | unset                                                                  |

---

### `dependencies.postgresql.operator.cluster.certificates.serverTLSSecret`

Name of the secret that contains the TLS certificate for the server.

| Field      | Value                                                                   |
| ---------- | ----------------------------------------------------------------------- |
| Key        | `dependencies.postgresql.operator.cluster.certificates.serverTLSSecret` |
| Type       | `string`                                                                |
| Required   | ❌                                                                      |
| Helm `tpl` | ❌                                                                      |
| Default    | unset                                                                   |

---

## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        labels:
          label1: label1
          label2: label2
        annotations:
          annotation1: annotation1
          annotation2: annotation2
        env:
          key: value
        envFrom:
          - secretRef:
            name: my-secret
            expandObjectName: true
          - configMapRef:
            name: my-configmap
            expandObjectName: false
        instances: 2
        singleNode: false
        logLevel: info
        primaryUpdateMethod: # TODO
        primaryUpdateStrategy: # TODO
        certificates: # TODO
        postgresql: # TODO
        initdb: # TODO
        primaryUpdateStrategy: # TODO
```
