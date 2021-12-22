sudo:
  pkg.installed:
    - version: {{ salt['pillar.get']('sudo:version') }}

{% for file_path in salt['pillar.get']('sudo:config', {}) %}
{{ file_path }}:
  file.managed:
    - contents_pillar: sudo:config:{{ file_path }}
    - user: root
    - group: root
    - mode: 0440
{% endfor %}
