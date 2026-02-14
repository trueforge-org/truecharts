# Index: Missing test-related content and headings in newdocs

- Source tree: `/Users/kjeld/GIT/trueforge/truecharts/charts/library/common/docs`
- Target tree: `/Users/kjeld/GIT/trueforge/truecharts/charts/library/common/newdocs`
- Docs files considered: **95**
- Newdocs files considered: **155**
- Docs files with no matched newdocs file: **2**
- Matched files with missing headings: **90**
- Matched files with missing test-related blocks (tables ignored): **23**

## 1) Docs files without a match in newdocs (aggressive matching)

- `resources.md`
- `securityContext.md`

## 2) Missing headings

### `addons.md`
- Matched newdocs file: `addons/index.md`
- Match type: `fuzzy` (score: `0.67`)
- Missing headings: **6**
  - `addons.$addon`
  - `addons.$addon.enabled`
  - `addons.$addon.targetSelector`
  - `addons.$addon.container`
  - `addons.$addon.service`
  - `addons.$addon.ingress`

### `certificate.md`
- Matched newdocs file: `certificate.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **11**
  - Naming scheme
  - `$name`
  - `enabled`
  - `namespace`
  - `labels`
  - `annotations`
  - `certificateIssuer`
  - `hosts`
  - `certificateSecretTemplate`
  - `labels`
  - `annotations`

### `cnpg/cluster.md`
- Matched newdocs file: `service/ClusterIP.md`
- Match type: `fuzzy` (score: `0.62`)
- Missing headings: **12**
  - `labels`
  - `annotations`
  - `env`
  - `envFrom`
  - `instances`
  - `singleNode`
  - `logLevel`
  - `primaryUpdateMethod`
  - `primaryUpdateStrategy`
  - `certificates`
  - `postgresql`
  - `initdb`

### `cnpg/cnpg.md`
- Matched newdocs file: `cnpg/index.md`
- Match type: `fuzzy` (score: `0.63`)
- Missing headings: **18**
  - Naming scheme
  - `$name`
  - `enabled`
  - `primary`
  - `hibernate`
  - `labels`
  - `annotations`
  - `type`
  - `pgVersion`
  - `mode`
  - `database`
  - `user`
  - `password`
  - `cluster`
  - `monitoring`
  - `recovery`
  - `backups`
  - `pooler`

### `configmap.md`
- Matched newdocs file: `configmap.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **7**
  - Naming scheme
  - `$name`
  - `enabled`
  - `namespace`
  - `labels`
  - `annotations`
  - `data`

### `container/args.md`
- Matched newdocs file: `workload/podSpec/containers/args.md`
- Match type: `fuzzy` (score: `0.61`)
- Missing headings: **4**
  - `args`
  - Or
  - `extraArgs`
  - Or

### `container/command.md`
- Matched newdocs file: `workload/podSpec/containers/command.md`
- Match type: `fuzzy` (score: `0.65`)
- Missing headings: **1**
  - `command`

### `container/env.md`
- Matched newdocs file: `addons/gluetun/container/env.md`
- Match type: `fuzzy` (score: `0.63`)
- Missing headings: **13**
  - `env`
  - `env.$key`
  - `env.$key.configMapKeyRef`
  - `env.$key.configMapKeyRef.name`
  - `env.$key.configMapKeyRef.key`
  - `env.$key.configMapKeyRef.expandObjectName`
  - `env.$key.secretKeyRef`
  - `env.$key.secretKeyRef.name`
  - `env.$key.secretKeyRef.key`
  - `env.$key.secretKeyRef.expandObjectName`
  - `env.$key.fieldRef`
  - `env.$key.fieldRef.fieldPath`
  - `env.$key.fieldRef.apiVersion`

### `container/envFrom.md`
- Matched newdocs file: `workload/podSpec/containers/envFrom.md`
- Match type: `fuzzy` (score: `0.65`)
- Missing headings: **7**
  - `envFrom`
  - `envFrom.secretRef`
  - `envFrom.secretRef.name`
  - `envFrom.secretRef.expandObjectName`
  - `envFrom.configMapRef`
  - `envFrom.configMapRef.name`
  - `envFrom.configMapRef.expandObjectName`

### `container/fixedEnv.md`
- Matched newdocs file: `workload/podSpec/containers/fixedEnv.md`
- Match type: `fuzzy` (score: `0.67`)
- Missing headings: **5**
  - `fixedEnv`
  - `fixedEnv.TZ`
  - `fixedEnv.UMASK`
  - `fixedEnv.PUID`
  - `fixedEnv.NVIDIA_CAPS`

### `container/index.md`
- Matched newdocs file: `workload/container/index.md`
- Match type: `fuzzy` (score: `0.77`)
- Missing headings: **19**
  - Notes
  - `enabled`
  - `type`
  - `imageSelector`
  - `primary`
  - `stdin`
  - `tty`
  - `command`
  - `args`
  - `extraArgs`
  - `termination`
  - `lifecycle`
  - `probes`
  - `resources`
  - `securityContext`
  - `envFrom`
  - `fixedEnv`
  - `env`
  - Full Examples

### `container/lifecycle.md`
- Matched newdocs file: `workload/podSpec/containers/lifecycle.md`
- Match type: `fuzzy` (score: `0.68`)
- Missing headings: **9**
  - `lifecycle`
  - `lifecycle.preStop`
  - `lifecycle.postStart`
  - `lifecycle.$hook.type`
  - `lifecycle.$hook.command`
  - `lifecycle.$hook.port`
  - `lifecycle.$hook.host`
  - `lifecycle.$hook.path`
  - `lifecycle.$hook.httpHeaders`

### `container/probes.md`
- Matched newdocs file: `workload/podSpec/containers/probes.md`
- Match type: `fuzzy` (score: `0.64`)
- Missing headings: **16**
  - `probes`
  - `probes.liveness`
  - `probes.readiness`
  - `probes.startup`
  - `probes.$probe.enabled`
  - `probes.$probe.type`
  - `probes.$probe.command`
  - `probes.$probe.port`
  - `probes.$probe.path`
  - `probes.$probe.httpHeaders`
  - `probes.$probe.spec`
  - `probes.$probe.spec.initialDelaySeconds`
  - `probes.$probe.spec.periodSeconds`
  - `probes.$probe.spec.timeoutSeconds`
  - `probes.$probe.spec.failureThreshold`
  - `probes.$probe.spec.successThreshold`

### `container/resources.md`
- Matched newdocs file: `workload/podSpec/containers/resources.md`
- Match type: `fuzzy` (score: `0.68`)
- Missing headings: **11**
  - Notes
  - `resources`
  - `resources.requests`
  - `resources.requests.cpu`
  - `resources.requests.memory`
  - `resources.limits`
  - `resources.limits.cpu`
  - `resources.limits.memory`
  - `resources.limits."gpu.intel.com/i915"`
  - `resources.limits."nvidia.com/gpu"`
  - `resources.limits."amd.com/gpu"`

### `container/securityContext.md`
- Matched newdocs file: `workload/podSpec/containers/securityContext.md`
- Match type: `fuzzy` (score: `0.74`)
- Missing headings: **13**
  - `securityContext`
  - `securityContext.runAsUser`
  - `securityContext.runAsGroup`
  - `securityContext.readOnlyRootFilesystem`
  - `securityContext.allowPrivilegeEscalation`
  - `securityContext.privileged`
  - `securityContext.runAsNonRoot`
  - `securityContext.capabilities`
  - `securityContext.capabilities.add`
  - `securityContext.capabilities.drop`
  - `securityContext.seccompProfile`
  - `securityContext.seccompProfile.type`
  - `securityContext.seccompProfile.profile`

### `container/termination.md`
- Matched newdocs file: `workload/container/termination.md`
- Match type: `fuzzy` (score: `0.82`)
- Missing headings: **3**
  - `termination`
  - `termination.messagePath`
  - `termination.messagePolicy`

### `containerOptions.md`
- Matched newdocs file: `containerOptions.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **2**
  - Defaults
  - `NVIDIA_CAPS`

### `credentials.md`
- Matched newdocs file: `credentials.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **15**
  - Naming scheme
  - `$name`
  - `type`
  - `url`
  - `region`
  - `customCASecretRef`
  - `customCASecretRef.name`
  - `customCASecretRef.key`
  - `customCASecretRef.expandObjectName`
  - `customCA`
  - `path`
  - `bucket`
  - `accessKey`
  - `secretKey`
  - `encrKey`

### `fallbackDefaults.md`
- Matched newdocs file: `global/fallbackDefaults.md`
- Match type: `fuzzy` (score: `0.82`)
- Missing headings: **30**
  - Defaults
  - `probeType`
  - `serviceProtocol`
  - `serviceType`
  - `storageClass`
  - `persistenceType`
  - `pvcRetain`
  - `pvcSize`
  - `vctSize`
  - `accessModes`
  - `probeTimeouts`
  - `probeTimeouts.liveness`
  - `probeTimeouts.liveness.initialDelaySeconds`
  - `probeTimeouts.liveness.periodSeconds`
  - `probeTimeouts.liveness.timeoutSeconds`
  - `probeTimeouts.liveness.failureThreshold`
  - `probeTimeouts.liveness.successThreshold`
  - `probeTimeouts.readiness`
  - `probeTimeouts.readiness.initialDelaySeconds`
  - `probeTimeouts.readiness.periodSeconds`
  - `probeTimeouts.readiness.timeoutSeconds`
  - `probeTimeouts.readiness.failureThreshold`
  - `probeTimeouts.readiness.successThreshold`
  - `probeTimeouts.startup`
  - `probeTimeouts.startup.initialDelaySeconds`
  - `probeTimeouts.startup.periodSeconds`
  - `probeTimeouts.startup.timeoutSeconds`
  - `probeTimeouts.startup.failureThreshold`
  - `probeTimeouts.startup.successThreshold`
  - `topologyKey`

### `global.md`
- Matched newdocs file: `global/index.md`
- Match type: `fuzzy` (score: `0.67`)
- Missing headings: **10**
  - Defaults
  - `labels`
  - `annotations`
  - `namespace`
  - `minNodePort`
  - `stopAll`
  - `metallb`
  - `traefik`
  - `traefik.addServiceAnnotations`
  - `traefik.commonMiddlewares`

### `hpa.md`
- Matched newdocs file: `hpa.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **7**
  - `$name`
  - `enabled`
  - `targetSelector`
  - `minReplicas`
  - `maxReplicas`
  - `metrics`
  - `behavior`

### `imagePullSecret.md`
- Matched newdocs file: `imagePullSecret.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **15**
  - Naming scheme
  - Target Selector
  - `$name`
  - `enabled`
  - `existingSecret`
  - `namespace`
  - `labels`
  - `annotations`
  - `targetSelectAll`
  - `targetSelector`
  - `data`
  - `data.registry`
  - `data.username`
  - `data.password`
  - `data.email`

### `index.md`
- Matched newdocs file: `cnpg/index.md`
- Match type: `fuzzy` (score: `0.67`)
- Missing headings: **22**
  - Notes
  - Schema Validation (Dev)
  - `global`
  - `fallbackDefaults`
  - `extraTpl`
  - `operator`
  - `operator.register`
  - `operator.verify`
  - `operator.verify.enabled`
  - `operator.verify.additionalsystem`
  - `podOptions`
  - `containerOptions`
  - `TZ`
  - `namespace`
  - `resources`
  - `securityContext`
  - Images
  - `image`
  - `image.repository`
  - `image.tag`
  - `image.pullPolicy`
  - Additional Documentation

### `ingress/certManager.md`
- Matched newdocs file: `ingress/certManager.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **2**
  - `enabled`
  - `certificateIssuer`

### `ingress/homepage.md`
- Matched newdocs file: `ingress/integrations/homepage.md`
- Match type: `fuzzy` (score: `0.71`)
- Missing headings: **17**
  - `enabled`
  - `name`
  - `description`
  - `group`
  - `icon`
  - `href`
  - `weight`
  - `podSelector`
  - `widget`
  - `widget.enabled`
  - `widget.type`
  - `widget.version`
  - `widget.url`
  - `widget.custom`
  - `widget.customkv`
  - `widget.customkv[].key`
  - `widget.customkv[].value`

### `ingress/index.md`
- Matched newdocs file: `ingress/index.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **30**
  - Naming scheme
  - Target Selector
  - `$name`
  - `enabled`
  - `primary`
  - `expandObjectName`
  - `required`
  - `namespace`
  - `labels`
  - `annotations`
  - `ingressClassName`
  - `targetSelector`
  - `hosts`
  - `hosts[].host`
  - `hosts[].paths`
  - `hosts[].paths[].path`
  - `hosts[].paths[].pathType`
  - `hosts[].paths[].overrideService`
  - `hosts[].paths[].overrideService.name`
  - `hosts[].paths[].overrideService.expandObjectName`
  - `hosts[].paths[].overrideService.port`
  - `tls`
  - `tls[].hosts`
  - `tls[].secretName`
  - `tls[].certificateIssuer`
  - `tls[].clusterIssuer`
  - `integrations`
  - `integrations.certManager`
  - `integrations.traefik`
  - `integrations.homepage`

### `ingress/traefik.md`
- Matched newdocs file: `ingress/traefik.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **8**
  - `enabled`
  - `entrypoints`
  - `forceTLS`
  - `middlewares`
  - `middlewares[].name`
  - `middlewares[].namespace`
  - `middlewares[].expandObjectName`
  - `chartMiddlewares`

### `metrics.md`
- Matched newdocs file: `metrics.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **8**
  - Naming scheme
  - `$name`
  - `enabled`
  - `type`
  - `targetSelector`
  - `selector`
  - `endpoints`
  - `prometheusRule`

### `middlewares/index.md`
- Matched newdocs file: `ingressMiddlewares/index.md`
- Match type: `fuzzy` (score: `0.83`)
- Missing headings: **10**
  - Naming scheme
  - `$provider`
  - `$name`
  - `enabled`
  - `expandObjectName`
  - `namespace`
  - `labels`
  - `annotations`
  - `data`
  - `type`

### `middlewares/traefik/add-prefix.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/add-prefix.md`
- Match type: `fuzzy` (score: `0.75`)
- Missing headings: **1**
  - `prefix`

### `middlewares/traefik/basic-auth.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/basic-auth.md`
- Match type: `fuzzy` (score: `0.75`)
- Missing headings: **4**
  - `users`
  - `users[].username`
  - `users[].password`
  - `secret`

### `middlewares/traefik/buffering.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/buffering.md`
- Match type: `fuzzy` (score: `0.75`)
- Missing headings: **5**
  - `maxRequestBodyBytes`
  - `memRequestBodyBytes`
  - `maxResponseBodyBytes`
  - `memResponseBodyBytes`
  - `retryExpression`

### `middlewares/traefik/chain.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/chain.md`
- Match type: `fuzzy` (score: `0.72`)
- Missing headings: **3**
  - `middlewares`
  - `middlewares[].name`
  - `middlewares[].expandObjectName`

### `middlewares/traefik/forward-auth.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/forward-auth.md`
- Match type: `fuzzy` (score: `0.77`)
- Missing headings: **7**
  - `address`
  - `authResponseHeadersRegex`
  - `trustForwardHeader`
  - `authResponseHeaders`
  - `authRequestHeaders`
  - `tls`
  - `tls.insecureSkipVerify`

### `middlewares/traefik/headers.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/headers.md`
- Match type: `fuzzy` (score: `0.74`)
- Missing headings: **28**
  - `customRequestHeaders`
  - `customResponseHeaders`
  - `accessControlAllowCredentials`
  - `accessControlAllowHeaders`
  - `accessControlAllowMethods`
  - `accessControlAllowOriginList`
  - `accessControlAllowOriginListRegex`
  - `accessControlExposeHeaders`
  - `accessControlMaxAge`
  - `addVaryHeader`
  - `allowedHosts`
  - `hostsProxyHeaders`
  - `sslProxyHeaders`
  - `stsSeconds`
  - `stsIncludeSubdomains`
  - `stsPreload`
  - `forceSTSHeader`
  - `frameDeny`
  - `customFrameOptionsValue`
  - `contentTypeNosniff`
  - `browserXssFilter`
  - `customBrowserXSSValue`
  - `contentSecurityPolicy`
  - `contentSecurityPolicyReportOnly`
  - `publicKey`
  - `referrerPolicy`
  - `permissionsPolicy`
  - `isDevelopment`

### `middlewares/traefik/index.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/index.md`
- Match type: `fuzzy` (score: `0.72`)
- Missing headings: **1**
  - `type`

### `middlewares/traefik/ip-allow-list.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/ip-allow-list.md`
- Match type: `fuzzy` (score: `0.77`)
- Missing headings: **4**
  - `sourceRange`
  - `ipStrategy`
  - `ipStrategy.depth`
  - `ipStrategy.excludedIPs`

### `middlewares/traefik/plugin-bouncer.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-bouncer.md`
- Match type: `fuzzy` (score: `0.78`)
- Missing headings: **36**
  - `pluginName`
  - `enabled`
  - `logLevel`
  - `updateIntervalSeconds`
  - `updateMaxFailure`
  - `defaultDecisionSeconds`
  - `httpTimeoutSeconds`
  - `crowdsecMode`
  - `crowdsecAppsecEnabled`
  - `crowdsecAppsecHost`
  - `crowdsecAppsecFailureBlock`
  - `crowdsecAppsecUnreachableBlock`
  - `crowdsecLapiKey`
  - `crowdsecLapiHost`
  - `crowdsecLapiScheme`
  - `crowdsecLapiTLSInsecureVerify`
  - `crowdsecCapiMachineId`
  - `crowdsecCapiPassword`
  - `crowdsecCapiScenarios`
  - `forwardedHeadersTrustedIPs`
  - `clientTrustedIPs`
  - `forwardedHeadersCustomName`
  - `remediationHeadersCustomName`
  - `redisCacheEnabled`
  - `redisCacheHost`
  - `redisCachePassword`
  - `redisCacheDatabase`
  - `crowdsecLapiTLSCertificateAuthority`
  - `crowdsecLapiTLSCertificateBouncer`
  - `crowdsecLapiTLSCertificateBouncerKey`
  - `captchaProvider`
  - `captchaSiteKey`
  - `captchaSecretKey`
  - `captchaGracePeriodSeconds`
  - `captchaHTMLFilePath`
  - `banHTMLFilePath`

### `middlewares/traefik/plugin-geoblock.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-geoblock.md`
- Match type: `fuzzy` (score: `0.78`)
- Missing headings: **15**
  - `pluginName`
  - `api`
  - `allowLocalRequests`
  - `logLocalRequests`
  - `logAllowedRequests`
  - `logApiRequests`
  - `apiTimeoutMs`
  - `cacheSize`
  - `forceMonthlyUpdate`
  - `allowUnknownCountries`
  - `unknownCountryApiResponse`
  - `blackListMode`
  - `silentStartUp`
  - `addCountryHeader`
  - `countries`

### `middlewares/traefik/plugin-mod-security.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-mod-security.md`
- Match type: `fuzzy` (score: `0.80`)
- Missing headings: **4**
  - `pluginName`
  - `modSecurityUrl`
  - `timeoutMillis`
  - `maxBodySize`

### `middlewares/traefik/plugin-real-ip.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-real-ip.md`
- Match type: `fuzzy` (score: `0.77`)
- Missing headings: **2**
  - `pluginName`
  - `excludednets`

### `middlewares/traefik/plugin-rewrite-response-headers.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-rewrite-response-headers.md`
- Match type: `fuzzy` (score: `0.83`)
- Missing headings: **5**
  - `pluginName`
  - `rewrites`
  - `rewrites[].header`
  - `rewrites[].regex`
  - `rewrites[].replacement`

### `middlewares/traefik/plugin-theme-park.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-theme-park.md`
- Match type: `fuzzy` (score: `0.79`)
- Missing headings: **5**
  - `pluginName`
  - `app`
  - `theme`
  - `baseUrl`
  - `addons`

### `middlewares/traefik/rate-limit.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/rate-limit.md`
- Match type: `fuzzy` (score: `0.75`)
- Missing headings: **2**
  - `average`
  - `burst`

### `middlewares/traefik/redirect-regex.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/redirect-regex.md`
- Match type: `fuzzy` (score: `0.78`)
- Missing headings: **3**
  - `regex`
  - `replacement`
  - `permanent`

### `middlewares/traefik/redirect-scheme.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/redirect-scheme.md`
- Match type: `fuzzy` (score: `0.78`)
- Missing headings: **2**
  - `scheme`
  - `permanent`

### `middlewares/traefik/replace-path-regex.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/replace-path-regex.md`
- Match type: `fuzzy` (score: `0.79`)
- Missing headings: **2**
  - `regex`
  - `replacement`

### `middlewares/traefik/replace-path.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/replace-path.md`
- Match type: `fuzzy` (score: `0.77`)
- Missing headings: **1**
  - `path`

### `middlewares/traefik/retry.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/retry.md`
- Match type: `fuzzy` (score: `0.72`)
- Missing headings: **2**
  - `attempts`
  - `initialInterval`

### `middlewares/traefik/strip-prefix-regex.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/strip-prefix-regex.md`
- Match type: `fuzzy` (score: `0.79`)
- Missing headings: **1**
  - `regex`

### `middlewares/traefik/strip-prefix.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/strip-prefix.md`
- Match type: `fuzzy` (score: `0.77`)
- Missing headings: **2**
  - `prefix`
  - `forceSlash`

### `networkpolicy.md`
- Matched newdocs file: `networkpolicy.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **34**
  - Naming scheme
  - `$name`
  - `enabled`
  - `primary`
  - `expandObjectName`
  - `namespace`
  - `labels`
  - `annotations`
  - Pod Selection
  - `podSelector`
  - Default Behavior
  - `matchLabels`
  - `matchExpressions`
  - `targetSelector`
  - `targetAllPods`
  - Policy Configuration
  - `policyTypes`
  - Ingress Rules
  - `ingress`
  - `from`
  - Pod Selector
  - Namespace Selector
  - Combined Pod and Namespace Selector
  - IP Block
  - `ports`
  - Port Ranges (Kubernetes 1.25+)
  - Named Ports
  - Egress Rules
  - `egress`
  - `to`
  - Pod Selector
  - Namespace Selector
  - IP Block
  - `ports`

### `notes.md`
- Matched newdocs file: `notes.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **6**
  - `header`
  - Welcome to TrueCharts!
  - `custom`
  - `footer`
  - Documentation
  - Bug reports

### `persistence/configmap.md`
- Matched newdocs file: `persistence/configmap.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **7**
  - `objectName`
  - `expandObjectName`
  - `optional`
  - `defaultMode`
  - `items`
  - `items[].key`
  - `items[].path`

### `persistence/device.md`
- Matched newdocs file: `persistence/device.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **3**
  - Notes
  - `hostPath`
  - `hostPathType`

### `persistence/emptyDir.md`
- Matched newdocs file: `persistence/emptyDir.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **2**
  - `size`
  - `medium`

### `persistence/hostPath.md`
- Matched newdocs file: `persistence/hostPath.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **2**
  - `hostPath`
  - `hostPathType`

### `persistence/index.md`
- Matched newdocs file: `persistence/index.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **21**
  - Naming scheme
  - Target Selector
  - `$name`
  - `enabled`
  - `type`
  - `mountPath`
  - `mountPropagation`
  - `subPath`
  - `readOnly`
  - `targetSelectAll`
  - `targetSelector`
  - `targetSelector.$podName`
  - `targetSelector.$podName.$containerName`
  - `targetSelector.$podName.$containerName.mountPath`
  - `targetSelector.$podName.$containerName.mountPropagation`
  - `targetSelector.$podName.$containerName.subPath`
  - `targetSelector.$podName.$containerName.readOnly`
  - Basic Examples
  - Example of a shared emptyDir volume
  - Example of a volume mounted to a specific container with a specific mountPath
  - Example of a volume mounted to a specific container using the default mountPath

### `persistence/iscsi.md`
- Matched newdocs file: `persistence/iscsi.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **16**
  - `iscsi`
  - `fsType`
  - `targetPortal`
  - `iqn`
  - `lun`
  - `initiatorName`
  - `iscsiInterface`
  - `portals`
  - `authDiscovery`
  - `authDiscovery.username`
  - `authDiscovery.password`
  - `authDiscovery.usernameInitiator`
  - `authDiscovery.passwordInitiator`
  - `authSession`
  - `authSession.username`
  - `authSession.password`

### `persistence/nfs.md`
- Matched newdocs file: `persistence/nfs.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **2**
  - `path`
  - `server`

### `persistence/pvc-vct/index.md`
- Matched newdocs file: `persistence/pvc-vct/index.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **23**
  - `labels`
  - `annotations`
  - `namespace`
  - `retain`
  - `accessModes`
  - `volumeName`
  - `existingClaim`
  - `size`
  - `storageClass`
  - `dataSource`
  - `dataSource.kind`
  - `dataSource.name`
  - `static`
  - `static.mode`
  - `mountOptions`
  - `mountOptions[].key`
  - `mountOptions[].value`
  - `volumeSnapshots`
  - `volumeSnapshots[].name`
  - `volumeSnapshots[].enabled`
  - `volumeSnapshots[].labels`
  - `volumeSnapshots[].annotations`
  - `volumeSnapshots[].volumeSnapshotClassName`

### `persistence/pvc-vct/static-custom.md`
- Matched newdocs file: `persistence/pvc-vct/static-custom.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **2**
  - `driver`
  - `provisioner`

### `persistence/pvc-vct/static-nfs.md`
- Matched newdocs file: `persistence/pvc-vct/static-nfs.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **2**
  - `server`
  - `share`

### `persistence/pvc-vct/static-smb.md`
- Matched newdocs file: `persistence/pvc-vct/static-smb.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **5**
  - `server`
  - `share`
  - `user`
  - `password`
  - `domain`

### `persistence/secret.md`
- Matched newdocs file: `persistence/secret.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **7**
  - `objectName`
  - `expandObjectName`
  - `optional`
  - `defaultMode`
  - `items`
  - `items.key`
  - `items.path`

### `podDisruptionBudget.md`
- Matched newdocs file: `podDisruptionBudget.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **9**
  - Naming scheme
  - `$name`
  - `enabled`
  - `namespace`
  - `labels`
  - `annotations`
  - `minAvailable`
  - `maxUnavailable`
  - `unhealthyPodEvictionPolicy`

### `podOptions.md`
- Matched newdocs file: `podOptions/index.md`
- Match type: `fuzzy` (score: `0.77`)
- Missing headings: **20**
  - Defaults
  - `enableServiceLinks`
  - `hostNetwork`
  - `hostPID`
  - `hostIPC`
  - `hostUsers`
  - `shareProcessNamespace`
  - `restartPolicy`
  - `dnsPolicy`
  - `dnsConfig`
  - `hostAliases`
  - `nodeSelector`
  - `defaultSpread`
  - `topologySpreadConstraints`
  - `tolerations`
  - `schedulerName`
  - `priorityClassName`
  - `runtimeClassName`
  - `automountServiceAccountToken`
  - `terminationGracePeriodSeconds`

### `priorityClass.md`
- Matched newdocs file: `priorityClass.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **10**
  - Naming scheme
  - `$name`
  - `enabled`
  - `namespace`
  - `labels`
  - `annotations`
  - `value`
  - `globalDefault`
  - `description`
  - `preemptionPolicy`

### `rbac.md`
- Matched newdocs file: `rbac.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **20**
  - Naming scheme
  - Target Selector
  - `$name`
  - `enabled`
  - `primary`
  - `namespace`
  - `clusterWide`
  - `labels`
  - `annotations`
  - `allServiceAccounts`
  - `serviceAccounts`
  - `rules`
  - `rules[].apiGroups`
  - `rules[].resources`
  - `rules[].resourceNames`
  - `rules[].verbs`
  - `subjects`
  - `subjects[].kind`
  - `subjects[].name`
  - `subjects[].apiGroup`

### `route.md`
- Matched newdocs file: `route.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **7**
  - Naming scheme
  - `$name`
  - `enabled`
  - `kind`
  - `parentRefs`
  - `hostnames`
  - `rules`

### `secret.md`
- Matched newdocs file: `secret.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **8**
  - Naming scheme
  - `$name`
  - `enabled`
  - `namespace`
  - `labels`
  - `annotations`
  - `type`
  - `data`

### `service/ExternalIP.md`
- Matched newdocs file: `service/ExternalIP.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **4**
  - `externalIP`
  - `useSlice`
  - `addressType`
  - `appProtocol`

### `service/ExternalName.md`
- Matched newdocs file: `service/ExternalName.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **1**
  - `externalName`

### `service/LoadBalancer.md`
- Matched newdocs file: `service/LoadBalancer.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **4**
  - `sharedKey`
  - `loadBalancerIP`
  - `loadBalancerIPs`
  - `loadBalancerSourceRanges`

### `service/NodePort.md`
- Matched newdocs file: `service/NodePort.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **1**
  - `ports.$port-name.nodePort`

### `service/index.md`
- Matched newdocs file: `service/index.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **21**
  - Naming scheme
  - Target Selector
  - `$name`
  - `enabled`
  - `namespace`
  - `labels`
  - `annotations`
  - `type`
  - `expandObjectName`
  - `clusterIP`
  - `ipFamilyPolicy`
  - `ipFamilies`
  - `sessionAffinity`
  - `sessionAffinityConfig.clientIP.timeoutSeconds`
  - `externalIPs`
  - `externalTrafficPolicy`
  - `publishNotReadyAddresses`
  - `targetSelector`
  - `ports`
  - `integrations`
  - `integrations.traefik`

### `service/integrations/traefik.md`
- Matched newdocs file: `service/integrations/traefik.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **11**
  - `enabled`
  - `forceTLS`
  - `insecureSkipVerify`
  - `serverName`
  - `rootCAs`
  - `rootCAs.secretRef`
  - `rootCAs.secretRef.name`
  - `rootCAs.secretRef.expandObjectName`
  - `rootCAs.configMapRef`
  - `rootCAs.configMapRef.name`
  - `rootCAs.configMapRef.expandObjectName`

### `service/ports.md`
- Matched newdocs file: `service/ports.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **7**
  - Target Selector
  - `$port-name`
  - `port`
  - `targetPort`
  - `protocol`
  - `hostPort`
  - `targetSelector`

### `serviceAccount.md`
- Matched newdocs file: `serviceAccount.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **10**
  - Naming scheme
  - Target Selector
  - `serviceAccount.$name`
  - `enabled`
  - `primary`
  - `namespace`
  - `labels`
  - `annotations`
  - `targetSelectAll`
  - `targetSelector`

### `storageClass.md`
- Matched newdocs file: `storageClass.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **11**
  - Naming scheme
  - `$name`
  - `enabled`
  - `labels`
  - `annotations`
  - `provisioner`
  - `parameters`
  - `reclaimPolicy`
  - `allowVolumeExpansion`
  - `volumeBindingMode`
  - `mountOptions`

### `volumeSnapshot.md`
- Matched newdocs file: `volumeSnapshots.md`
- Match type: `fuzzy` (score: `0.97`)
- Missing headings: **7**
  - `$name`
  - `labels`
  - `annotations`
  - `enabled`
  - `source`
  - `volumeSnapshotContentName`
  - `persistentVolumeClaimName`

### `volumeSnapshotClass.md`
- Matched newdocs file: `volumeSnapshotClass.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **8**
  - `$name`
  - `labels`
  - `annotations`
  - `enabled`
  - `isDefault`
  - `driver`
  - `deletionPolicy`
  - `parameters`

### `vpa.md`
- Matched newdocs file: `vpa.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **5**
  - `$name`
  - `enabled`
  - `targetSelector`
  - `updatePolicy`
  - `resourcePolicy`

### `webhook.md`
- Matched newdocs file: `webhook.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **29**
  - Naming scheme
  - `$name`
  - `enabled`
  - `namespace`
  - `labels`
  - `annotations`
  - `type`
  - `webhooks`
  - `webhooks[].name`
  - `webhooks[].failurePolicy`
  - `webhooks[].matchPolicy`
  - `webhooks[].sideEffects`
  - `webhooks[].reinvocationPolicy`
  - `webhooks[].timeoutSeconds`
  - `webhooks[].admissionReviewVersions`
  - `webhooks[].clientConfig`
  - `webhooks[].clientConfig.caBundle`
  - `webhooks[].clientConfig.url`
  - `webhooks[].clientConfig.service`
  - `webhooks[].clientConfig.service.name`
  - `webhooks[].clientConfig.service.namespace`
  - `webhooks[].clientConfig.service.path`
  - `webhooks[].clientConfig.service.port`
  - `webhooks[].rules`
  - `webhooks[].rules[].scope`
  - `webhooks[].rules[].apiGroups`
  - `webhooks[].rules[].apiVersions`
  - `webhooks[].rules[].operations`
  - `webhooks[].rules[].resources`

### `workload/cronjob.md`
- Matched newdocs file: `workload/cronjob.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **13**
  - Notes
  - `schedule`
  - `timezone`
  - `concurrencyPolicy`
  - `failedJobsHistoryLimit`
  - `successfulJobsHistoryLimit`
  - `startingDeadlineSeconds`
  - `completionMode`
  - `backoffLimit`
  - `completions`
  - `parallelism`
  - `ttlSecondsAfterFinished`
  - `activeDeadlineSeconds`

### `workload/daemonset.md`
- Matched newdocs file: `workload/daemonset.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **6**
  - Notes
  - `revisionHistoryLimit`
  - `strategy`
  - `rollingUpdate`
  - `rollingUpdate.maxUnavailable`
  - `rollingUpdate.maxSurge`

### `workload/deployment.md`
- Matched newdocs file: `workload/deployment.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **7**
  - Notes
  - `replicas`
  - `revisionHistoryLimit`
  - `strategy`
  - `rollingUpdate`
  - `rollingUpdate.maxUnavailable`
  - `rollingUpdate.maxSurge`

### `workload/index.md`
- Matched newdocs file: `workload/index.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **52**
  - Naming scheme
  - `$name`
  - `enabled`
  - `primary`
  - `labels`
  - `annotations`
  - `namespace`
  - `type`
  - `podSpec`
  - `labels`
  - `annotations`
  - `automountServiceAccountToken`
  - `serviceAccountName`
  - `hostNetwork`
  - `hostPID`
  - `hostIPC`
  - `hostUsers`
  - `shareProcessNamespace`
  - `enableServiceLinks`
  - `restartPolicy`
  - `schedulerName`
  - `priorityClassName`
  - `hostname`
  - `terminationGracePeriodSeconds`
  - `nodeSelector`
  - `topologySpreadConstraints`
  - `hostAliases`
  - `ip`
  - `hostnames`
  - `dnsPolicy`
  - `dnsConfig`
  - `dnsConfig.nameservers`
  - `dnsConfig.searches`
  - `dnsConfig.options`
  - `dnsConfig.options.name`
  - `dnsConfig.options.value`
  - `tolerations`
  - `tolerations.operator`
  - `tolerations.key`
  - `tolerations.value`
  - `tolerations.effect`
  - `tolerations.tolerationSeconds`
  - `runtimeClassName`
  - `securityContext`
  - `securityContext.fsGroup`
  - `securityContext.fsGroupChangePolicy`
  - `securityContext.supplementalGroups`
  - `securityContext.sysctls`
  - `securityContext.sysctls.name`
  - `securityContext.sysctls.value`
  - `containers`
  - `initContainers`

### `workload/job.md`
- Matched newdocs file: `workload/job.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **7**
  - Notes
  - `completionMode`
  - `backoffLimit`
  - `completions`
  - `parallelism`
  - `ttlSecondsAfterFinished`
  - `activeDeadlineSeconds`

### `workload/statefulset.md`
- Matched newdocs file: `workload/statefulset.md`
- Match type: `exact-path` (score: `1.00`)
- Missing headings: **7**
  - Notes
  - `replicas`
  - `revisionHistoryLimit`
  - `strategy`
  - `rollingUpdate`
  - `rollingUpdate.maxUnavailable`
  - `rollingUpdate.partition`


## 3) Missing test-related text blocks (tables ignored)

### `cnpg/cluster.md`
- Matched newdocs file: `service/ClusterIP.md`
- Match type: `fuzzy` (score: `0.62`)
- Missing test-related blocks: **2**
  - BEGIN BLOCK
    If you are a chart developer, changing the default value is not recommended,
    as users are expected to change this themselves **if** they are running your
    chart on a single-node cluster.
  - END BLOCK
  - BEGIN BLOCK
    If you are a chart developer, changing the default value is not recommended,
    as users are expected to change this themselves if they are running into
    issues with CNPG.
  - END BLOCK

### `cnpg/cnpg.md`
- Matched newdocs file: `cnpg/index.md`
- Match type: `fuzzy` (score: `0.63`)
- Missing test-related blocks: **3**
  - BEGIN BLOCK
    If you are a chart developer, changing the default value is not recommended,
    as users are expected to change this themselves **if** they want to configure
    a CNPG restore.
  - END BLOCK
  - BEGIN BLOCK
    Define the database password
  - END BLOCK
  - BEGIN BLOCK
    Chart users are strongly encouraged to override this setting with their own
    secure password **during initial install**
  - END BLOCK

### `container/index.md`
- Matched newdocs file: `workload/container/index.md`
- Match type: `fuzzy` (score: `0.77`)
- Missing test-related blocks: **2**
  - BEGIN BLOCK
    Define if the container should have stdin enabled or not
  - END BLOCK
  - BEGIN BLOCK
    Define if the container should have tty enabled or not
  - END BLOCK

### `container/probes.md`
- Matched newdocs file: `workload/podSpec/containers/probes.md`
- Match type: `fuzzy` (score: `0.64`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Define the failureThreshold in seconds
  - END BLOCK

### `container/resources.md`
- Matched newdocs file: `workload/podSpec/containers/resources.md`
- Match type: `fuzzy` (score: `0.68`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    - [CPU Regex Validation](https://regex101.com/r/D4HouI/1)
    - [Memory Regex Validation](https://regex101.com/r/4X3Z9V/1)
  - END BLOCK

### `container/securityContext.md`
- Matched newdocs file: `workload/podSpec/containers/securityContext.md`
- Match type: `fuzzy` (score: `0.74`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    When setting capabilities for containers, remember to **NOT** include `CAP_` prefix.
    For example, `CAP_NET_ADMIN` should be `NET_ADMIN`. This is not specific to this chart,
    but a general Kubernetes thing.
  - END BLOCK

### `credentials.md`
- Matched newdocs file: `credentials.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Setting this manually is usually not necessary as the region should normally
    be automatically detected from the [URL](/truecharts-common/credentials#url).
  - END BLOCK

### `fallbackDefaults.md`
- Matched newdocs file: `global/fallbackDefaults.md`
- Match type: `fuzzy` (score: `0.82`)
- Missing test-related blocks: **3**
  - BEGIN BLOCK
    Define default liveness probe failureThreshold if not defined in the container
  - END BLOCK
  - BEGIN BLOCK
    Define default readiness probe failureThreshold if not defined in the container
  - END BLOCK
  - BEGIN BLOCK
    Define default startup probe failureThreshold if not defined in the container
  - END BLOCK

### `imagePullSecret.md`
- Matched newdocs file: `imagePullSecret.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Define the password of the image pull secret
  - END BLOCK

### `index.md`
- Matched newdocs file: `cnpg/index.md`
- Match type: `fuzzy` (score: `0.67`)
- Missing test-related blocks: **11**
  - BEGIN BLOCK
    Validate values files against the common schema with:
  - END BLOCK
  - BEGIN BLOCK
    `python3 charts/library/common/test_schema.py`
  - END BLOCK
  - BEGIN BLOCK
    This validates:
  - END BLOCK
  - BEGIN BLOCK
    - `charts/stable/*/values.yaml`
    - `charts/library/common-test/ci/*values.yaml`
  - END BLOCK
  - BEGIN BLOCK
    - `--output-file <path>` to write output to both stdout and a log file
    - `--max-failures <n>` to stop after `n` failures (`0` means no limit)
    - `--fail-fast` to stop after the first failure
  - END BLOCK
  - BEGIN BLOCK
    Local common-test runs can set a threshold with:
  - END BLOCK
  - BEGIN BLOCK
    `SCHEMA_MAX_FAILURES=25 ./run_common_tests.sh`
  - END BLOCK
  - BEGIN BLOCK
    CI runs the full schema check (`--max-failures 0`) and uploads the schema log artifact.
  - END BLOCK
  - BEGIN BLOCK
    Contains specific settings for verifying system
  - END BLOCK
  - BEGIN BLOCK
    Enables or disables the verification of system
  - END BLOCK
  - BEGIN BLOCK
    Additional system to verify
  - END BLOCK

### `ingress/index.md`
- Matched newdocs file: `ingress/index.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Define if the override service object name should be expanded
  - END BLOCK

### `middlewares/traefik/basic-auth.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/basic-auth.md`
- Match type: `fuzzy` (score: `0.75`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Define the password
  - END BLOCK

### `middlewares/traefik/forward-auth.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/forward-auth.md`
- Match type: `fuzzy` (score: `0.77`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Define the tls.insecureSkipVerify
  - END BLOCK

### `middlewares/traefik/plugin-bouncer.md`
- Matched newdocs file: `ingressMiddlewares/middlewares/traefik/plugin-bouncer.md`
- Match type: `fuzzy` (score: `0.78`)
- Missing test-related blocks: **5**
  - BEGIN BLOCK
    Define the updateMaxFailure
  - END BLOCK
  - BEGIN BLOCK
    Define the crowdsecAppsecFailureBlock
  - END BLOCK
  - BEGIN BLOCK
    Define the crowdsecLapiTLSInsecureVerify
  - END BLOCK
  - BEGIN BLOCK
    Define the crowdsecCapiPassword
  - END BLOCK
  - BEGIN BLOCK
    Define the redisCachePassword
  - END BLOCK

### `networkpolicy.md`
- Matched newdocs file: `networkpolicy.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    List of ports which should be made accessible
  - END BLOCK

### `persistence/configmap.md`
- Matched newdocs file: `persistence/configmap.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Whether the configmap should be required or not.
  - END BLOCK

### `persistence/iscsi.md`
- Matched newdocs file: `persistence/iscsi.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **3**
  - BEGIN BLOCK
    Define the password
  - END BLOCK
  - BEGIN BLOCK
    Define the passwordInitiator
  - END BLOCK
  - BEGIN BLOCK
    Define the password
  - END BLOCK

### `persistence/pvc-vct/static-smb.md`
- Matched newdocs file: `persistence/pvc-vct/static-smb.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Define the smb password
  - END BLOCK

### `persistence/secret.md`
- Matched newdocs file: `persistence/secret.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Whether the secret should be required or not.
  - END BLOCK

### `service/integrations/traefik.md`
- Matched newdocs file: `service/integrations/traefik.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **2**
  - BEGIN BLOCK
    Skip TLS verification when taling to an HTTPS backend service
  - END BLOCK
  - BEGIN BLOCK
    Alternatively you can set a [server name](/truecharts-common/service/integrations/traefik#servername)
    and [root CAs](/truecharts-common/service/integrations/traefik#rootcas) to use when performing
    TLS validation.
  - END BLOCK

### `webhook.md`
- Matched newdocs file: `webhook.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **2**
  - BEGIN BLOCK
    Define the failurePolicy for the webhook
  - END BLOCK
  - BEGIN BLOCK
    - `Ignore`
    - `Fail`
  - END BLOCK

### `workload/cronjob.md`
- Matched newdocs file: `workload/cronjob.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    Define the failedJobsHistoryLimit
  - END BLOCK

### `workload/index.md`
- Matched newdocs file: `workload/index.md`
- Match type: `exact-path` (score: `1.00`)
- Missing test-related blocks: **1**
  - BEGIN BLOCK
    - `Always`
    - `Never`
    - `OnFailure`
  - END BLOCK

