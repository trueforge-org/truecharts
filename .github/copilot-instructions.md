# Copilot instructions for TrueCharts

- This repository primarily contains Helm charts under `charts/`.
- When changing chart files (other than docs like `README.md`), also bump that chart version in its `Chart.yaml`.
- Keep changes minimal and scoped to the requested chart or library component.
- Run `pre-commit` on your changes before finalizing.
- When editing `charts/library/common`, also update the Helm unit tests in `charts/library/common-test` accordingly.
- For common library changes, run `./run_common_tests.sh` (requires the Helm `unittest` plugin).
- Dont manually alter chart readme's or changelogs
