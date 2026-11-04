## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        # Promote a replica during an update, instead of restarting the primary
        primaryUpdateMethod: switchover
```
