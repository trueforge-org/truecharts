#!/usr/bin/env bash
# Runs the Valkey dependency of common-test on a real cluster, and checks what rendering can't:
# that the app waits for Valkey, can reach it, and that the data survives restarts and upgrades.
set -euo pipefail

chart="charts/library/common-test"
values="${chart}/ci/valkey-values.yaml"
# Does not contain the chart name, so the object names get expanded
release="vk-runtime"
namespace="vk-runtime"
valkey="${release}-common-test-valkey-main"
app="${release}-common-test"
secret="${release}-valkeycreds"

log() { echo -e "\n=== $*"; }
fail() {
  echo "FAILED: $*" >&2
  exit 1
}
expect() {
  local name="$1" want="$2" got="$3"
  if [[ "${got}" != "${want}" ]]; then
    fail "${name}: expected [${want}], got [${got}]"
  fi
  echo "ok: ${name}"
}
debug() {
  local rc=$?
  if [[ "${rc}" -ne 0 ]]; then
    log "Debug output"
    kubectl get all,pvc -n "${namespace}" -o wide || true
    kubectl get events -n "${namespace}" --sort-by=.lastTimestamp | tail -30 || true
    kubectl logs -n "${namespace}" "statefulset/${valkey}" --tail=50 || true
    kubectl logs -n "${namespace}" "deployment/${app}" --all-containers --tail=50 || true
  fi
}
trap debug EXIT

app_pod() {
  kubectl get pods -n "${namespace}" -l "app.kubernetes.io/instance=${release},pod.name=main" \
    -o jsonpath='{.items[0].metadata.name}'
}
client() { kubectl exec -n "${namespace}" client -- "$@"; }
valkey_cli() { client valkey-cli -u "${url}" "$@"; }
wait_valkey() { kubectl rollout status -n "${namespace}" "statefulset/${valkey}" --timeout=180s; }

helm dependency build "${chart}"

log "The app waits while Valkey is down"
helm install "${release}" "${chart}" -n "${namespace}" --create-namespace -f "${values}" \
  --set dependencies.valkey.workload.main.replicas=0

for _ in $(seq 1 30); do
  pod="$(app_pod 2>/dev/null || true)"
  [[ -n "${pod}" ]] && kubectl logs -n "${namespace}" "${pod}" -c "${app}-system-valkey-wait" 2>/dev/null |
    grep -q "Valkey not responding" && break
  sleep 5
done
pod="$(app_pod)"
kubectl logs -n "${namespace}" "${pod}" -c "${app}-system-valkey-wait" | grep -q "Valkey not responding" ||
  fail "valkey-wait did not report that Valkey is down"
expect "app is held back by valkey-wait" "" \
  "$(kubectl get pod -n "${namespace}" "${pod}" -o jsonpath='{.status.containerStatuses[0].state.running}')"

log "The app starts once Valkey is up"
kubectl scale -n "${namespace}" "statefulset/${valkey}" --replicas=1
wait_valkey
kubectl rollout status -n "${namespace}" "deployment/${app}" --timeout=180s
kubectl logs -n "${namespace}" "$(app_pod)" -c "${app}-system-valkey-wait" | grep -q "Valkey Responded" ||
  fail "valkey-wait did not report that Valkey responded"
echo "ok: valkey-wait finished by itself"
expect "valkey has no wait for itself" "" \
  "$(kubectl get statefulset -n "${namespace}" "${valkey}" -o jsonpath='{.spec.template.spec.initContainers[*].name}')"

log "The credentials work"
url="$(kubectl get secret -n "${namespace}" "${secret}" -o jsonpath='{.data.url}' | base64 -d)"
host="$(kubectl get secret -n "${namespace}" "${secret}" -o jsonpath='{.data.plainhost}' | base64 -d)"
expect "host in the secret is the service" "${valkey}" "${host}"
kubectl get service -n "${namespace}" "${host}" >/dev/null
expect "app gets the same url" "${url}" \
  "$(kubectl get deployment -n "${namespace}" "${app}" -o jsonpath='{.spec.template.spec.containers[0].env[?(@.name=="REDIS_URL")].value}')"

image="$(kubectl get deployment -n "${namespace}" "${app}" -o jsonpath='{.spec.template.spec.initContainers[?(@.name=="'"${app}"'-system-valkey-wait")].image}')"
kubectl run client -n "${namespace}" --image="${image}" --restart=Never --command -- sleep infinity
kubectl wait -n "${namespace}" pod/client --for=condition=Ready --timeout=120s

expect "ping with the url" "PONG" "$(valkey_cli ping)"
expect "ping without a password is refused" "NOAUTH Authentication required." \
  "$(client valkey-cli -h "${host}" ping 2>&1)"
expect "set" "OK" "$(valkey_cli set runtime:first one)"
expect "get" "one" "$(valkey_cli get runtime:first)"

log "AOF is on, and in the volume"
expect "appendonly" "yes" "$(valkey_cli config get appendonly | tail -1)"
expect "dir" "/config" "$(valkey_cli config get dir | tail -1)"
kubectl get pvc -n "${namespace}" "${valkey%-main}-data" >/dev/null

log "The data survives a crash"
expect "set" "OK" "$(valkey_cli set runtime:crash two)"
# AOF syncs every second
sleep 3
kubectl delete pod -n "${namespace}" "${valkey}-0" --grace-period=0 --force
sleep 5
wait_valkey
kubectl wait -n "${namespace}" "pod/${valkey}-0" --for=condition=Ready --timeout=180s
expect "first key after a crash" "one" "$(valkey_cli get runtime:first)"
expect "second key after a crash" "two" "$(valkey_cli get runtime:crash)"

log "The data survives a full stop"
kubectl scale -n "${namespace}" "statefulset/${valkey}" --replicas=0
kubectl wait -n "${namespace}" "pod/${valkey}-0" --for=delete --timeout=120s
kubectl scale -n "${namespace}" "statefulset/${valkey}" --replicas=1
wait_valkey
kubectl wait -n "${namespace}" "pod/${valkey}-0" --for=condition=Ready --timeout=180s
expect "key after a full stop" "two" "$(valkey_cli get runtime:crash)"

log "The data and credentials survive a chart upgrade"
helm upgrade "${release}" "${chart}" -n "${namespace}" -f "${values}" --wait --timeout 250s
expect "url after an upgrade" "${url}" \
  "$(kubectl get secret -n "${namespace}" "${secret}" -o jsonpath='{.data.url}' | base64 -d)"
expect "key after an upgrade" "two" "$(valkey_cli get runtime:crash)"

log "All Valkey runtime checks passed"
