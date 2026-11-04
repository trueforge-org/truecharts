## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        # Each parameter is passed to PostgreSQL as a string
        postgresql:
          max_connections: "200"
          shared_buffers: "256MB"
```
