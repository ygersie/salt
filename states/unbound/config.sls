{% for file_path in salt['pillar.get']('unbound:config', {}) %}
{{ file_path }}:
  file.managed:
    - contents_pillar: unbound:config:{{ file_path }}
    - user: root
    - group: root
    - mode: 0644
    # this will trigger a systemctl reload
    - watch_in:
      - cmd: unbound-configtest
    # we want the config to be deployed before the svc is started
    - require_in:
      - service: unbound
{% endfor %}
