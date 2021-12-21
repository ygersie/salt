consul-config-files:
  file.managed:
    - user: consul
    - group: consul
    - mode: '0600'
    - require:
      - pkg: consul
    - names:
      - /etc/consul.d/consul.env:
        - contents_pillar: consul:env
      - /etc/consul.d/config.hcl:
        - contents_pillar: consul:config
        - watch_in:
          - service: consul

{% for service in salt['pillar.get']('consul:services', {}) %}
/etc/consul.d/services/{{ "{}.hcl".format(service) }}:
  file.managed:
    - user: consul
    - group: consul
    - mode: '0600'
    - makedirs: True
    - contents_pillar: consul:services:{{ service }}
    - require:
      - pkg: consul
    - watch_in:
      - service: consul
{% endfor %}
