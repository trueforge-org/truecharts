#!/usr/bin/env bash
# Checks that a chart depending on the packaged common renders outside of this
# repository, and that its values are validated against the schema of common.
set -o errexit
set -o nounset
set -o pipefail

repo_root=$(git rev-parse --show-toplevel)
scratch_dir=$(mktemp -d)
trap 'rm -rf "$scratch_dir"' EXIT

chart="$scratch_dir/chart"
mkdir -p "$chart/templates" "$scratch_dir/package"
helm package "$repo_root/charts/library/common" --destination "$scratch_dir/package" >/dev/null
tar -xzf "$scratch_dir"/package/common-*.tgz -C "$scratch_dir/package"

cat >"$chart/Chart.yaml" <<EOF
apiVersion: v2
name: schema-test
version: 1.0.0
dependencies:
  - name: common
    version: "*"
    repository: file://$scratch_dir/package/common
EOF
echo '{{ include "tc.v1.common.loader.all" . }}' >"$chart/templates/common.yaml"
cat >"$chart/values.yaml" <<EOF
image:
  repository: ghcr.io/example/app
  tag: 1.0.0
  pullPolicy: IfNotPresent
service:
  main:
    ports:
      main:
        port: 8080
EOF

"$repo_root/.github/scripts/add_chart_schema.sh" "$chart"
[[ -f "$chart/values.schema.json" ]] || {
  echo "The chart did not get a schema" >&2
  exit 1
}

if ! helm template test "$chart" --kube-version 1.33.0 >/dev/null; then
  echo "A chart with valid values failed to render" >&2
  exit 1
fi

check_rejected() {
  local description="$1"
  shift
  local output
  if output=$(helm template test "$chart" --kube-version 1.33.0 "$@" 2>&1); then
    echo "Expected the schema to reject $description" >&2
    exit 1
  fi
  if ! grep -q "don't meet the specifications of the schema" <<<"$output"; then
    echo "Expected a schema error for $description, but got:" >&2
    echo "$output" >&2
    exit 1
  fi
}

# A key of the chart itself, a schema in common alone would not see this
check_rejected "an invalid [service]" --set service=invalid
# Through a $ref, and through the $ref back to the root in dependencies
check_rejected "an invalid [operator.pgVersion]" --set dependencies.postgresql.operator.pgVersion=19
check_rejected "an invalid key in a custom dependency" --set dependencies.custom.service=invalid
# Keys that fail rendering in a dependency, in a predefined and a custom one
check_rejected "[extraTpl] in a dependency" --set 'dependencies.valkey.extraTpl[0]=test'
check_rejected "[dependencies] in a dependency" --set dependencies.custom.dependencies.other.enabled=true

# Partial overrides are fine, the schema sees the values before the defaults of common are merged
cat >"$scratch_dir/partial-values.yaml" <<EOF
global:
  stopAll: true
dependencies:
  valkey:
    depconfig:
      password: example
EOF
if ! helm template test "$chart" --kube-version 1.33.0 -f "$scratch_dir/partial-values.yaml" >/dev/null; then
  echo "A chart with a partial override failed to render" >&2
  exit 1
fi

# The values of every chart have to pass as well, or the chart can not be installed after it is released.
# Only schema errors count, as these charts are not all on this version of common.
export chart
check_values_file() {
  if helm template test "$chart" --kube-version 1.33.0 -f "$1" 2>&1 | grep -A5 "don't meet the specifications of the schema"; then
    echo "Failed: $1"
    return 1
  fi
}
export -f check_values_file
if ! find "$repo_root/charts/stable" "$repo_root/charts/incubator" -maxdepth 2 -name values.yaml -print0 2>/dev/null |
  cat - <(find "$repo_root/charts/library/common-test/ci" -name '*values.yaml' -print0) |
  xargs -0 -P 8 -I{} bash -c 'check_values_file "$1"' _ {}; then
  echo "The values of a chart do not pass the schema" >&2
  exit 1
fi

echo "The schema of common is validated on a chart that depends on it"
