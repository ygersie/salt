{% set files = salt['pillar.get']('files', {}) %}

{% for file, properties in files.get('enabled', {}).items() %}
file-ensure-{{ file }}-present:
  file.managed:
    - name: {{ file }}
    - makedirs: True
    {% if properties.get('contents') %}
    - contents_pillar: files:enabled:{{ file }}:contents
    {% endif %}

    {% for key, value in properties.items() %}
      {% if key == 'contents' %}
        {% continue %}
      {% endif %}
    - {{ key }}: {{ value }}
    {% endfor %}
{% endfor %}

{% for file in files.get('disabled', []) %}
file-ensure-{{ file }}-absent:
  file.absent:
    - name: {{ file }}
{% endfor %}
