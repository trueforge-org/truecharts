---
title: Multus
---

It is strongly recommended to check out the Multus [project documentation](https://github.com/k8snetworkplumbingwg/multus-cni/tree/master/docs) before
you start configuring this chart.

## Integrations

### Cilium

Cilium is an exclusive CNI by default and needs to be configured to allow interoperation with other CNIs.

To do this, the following value needs to be added to the Cilium chart:

```yaml
cni:
  exclusive: false
```

### Talos

Talos does not ship all reference CNI plugins by default. You can check which
CNI plugins are available in your talos install using the following command:

```bash
$ talosctl list /opt/cni/bin
NODE        NAME
192.168.1.10   .
192.168.1.10   bridge
192.168.1.10   cilium-cni
192.168.1.10   firewall
192.168.1.10   flannel
192.168.1.10   host-local
192.168.1.10   ipvlan
192.168.1.10   loopback
192.168.1.10   macvlan
192.168.1.10   multus-shim
192.168.1.10   passthru
192.168.1.10   portmap
```

If you find that the plugins you require are missing, you can use this chart to
install them. To do so, you must enable the Talos integration and specify
which CNI binaries you would like to have installed. For example:

```yaml
multus:
  integrations:
    talos:
      enabled: true
      installCni:
        macvlan: true
        ipvlan: true
```

The above configuration will install the `macvlan` and `ipvlan` CNI plugins. This
is the default behaviour (as long as the talos integration is enabled), however,
it can be disabled by setting the value of any of corresponding keys to `false`.
On the other hand, more CNI plugins can be specified for installation by adding
their names under the `installCni` map in the form of `<binary_name>: true`.

:::danger
If the Talos integration is enabled, this chart assumes it has full control
over all CNIs listed in `integrations.talos.installCni`(and set to `true`).
During [uninstall](#uninstalling), it will remove all CNIs that are enabled
(`true`). If this is undesired, set the keys of the relevant CNI names to `false`
before enabling the [uninstall](#uninstalling) chart mode.
:::


## Adding network interfaces to workloads

Adding a network interface to a workload consists of 2 steps:

1. Defining the interface template via `NetworkAttachementDefinition` CRD.
2. Attaching the interface to a pod via custom annotations

:::tip
More details can be found in the [Multus documentation](https://github.com/k8snetworkplumbingwg/multus-cni/blob/master/docs/how-to-use.md#create-network-attachment-definition).
:::

:::warning
If you have a multi-node cluster, you will need to deploy the [Whereabouts](https://github.com/k8snetworkplumbingwg/whereabouts) plugin for IPAM management. The standard `host-local` IPAM plugin does not support multi-node IP assigment and using it may lead to IP conflicts, leaks and/or exhaustion
:::

### Examples

#### Bridge network

```yaml
apiVersion: k8s.cni.cncf.io/v1
kind: NetworkAttachmentDefinition
metadata:
  name: bridge-network-with-gateway
spec:
  config: '{
    "cniVersion": "0.3.1",
    "name": "mynet",
    "type": "bridge",
    "bridge": "br-192-168-10",
    "isDefaultGateway": true,
    "ipMasq": true,
    "ipam": {
      "type": "host-local",
      "subnet": "192.168.10.0/24",
      "rangeStart": "192.168.10.200",
      "rangeEnd": "192.168.10.216",
      "gateway": "192.168.10.1"
    }
  }'
---
apiVersion: v1
kind: Pod
metadata:
  name: busybox-bridge-pod
  annotations:
    k8s.v1.cni.cncf.io/networks: bridge-network-with-gateway
spec:
  containers:
  - name: busybox-container
    image: busybox:1.36
    command:
     - "sh"
     - "-c"
     - |
      ip addr
      echo
      ip r
      echo
      echo '----- Waiting indefinitely -----'
      sleep infinity
```

#### Macvlan default route network

```yaml
apiVersion: k8s.cni.cncf.io/v1
kind: NetworkAttachmentDefinition
metadata:
  name: macvlan-network
spec:
  config: '{
    "cniVersion": "0.3.1",
    "name": "mynet",
    "type": "macvlan",
    "master": "eth0",
    "mode": "bridge",
    "ipam": {
      "type": "host-local",
      "subnet": "192.168.1.0/24",
      "rangeStart": "192.168.1.3",
      "rangeEnd": "192.168.1.99",
      "gateway": "192.168.1.1",
      "routes": [
        { "dst": "0.0.0.0/0" }
      ]
    }
  }'
---
apiVersion: v1
kind: Pod
metadata:
  name: busybox-macvlan-pod
  annotations:
    k8s.v1.cni.cncf.io/networks: |
      [{
        "name": "macvlan-network",
        "mac": "02:aa:bb:cc:dd:ee",
        "default-route": ["192.168.1.1"]
      }]
spec:
  containers:
  - name: busybox-container
    image: busybox:1.36
    command:
     - "sh"
     - "-c"
     - |
      ip addr
      echo
      ip r
      echo
      echo '----- Waiting indefinitely -----'
      sleep infinity
```

## Uninstalling

:::note
Before uninstalling this chart, make sure to remove all workloads which make use
of network interfaces deployed via Multus. Failing to do so may leave stale
network interfaces in your cluster.
:::

This chart makes several changes to the node's root filesystem (via host-path
mounts). These changes cannot be reversed by simply uninstalling the chart.

To combat this, this chart provides an "uninstall" mode, which takes care of
cleaning up any host filesystem changes made by this chart.

Therefore, when uninstalling, it is recommended to first configure the chart in
"uninstall" mode like so:

```yaml
multus:
  uninstall: true
```

Once applied, a cleanup container will run (you can check the logs for progress)
and when it is done, the chart can be safely uninstalled.

## Troubleshooting

### Missing networks after a node reboot

This is a common issue with Multus and is caused by a race condition, where the
primary CNI starts before Multus after a node reboot. This causes workloads to
start scheduling before Multus has started, using only the primary CNI to configure
the pods networks, resulting in missing network interfaces.

The easiest way to fix this is to change the directory where your primary CNI
places its config file. For example, with `Cilium` this can be achieved like so:

```yaml
cni:
  confPath: /etc/cni/net.d/cilium # Note the cilium subdir
```

Once done, Multus needs to be pointed to where the primary CNI config is located.
If using `Cilium`, this will look something like this:

```yaml
multus:
  primaryCniConfigFile: "cilium/05-cilium.conflist"
```

:::note
Due to Multus configuration limitations only subdirectories of the path specified
under `persistence.cniconf.mountPath` are supported when configuring `multus.primaryCniConfigFile`
```

:::warning
If you do not configure the location of the primary CNI config correctly, your
cluster will become unschedulable. Already deployed workloads will continue working,
however, new workloads will not be able to be scheduled.
:::

:::tip
If you already had your primary CNI deployed using the standard CNI directory,
a stale config file may be left behind when you change the primary CNI config
location.

You can try to prevent this from happening by first scaling down primary CNI to
0 replicas, and checking its config file has been removed from the host file
system.

If a stale file is left after changing the config file location, you must manually
remove it from the filesystem of **all** nodes. Otherwise, after a node reboot the cluster will see the stale primary CNI file and immediately try to use it instead of waiting for Multus to start.

An easy way to access a node's filesystem is using the `kubectl debug` command like
so:

```bash
kubectl debug node/<NODE_NAME> --profile=sysadmin exec -it --image ubuntu -n kube-system -- sh
```

Once inside the pod, the host's filesystem will be mounted under `/host`.

When done clean up the completed node debug pod(s) using the following command:

```bash
kubectl get pods -n kube-system -o name | grep "node-debugger" | xargs kubectl delete -n kube-system
```
:::
