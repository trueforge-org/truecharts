#!/bin/bash

curr_chart=$1

if [ -z "$curr_chart" ]; then
    echo "No chart name provided"
    exit 1
fi

echo "Chart name: $curr_chart"
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
helm install kube-prometheus-stack oci://ghcr.io/prometheus-community/charts/kube-prometheus-stack --namespace kube-prometheus-stack --create-namespace \
    --set alertmanager.enabled=false --set grafana.enabled=false --set kubeProxy.enabled=false --wait
if [[ "$?" != "0" ]]; then
    echo "Failed to install kube-prometheus-stack chart"
    exit 1
fi
echo "Done installing kube-prometheus-stack chart"

if [[ $nginx_needed == "true" ]]; then
    echo "Installing ingress-nginx chart"
    helm install ingress-nginx oci://ghcr.io/home-operations/charts-mirror/ingress-nginx --namespace ingress-nginx --create-namespace \
        --set controller.ingressClassResource.default=true --set controller.publishService.enabled=false --set controller.service.type="ClusterIP" --set controller.config.allow-snippet-annotations=true --set controller.config.annotations-risk-level="Critical" --wait
    if [[ "$?" != "0" ]]; then
        echo "Failed to install ingress-nginx chart"
        exit 1
    fi
    echo "Done installing ingress-nginx chart"
fi

if [[ "$curr_chart" == "charts/stable/volsync" ]]; then
    echo "Installing snapshot-controller chart"
    helm install snapshot-controller oci://oci.trueforge.org/truecharts/snapshot-controller --namespace snapshot-controller --create-namespace --wait
    if [[ "$?" != "0" ]]; then
        echo "Failed to install snapshot-controller chart"
        exit 1
    fi
    echo "Done installing snapshot-controller chart"
fi

if [[ "$curr_chart" == "charts/stable/metallb-config" ]]; then
    echo "Installing metallb chart"
    helm install metallb oci://quay.io/metallb/chart/metallb --namespace metallb --create-namespace --wait
    if [[ "$?" != "0" ]]; then
        echo "Failed to install metallb chart"
        exit 1
    fi
    echo "Done installing metallb chart"
fi

if [[ "$curr_chart" == "charts/stable/clusterissuer" ]]; then
    echo "Installing cert-manager chart"
    helm install cert-manager oci://quay.io/jetstack/charts/cert-manager --namespace cert-manager --create-namespace --set crds.enabled=true --wait
    if [[ "$?" != "0" ]]; then
        echo "Failed to install cert-manager chart"
        exit 1
    fi
    echo "Done installing cert-manager chart"
fi

if [[ "$cnpg_enabled" == "true" ]]; then
    echo "Installing cloudnative-pg chart"
    helm install cloudnative-pg oci://ghcr.io/cloudnative-pg/charts/cloudnative-pg --namespace cloudnative-pg --create-namespace --wait
    if [[ "$?" != "0" ]]; then
        echo "Failed to install cloudnative-pg chart"
        exit 1
    fi
    echo "Done installing cloudnative-pg chart"
fi

if [[ "$curr_chart" == "charts/stable/kubernetes-dashboard" ]]; then
    echo "Installing metrics-server chart"
    helm install metrics-server oci://ghcr.io/home-operations/charts-mirror/metrics-server --namespace metrics-server --create-namespace --wait
    if [[ "$?" != "0" ]]; then
        echo "Failed to install metrics-server chart"
        exit 1
    fi
    echo "Done installing metrics-server chart"
fi
