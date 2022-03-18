netplan-pkg:
  pkg.installed:
    - name: netplan.io
    - version: {{ salt['pillar.get']('netplan:version') }}

{% for interface in salt['pillar.get']('netplan:interfaces', {}) %}
/etc/netplan/{{ interface }}.yaml:
  file.managed:
    - user: root
    - group: root
    - require:
      - pkg: netplan.io
    - contents_pillar: netplan:interfaces:{{ interface }}
    - watch_in:
      - cmd: netplan-apply
{% endfor %}

netplan-apply:
  cmd.wait:
    - name: 'netplan apply'
