## Full Examples

```yaml
dependencies:
  postgresql:
    operator:
      cluster:
        initdb:
          encoding: UTF8
          localeCollate: C
          localeCtype: C
          dataChecksums: true
          postInitApplicationSQL:
            - CREATE EXTENSION IF NOT EXISTS pg_trgm;
```
