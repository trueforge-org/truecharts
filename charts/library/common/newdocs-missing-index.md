# Index: Schema-backed missing content in newdocs

This index highlights missing headings that should be generatable from `values.schema.json` where possible.

- Source tree: `/Users/kjeld/GIT/trueforge/truecharts/charts/library/common/docs`
- Target tree: `/Users/kjeld/GIT/trueforge/truecharts/charts/library/common/newdocs`
- Docs files considered: **95**
- Newdocs files considered: **155**
- Docs files without any newdocs match: **0**
- Matched files with schema-backed missing headings: **11**
- Matched files with only non-schema missing headings: **92**

## 1) Docs files without a match in newdocs

- None

## 2) Missing headings that map to schema paths (actionable for generator)

### `addons.md`
- Matched newdocs file: `addons/index.md`
- Match type: `fuzzy` (score: `0.82`)
- Matched schema file: `addons/addons.json` (score: `0.98`)
- Missing schema-backed headings: **4**
  - ``addons.$addon.targetSelector`` -> `*.targetSelector`
  - ``addons.$addon.container`` -> `*.container`
  - ``addons.$addon.service`` -> `*.service`
  - ``addons.$addon.ingress`` -> `*.ingress`

### `container/fixedEnv.md`
- Matched newdocs file: `workload/podSpec/containers/fixedEnv.md`
- Match type: `fuzzy` (score: `1.03`)
- Matched schema file: `workload/podSpec/containers/fixedEnv.json` (score: `1.07`)
- Missing schema-backed headings: **4**
  - ``fixedEnv.TZ`` -> `TZ`
  - ``fixedEnv.UMASK`` -> `UMASK`
  - ``fixedEnv.PUID`` -> `PUID`
  - ``fixedEnv.NVIDIA_CAPS`` -> `NVIDIA_CAPS`

### `container/lifecycle.md`
- Matched newdocs file: `workload/podSpec/containers/lifecycle.md`
- Match type: `fuzzy` (score: `1.04`)
- Matched schema file: `workload/podSpec/containers/lifecycle.json` (score: `1.08`)
- Missing schema-backed headings: **6**
  - ``lifecycle.preStop`` -> `preStop`
  - ``lifecycle.postStart`` -> `postStart`
  - ``lifecycle.$hook.port`` -> `*.port`
  - ``lifecycle.$hook.host`` -> `*.host`
  - ``lifecycle.$hook.path`` -> `*.path`
  - ``lifecycle.$hook.httpHeaders`` -> `*.httpHeaders`

### `container/probes.md`
- Matched newdocs file: `workload/podSpec/containers/probes.md`
- Match type: `fuzzy` (score: `1.00`)
- Matched schema file: `workload/podSpec/containers/probes.json` (score: `1.04`)
- Missing schema-backed headings: **12**
  - ``probes.liveness`` -> `liveness`
  - ``probes.readiness`` -> `readiness`
  - ``probes.startup`` -> `startup`
  - ``probes.$probe.port`` -> `startup.port`
  - ``probes.$probe.path`` -> `*.path`
  - ``probes.$probe.httpHeaders`` -> `*.httpHeaders`
  - ``probes.$probe.spec`` -> `*.spec`
  - ``probes.$probe.spec.initialDelaySeconds`` -> `*.spec.initialDelaySeconds`
  - ``probes.$probe.spec.periodSeconds`` -> `*.spec.periodSeconds`
  - ``probes.$probe.spec.timeoutSeconds`` -> `*.spec.timeoutSeconds`
  - ``probes.$probe.spec.failureThreshold`` -> `*.spec.failureThreshold`
  - ``probes.$probe.spec.successThreshold`` -> `*.spec.successThreshold`

### `container/resources.md`
- Matched newdocs file: `workload/podSpec/containers/resources.md`
- Match type: `fuzzy` (score: `1.04`)
- Matched schema file: `workload/podSpec/containers/resources.json` (score: `1.08`)
- Missing schema-backed headings: **6**
  - ``resources.requests`` -> `requests`
  - ``resources.requests.cpu`` -> `requests.cpu`
  - ``resources.requests.memory`` -> `requests.memory`
  - ``resources.limits`` -> `limits`
  - ``resources.limits.cpu`` -> `limits.cpu`
  - ``resources.limits.memory`` -> `limits.memory`

### `container/securityContext.md`
- Matched newdocs file: `workload/podSpec/containers/securityContext.md`
- Match type: `fuzzy` (score: `1.10`)
- Matched schema file: `workload/podSpec/containers/securityContext.json` (score: `1.14`)
- Missing schema-backed headings: **11**
  - ``securityContext.runAsUser`` -> `runAsUser`
  - ``securityContext.runAsGroup`` -> `runAsGroup`
  - ``securityContext.readOnlyRootFilesystem`` -> `readOnlyRootFilesystem`
  - ``securityContext.allowPrivilegeEscalation`` -> `allowPrivilegeEscalation`
  - ``securityContext.privileged`` -> `privileged`
  - ``securityContext.runAsNonRoot`` -> `runAsNonRoot`
  - ``securityContext.capabilities`` -> `capabilities`
  - ``securityContext.capabilities.add`` -> `capabilities.add`
  - ``securityContext.capabilities.drop`` -> `capabilities.drop`
  - ``securityContext.seccompProfile`` -> `seccompProfile`
  - ``securityContext.seccompProfile.profile`` -> `seccompProfile.profile`

### `container/termination.md`
- Matched newdocs file: `workload/container/termination.md`
- Match type: `fuzzy` (score: `1.27`)
- Matched schema file: `workload/container/termination.json` (score: `1.26`)
- Missing schema-backed headings: **2**
  - ``termination.messagePath`` -> `messagePath`
  - ``termination.messagePolicy`` -> `messagePolicy`

### `fallbackDefaults.md`
- Matched newdocs file: `global/fallbackDefaults.md`
- Match type: `fuzzy` (score: `1.22`)
- Matched schema file: `global/fallbackDefaults.json` (score: `1.12`)
- Missing schema-backed headings: **18**
  - ``probeTimeouts.liveness`` -> `probeTimeouts.liveness`
  - ``probeTimeouts.liveness.initialDelaySeconds`` -> `probeTimeouts.liveness.initialDelaySeconds`
  - ``probeTimeouts.liveness.periodSeconds`` -> `probeTimeouts.liveness.periodSeconds`
  - ``probeTimeouts.liveness.timeoutSeconds`` -> `probeTimeouts.liveness.timeoutSeconds`
  - ``probeTimeouts.liveness.failureThreshold`` -> `probeTimeouts.liveness.failureThreshold`
  - ``probeTimeouts.liveness.successThreshold`` -> `probeTimeouts.liveness.successThreshold`
  - ``probeTimeouts.readiness`` -> `probeTimeouts.readiness`
  - ``probeTimeouts.readiness.initialDelaySeconds`` -> `probeTimeouts.readiness.initialDelaySeconds`
  - ``probeTimeouts.readiness.periodSeconds`` -> `probeTimeouts.readiness.periodSeconds`
  - ``probeTimeouts.readiness.timeoutSeconds`` -> `probeTimeouts.readiness.timeoutSeconds`
  - ``probeTimeouts.readiness.failureThreshold`` -> `probeTimeouts.readiness.failureThreshold`
  - ``probeTimeouts.readiness.successThreshold`` -> `probeTimeouts.readiness.successThreshold`
  - ``probeTimeouts.startup`` -> `probeTimeouts.startup`
  - ``probeTimeouts.startup.initialDelaySeconds`` -> `probeTimeouts.startup.initialDelaySeconds`
  - ``probeTimeouts.startup.periodSeconds`` -> `probeTimeouts.startup.periodSeconds`
  - ``probeTimeouts.startup.timeoutSeconds`` -> `probeTimeouts.startup.timeoutSeconds`
  - ``probeTimeouts.startup.failureThreshold`` -> `probeTimeouts.startup.failureThreshold`
  - ``probeTimeouts.startup.successThreshold`` -> `probeTimeouts.startup.successThreshold`

### `global.md`
- Matched newdocs file: `global/index.md`
- Match type: `fuzzy` (score: `0.82`)
- Matched schema file: `global/global.json` (score: `0.98`)
- Missing schema-backed headings: **2**
  - ``traefik.addServiceAnnotations`` -> `traefik.addServiceAnnotations`
  - ``traefik.commonMiddlewares`` -> `traefik.commonMiddlewares`

### `ingress/homepage.md`
- Matched newdocs file: `ingress/integrations/homepage.md`
- Match type: `fuzzy` (score: `1.16`)
- Matched schema file: `ingress/integrations/homepage.json` (score: `1.15`)
- Missing schema-backed headings: **4**
  - ``widget.version`` -> `widget.version`
  - ``widget.url`` -> `widget.url`
  - ``widget.custom`` -> `widget.custom`
  - ``widget.customkv`` -> `widget.customkv`

### `resources.md`
- Matched newdocs file: `workload/podSpec/containers/resources.md`
- Match type: `fuzzy` (score: `0.63`)
- Matched schema file: `workload/podSpec/containers/resources.json` (score: `0.64`)
- Missing schema-backed headings: **6**
  - ``resources.limits`` -> `limits`
  - ``resources.limits.cpu`` -> `limits.cpu`
  - ``resources.limits.memory`` -> `limits.memory`
  - ``resources.requests`` -> `requests`
  - ``resources.requests.cpu`` -> `requests.cpu`
  - ``resources.requests.memory`` -> `requests.memory`

## 3) Missing headings likely not schema-derived (manual/docs narrative)

### `addons.md`
- Matched newdocs file: `addons/index.md`
- Match type: `fuzzy` (score: `0.82`)
- Matched schema file: `addons/addons.json` (score: `0.98`)
- Missing non-schema headings: **2**
  - ``addons.$addon``
  - ``addons.$addon.enabled``

### `certificate.md`
- Matched newdocs file: `certificate.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `certificate.json` (score: `1.35`)
- Missing non-schema headings: **11**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``certificateIssuer``
  - ``hosts``
  - ``certificateSecretTemplate``
  - ``labels``
  - ``annotations``

### `cnpg/cluster.md`
- Matched newdocs file: `cnpg/cluster/index.md`
- Match type: `fuzzy` (score: `0.71`)
- Matched schema file: `cnpg/cluster.json` (score: `1.50`)
- Missing non-schema headings: **12**
  - ``labels``
  - ``annotations``
  - ``env``
  - ``envFrom``
  - ``instances``
  - ``singleNode``
  - ``logLevel``
  - ``primaryUpdateMethod``
  - ``primaryUpdateStrategy``
  - ``certificates``
  - ``postgresql``
  - ``initdb``

### `cnpg/cnpg.md`
- Matched newdocs file: `cnpg/index.md`
- Match type: `fuzzy` (score: `0.78`)
- Matched schema file: `cnpg/cnpg.json` (score: `1.40`)
- Missing non-schema headings: **18**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``primary``
  - ``hibernate``
  - ``labels``
  - ``annotations``
  - ``type``
  - ``pgVersion``
  - ``mode``
  - ``database``
  - ``user``
  - ``password``
  - ``cluster``
  - ``monitoring``
  - ``recovery``
  - ``backups``
  - ``pooler``

### `configmap.md`
- Matched newdocs file: `configmap.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `configmap.json` (score: `1.35`)
- Missing non-schema headings: **7**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``data``

### `container/args.md`
- Matched newdocs file: `workload/podSpec/containers/args.md`
- Match type: `fuzzy` (score: `0.97`)
- Matched schema file: `workload/podSpec/containers/args.json` (score: `1.01`)
- Missing non-schema headings: **4**
  - ``args``
  - `Or`
  - ``extraArgs``
  - `Or`

### `container/command.md`
- Matched newdocs file: `workload/podSpec/containers/command.md`
- Match type: `fuzzy` (score: `1.01`)
- Matched schema file: `workload/podSpec/containers/command.json` (score: `1.05`)
- Missing non-schema headings: **1**
  - ``command``

### `container/env.md`
- Matched newdocs file: `addons/gluetun/container/env.md`
- Match type: `fuzzy` (score: `0.99`)
- Matched schema file: `addons/gluetun/container/env.json` (score: `1.03`)
- Missing non-schema headings: **13**
  - ``env``
  - ``env.$key``
  - ``env.$key.configMapKeyRef``
  - ``env.$key.configMapKeyRef.name``
  - ``env.$key.configMapKeyRef.key``
  - ``env.$key.configMapKeyRef.expandObjectName``
  - ``env.$key.secretKeyRef``
  - ``env.$key.secretKeyRef.name``
  - ``env.$key.secretKeyRef.key``
  - ``env.$key.secretKeyRef.expandObjectName``
  - ``env.$key.fieldRef``
  - ``env.$key.fieldRef.fieldPath``
  - ``env.$key.fieldRef.apiVersion``

### `container/envFrom.md`
- Matched newdocs file: `workload/podSpec/containers/envFrom.md`
- Match type: `fuzzy` (score: `1.01`)
- Matched schema file: `workload/podSpec/containers/envFrom.json` (score: `1.05`)
- Missing non-schema headings: **7**
  - ``envFrom``
  - ``envFrom.secretRef``
  - ``envFrom.secretRef.name``
  - ``envFrom.secretRef.expandObjectName``
  - ``envFrom.configMapRef``
  - ``envFrom.configMapRef.name``
  - ``envFrom.configMapRef.expandObjectName``

### `container/fixedEnv.md`
- Matched newdocs file: `workload/podSpec/containers/fixedEnv.md`
- Match type: `fuzzy` (score: `1.03`)
- Matched schema file: `workload/podSpec/containers/fixedEnv.json` (score: `1.07`)
- Missing non-schema headings: **1**
  - ``fixedEnv``

### `container/index.md`
- Matched newdocs file: `workload/container/index.md`
- Match type: `fuzzy` (score: `1.22`)
- Matched schema file: `addons/gluetun/container/env.json` (score: `0.74`)
- Missing non-schema headings: **19**
  - `Notes`
  - ``enabled``
  - ``type``
  - ``imageSelector``
  - ``primary``
  - ``stdin``
  - ``tty``
  - ``command``
  - ``args``
  - ``extraArgs``
  - ``termination``
  - ``lifecycle``
  - ``probes``
  - ``resources``
  - ``securityContext``
  - ``envFrom``
  - ``fixedEnv``
  - ``env``
  - `Full Examples`

### `container/lifecycle.md`
- Matched newdocs file: `workload/podSpec/containers/lifecycle.md`
- Match type: `fuzzy` (score: `1.04`)
- Matched schema file: `workload/podSpec/containers/lifecycle.json` (score: `1.08`)
- Missing non-schema headings: **3**
  - ``lifecycle``
  - ``lifecycle.$hook.type``
  - ``lifecycle.$hook.command``

### `container/probes.md`
- Matched newdocs file: `workload/podSpec/containers/probes.md`
- Match type: `fuzzy` (score: `1.00`)
- Matched schema file: `workload/podSpec/containers/probes.json` (score: `1.04`)
- Missing non-schema headings: **4**
  - ``probes``
  - ``probes.$probe.enabled``
  - ``probes.$probe.type``
  - ``probes.$probe.command``

### `container/resources.md`
- Matched newdocs file: `workload/podSpec/containers/resources.md`
- Match type: `fuzzy` (score: `1.04`)
- Matched schema file: `workload/podSpec/containers/resources.json` (score: `1.08`)
- Missing non-schema headings: **5**
  - `Notes`
  - ``resources``
  - ``resources.limits."gpu.intel.com/i915"``
  - ``resources.limits."nvidia.com/gpu"``
  - ``resources.limits."amd.com/gpu"``

### `container/securityContext.md`
- Matched newdocs file: `workload/podSpec/containers/securityContext.md`
- Match type: `fuzzy` (score: `1.10`)
- Matched schema file: `workload/podSpec/containers/securityContext.json` (score: `1.14`)
- Missing non-schema headings: **2**
  - ``securityContext``
  - ``securityContext.seccompProfile.type``

### `container/termination.md`
- Matched newdocs file: `workload/container/termination.md`
- Match type: `fuzzy` (score: `1.27`)
- Matched schema file: `workload/container/termination.json` (score: `1.26`)
- Missing non-schema headings: **1**
  - ``termination``

### `containerOptions.md`
- Matched newdocs file: `containerOptions.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `containerOptions.json` (score: `1.35`)
- Missing non-schema headings: **2**
  - `Defaults`
  - ``NVIDIA_CAPS``

### `credentials.md`
- Matched newdocs file: `credentials.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `credentials.json` (score: `1.35`)
- Missing non-schema headings: **15**
  - `Naming scheme`
  - ``$name``
  - ``type``
  - ``url``
  - ``region``
  - ``customCASecretRef``
  - ``customCASecretRef.name``
  - ``customCASecretRef.key``
  - ``customCASecretRef.expandObjectName``
  - ``customCA``
  - ``path``
  - ``bucket``
  - ``accessKey``
  - ``secretKey``
  - ``encrKey``

### `fallbackDefaults.md`
- Matched newdocs file: `global/fallbackDefaults.md`
- Match type: `fuzzy` (score: `1.22`)
- Matched schema file: `global/fallbackDefaults.json` (score: `1.12`)
- Missing non-schema headings: **12**
  - `Defaults`
  - ``probeType``
  - ``serviceProtocol``
  - ``serviceType``
  - ``storageClass``
  - ``persistenceType``
  - ``pvcRetain``
  - ``pvcSize``
  - ``vctSize``
  - ``accessModes``
  - ``probeTimeouts``
  - ``topologyKey``

### `global.md`
- Matched newdocs file: `global/index.md`
- Match type: `fuzzy` (score: `0.82`)
- Matched schema file: `global/global.json` (score: `0.98`)
- Missing non-schema headings: **8**
  - `Defaults`
  - ``labels``
  - ``annotations``
  - ``namespace``
  - ``minNodePort``
  - ``stopAll``
  - ``metallb``
  - ``traefik``

### `hpa.md`
- Matched newdocs file: `hpa.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `hpa.json` (score: `1.35`)
- Missing non-schema headings: **7**
  - ``$name``
  - ``enabled``
  - ``targetSelector``
  - ``minReplicas``
  - ``maxReplicas``
  - ``metrics``
  - ``behavior``

### `imagePullSecret.md`
- Matched newdocs file: `imagePullSecret.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `imagePullSecret.json` (score: `1.35`)
- Missing non-schema headings: **15**
  - `Naming scheme`
  - `Target Selector`
  - ``$name``
  - ``enabled``
  - ``existingSecret``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``targetSelectAll``
  - ``targetSelector``
  - ``data``
  - ``data.registry``
  - ``data.username``
  - ``data.password``
  - ``data.email``

### `index.md`
- Matched newdocs file: `cnpg/index.md`
- Match type: `fuzzy` (score: `1.07`)
- Matched schema file: `persistence/pvc-vct/index.json` (score: `0.61`)
- Missing non-schema headings: **22**
  - `Notes`
  - `Schema Validation (Dev)`
  - ``global``
  - ``fallbackDefaults``
  - ``extraTpl``
  - ``operator``
  - ``operator.register``
  - ``operator.verify``
  - ``operator.verify.enabled``
  - ``operator.verify.additionalsystem``
  - ``podOptions``
  - ``containerOptions``
  - ``TZ``
  - ``namespace``
  - ``resources``
  - ``securityContext``
  - `Images`
  - ``image``
  - ``image.repository``
  - ``image.tag``
  - ``image.pullPolicy``
  - `Additional Documentation`

### `ingress/certManager.md`
- Matched newdocs file: `ingress/certManager.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `ingress/certManager.json` (score: `1.50`)
- Missing non-schema headings: **2**
  - ``enabled``
  - ``certificateIssuer``

### `ingress/homepage.md`
- Matched newdocs file: `ingress/integrations/homepage.md`
- Match type: `fuzzy` (score: `1.16`)
- Matched schema file: `ingress/integrations/homepage.json` (score: `1.15`)
- Missing non-schema headings: **13**
  - ``enabled``
  - ``name``
  - ``description``
  - ``group``
  - ``icon``
  - ``href``
  - ``weight``
  - ``podSelector``
  - ``widget``
  - ``widget.enabled``
  - ``widget.type``
  - ``widget.customkv[].key``
  - ``widget.customkv[].value``

### `ingress/index.md`
- Matched newdocs file: `ingress/index.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `ingress/ingress.json` (score: `0.99`)
- Missing non-schema headings: **30**
  - `Naming scheme`
  - `Target Selector`
  - ``$name``
  - ``enabled``
  - ``primary``
  - ``expandObjectName``
  - ``required``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``ingressClassName``
  - ``targetSelector``
  - ``hosts``
  - ``hosts[].host``
  - ``hosts[].paths``
  - ``hosts[].paths[].path``
  - ``hosts[].paths[].pathType``
  - ``hosts[].paths[].overrideService``
  - ``hosts[].paths[].overrideService.name``
  - ``hosts[].paths[].overrideService.expandObjectName``
  - ``hosts[].paths[].overrideService.port``
  - ``tls``
  - ``tls[].hosts``
  - ``tls[].secretName``
  - ``tls[].certificateIssuer``
  - ``tls[].clusterIssuer``
  - ``integrations``
  - ``integrations.certManager``
  - ``integrations.traefik``
  - ``integrations.homepage``

### `ingress/traefik.md`
- Matched newdocs file: `ingress/traefik.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `ingress/traefik.json` (score: `1.50`)
- Missing non-schema headings: **8**
  - ``enabled``
  - ``entrypoints``
  - ``forceTLS``
  - ``middlewares``
  - ``middlewares[].name``
  - ``middlewares[].namespace``
  - ``middlewares[].expandObjectName``
  - ``chartMiddlewares``

### `metrics.md`
- Matched newdocs file: `metrics.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `metrics.json` (score: `1.35`)
- Missing non-schema headings: **8**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``type``
  - ``targetSelector``
  - ``selector``
  - ``endpoints``
  - ``prometheusRule``

### `middlewares/index.md`
- Matched newdocs file: `ingressMiddlewares/index.md`
- Match type: `fuzzy` (score: `1.13`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/index.json` (score: `0.96`)
- Missing non-schema headings: **10**
  - `Naming scheme`
  - ``$provider``
  - ``$name``
  - ``enabled``
  - ``expandObjectName``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``data``
  - ``type``

### `middlewares/traefik/add-prefix.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/add-prefix.md`
- Match type: `fuzzy` (score: `1.23`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/add-prefix.json` (score: `1.25`)
- Missing non-schema headings: **1**
  - ``prefix``

### `middlewares/traefik/basic-auth.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/basic-auth.md`
- Match type: `fuzzy` (score: `1.23`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/basic-auth.json` (score: `1.25`)
- Missing non-schema headings: **4**
  - ``users``
  - ``users[].username``
  - ``users[].password``
  - ``secret``

### `middlewares/traefik/buffering.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/buffering.md`
- Match type: `fuzzy` (score: `1.23`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/buffering.json` (score: `1.25`)
- Missing non-schema headings: **5**
  - ``maxRequestBodyBytes``
  - ``memRequestBodyBytes``
  - ``maxResponseBodyBytes``
  - ``memResponseBodyBytes``
  - ``retryExpression``

### `middlewares/traefik/chain.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/chain.md`
- Match type: `fuzzy` (score: `1.20`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/chain.json` (score: `1.22`)
- Missing non-schema headings: **3**
  - ``middlewares``
  - ``middlewares[].name``
  - ``middlewares[].expandObjectName``

### `middlewares/traefik/forward-auth.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/forward-auth.md`
- Match type: `fuzzy` (score: `1.25`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/forward-auth.json` (score: `1.27`)
- Missing non-schema headings: **7**
  - ``address``
  - ``authResponseHeadersRegex``
  - ``trustForwardHeader``
  - ``authResponseHeaders``
  - ``authRequestHeaders``
  - ``tls``
  - ``tls.insecureSkipVerify``

### `middlewares/traefik/headers.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/headers.md`
- Match type: `fuzzy` (score: `1.22`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/headers.json` (score: `1.24`)
- Missing non-schema headings: **28**
  - ``customRequestHeaders``
  - ``customResponseHeaders``
  - ``accessControlAllowCredentials``
  - ``accessControlAllowHeaders``
  - ``accessControlAllowMethods``
  - ``accessControlAllowOriginList``
  - ``accessControlAllowOriginListRegex``
  - ``accessControlExposeHeaders``
  - ``accessControlMaxAge``
  - ``addVaryHeader``
  - ``allowedHosts``
  - ``hostsProxyHeaders``
  - ``sslProxyHeaders``
  - ``stsSeconds``
  - ``stsIncludeSubdomains``
  - ``stsPreload``
  - ``forceSTSHeader``
  - ``frameDeny``
  - ``customFrameOptionsValue``
  - ``contentTypeNosniff``
  - ``browserXssFilter``
  - ``customBrowserXSSValue``
  - ``contentSecurityPolicy``
  - ``contentSecurityPolicyReportOnly``
  - ``publicKey``
  - ``referrerPolicy``
  - ``permissionsPolicy``
  - ``isDevelopment``

### `middlewares/traefik/index.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/index.md`
- Match type: `fuzzy` (score: `1.20`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/index.json` (score: `1.22`)
- Missing non-schema headings: **1**
  - ``type``

### `middlewares/traefik/ip-allow-list.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/ip-allow-list.md`
- Match type: `fuzzy` (score: `1.25`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/ip-allow-list.json` (score: `1.27`)
- Missing non-schema headings: **4**
  - ``sourceRange``
  - ``ipStrategy``
  - ``ipStrategy.depth``
  - ``ipStrategy.excludedIPs``

### `middlewares/traefik/plugin-bouncer.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-bouncer.md`
- Match type: `fuzzy` (score: `1.26`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/plugin-bouncer.json` (score: `1.28`)
- Missing non-schema headings: **36**
  - ``pluginName``
  - ``enabled``
  - ``logLevel``
  - ``updateIntervalSeconds``
  - ``updateMaxFailure``
  - ``defaultDecisionSeconds``
  - ``httpTimeoutSeconds``
  - ``crowdsecMode``
  - ``crowdsecAppsecEnabled``
  - ``crowdsecAppsecHost``
  - ``crowdsecAppsecFailureBlock``
  - ``crowdsecAppsecUnreachableBlock``
  - ``crowdsecLapiKey``
  - ``crowdsecLapiHost``
  - ``crowdsecLapiScheme``
  - ``crowdsecLapiTLSInsecureVerify``
  - ``crowdsecCapiMachineId``
  - ``crowdsecCapiPassword``
  - ``crowdsecCapiScenarios``
  - ``forwardedHeadersTrustedIPs``
  - ``clientTrustedIPs``
  - ``forwardedHeadersCustomName``
  - ``remediationHeadersCustomName``
  - ``redisCacheEnabled``
  - ``redisCacheHost``
  - ``redisCachePassword``
  - ``redisCacheDatabase``
  - ``crowdsecLapiTLSCertificateAuthority``
  - ``crowdsecLapiTLSCertificateBouncer``
  - ``crowdsecLapiTLSCertificateBouncerKey``
  - ``captchaProvider``
  - ``captchaSiteKey``
  - ``captchaSecretKey``
  - ``captchaGracePeriodSeconds``
  - ``captchaHTMLFilePath``
  - ``banHTMLFilePath``

### `middlewares/traefik/plugin-geoblock.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-geoblock.md`
- Match type: `fuzzy` (score: `1.26`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/plugin-geoblock.json` (score: `1.28`)
- Missing non-schema headings: **15**
  - ``pluginName``
  - ``api``
  - ``allowLocalRequests``
  - ``logLocalRequests``
  - ``logAllowedRequests``
  - ``logApiRequests``
  - ``apiTimeoutMs``
  - ``cacheSize``
  - ``forceMonthlyUpdate``
  - ``allowUnknownCountries``
  - ``unknownCountryApiResponse``
  - ``blackListMode``
  - ``silentStartUp``
  - ``addCountryHeader``
  - ``countries``

### `middlewares/traefik/plugin-mod-security.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-mod-security.md`
- Match type: `fuzzy` (score: `1.28`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/plugin-mod-security.json` (score: `1.30`)
- Missing non-schema headings: **4**
  - ``pluginName``
  - ``modSecurityUrl``
  - ``timeoutMillis``
  - ``maxBodySize``

### `middlewares/traefik/plugin-real-ip.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-real-ip.md`
- Match type: `fuzzy` (score: `1.25`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/plugin-real-ip.json` (score: `1.27`)
- Missing non-schema headings: **2**
  - ``pluginName``
  - ``excludednets``

### `middlewares/traefik/plugin-rewrite-response-headers.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-rewrite-response-headers.md`
- Match type: `fuzzy` (score: `1.31`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/plugin-rewrite-response-headers.json` (score: `1.33`)
- Missing non-schema headings: **5**
  - ``pluginName``
  - ``rewrites``
  - ``rewrites[].header``
  - ``rewrites[].regex``
  - ``rewrites[].replacement``

### `middlewares/traefik/plugin-theme-park.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-theme-park.md`
- Match type: `fuzzy` (score: `1.27`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/plugin-theme-park.json` (score: `1.29`)
- Missing non-schema headings: **5**
  - ``pluginName``
  - ``app``
  - ``theme``
  - ``baseUrl``
  - ``addons``

### `middlewares/traefik/rate-limit.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/rate-limit.md`
- Match type: `fuzzy` (score: `1.23`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/rate-limit.json` (score: `1.25`)
- Missing non-schema headings: **2**
  - ``average``
  - ``burst``

### `middlewares/traefik/redirect-regex.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/redirect-regex.md`
- Match type: `fuzzy` (score: `1.26`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/redirect-regex.json` (score: `1.28`)
- Missing non-schema headings: **3**
  - ``regex``
  - ``replacement``
  - ``permanent``

### `middlewares/traefik/redirect-scheme.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/redirect-scheme.md`
- Match type: `fuzzy` (score: `1.26`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/redirect-scheme.json` (score: `1.28`)
- Missing non-schema headings: **2**
  - ``scheme``
  - ``permanent``

### `middlewares/traefik/replace-path-regex.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/replace-path-regex.md`
- Match type: `fuzzy` (score: `1.27`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/replace-path-regex.json` (score: `1.29`)
- Missing non-schema headings: **2**
  - ``regex``
  - ``replacement``

### `middlewares/traefik/replace-path.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/replace-path.md`
- Match type: `fuzzy` (score: `1.25`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/replace-path.json` (score: `1.27`)
- Missing non-schema headings: **1**
  - ``path``

### `middlewares/traefik/retry.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/retry.md`
- Match type: `fuzzy` (score: `1.20`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/retry.json` (score: `1.22`)
- Missing non-schema headings: **2**
  - ``attempts``
  - ``initialInterval``

### `middlewares/traefik/strip-prefix-regex.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/strip-prefix-regex.md`
- Match type: `fuzzy` (score: `1.27`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/strip-prefix-regex.json` (score: `1.29`)
- Missing non-schema headings: **1**
  - ``regex``

### `middlewares/traefik/strip-prefix.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/strip-prefix.md`
- Match type: `fuzzy` (score: `1.25`)
- Matched schema file: `ingressMiddlewares/middlewares/traefik/strip-prefix.json` (score: `1.27`)
- Missing non-schema headings: **2**
  - ``prefix``
  - ``forceSlash``

### `networkpolicy.md`
- Matched newdocs file: `networkpolicy.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `networkpolicy.json` (score: `1.35`)
- Missing non-schema headings: **34**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``primary``
  - ``expandObjectName``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - `Pod Selection`
  - ``podSelector``
  - `Default Behavior`
  - ``matchLabels``
  - ``matchExpressions``
  - ``targetSelector``
  - ``targetAllPods``
  - `Policy Configuration`
  - ``policyTypes``
  - `Ingress Rules`
  - ``ingress``
  - ``from``
  - `Pod Selector`
  - `Namespace Selector`
  - `Combined Pod and Namespace Selector`
  - `IP Block`
  - ``ports``
  - `Port Ranges (Kubernetes 1.25+)`
  - `Named Ports`
  - `Egress Rules`
  - ``egress``
  - ``to``
  - `Pod Selector`
  - `Namespace Selector`
  - `IP Block`
  - ``ports``

### `notes.md`
- Matched newdocs file: `notes.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `notes.json` (score: `1.35`)
- Missing non-schema headings: **6**
  - ``header``
  - `Welcome to TrueCharts!`
  - ``custom``
  - ``footer``
  - `Documentation`
  - `Bug reports`

### `persistence/configmap.md`
- Matched newdocs file: `persistence/configmap.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/configmap.json` (score: `1.50`)
- Missing non-schema headings: **7**
  - ``objectName``
  - ``expandObjectName``
  - ``optional``
  - ``defaultMode``
  - ``items``
  - ``items[].key``
  - ``items[].path``

### `persistence/device.md`
- Matched newdocs file: `persistence/device.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/device.json` (score: `1.50`)
- Missing non-schema headings: **3**
  - `Notes`
  - ``hostPath``
  - ``hostPathType``

### `persistence/emptyDir.md`
- Matched newdocs file: `persistence/emptyDir.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/emptyDir.json` (score: `1.50`)
- Missing non-schema headings: **2**
  - ``size``
  - ``medium``

### `persistence/hostPath.md`
- Matched newdocs file: `persistence/hostPath.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/hostPath.json` (score: `1.50`)
- Missing non-schema headings: **2**
  - ``hostPath``
  - ``hostPathType``

### `persistence/index.md`
- Matched newdocs file: `persistence/index.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/pvc-vct/index.json` (score: `1.27`)
- Missing non-schema headings: **21**
  - `Naming scheme`
  - `Target Selector`
  - ``$name``
  - ``enabled``
  - ``type``
  - ``mountPath``
  - ``mountPropagation``
  - ``subPath``
  - ``readOnly``
  - ``targetSelectAll``
  - ``targetSelector``
  - ``targetSelector.$podName``
  - ``targetSelector.$podName.$containerName``
  - ``targetSelector.$podName.$containerName.mountPath``
  - ``targetSelector.$podName.$containerName.mountPropagation``
  - ``targetSelector.$podName.$containerName.subPath``
  - ``targetSelector.$podName.$containerName.readOnly``
  - `Basic Examples`
  - `Example of a shared emptyDir volume`
  - `Example of a volume mounted to a specific container with a specific mountPath`
  - `Example of a volume mounted to a specific container using the default mountPath`

### `persistence/iscsi.md`
- Matched newdocs file: `persistence/iscsi.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/iscsi.json` (score: `1.50`)
- Missing non-schema headings: **16**
  - ``iscsi``
  - ``fsType``
  - ``targetPortal``
  - ``iqn``
  - ``lun``
  - ``initiatorName``
  - ``iscsiInterface``
  - ``portals``
  - ``authDiscovery``
  - ``authDiscovery.username``
  - ``authDiscovery.password``
  - ``authDiscovery.usernameInitiator``
  - ``authDiscovery.passwordInitiator``
  - ``authSession``
  - ``authSession.username``
  - ``authSession.password``

### `persistence/nfs.md`
- Matched newdocs file: `persistence/nfs.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/nfs.json` (score: `1.50`)
- Missing non-schema headings: **2**
  - ``path``
  - ``server``

### `persistence/pvc-vct/index.md`
- Matched newdocs file: `persistence/pvc-vct/index.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/pvc-vct/index.json` (score: `1.56`)
- Missing non-schema headings: **23**
  - ``labels``
  - ``annotations``
  - ``namespace``
  - ``retain``
  - ``accessModes``
  - ``volumeName``
  - ``existingClaim``
  - ``size``
  - ``storageClass``
  - ``dataSource``
  - ``dataSource.kind``
  - ``dataSource.name``
  - ``static``
  - ``static.mode``
  - ``mountOptions``
  - ``mountOptions[].key``
  - ``mountOptions[].value``
  - ``volumeSnapshots``
  - ``volumeSnapshots[].name``
  - ``volumeSnapshots[].enabled``
  - ``volumeSnapshots[].labels``
  - ``volumeSnapshots[].annotations``
  - ``volumeSnapshots[].volumeSnapshotClassName``

### `persistence/pvc-vct/static-custom.md`
- Matched newdocs file: `persistence/pvc-vct/static-custom.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/pvc-vct/static-custom.json` (score: `1.56`)
- Missing non-schema headings: **2**
  - ``driver``
  - ``provisioner``

### `persistence/pvc-vct/static-nfs.md`
- Matched newdocs file: `persistence/pvc-vct/static-nfs.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/pvc-vct/static-nfs.json` (score: `1.56`)
- Missing non-schema headings: **2**
  - ``server``
  - ``share``

### `persistence/pvc-vct/static-smb.md`
- Matched newdocs file: `persistence/pvc-vct/static-smb.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/pvc-vct/static-smb.json` (score: `1.56`)
- Missing non-schema headings: **5**
  - ``server``
  - ``share``
  - ``user``
  - ``password``
  - ``domain``

### `persistence/secret.md`
- Matched newdocs file: `persistence/secret.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `persistence/secret.json` (score: `1.50`)
- Missing non-schema headings: **7**
  - ``objectName``
  - ``expandObjectName``
  - ``optional``
  - ``defaultMode``
  - ``items``
  - ``items.key``
  - ``items.path``

### `podDisruptionBudget.md`
- Matched newdocs file: `podDisruptionBudget.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `podDisruptionBudget.json` (score: `1.35`)
- Missing non-schema headings: **9**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``minAvailable``
  - ``maxUnavailable``
  - ``unhealthyPodEvictionPolicy``

### `podOptions.md`
- Matched newdocs file: `podOptions/index.md`
- Match type: `fuzzy` (score: `0.92`)
- Matched schema file: `podOptions/podOptions.json` (score: `1.00`)
- Missing non-schema headings: **20**
  - `Defaults`
  - ``enableServiceLinks``
  - ``hostNetwork``
  - ``hostPID``
  - ``hostIPC``
  - ``hostUsers``
  - ``shareProcessNamespace``
  - ``restartPolicy``
  - ``dnsPolicy``
  - ``dnsConfig``
  - ``hostAliases``
  - ``nodeSelector``
  - ``defaultSpread``
  - ``topologySpreadConstraints``
  - ``tolerations``
  - ``schedulerName``
  - ``priorityClassName``
  - ``runtimeClassName``
  - ``automountServiceAccountToken``
  - ``terminationGracePeriodSeconds``

### `priorityClass.md`
- Matched newdocs file: `priorityClass.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `priorityClass.json` (score: `1.35`)
- Missing non-schema headings: **10**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``value``
  - ``globalDefault``
  - ``description``
  - ``preemptionPolicy``

### `rbac.md`
- Matched newdocs file: `rbac.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `rbac.json` (score: `1.35`)
- Missing non-schema headings: **20**
  - `Naming scheme`
  - `Target Selector`
  - ``$name``
  - ``enabled``
  - ``primary``
  - ``namespace``
  - ``clusterWide``
  - ``labels``
  - ``annotations``
  - ``allServiceAccounts``
  - ``serviceAccounts``
  - ``rules``
  - ``rules[].apiGroups``
  - ``rules[].resources``
  - ``rules[].resourceNames``
  - ``rules[].verbs``
  - ``subjects``
  - ``subjects[].kind``
  - ``subjects[].name``
  - ``subjects[].apiGroup``

### `resources.md`
- Matched newdocs file: `workload/podSpec/containers/resources.md`
- Match type: `fuzzy` (score: `0.63`)
- Matched schema file: `workload/podSpec/containers/resources.json` (score: `0.64`)
- Missing non-schema headings: **4**
  - `Defaults`
  - ``resources.requests."gpu.intel.com/i915"``
  - ``resources.limits."nvidia.com/gpu"``
  - ``resources.limits."amd.com/gpu"``

### `route.md`
- Matched newdocs file: `route.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `route.json` (score: `1.35`)
- Missing non-schema headings: **7**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``kind``
  - ``parentRefs``
  - ``hostnames``
  - ``rules``

### `secret.md`
- Matched newdocs file: `secret.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `secret.json` (score: `1.35`)
- Missing non-schema headings: **8**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``type``
  - ``data``

### `securityContext.md`
- Matched newdocs file: `workload/podSpec/containers/securityContext.md`
- Match type: `fuzzy` (score: `0.76`)
- Matched schema file: `workload/podSpec/containers/securityContext.json` (score: `0.77`)
- Missing non-schema headings: **21**
  - `Defaults`
  - ``securityContext.container``
  - ``securityContext.container.PUID``
  - ``securityContext.container.UMASK``
  - ``securityContext.container.runAsNonRoot``
  - ``securityContext.container.runAsUser``
  - ``securityContext.container.runAsGroup``
  - ``securityContext.container.readOnlyRootFilesystem``
  - ``securityContext.container.allowPrivilegeEscalation``
  - ``securityContext.container.privileged``
  - ``securityContext.container.seccompProfile``
  - ``securityContext.container.seccompProfile.type``
  - ``securityContext.container.seccompProfile.profile``
  - ``securityContext.container.capabilities``
  - ``securityContext.container.capabilities.add``
  - ``securityContext.container.capabilities.drop``
  - ``securityContext.pod``
  - ``securityContext.pod.fsGroup``
  - ``securityContext.pod.fsGroupChangePolicy``
  - ``securityContext.pod.supplementalGroups``
  - ``securityContext.pod.sysctls``

### `service/ExternalIP.md`
- Matched newdocs file: `service/ExternalIP.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `service/ExternalIP.json` (score: `1.50`)
- Missing non-schema headings: **4**
  - ``externalIP``
  - ``useSlice``
  - ``addressType``
  - ``appProtocol``

### `service/ExternalName.md`
- Matched newdocs file: `service/ExternalName.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `service/ExternalName.json` (score: `1.50`)
- Missing non-schema headings: **1**
  - ``externalName``

### `service/LoadBalancer.md`
- Matched newdocs file: `service/LoadBalancer.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `service/LoadBalancer.json` (score: `1.50`)
- Missing non-schema headings: **4**
  - ``sharedKey``
  - ``loadBalancerIP``
  - ``loadBalancerIPs``
  - ``loadBalancerSourceRanges``

### `service/NodePort.md`
- Matched newdocs file: `service/NodePort.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `service/NodePort.json` (score: `1.50`)
- Missing non-schema headings: **1**
  - ``ports.$port-name.nodePort``

### `service/index.md`
- Matched newdocs file: `service/index.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `service/NodePort.json` (score: `0.93`)
- Missing non-schema headings: **21**
  - `Naming scheme`
  - `Target Selector`
  - ``$name``
  - ``enabled``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``type``
  - ``expandObjectName``
  - ``clusterIP``
  - ``ipFamilyPolicy``
  - ``ipFamilies``
  - ``sessionAffinity``
  - ``sessionAffinityConfig.clientIP.timeoutSeconds``
  - ``externalIPs``
  - ``externalTrafficPolicy``
  - ``publishNotReadyAddresses``
  - ``targetSelector``
  - ``ports``
  - ``integrations``
  - ``integrations.traefik``

### `service/integrations/traefik.md`
- Matched newdocs file: `service/integrations/traefik.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `service/integrations/traefik.json` (score: `1.56`)
- Missing non-schema headings: **11**
  - ``enabled``
  - ``forceTLS``
  - ``insecureSkipVerify``
  - ``serverName``
  - ``rootCAs``
  - ``rootCAs.secretRef``
  - ``rootCAs.secretRef.name``
  - ``rootCAs.secretRef.expandObjectName``
  - ``rootCAs.configMapRef``
  - ``rootCAs.configMapRef.name``
  - ``rootCAs.configMapRef.expandObjectName``

### `service/ports.md`
- Matched newdocs file: `service/ports.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `service/ports.json` (score: `1.50`)
- Missing non-schema headings: **7**
  - `Target Selector`
  - ``$port-name``
  - ``port``
  - ``targetPort``
  - ``protocol``
  - ``hostPort``
  - ``targetSelector``

### `serviceAccount.md`
- Matched newdocs file: `serviceAccount.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `serviceAccount.json` (score: `1.35`)
- Missing non-schema headings: **10**
  - `Naming scheme`
  - `Target Selector`
  - ``serviceAccount.$name``
  - ``enabled``
  - ``primary``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``targetSelectAll``
  - ``targetSelector``

### `storageClass.md`
- Matched newdocs file: `storageClass.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `storageClass.json` (score: `1.35`)
- Missing non-schema headings: **11**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``labels``
  - ``annotations``
  - ``provisioner``
  - ``parameters``
  - ``reclaimPolicy``
  - ``allowVolumeExpansion``
  - ``volumeBindingMode``
  - ``mountOptions``

### `volumeSnapshot.md`
- Matched newdocs file: `volumeSnapshots.md`
- Match type: `fuzzy` (score: `1.17`)
- Matched schema file: `volumeSnapshots.json` (score: `1.17`)
- Missing non-schema headings: **7**
  - ``$name``
  - ``labels``
  - ``annotations``
  - ``enabled``
  - ``source``
  - ``volumeSnapshotContentName``
  - ``persistentVolumeClaimName``

### `volumeSnapshotClass.md`
- Matched newdocs file: `volumeSnapshotClass.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `volumeSnapshotClass.json` (score: `1.35`)
- Missing non-schema headings: **8**
  - ``$name``
  - ``labels``
  - ``annotations``
  - ``enabled``
  - ``isDefault``
  - ``driver``
  - ``deletionPolicy``
  - ``parameters``

### `vpa.md`
- Matched newdocs file: `vpa.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `vpa.json` (score: `1.35`)
- Missing non-schema headings: **5**
  - ``$name``
  - ``enabled``
  - ``targetSelector``
  - ``updatePolicy``
  - ``resourcePolicy``

### `webhook.md`
- Matched newdocs file: `webhook.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `webhook.json` (score: `1.35`)
- Missing non-schema headings: **29**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``namespace``
  - ``labels``
  - ``annotations``
  - ``type``
  - ``webhooks``
  - ``webhooks[].name``
  - ``webhooks[].failurePolicy``
  - ``webhooks[].matchPolicy``
  - ``webhooks[].sideEffects``
  - ``webhooks[].reinvocationPolicy``
  - ``webhooks[].timeoutSeconds``
  - ``webhooks[].admissionReviewVersions``
  - ``webhooks[].clientConfig``
  - ``webhooks[].clientConfig.caBundle``
  - ``webhooks[].clientConfig.url``
  - ``webhooks[].clientConfig.service``
  - ``webhooks[].clientConfig.service.name``
  - ``webhooks[].clientConfig.service.namespace``
  - ``webhooks[].clientConfig.service.path``
  - ``webhooks[].clientConfig.service.port``
  - ``webhooks[].rules``
  - ``webhooks[].rules[].scope``
  - ``webhooks[].rules[].apiGroups``
  - ``webhooks[].rules[].apiVersions``
  - ``webhooks[].rules[].operations``
  - ``webhooks[].rules[].resources``

### `workload/cronjob.md`
- Matched newdocs file: `workload/cronjob.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `workload/cronjob.json` (score: `1.50`)
- Missing non-schema headings: **13**
  - `Notes`
  - ``schedule``
  - ``timezone``
  - ``concurrencyPolicy``
  - ``failedJobsHistoryLimit``
  - ``successfulJobsHistoryLimit``
  - ``startingDeadlineSeconds``
  - ``completionMode``
  - ``backoffLimit``
  - ``completions``
  - ``parallelism``
  - ``ttlSecondsAfterFinished``
  - ``activeDeadlineSeconds``

### `workload/daemonset.md`
- Matched newdocs file: `workload/daemonset.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `workload/daemonset.json` (score: `1.50`)
- Missing non-schema headings: **6**
  - `Notes`
  - ``revisionHistoryLimit``
  - ``strategy``
  - ``rollingUpdate``
  - ``rollingUpdate.maxUnavailable``
  - ``rollingUpdate.maxSurge``

### `workload/deployment.md`
- Matched newdocs file: `workload/deployment.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `workload/deployment.json` (score: `1.50`)
- Missing non-schema headings: **7**
  - `Notes`
  - ``replicas``
  - ``revisionHistoryLimit``
  - ``strategy``
  - ``rollingUpdate``
  - ``rollingUpdate.maxUnavailable``
  - ``rollingUpdate.maxSurge``

### `workload/index.md`
- Matched newdocs file: `workload/index.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `workload/job.json` (score: `0.86`)
- Missing non-schema headings: **52**
  - `Naming scheme`
  - ``$name``
  - ``enabled``
  - ``primary``
  - ``labels``
  - ``annotations``
  - ``namespace``
  - ``type``
  - ``podSpec``
  - ``labels``
  - ``annotations``
  - ``automountServiceAccountToken``
  - ``serviceAccountName``
  - ``hostNetwork``
  - ``hostPID``
  - ``hostIPC``
  - ``hostUsers``
  - ``shareProcessNamespace``
  - ``enableServiceLinks``
  - ``restartPolicy``
  - ``schedulerName``
  - ``priorityClassName``
  - ``hostname``
  - ``terminationGracePeriodSeconds``
  - ``nodeSelector``
  - ``topologySpreadConstraints``
  - ``hostAliases``
  - ``ip``
  - ``hostnames``
  - ``dnsPolicy``
  - ``dnsConfig``
  - ``dnsConfig.nameservers``
  - ``dnsConfig.searches``
  - ``dnsConfig.options``
  - ``dnsConfig.options.name``
  - ``dnsConfig.options.value``
  - ``tolerations``
  - ``tolerations.operator``
  - ``tolerations.key``
  - ``tolerations.value``
  - ... plus 12 more

### `workload/job.md`
- Matched newdocs file: `workload/job.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `workload/job.json` (score: `1.50`)
- Missing non-schema headings: **7**
  - `Notes`
  - ``completionMode``
  - ``backoffLimit``
  - ``completions``
  - ``parallelism``
  - ``ttlSecondsAfterFinished``
  - ``activeDeadlineSeconds``

### `workload/statefulset.md`
- Matched newdocs file: `workload/statefulset.md`
- Match type: `exact-path` (score: `1.00`)
- Matched schema file: `workload/statefulset.json` (score: `1.50`)
- Missing non-schema headings: **7**
  - `Notes`
  - ``replicas``
  - ``revisionHistoryLimit``
  - ``strategy``
  - ``rollingUpdate``
  - ``rollingUpdate.maxUnavailable``
  - ``rollingUpdate.partition``

