#!/bin/bash
# https://github.com/helm-unittest/helm-unittest

# -- You need to install this helm plugin (use the latest Helm and helm-unittest)
# Helm 4: helm plugin install https://github.com/helm-unittest/helm-unittest --verify=false
# Helm 3: helm plugin install https://github.com/helm-unittest/helm-unittest

common_test_path="charts/library/common-test"

function cleanup {
  if [ -d "$common_test_path/charts" ]; then
    echo "🧹 Cleaning up charts..."
    rm -r "$common_test_path/charts"
    rm -f "$common_test_path/Chart.lock"
  fi
  # Clean snapshots
  find "$common_test_path" -type d -name __snapshot__ -exec rm -r {} +
}

cleanup

echo "🔨 Building common..."
if ! helm dependency update "$common_test_path"; then
  echo "❌ Failed to build common"
  cleanup
  exit 1
fi

echo "🧪 Running tests..."
# Run from the chart directory, same as CI (.github/workflows/common-tests.yaml)
(cd "$common_test_path" && helm unittest --update-snapshot -f "tests/**/*.yaml" . -v ./unit-values.yaml)
result=$?

cleanup

exit $result
