/etc/ssh/authorized_keys:
  file.directory:
    - user: root
    - group: root
    - clean: true
    - file_mode: 0644
    - dir_mode: 0755
# "exclude_list" is a list of files to be excluded from being removed by the
# "clean" operation. Salt would otherwise keep removing and adding the files everytime.
# The `or ""` makes sure the output of the list append isn't None for each key.
{% set exclude_list = [] %}
{% for user in salt['pillar.get']('ssh:authorized_keys', {}) %}
{{ exclude_list.append(user + ".pub") or "" }}
{% endfor %}
    - exclude_pat: {{ exclude_list }}

{% for user in salt['pillar.get']('ssh:authorized_keys') %}
/etc/ssh/authorized_keys/{{ user }}.pub:
  file.managed:
    - contents_pillar: ssh:authorized_keys:{{ user }}
    - require:
      - file: /etc/ssh/authorized_keys
{% endfor %}
