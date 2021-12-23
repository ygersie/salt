systemd-resolved-stopped:
  service.dead:
    - name: systemd-resolved
    - enable: False

unbound-configtest:
  cmd.wait:
    - name: unbound-checkconf /etc/unbound/unbound.conf

unbound-service:
  service.running:
    - name: unbound
    - enable: True
    - reload: True
    - require:
      - service: systemd-resolved-stopped
    - watch:
      - cmd: unbound-configtest
