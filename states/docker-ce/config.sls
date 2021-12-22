{% if salt['pillar.get']('docker-ce:config') %}
docker-ce-config:
  file.serialize:
    - name: /etc/docker/daemon.json
    - dataset_pillar: docker-ce:config
    - formatter: json
    - user: root
    - group: root
    - mode: 0600
    - makedirs: True
    - require_in:
      - service: docker-ce-service
      - pkg: docker-ce
{% endif %}
