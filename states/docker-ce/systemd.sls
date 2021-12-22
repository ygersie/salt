{% if salt['pillar.get']('docker-ce:systemd') %}
/etc/systemd/system/docker.service.d/overrides.conf:
  file.managed:
    - contents_pillar: docker-ce:systemd
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True
    - require_in:
      - service: docker-ce-service
      - pkg: docker-ce
{% endif %}

reload-systemd-docker:
  cmd.wait:
    - name: systemctl daemon-reload
    - watch:
      - file: /etc/systemd/system/docker.service.d/overrides.conf
