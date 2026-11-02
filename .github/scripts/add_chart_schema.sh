#!/usr/bin/env bash
# Copies the schema of the common version a chart depends on into the chart.
# Helm validates a subchart's schema only against the values of that subchart,
# so the values of a chart are only validated with a schema in the chart itself.
set -o errexit
set -o nounset
set -o pipefail

chart=${1:?"No chart path provided"}

if grep -qE '^type: *library' "$chart/Chart.yaml"; then
  exit 0
fi

# Pulls from the registry occasionally fail with "unexpected EOF"
for attempt in 1 2 3; do
  if helm dependency build "$chart" >/dev/null; then
    break
  fi
  if [[ "$attempt" == 3 ]]; then
    echo "Failed to build the dependencies of [$chart]" >&2
    exit 1
  fi
  sleep 5
done

common_package=$(find "$chart/charts" -maxdepth 1 -name 'common-*.tgz' 2>/dev/null | head -n 1)
if [[ -z "$common_package" ]]; then
  echo "[$chart] does not depend on common, not adding a schema"
  exit 0
fi

# Versions of common from before the schema do not have the file
if ! tar -tzf "$common_package" common/values.schema.json >/dev/null 2>&1; then
  echo "$(basename "$common_package") has no schema, not adding one to [$chart]"
  exit 0
fi

tar -xzOf "$common_package" common/values.schema.json >"$chart/values.schema.json"
echo "Added the schema of $(basename "$common_package") to [$chart]"
