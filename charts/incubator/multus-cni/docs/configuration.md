---
title: Configuration
---

It is strongly recommended to check out the Multus [poject documentation](https://github.com/k8snetworkplumbingwg/multus-cni/tree/master/docs) before
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

Talos does no ship all reference CNI plugins by default. You can check which
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

## Uninstalling

This chart makes several changes to the nodes root filesyste (via host-path
mounts). These changes cannot be reversed by simply uninstalling the chart.

To combat this, this chart has provides a special "uninstall" mode, which takes
care of cleaning up the host filesystem changes made by this chart.

Therefore, when uninstalling Multus, it is recommended first configure the chart
in "uninstall" mode like so:

```yaml
multus:
  uninstall: true
```

Once applied and the cleanup container has run (you can check the logs for progress),
the chart can be safely uninstalled.


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

If this happens, you must manually remove this file from the host's filesystem,
as otherwise after a node reboot the cluster will see the stale primary CNI file
immediately and try to use it instead of waiting for Multus to start.
:::
