---
applyTo: "charts/library/common/docs/**,charts/library/common/examples/**,charts/library/common/docs-pages.yaml,charts/library/common/complete-values-structure.yaml,charts/library/common/template-keys-structure.yaml,charts/library/common/generate_*.py,charts/library/common/check_*.py"
paths:
  - "charts/library/common/docs/**"
  - "charts/library/common/examples/**"
  - "charts/library/common/docs-pages.yaml"
  - "charts/library/common/complete-values-structure.yaml"
  - "charts/library/common/template-keys-structure.yaml"
  - "charts/library/common/generate_*.py"
  - "charts/library/common/check_*.py"
description: "Rules for the generated common library docs, examples and structure files, and the generators that build them"
---

# Common library docs and generated files

These rules apply to `charts/library/common/docs/`, `examples/`, `docs-pages.yaml`, the structure files and the generator scripts. They add to the library rules in [`common-library.instructions.md`](common-library.instructions.md) and the general rules in [`AGENTS.md`](../../AGENTS.md).

| Path (`charts/library/common/`) | Purpose |
| --- | --- |
| `docs/` | User documentation, published at <https://trueforge.org/truecharts-common>. Generated from the schema, except `docs/dependencies.md`. |
| `examples/**/*.md` | The `## Full Examples` sections of the generated docs pages. |
| `docs-pages.yaml` | Lists each docs page with its values path, title and the keys rendered inline. Every schema key must be covered by a page. |
| `complete-values-structure.yaml`, `template-keys-structure.yaml` | Generated lists of the keys used in values files and templates, for the schema coverage check. |
| `stable-legacy-keys.yaml`, `legacy_keys.py` | Keys that charts still set but no template reads, and the helper that leaves them out in `test_schema.py` and `generate_complete_values_structure.py`. |
| `*.py` | Generators and checks for the docs, structure files and schema. |

## Generated docs

- `docs/**` is generated from the schemas by `generate_docs.py`, except `docs/dependencies.md`, which is written by hand (see [`common-library-dependencies.instructions.md`](common-library-dependencies.instructions.md)). Generated pages say "This page is generated from JSON schema". Do not edit them by hand.
  - Change the schema, or the `## Full Examples` section in `examples/<page>.md`, which mirrors the path of the page in `docs/`.
  - Then run `python3 charts/library/common/generate_docs.py`. By default it also checks the structure and formatting of the pages.
  - List new pages and their values paths in `docs-pages.yaml`.
  - `python3 charts/library/common/generate_docs.py --check` fails when the pages are not up to date, or when a file in `examples/` has no page. CI runs it. Text that only exists in a page is lost on the next run, so put text about a key in its schema `description`, and other sections after `## Full Examples` in `examples/`.

## Generated structure files

- `complete-values-structure.yaml` is rebuilt on every run from the `common` and `common-test` values files, the `set:` blocks of the `common-test` unittests, and the values files of charts under `charts/stable` and `charts/incubator`. Charts only add keys under root-level keys defined by the library, never new root-level keys.
- `template-keys-structure.yaml` lists the keys the templates read. `generate_template_keys_structure.py` maps `$objectData` in `class/` and `lib/` through `OBJECT_DATA_OWNERS`, by the place of the file; add a file or directory there when you add a template that renders an object. Keys that spawners compute themselves are in `INTERNAL_OBJECT_KEYS`. `generate_template_keys_structure.py --check` fails when the file is not up to date, `./run_common_tests.sh` runs it.
- Regenerate them after changing values or templates:

  ```bash
  pip install PyYAML ruamel.yaml
  python3 charts/library/common/generate_complete_values_structure.py
  python3 charts/library/common/generate_template_keys_structure.py
  ```

- The generated files are not always up to date. Commit only the generated changes that belong to your change. Mention unrelated changes from a generator, or a generator check that already fails, in your summary or PR, instead of fixing them in the same PR.
- `check_complete_values_schema_coverage.py` must report 100% coverage of both structure files, see [Schema checks](common-library-schema.instructions.md#schema-checks).
