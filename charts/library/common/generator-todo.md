# Newdocs Generator To-Do

- Derived from `newdocs-missing-index.md`
- Scope: generator/schema-backed tasks + verification

## Phase 1 — File Coverage

- [x] All docs files are matched to a newdocs file


## Phase 2 — Schema-backed Generator Gaps (High Priority)

- [ ] `addons.md` -> `addons/index.md`
  - [ ] Verify schema link: `addons/addons.json`
  - [ ] Add heading/content: ``addons.$addon.targetSelector`` -> `*.targetSelector`
  - [ ] Add heading/content: ``addons.$addon.container`` -> `*.container`
  - [ ] Add heading/content: ``addons.$addon.service`` -> `*.service`
  - [ ] Add heading/content: ``addons.$addon.ingress`` -> `*.ingress`

- [ ] `container/fixedEnv.md` -> `workload/podSpec/containers/fixedEnv.md`
  - [ ] Verify schema link: `workload/podSpec/containers/fixedEnv.json`
  - [ ] Add heading/content: ``fixedEnv.TZ`` -> `TZ`
  - [ ] Add heading/content: ``fixedEnv.UMASK`` -> `UMASK`
  - [ ] Add heading/content: ``fixedEnv.PUID`` -> `PUID`
  - [ ] Add heading/content: ``fixedEnv.NVIDIA_CAPS`` -> `NVIDIA_CAPS`

- [ ] `container/lifecycle.md` -> `workload/podSpec/containers/lifecycle.md`
  - [ ] Verify schema link: `workload/podSpec/containers/lifecycle.json`
  - [ ] Add heading/content: ``lifecycle.preStop`` -> `preStop`
  - [ ] Add heading/content: ``lifecycle.postStart`` -> `postStart`
  - [ ] Add heading/content: ``lifecycle.$hook.port`` -> `*.port`
  - [ ] Add heading/content: ``lifecycle.$hook.host`` -> `*.host`
  - [ ] Add heading/content: ``lifecycle.$hook.path`` -> `*.path`
  - [ ] Add heading/content: ``lifecycle.$hook.httpHeaders`` -> `*.httpHeaders`

- [ ] `container/probes.md` -> `workload/podSpec/containers/probes.md`
  - [ ] Verify schema link: `workload/podSpec/containers/probes.json`
  - [ ] Add heading/content: ``probes.liveness`` -> `liveness`
  - [ ] Add heading/content: ``probes.readiness`` -> `readiness`
  - [ ] Add heading/content: ``probes.startup`` -> `startup`
  - [ ] Add heading/content: ``probes.$probe.port`` -> `startup.port`
  - [ ] Add heading/content: ``probes.$probe.path`` -> `*.path`
  - [ ] Add heading/content: ``probes.$probe.httpHeaders`` -> `*.httpHeaders`
  - [ ] Add heading/content: ``probes.$probe.spec`` -> `*.spec`
  - [ ] Add heading/content: ``probes.$probe.spec.initialDelaySeconds`` -> `*.spec.initialDelaySeconds`
  - [ ] Add heading/content: ``probes.$probe.spec.periodSeconds`` -> `*.spec.periodSeconds`
  - [ ] Add heading/content: ``probes.$probe.spec.timeoutSeconds`` -> `*.spec.timeoutSeconds`
  - [ ] Add heading/content: ``probes.$probe.spec.failureThreshold`` -> `*.spec.failureThreshold`
  - [ ] Add heading/content: ``probes.$probe.spec.successThreshold`` -> `*.spec.successThreshold`

- [ ] `container/resources.md` -> `workload/podSpec/containers/resources.md`
  - [ ] Verify schema link: `workload/podSpec/containers/resources.json`
  - [ ] Add heading/content: ``resources.requests`` -> `requests`
  - [ ] Add heading/content: ``resources.requests.cpu`` -> `requests.cpu`
  - [ ] Add heading/content: ``resources.requests.memory`` -> `requests.memory`
  - [ ] Add heading/content: ``resources.limits`` -> `limits`
  - [ ] Add heading/content: ``resources.limits.cpu`` -> `limits.cpu`
  - [ ] Add heading/content: ``resources.limits.memory`` -> `limits.memory`

- [ ] `container/securityContext.md` -> `workload/podSpec/containers/securityContext.md`
  - [ ] Verify schema link: `workload/podSpec/containers/securityContext.json`
  - [ ] Add heading/content: ``securityContext.runAsUser`` -> `runAsUser`
  - [ ] Add heading/content: ``securityContext.runAsGroup`` -> `runAsGroup`
  - [ ] Add heading/content: ``securityContext.readOnlyRootFilesystem`` -> `readOnlyRootFilesystem`
  - [ ] Add heading/content: ``securityContext.allowPrivilegeEscalation`` -> `allowPrivilegeEscalation`
  - [ ] Add heading/content: ``securityContext.privileged`` -> `privileged`
  - [ ] Add heading/content: ``securityContext.runAsNonRoot`` -> `runAsNonRoot`
  - [ ] Add heading/content: ``securityContext.capabilities`` -> `capabilities`
  - [ ] Add heading/content: ``securityContext.capabilities.add`` -> `capabilities.add`
  - [ ] Add heading/content: ``securityContext.capabilities.drop`` -> `capabilities.drop`
  - [ ] Add heading/content: ``securityContext.seccompProfile`` -> `seccompProfile`
  - [ ] Add heading/content: ``securityContext.seccompProfile.profile`` -> `seccompProfile.profile`

- [ ] `container/termination.md` -> `workload/container/termination.md`
  - [ ] Verify schema link: `workload/container/termination.json`
  - [ ] Add heading/content: ``termination.messagePath`` -> `messagePath`
  - [ ] Add heading/content: ``termination.messagePolicy`` -> `messagePolicy`

- [ ] `fallbackDefaults.md` -> `global/fallbackDefaults.md`
  - [ ] Verify schema link: `global/fallbackDefaults.json`
  - [ ] Add heading/content: ``probeTimeouts.liveness`` -> `probeTimeouts.liveness`
  - [ ] Add heading/content: ``probeTimeouts.liveness.initialDelaySeconds`` -> `probeTimeouts.liveness.initialDelaySeconds`
  - [ ] Add heading/content: ``probeTimeouts.liveness.periodSeconds`` -> `probeTimeouts.liveness.periodSeconds`
  - [ ] Add heading/content: ``probeTimeouts.liveness.timeoutSeconds`` -> `probeTimeouts.liveness.timeoutSeconds`
  - [ ] Add heading/content: ``probeTimeouts.liveness.failureThreshold`` -> `probeTimeouts.liveness.failureThreshold`
  - [ ] Add heading/content: ``probeTimeouts.liveness.successThreshold`` -> `probeTimeouts.liveness.successThreshold`
  - [ ] Add heading/content: ``probeTimeouts.readiness`` -> `probeTimeouts.readiness`
  - [ ] Add heading/content: ``probeTimeouts.readiness.initialDelaySeconds`` -> `probeTimeouts.readiness.initialDelaySeconds`
  - [ ] Add heading/content: ``probeTimeouts.readiness.periodSeconds`` -> `probeTimeouts.readiness.periodSeconds`
  - [ ] Add heading/content: ``probeTimeouts.readiness.timeoutSeconds`` -> `probeTimeouts.readiness.timeoutSeconds`
  - [ ] Add heading/content: ``probeTimeouts.readiness.failureThreshold`` -> `probeTimeouts.readiness.failureThreshold`
  - [ ] Add heading/content: ``probeTimeouts.readiness.successThreshold`` -> `probeTimeouts.readiness.successThreshold`
  - [ ] Add heading/content: ``probeTimeouts.startup`` -> `probeTimeouts.startup`
  - [ ] Add heading/content: ``probeTimeouts.startup.initialDelaySeconds`` -> `probeTimeouts.startup.initialDelaySeconds`
  - [ ] Add heading/content: ``probeTimeouts.startup.periodSeconds`` -> `probeTimeouts.startup.periodSeconds`
  - [ ] Add heading/content: ``probeTimeouts.startup.timeoutSeconds`` -> `probeTimeouts.startup.timeoutSeconds`
  - [ ] Add heading/content: ``probeTimeouts.startup.failureThreshold`` -> `probeTimeouts.startup.failureThreshold`
  - [ ] Add heading/content: ``probeTimeouts.startup.successThreshold`` -> `probeTimeouts.startup.successThreshold`

- [ ] `global.md` -> `global/index.md`
  - [ ] Verify schema link: `global/global.json`
  - [ ] Add heading/content: ``traefik.addServiceAnnotations`` -> `traefik.addServiceAnnotations`
  - [ ] Add heading/content: ``traefik.commonMiddlewares`` -> `traefik.commonMiddlewares`

- [ ] `ingress/homepage.md` -> `ingress/integrations/homepage.md`
  - [ ] Verify schema link: `ingress/integrations/homepage.json`
  - [ ] Add heading/content: ``widget.version`` -> `widget.version`
  - [ ] Add heading/content: ``widget.url`` -> `widget.url`
  - [ ] Add heading/content: ``widget.custom`` -> `widget.custom`
  - [ ] Add heading/content: ``widget.customkv`` -> `widget.customkv`

- [ ] `resources.md` -> `workload/podSpec/containers/resources.md`
  - [ ] Verify schema link: `workload/podSpec/containers/resources.json`
  - [ ] Add heading/content: ``resources.limits`` -> `limits`
  - [ ] Add heading/content: ``resources.limits.cpu`` -> `limits.cpu`
  - [ ] Add heading/content: ``resources.limits.memory`` -> `limits.memory`
  - [ ] Add heading/content: ``resources.requests`` -> `requests`
  - [ ] Add heading/content: ``resources.requests.cpu`` -> `requests.cpu`
  - [ ] Add heading/content: ``resources.requests.memory`` -> `requests.memory`


## Phase 4 — Verification

- [ ] Run `python3 generate_newdocs.py --clean`
- [ ] Rebuild this todo from gap index
- [ ] Confirm `schema-backed` section becomes empty
- [ ] Spot-check top 10 previously failing files
