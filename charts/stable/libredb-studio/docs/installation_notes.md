---
title: Installation Notes
---

## First start

On first start the application writes an administrator account and prints the password
once. Read it back with:

```bash
kubectl logs -n <namespace> deploy/<release-name> | grep -i "admin"
```

The same credentials are stored at `/app/data/auth-bootstrap.json` inside the persistent
volume. Set `ADMIN_PASSWORD` yourself to choose the password instead.

## Single replica

Storage runs on SQLite, which takes a single writer, so this chart is meant for one
replica. Raising the replica count corrupts sessions and saved connections.

## Cookies over plain http

Auth cookies carry the `Secure` flag in production, and a browser rejects a `Secure`
cookie that arrives over plain http on a host that is not loopback, so the login form
posts, succeeds and comes straight back. The chart sets `AUTH_COOKIE_SECURE` to `false`
because most installs here are reached over plain http on a LAN address. Set it to
`true` when TLS terminates at an ingress or a load balancer.

## Rolling back after using Prometheus or Apache Kafka

Chart 1.1.0 raised the application to 0.17.0, which added Prometheus and Apache Kafka
connections. Chart 1.0.0 runs 0.16.2, which does not know those two, and it reads the
same saved connections from the volume. With one of them saved, the connection list fails
to render on the older version, and that list is the only place a connection can be
deleted.
Remove Prometheus and Kafka connections before rolling back.

## Prometheus responses and memory

The image caps the JavaScript heap at 384 MiB, which is set inside the image and is not
the same as `resources.limits.memory`. A Prometheus answer is read whole into that heap,
so a very large one can end the process and restart the pod. Raising the memory limit on
its own does not raise the cap. Keep Prometheus queries narrow, or point the connection
at a server that answers in a few megabytes.
