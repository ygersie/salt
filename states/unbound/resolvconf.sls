overwrite-resolv.conf:
  file.managed:
    - name: /etc/resolv.conf
    - follow_symlinks: False
    - contents:
      - nameserver 127.0.0.1
{% for domain in salt['pillar.get']('unbound:resolvconf_search_domains', []) %}
      - search {{ domain }}
{% endfor %}
