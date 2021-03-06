{% if salt['pillar.get']('unbound:systemd') %}
/etc/systemd/system/unbound.service.d/overrides.conf:
  file.managed:
    - contents_pillar: unbound:systemd
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - watch_in:
      - cmd: unbound-reload-systemd
    - require_in:
      - service: unbound-service
      - pkg: unbound
{% endif %}

unbound-reload-systemd:
  cmd.wait:
    - name: systemctl daemon-reload
