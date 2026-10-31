## Full Examples

```yaml
persistence:
  iscsi-vol:
    enabled: true
    type: iscsi
    iscsi:
      fsType: "{{ .Values.some_fsType }}"
      targetPortal: "{{ .Values.some_targetPortal }}"
      iqn: "{{ .Values.some_iqn }}"
      lun: "{{ .Values.some_lun }}"
      initiatorName: "{{ .Values.some_initiatorName }}"
      iscsiInterface: "{{ .Values.some_interface }}"
      portals:
        - "{{ index .Values.some_portals 0 }}"
        - "{{ index .Values.some_portals 1 }}"
      authSession:
        username: "{{ .Values.username }}"
        password: "{{ .Values.password }}"
        usernameInitiator: '{{ printf "%s%s" .Values.username "Initiator" }}'
        passwordInitiator: '{{ printf "%s%s" .Values.password "Initiator" }}'
  iscsi-vol2:
    enabled: true
    type: iscsi
    iscsi:
      fsType: ext4
      targetPortal: some.target.portal
      iqn: some.iqn
      lun: 0
      initiatorName: some.initiator.name
      iscsiInterface: some.interface
      portals:
        - some.portal.1
        - some.portal.2
      authDiscovery:
        username: some.username
        password: some.password
        usernameInitiator: some.usernameInitiator
        passwordInitiator: some.passwordInitiator
```
