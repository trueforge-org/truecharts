#!/bin/bash
# Prepare the Ubuntu 26.04 runner host for the k3d install tests.

# Ubuntu 26.04 ships path-attached AppArmor profiles for some apps. They also
# attach to the same binary path inside privileged (unconfined) k3d containers.
# The wg-quick profile denies exec of busybox applets, which breaks wg-easy
# ("/usr/bin/readlink: Permission denied").
if [ -f /etc/apparmor.d/wg-quick ]; then
  echo "Unloading host AppArmor profile wg-quick"
  sudo apparmor_parser -R /etc/apparmor.d/wg-quick || true
fi

# wg-easy's default PostUp hooks use legacy iptables (nat/filter tables),
# and the Ubuntu 26.04 kernel does not autoload those modules.
for module in ip_tables iptable_nat iptable_filter; do
  sudo modprobe "${module}" || echo "::warning::kernel module ${module} not available"
done
lsmod | grep -E '^(ip_tables|iptable_)' || true
