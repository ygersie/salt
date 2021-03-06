nomad-config-files:
  file.managed:
    - user: root
    - group: root
    - mode: '0600'
    - require:
      - pkg: nomad
    - makedirs: True
    - names:
      - /etc/nomad.d/nomad.hcl:
        - contents_pillar: nomad:config
        - watch_in:
          - service: nomad

    {% if salt['pillar.get']('nomad:env') %}
      - /etc/nomad.d/nomad.env:
        - contents_pillar: nomad:env
    {% endif %}
