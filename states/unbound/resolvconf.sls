overwrite-resolv.conf:
  file.managed:
    - name: /etc/resolv.conf
    - follow_symlinks: False
    {% if salt['pillar.get']('unbound:resolv.conf') %}
    - contents_pillar: unbound:resolv.conf
    {% else %}
    - contents:
      - nameserver 127.0.0.1
    {% endif %}
