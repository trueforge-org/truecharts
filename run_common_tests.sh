#!/bin/bash
# https://github.com/helm-unittest/helm-unittest

# -- You need to install this helm plugin
# helm plugin install https://github.com/helm-unittest/helm-unittest

common_test_path="charts/library/common-test"
common_schema_test_script="charts/library/common/test_schema.py"
common_coverage_script="charts/library/common/check_complete_values_schema_coverage.py"

function cleanup {
  if [ -d "$common_test_path/charts" ]; then
    echo "🧹 Cleaning up charts..."
    rm -r "$common_test_path/charts"
    rm "$common_test_path/Chart.lock"
    # Clean snapshots
    rm -r "$common_test_path/**/__snapshot__" 2>/dev/null
  fi
}

cleanup

echo "🔨 Building common..."
helm dependency update "$common_test_path"

echo "🧪 Running tests..."
helm unittest --update-snapshot -f "tests/*/*.yaml" "./$common_test_path" -v ./$common_test_path/unit-values.yaml

echo "🧪 Running common schema validation..."
schema_args=()
if [ -n "${SCHEMA_MAX_FAILURES:-}" ]; then
  schema_args+=(--max-failures "$SCHEMA_MAX_FAILURES")
fi
python3 "$common_schema_test_script" "${schema_args[@]}"

echo "📊 Running complete-values schema coverage check..."
python3 "$common_coverage_script"

cleanup
