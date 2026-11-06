## Full Examples

### Deny traffic from the world and from a CIDR

```yaml
networkpolicy:
  deny-ingress:
    enabled: true
    type: cilium
    targetSelector: main
    ingressDeny:
      - fromEntities:
          - world
        toPorts:
          - ports:
              - port: "8080"
                protocol: TCP
      - fromCIDR:
          - 203.0.113.0/24
    ingress:
      - fromEntities:
          - cluster
```

### Deny a CIDR range except a subnet, and ICMP

```yaml
networkpolicy:
  deny-ranges:
    enabled: true
    type: cilium
    targetAllPods: true
    ingressDeny:
      - fromCIDRSet:
          - cidr: 10.0.0.0/8
            except:
              - 10.1.0.0/16
      - fromEndpoints:
          - matchLabels:
              environment: untrusted
        icmps:
          - fields:
              - type: 8
                family: IPv4
```
