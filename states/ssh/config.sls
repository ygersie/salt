{% for file_path in salt['pillar.get']('ssh:config', {}) %}
{{ file_path }}:
  file.managed:
    - contents_pillar: ssh:config:{{ file_path }}
    - user: root
    - group: root
    - mode: 0644
    {% if 'sshd_config' in file_path %}
    - watch_in:
      - cmd: sshd-configtest
    {% endif %}
{% endfor %}
