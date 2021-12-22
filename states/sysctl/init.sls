{% for key, value in salt['pillar.get']('sysctl', {}).items() %}
sysctl-{{ key }}:
  sysctl.present:
    - name: {{ key }}
    - value: {{ value }}
{% endfor %}
