#!/bin/bash
# Runs the common library tests the same way CI does (.github/workflows/common-tests.yaml):
#   1. helm-unittest suites of charts/library/common-test
#   2. common JSON schema validation and coverage check (only when the schema tooling exists)
#
# Missing tools are installed automatically, always the latest release:
#   - Helm:          https://github.com/helm/helm (official get-helm-4 script)
#   - helm-unittest: https://github.com/helm-unittest/helm-unittest
#
# Environment variables:
#   UPDATE_TOOLS=1               Reinstall the latest Helm and helm-unittest even if already installed
#   UNITTEST_FILES=<glob>        Suites to run, relative to common-test (default: tests/**/*.yaml)
#   SKIP_SCHEMA_TESTS=1          Skip the schema validation and coverage checks (for quick iteration only)
#   SCHEMA_MAX_FAILURES=<n>      Passed to test_schema.py as --max-failures
#   HELM_INSTALL_DIR / USE_SUDO  Forwarded to the Helm install script (default /usr/local/bin, with sudo)

cd "$(dirname "$0")" || exit 1

common_test_path="charts/library/common-test"
common_schema_test_script="charts/library/common/test_schema.py"
common_coverage_script="charts/library/common/check_complete_values_schema_coverage.py"
helm_install_script="https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4"
helm_unittest_repo="https://github.com/helm-unittest/helm-unittest"
scratch_dir=""


function cleanup {
  if [ -n "$scratch_dir" ] && [ -d "$scratch_dir" ]; then
    echo "🧹 Cleaning up..."
    rm -rf "$scratch_dir"
  fi
}

function fail {
  echo "❌ $1"
  exit "${2:-1}"
}

function helm_major_version {
  helm version --template '{{.Version}}' 2>/dev/null | sed -E 's/^v([0-9]+).*/\1/'
}

function ensure_helm {
  if command -v helm >/dev/null 2>&1 && [ "${UPDATE_TOOLS:-}" != "1" ]; then
    if [ "$(helm_major_version)" -lt 4 ] 2>/dev/null; then
      echo "⚠️ Helm $(helm version --short) found, use the latest Helm. Run with UPDATE_TOOLS=1 to upgrade."
    fi
    return 0
  fi
  command -v curl >/dev/null 2>&1 || fail "curl is required to install Helm"
  echo "📦 Installing latest Helm..."
  curl -fsSL "$helm_install_script" | bash || fail "Failed to install Helm"
  command -v helm >/dev/null 2>&1 || fail "Helm installed but not on PATH (HELM_INSTALL_DIR=${HELM_INSTALL_DIR:-/usr/local/bin})"
}

function ensure_helm_unittest {
  if helm plugin list 2>/dev/null | awk 'NR > 1 { print $1 }' | grep -qx unittest; then
    [ "${UPDATE_TOOLS:-}" != "1" ] && return 0
    # "helm plugin update" fails on Helm 4 for git-installed plugins, so reinstall instead
    echo "♻️ Reinstalling latest helm-unittest..."
    helm plugin uninstall unittest || fail "Failed to uninstall helm-unittest"
  else
    echo "📦 Installing latest helm-unittest..."
  fi
  local install_args=("$helm_unittest_repo")
  # Helm 4 verifies plugins by default, which the helm-unittest source does not support
  if [ "$(helm_major_version)" -ge 4 ] 2>/dev/null; then
    install_args+=(--verify=false)
  fi
  helm plugin install "${install_args[@]}" || fail "Failed to install helm-unittest"
}

function ensure_python_deps {
  command -v python3 >/dev/null 2>&1 || fail "python3 is required for the common schema checks"
  if ! python3 -c 'import yaml' >/dev/null 2>&1; then
    echo "📦 Installing PyYAML..."
    python3 -m pip install --quiet PyYAML ||
      fail "PyYAML is missing and could not be installed, run: pip install PyYAML ruamel.yaml (e.g. in a venv)"
  fi
}

ensure_helm
ensure_helm_unittest
echo "ℹ️ Helm $(helm version --short), helm-unittest $(helm plugin list | awk '$1 == "unittest" { print $2 }')"

trap cleanup EXIT
trap 'exit 130' INT TERM

# The unit tests run in a scratch copy, so no build artifacts or snapshots end up in the repository.
# The "$id" of values.schema.json holds the CI checkout path, and its "$ref"s resolve relative to it.
# The copy points it to itself, the file in the repository must keep the CI path.
scratch_dir="$(mktemp -d)" || fail "Failed to create a scratch directory"
cp -R charts/library "$scratch_dir/" || fail "Failed to copy charts/library"
common_test_path="$scratch_dir/library/common-test"
scratch_schema="$scratch_dir/library/common/values.schema.json"
rm -rf "$common_test_path/charts" "$common_test_path/Chart.lock"
if [ -f "$scratch_schema" ]; then
  escaped_id="$(printf '%s' "file://$scratch_schema" | sed 's/[\\&#]/\\&/g')"
  if ! sed -E "s#(\"\\\$id\"[[:space:]]*:[[:space:]]*\")[^\"]*\"#\1${escaped_id}\"#" "$scratch_schema" > "$scratch_schema.tmp" ||
    ! mv "$scratch_schema.tmp" "$scratch_schema"; then
    fail "Failed to point the \$id of values.schema.json to the scratch copy"
  fi
fi

echo "🔨 Building common..."
helm dependency update "$common_test_path" || fail "Failed to build common"

echo "🧪 Running tests..."
# Run from the chart directory, same as CI
(cd "$common_test_path" && helm unittest -f "${UNITTEST_FILES:-tests/**/*.yaml}" . -v ./unit-values.yaml)
result=$?
[ "$result" -eq 0 ] || fail "Unit tests failed" "$result"

if [ -f "$common_schema_test_script" ]; then
  if [ "${SKIP_SCHEMA_TESTS:-}" = "1" ]; then
    echo "⚠️ Schema checks skipped (SKIP_SCHEMA_TESTS=1), CI still runs them"
  else
    ensure_python_deps

    echo "🧪 Running common schema validation..."
    schema_args=()
    if [ -n "${SCHEMA_MAX_FAILURES:-}" ]; then
      schema_args+=(--max-failures "$SCHEMA_MAX_FAILURES")
    fi
    python3 "$common_schema_test_script" "${schema_args[@]}"
    result=$?
    [ "$result" -eq 0 ] || fail "Schema validation failed, see stable_schema_validation.log" "$result"

    echo "📊 Running complete-values schema coverage check..."
    python3 "$common_coverage_script"
    result=$?
    [ "$result" -eq 0 ] || fail "Schema coverage check failed" "$result"
  fi
fi


echo "🧪 Running common schema validation..."
schema_args=()
if [ -n "${SCHEMA_MAX_FAILURES:-}" ]; then
  schema_args+=(--max-failures "$SCHEMA_MAX_FAILURES")
fi
python3 "$common_schema_test_script" "${schema_args[@]}" || { status=$?; cleanup; exit "$status"; }

echo "📊 Running complete-values schema coverage check..."
python3 "$common_coverage_script" || { status=$?; cleanup; exit "$status"; }

cleanup

echo "✅ Common tests passed"

