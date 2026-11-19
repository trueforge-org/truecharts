## Full Examples

### Spread over the racks

Keep the number of Valkey pods per rack within one of each other, and keep a pod `Pending` when that is not possible:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      scheduling:
        topologySpreadConstraints:
          - maxSkew: 1
            topologyKey: topology.example.com/rack
            whenUnsatisfiable: DoNotSchedule
```

### More than one topology key

Spread over the regions strictly, and over the racks as a preference:

```yaml
dependencies:
  valkey:
    enabled: true
    mode: operator
    operator:
      scheduling:
        topologySpreadConstraints:
          - maxSkew: 1
            topologyKey: topology.kubernetes.io/region
            whenUnsatisfiable: DoNotSchedule
          - maxSkew: 2
            topologyKey: topology.example.com/rack
            whenUnsatisfiable: ScheduleAnyway
```
