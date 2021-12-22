/etc/ssh/authorized_keys:
  file.directory:
    - user: root
    - group: root
    - clean: true
    - file_mode: 0644
    - dir_mode: 0755

{% for user in salt['pillar.get']('ssh:authorized_keys') %}
/etc/ssh/authorized_keys/{{ user }}.pub:
  file.managed:
    - contents_pillar: ssh:authorized_keys:{{ user }}
    - require:
      - file: /etc/ssh/authorized_keys
{% endfor %}
