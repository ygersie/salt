{% for job in salt['pillar.get']('nomad:jobs', {}) %}
/etc/nomad.d/jobs/{{ job }}.hcl:
  file.managed:
    - user: root
    - group: root
    - mode: '0600'
    - makedirs: True
    - require:
      - pkg: nomad
    - contents_pillar: nomad:jobs:{{ job }}:contents
  {% if salt['pillar.get']('nomad:jobs:{}:auto_deploy'.format(job)) %}
    - watch_in:
      - cmd: reload-job-{{ job }}

  cmd.run:
    - unless: 'nomad status {{ job }} 2>&1 | egrep -q "Status\s+=\s+running"'
    - name: 'nomad run -detach /etc/nomad.d/jobs/{{ job }}.hcl'
    - require:
      - file: /etc/nomad.d/jobs/{{ job }}.hcl
  {% endif %}

reload-job-{{ job }}:
  cmd.wait:
    - name: 'nomad run -detach /etc/nomad.d/jobs/{{ job }}.hcl'
{% endfor %}
