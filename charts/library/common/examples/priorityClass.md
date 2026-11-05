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
