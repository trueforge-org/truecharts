---
title: Priority Class
---

:::note

- See the [Full Examples](/truecharts-common/priorityClass#full-examples) section for complete examples.

:::

## Appears in

- `.Values.priorityClass`

---

## `priorityClass`

PriorityClasses, keyed by name.

| Field | Value |
| --- | --- |
| Key | `priorityClass` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name`

A priority class.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name` |
| Type | `map` |
| Required | ✅ |
| Helm `tpl` | ❌ |
| Default | `{}` |

---

## `$name.preemptionPolicy`

Whether pods of this class may preempt lower priority pods.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.preemptionPolicy` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"PreemptLowerPriority"` |
| Allowed values | `"PreemptLowerPriority"`, `"Never"` |

---

## `$name.enabled`

Create this priority class when true. Accepts a Helm `tpl` string that renders to `true` or `false`.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.enabled` |
| Type | `bool` |
| Required | ✅ |
| Helm `tpl` | ✅ |
| Default | `false` |

---

## `$name.namespace`

Namespace to create this object in. Overrides the chart-wide `namespace` and `global.namespace`.

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.namespace` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `""` |

---

## `$name.labels`

Additional labels for priority class

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.labels` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.annotationsList`

Additional annotations as a list of name and value pairs, merged into the annotations

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.annotationsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.labelsList`

Additional labels as a list of name and value pairs, merged into the labels

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.labelsList` |
| Type | `list of map` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## `$name.annotations`

Additional annotations for priority class

See [Labels, Annotations and Namespace](/truecharts-common/metadata) for all keys of this object.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.annotations` |
| Type | `map` |
| Required | ❌ |
| Helm `tpl` | ✅ (On value only) |
| Default | `{}` |

---

## `$name.value`

Priority value of the class. A higher value means a higher priority.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.value` |
| Type | `int` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `1000000` |

---

## `$name.globalDefault`

Use this class for pods that set no priority class. Only one class in the cluster can be the default.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.globalDefault` |
| Type | `bool` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `false` |

---

## `$name.description`

Description of the priority class.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.description` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | `"No description given"` |

---

## Internal Common Keys

:::warning

These keys are only for the internal use of common. Do not use them in charts that are based on common: they can change or be removed at any time, without a breaking change.

:::

---

## `$name.provisioner`

Not used by the priority class templates. Only set in the priority class fixture of common-test.

| Field | Value |
| --- | --- |
| Key | `priorityClass.$name.provisioner` |
| Type | `string` |
| Required | ❌ |
| Helm `tpl` | ❌ |
| Default | unset |

---

## Full Examples

### Basic PriorityClass

```yaml
priorityClass:
  example:
    enabled: true
    value: 1000000
    preemptionPolicy: PreemptLowerPriority
    globalDefault: false
    description: some description
```

### Never preempt

Pods of this class are placed before lower priority pods in the queue, but never evict running pods:

```yaml
priorityClass:
  non-preempting:
    enabled: true
    value: 500000
    preemptionPolicy: Never
    description: High priority without preemption
```

### Default class and use

A class that is used by every pod without a `priorityClassName`, and a workload that selects another one:

```yaml
priorityClass:
  default-class:
    enabled: true
    value: 1000
    globalDefault: true
    description: Default priority of the pods
    labels:
      key: value
    annotations:
      key: value

podOptions:
  priorityClassName: example

workload:
  main:
    enabled: true
    primary: true
    podSpec:
      priorityClassName: non-preempting
      containers:
        main:
          enabled: true
          primary: true
          imageSelector: image
```
