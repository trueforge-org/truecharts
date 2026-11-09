# TrueCharts instructions for Claude Code

These are the TrueCharts-specific parts of the shared `CLAUDE.md`, which is managed in `trueforge-org/.github`.

- The area-specific rules live in `.github/instructions/` and are symlinked into `.claude/rules/`, so Claude Code loads each one only when it works on files matching its `paths:` frontmatter. Update those files, not the shared `CLAUDE.md`.
- Work on many charts counts as repetitive work, so delegate it to agents as well.
- The `haiku-triage` rule covers `./run_common_tests.sh`, `helm unittest`, `test_schema.py`, the `check_*.py` and `generate_*.py --check` scripts, `tc-lint.sh`, `helm lint`, `pre-commit` and `markdownlint` over many files.
