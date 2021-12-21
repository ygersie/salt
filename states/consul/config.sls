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

{% for key, value in salt['pillar.get']('consul:services', {}).items() %}
/etc/consul.d/services/{{ "{}.hcl".format(key) }}:
  file.managed:
    - user: consul
    - group: consul
    - mode: '0600'
    - makedirs: True
    - require:
      - pkg: consul
    - watch_in:
      - service: consul
{% endfor %}
