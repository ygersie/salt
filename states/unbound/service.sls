unbound-configtest:
  cmd.wait:
    - name: unbound-checkconf /etc/unbound/unbound.conf

unbound-service:
  service.running:
    - name: unbound
    - enable: True
    - reload: True
    - watch:
      - cmd: unbound-configtest
