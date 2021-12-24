{% for file_path in salt['pillar.get']('unbound:config', {}) %}
{{ file_path }}:
  file.managed:
    - contents_pillar: unbound:config:{{ file_path }}
    - user: root
    - group: root
    - mode: 0644
    - watch_in:
      - cmd: unbound-configtest
    - require_in:
      - service: unbound
    - require:
      - file: /var/run/unbound
{% endfor %}
