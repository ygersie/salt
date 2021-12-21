nomad-config-files:
  file.managed:
    - user: root
    - group: root
    - mode: '0600'
    - require:
      - pkg: nomad
    - names:
      - /etc/nomad.d/nomad.hcl:
        - contents_pillar: nomad:config
        - watch_in:
          - service: nomad

    {% if salt['pillar.get']('nomad:env') %}
      - /etc/nomad.d/nomad.env:
        - contents_pillar: nomad:env
    {% endif %}

    {% for cni_config in salt['pillar.get']('nomad:cni', {}) %}
      - {{ cni_config }}:
        - makedirs: True
        - contents_pillar: nomad:cni:{{ cni_config }}
    {% endfor %}
