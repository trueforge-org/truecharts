#!/bin/bash

curr_chart=$1
dependency_selector=${2:-}

if [ -z "$curr_chart" ]; then
    echo "No chart name provided"
    exit 1
fi

echo "Chart name: $curr_chart"

# renovate: datasource=helm depName=kube-prometheus-stack repository=oci://ghcr.io/prometheus-community/charts
KUBE_PROMETHEUS_STACK_CHART_VERSION="82.0.0"
# renovate: datasource=helm depName=ingress-nginx repository=oci://ghcr.io/home-operations/charts-mirror
INGRESS_NGINX_CHART_VERSION="4.13.0"
# renovate: datasource=helm depName=snapshot-controller repository=oci://oci.trueforge.org/truecharts
SNAPSHOT_CONTROLLER_CHART_VERSION="4.15.0"
# renovate: datasource=helm depName=metallb repository=oci://quay.io/metallb/chart
METALLB_CHART_VERSION="0.15.3"
# renovate: datasource=helm depName=cert-manager repository=oci://quay.io/jetstack/charts
CERT_MANAGER_CHART_VERSION="v1.19.3"
# renovate: datasource=helm depName=cloudnative-pg repository=oci://ghcr.io/cloudnative-pg/charts
CLOUDNATIVE_PG_CHART_VERSION="0.27.1"
# renovate: datasource=helm depName=metrics-server repository=oci://ghcr.io/home-operations/charts-mirror
METRICS_SERVER_CHART_VERSION="3.13.0"
# renovate: datasource=helm depName=volsync repository=oci://oci.trueforge.org/truecharts
VOLSYNC_CHART_VERSION="3.15.16"
HELM_WAIT_TIMEOUT="15m"

helm_install_with_retry() {
    local release="$1"
    shift

    for attempt in 1 2 3; do
        echo "Installing ${release} (attempt ${attempt}/3)..."
        if helm install "${release}" "$@" --wait --timeout "${HELM_WAIT_TIMEOUT}"; then
            return 0
        fi

        if [[ "${attempt}" -lt 3 ]]; then
            echo "Retrying ${release} after transient install failure..."
            helm uninstall "${release}" --ignore-not-found --wait || true
            sleep $((attempt * 15))
        fi
    done

    echo "Failed to install ${release} after 3 attempts"
    return 1
}

if [[ "$curr_chart" == "charts/library/common-test" ]] && [[ -n "$dependency_selector" ]]; then
    echo "Dependency selector: $dependency_selector"

    if [[ "$dependency_selector" =~ (ingress|metrics|cnpg|volsync).*-values.yaml ]]; then
        if ! helm_install_with_retry kube-prometheus-stack oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack --namespace kube-prometheus-stack --create-namespace --version "$KUBE_PROMETHEUS_STACK_CHART_VERSION" --set alertmanager.enabled=false --set grafana.enabled=false --set kubeProxy.enabled=false; then
            echo "Failed to install kube-prometheus-stack chart"
            exit 1
        fi
    fi

    if [[ "$dependency_selector" =~ cnpg.*-values.yaml ]]; then
        if ! helm_install_with_retry cloudnative-pg oci://ghcr.io/cloudnative-pg/charts/cloudnative-pg --namespace cloudnative-pg --create-namespace --version "$CLOUDNATIVE_PG_CHART_VERSION"; then
            echo "Failed to install cloudnative-pg chart"
            exit 1
        fi
    fi

    if [[ "$dependency_selector" =~ ingress.*-values.yaml ]]; then
        if ! helm_install_with_retry cert-manager oci://quay.io/jetstack/charts/cert-manager --namespace cert-manager --create-namespace --version "$CERT_MANAGER_CHART_VERSION" --set crds.enabled=true; then
            echo "Failed to install cert-manager chart"
            exit 1
        fi

        if ! helm_install_with_retry ingress-nginx oci://ghcr.io/home-operations/charts-mirror/ingress-nginx --namespace ingress-nginx --create-namespace --version "$INGRESS_NGINX_CHART_VERSION" --set controller.ingressClassResource.default=true --set controller.publishService.enabled=false --set controller.service.type="ClusterIP" --set controller.config.allow-snippet-annotations=true --set controller.config.annotations-risk-level="Critical"; then
            echo "Failed to install ingress-nginx chart"
            exit 1
        fi
    fi

    if [[ "$dependency_selector" =~ volsync.*-values.yaml ]]; then
        if ! helm_install_with_retry snapshot-controller oci://oci.trueforge.org/truecharts/snapshot-controller --namespace snapshot-controller --create-namespace --version "$SNAPSHOT_CONTROLLER_CHART_VERSION"; then
            echo "Failed to install snapshot-controller chart"
            exit 1
        fi

        if ! helm_install_with_retry volsync oci://oci.trueforge.org/truecharts/volsync --namespace volsync --create-namespace --version "$VOLSYNC_CHART_VERSION"; then
            echo "Failed to install volsync chart"
            exit 1
        fi
    fi

    exit 0
fi

values_yaml=$(cat "$curr_chart/values.yaml")
cnpg_enabled=$(go-yq '.cnpg | map(.enabled) | any' <<<"$values_yaml")
ingress_required=$(go-yq '.ingress | map(.required) | any' <<<"$values_yaml")
ingress_enabled=$(go-yq '.ingress | map(.enabled) | any' <<<"$values_yaml")
nginx_needed="false"
if [[ "$ingress_required" == "true" ]] || [[ "$ingress_enabled" == "true" ]]; then
    nginx_needed="true"
else
    for ci_values in "$curr_chart"/ci/*values.yaml; do
        ci_values_yaml=$(cat "$ci_values")
        ingress_enabled=$(go-yq '.ingress | map(.enabled) | any' <<<"$ci_values_yaml")
        if [[ "$ingress_enabled" == "true" ]]; then
            nginx_needed="true"
            break
        fi
    done
fi

echo "Installing kube-prometheus-stack chart"
if ! helm_install_with_retry kube-prometheus-stack oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack --namespace kube-prometheus-stack --create-namespace \
    --version "$KUBE_PROMETHEUS_STACK_CHART_VERSION" --set alertmanager.enabled=false --set grafana.enabled=false --set kubeProxy.enabled=false; then
    echo "Failed to install kube-prometheus-stack chart"
    exit 1
fi
echo "Done installing kube-prometheus-stack chart"

if [[ $nginx_needed == "true" ]]; then
    echo "Installing ingress-nginx chart"
    if ! helm_install_with_retry ingress-nginx oci://ghcr.io/home-operations/charts-mirror/ingress-nginx --namespace ingress-nginx --create-namespace \
        --version "$INGRESS_NGINX_CHART_VERSION" --set controller.ingressClassResource.default=true --set controller.publishService.enabled=false --set controller.service.type="ClusterIP" --set controller.config.allow-snippet-annotations=true --set controller.config.annotations-risk-level="Critical"; then
        echo "Failed to install ingress-nginx chart"
        exit 1
    fi
    echo "Done installing ingress-nginx chart"
fi

if [[ "$curr_chart" == "charts/stable/volsync" ]]; then
    echo "Installing snapshot-controller chart"
    if ! helm_install_with_retry snapshot-controller oci://oci.trueforge.org/truecharts/snapshot-controller --namespace snapshot-controller --create-namespace --version "$SNAPSHOT_CONTROLLER_CHART_VERSION"; then
        echo "Failed to install snapshot-controller chart"
        exit 1
    fi
    echo "Done installing snapshot-controller chart"
fi

if [[ "$curr_chart" == "charts/stable/metallb-config" ]]; then
    echo "Installing metallb chart"
    if ! helm_install_with_retry metallb oci://quay.io/metallb/chart/metallb --namespace metallb --create-namespace --version "$METALLB_CHART_VERSION"; then
        echo "Failed to install metallb chart"
        exit 1
    fi
    echo "Done installing metallb chart"
fi

if [[ "$curr_chart" == "charts/stable/clusterissuer" ]]; then
    echo "Installing cert-manager chart"
    if ! helm_install_with_retry cert-manager oci://quay.io/jetstack/charts/cert-manager --namespace cert-manager --create-namespace --version "$CERT_MANAGER_CHART_VERSION" --set crds.enabled=true; then
        echo "Failed to install cert-manager chart"
        exit 1
    fi
    echo "Done installing cert-manager chart"
fi

if [[ "$cnpg_enabled" == "true" ]]; then
    echo "Installing cloudnative-pg chart"
    if ! helm_install_with_retry cloudnative-pg oci://ghcr.io/cloudnative-pg/charts/cloudnative-pg --namespace cloudnative-pg --create-namespace --version "$CLOUDNATIVE_PG_CHART_VERSION"; then
        echo "Failed to install cloudnative-pg chart"
        exit 1
    fi
    echo "Done installing cloudnative-pg chart"
fi

if [[ "$curr_chart" == "charts/stable/kubernetes-dashboard" ]]; then
    echo "Installing metrics-server chart"
    if ! helm_install_with_retry metrics-server oci://ghcr.io/home-operations/charts-mirror/metrics-server --namespace metrics-server --create-namespace --version "$METRICS_SERVER_CHART_VERSION"; then
        echo "Failed to install metrics-server chart"
        exit 1
    fi
    echo "Done installing metrics-server chart"
fi
