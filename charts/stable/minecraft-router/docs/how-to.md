---
title: Minecraft-Server How To
---

When you have multiple Java Minecraft-Servers running and you want to open for all the standard 25565 port. Minecraft-Router is the solution.
The correct minecraft server will be chosed based upon which URL is used to connect.

Default server can be given in the case an unknown URL is detected.

More information about linking charts and Cluster Internal Domain can be found in the common documentation.
Example deployment, used with Cluster Internal Domain names:

## Manual Discovery

```yaml
mcrouter:
   default: minecraft-java.minecraft-java.svc.cluster.local:25565
    mappings:
      - ${SERVER1_URL}=minecraft-java.minecraft-java.svc.cluster.local:25565
      - ${SERVER2_URL}=truecharts-mcserver-minecraft-java.truecharts-mcserver.svc.cluster.local:25565
      - ${SERVER3_URL}=kidsplayground-server-minecraft-java.kidsplayground-server.svc.cluster.local:25565
````

## Automatic Discovery

You can add the following annotations to your minecraft-java instances like so for the main service to be auto discovered by minecraft-router.

```yaml
service:
  main:
    enabled: true
    annotations: 
      # only 1 service should have this enabled
      mc-router.itzg.me/defaultServer: "true"
      # the domain that users will connect to!
      mc-router.itzg.me/externalServerName: "external.host.domain"
```
