{% for archive, properties in salt['pillar.get']('archive', {}).items() %}
extract-{{ archive }}-{{ properties['destination'] }}:
  archive.extracted:
    - name: {{ properties['destination'] }}
    {% for key, value in properties.items() %}
      {% if key == 'destination' %}
        {% continue %}
      {% endif %}
    - {{ key }}: {{ value }}
    {% endfor %}
{% endfor %}
