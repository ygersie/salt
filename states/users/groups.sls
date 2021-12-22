{% for group, properties in salt['pillar.get']('groups:enabled', {}).items() %}
ensure-group-{{ group }}-present:
  group.present:
    - name: {{ group }}
    {% for key, value in properties.items() %}
    - {{ key }}: {{ value }}
    {% endfor %}
{% endfor %}

{% for group in salt['pillar.get']('groups:disabled', []) %}
ensure-group-{{ group }}-absent:
  group.absent:
    - name: {{ group }}
{% endfor %}
