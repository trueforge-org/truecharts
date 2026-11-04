╔══════════════════════════════════════════════════════════════════════════════╗
║          TRUECHARTS COMMON CHART DOCUMENTATION EXTRACTION                    ║
║                     Complete Configuration Reference                         ║
╚══════════════════════════════════════════════════════════════════════════════╝

LOCATION: /home/runner/.copilot/session-state/

FILES INCLUDED:
===============

1. docs-structure.txt (26KB, 974 lines)
   - COMPLETE hierarchical structure of all configuration keys
   - All data types, defaults, and valid values
   - Detailed configuration for every resource type
   - Ready for schema generation, IDE autocomplete, or documentation

2. docs-summary.txt (6.2KB, 177 lines)
   - High-level summary of all extracted information
   - Checklist of all resource types covered
   - Statistics and metadata about the extraction

3. quick-reference.txt (4.9KB, 185 lines)
   - Quick lookup index by category
   - Common patterns and usage examples
   - Search tips for finding specific information

4. README.txt (this file)
   - Overview and navigation guide

SOURCE DOCUMENTATION:
=====================
All information extracted from 95+ markdown files in:
/home/runner/work/truecharts/truecharts/charts/library/common/docs/

WHAT'S COVERED:
===============

TOP-LEVEL KEYS:
  • global, fallbackDefaults, operator, extraTpl
  • podOptions, containerOptions, TZ, namespace
  • resources, securityContext, image

WORKLOAD TYPES (5):
  • Deployment - with replicas, strategy (Recreate/RollingUpdate)
  • StatefulSet - with partition, OnDelete/RollingUpdate
  • DaemonSet - with maxUnavailable, maxSurge
  • Job - with completionMode, backoffLimit, parallelism
  • CronJob - with schedule, timezone, concurrency policy

SERVICE TYPES (5):
  • ClusterIP - default service type
  • LoadBalancer - with loadBalancerIP, sourceRanges
  • NodePort - with nodePort configuration per port
  • ExternalIP - using externalIPs list
  • ExternalName - with externalName reference

PERSISTENCE TYPES (9):
  • pvc - PersistentVolumeClaim with storageClass, size, retain
  • vct - VolumeClaimTemplate for StatefulSets
  • hostPath - direct host filesystem mounting
  • emptyDir - temporary pod storage
  • nfs - NFS server mounting
  • iscsi - iSCSI LUN mounting
  • device - raw block device
  • configmap - ConfigMap as volume
  • secret - Secret as volume

MIDDLEWARE TYPES (24 for Traefik):
  • Basic: add-prefix, basic-auth, buffering, chain, compress
  • Headers: content-type, headers
  • Security: forward-auth, ip-allow-list
  • Plugins: bouncer, geoblock, mod-security, real-ip, 
    rewrite-response-headers, theme-park
  • Routing: rate-limit, redirect-regex, redirect-scheme,
    replace-path-regex, replace-path, retry,
    strip-prefix-regex, strip-prefix

CONTAINER CONFIGURATION:
  • Images: imageSelector, repository, tag, pullPolicy
  • Execution: command, args, stdin, tty
  • Environment: env (with secretKeyRef, configMapKeyRef, fieldRef),
    envFrom, fixedEnv
  • Resources: CPU/memory limits and requests
  • Security: securityContext (PUID, runAsUser, capabilities, etc.)
  • Lifecycle: postStart, preStop hooks
  • Probes: liveness, readiness, startup (http/https/tcp/exec/grpc)
  • Termination: graceful shutdown configuration

DATABASE (CNPG):
  • Instances, singleNode configuration
  • PostgreSQL parameters, pg_hba rules
  • Storage: main and WAL storage configuration
  • Backup: S3-compatible backup configuration
  • Bootstrap: initdb or recovery from backup
  • Pooler: connection pooling with PgBouncer
  • Monitoring: PodMonitor integration

OTHER RESOURCES (30+):
  • Autoscaling: hpa (HorizontalPodAutoscaler), vpa (VerticalPodAutoscaler)
  • Policies: podDisruptionBudget, priorityClass, networkPolicy
  • Security: rbac, serviceAccount, secret, certificate, webhook
  • Storage: storageClass, volumeSnapshot, volumeSnapshotClass
  • Config: configmap, credentials, imagePullSecret
  • Networking: ingress, route (OpenShift)
  • Monitoring: metrics (ServiceMonitor/PodMonitor)
  • Addons: codeserver, netshoot, vpn

SPECIAL FEATURES:
=================

1. Variable-Named Objects:
   All resources use $name pattern for multiple instances
   Example: workload.main, workload.worker, service.api, service.web

2. Target Selectors:
   Resources can target specific pods/containers
   - Services target pods
   - Persistence targets pods and containers
   - HPA/VPA target workloads
   - ServiceAccounts target multiple pods

3. Primary Designation:
   - One workload must be primary
   - One container per workload must be primary
   - Affects default naming and behavior

4. Naming Schemes:
   - Primary objects: $FullName
   - Non-primary: $FullName-$ResourceName
   - Override with expandObjectName: false

5. Helm Templating:
   Many values support templating: {{ .Values.some.key }}
   Check docs-structure.txt for which keys support tpl

6. Fallback Defaults:
   Global defaults in fallbackDefaults for:
   - Probe types and timeouts
   - Service protocols and types
   - Persistence types and sizes
   - Access modes and storage classes

USAGE GUIDE:
============

For Schema Generation:
  → Use docs-structure.txt for complete type information

For IDE Autocomplete:
  → Parse docs-structure.txt into JSON Schema or LSP

For Documentation:
  → Use docs-summary.txt for overview
  → Use quick-reference.txt for examples
  → Reference docs-structure.txt for details

For Development:
  → Start with quick-reference.txt examples
  → Look up specifics in docs-structure.txt
  → Check original docs for detailed explanations

SEARCH EXAMPLES:
================

Find all keys related to storage:
  grep -i storage docs-structure.txt

Find all default values:
  grep "default:" docs-structure.txt

Find container configuration:
  grep -A50 "=== CONTAINER" docs-structure.txt

Find middleware types:
  grep -A30 "MIDDLEWARE TYPES" docs-structure.txt

Find a specific resource like HPA:
  grep -A20 "hpa\." docs-structure.txt

STATISTICS:
===========

Total Documentation Files: 95
Total Lines Extracted: 974
Total Configuration Keys: 500+
Resource Types: 40+
Middleware Types: 24
Service Types: 5
Persistence Types: 9
Workload Types: 5
Probe Types: 5

MAINTENANCE:
============

This extraction was performed on: February 14, 2025
Source: TrueCharts common library chart documentation
Version: Latest from main branch

To update this extraction:
1. Navigate to the docs directory
2. Run the extraction script again
3. Compare changes with diff tools
4. Update any dependent schemas or tools

ADDITIONAL NOTES:
=================

• All variable-named objects follow the pattern: resource.$name
• Most resources support labels and annotations maps
• Many string values support Helm templating
• Check Helm `tpl` column in structure for template support
• Some keys are required (marked ✅), others optional (marked ❌)
• Default values come from fallbackDefaults or are documented in structure

For questions or issues, refer to:
https://truecharts.org/charts/library/common/

╔══════════════════════════════════════════════════════════════════════════════╗
║                     END OF DOCUMENTATION EXTRACTION                          ║
╚══════════════════════════════════════════════════════════════════════════════╝
