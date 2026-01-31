#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="${1:-.}"

find "$ROOT_DIR" -name Chart.yaml -print0 | while IFS= read -r -d '' chart; do
  echo "Cleaning $chart"

  yq e -i '
    .annotations |=
      with_entries(
        select(.key | test("^truecharts\\.org") | not)
      )
  ' "$chart"
done
