{% set crontabs = salt['pillar.get']('crontabs', {}) %}

{% for crontab, properties in crontabs.get('enabled', {}).items() %}
cron-ensure-{{ crontab }}-present:
  cron.present:
    - identifier: {{ crontab }}
    {% for key, value in properties.items() %}
      {% if key == 'identifier' %}
        {% continue %}
      {% endif %}
    - {{ key }}: "{{ value }}"
    {% endfor %}
{% endfor %}

{% for crontab, properties in crontabs.get('disabled', {}).items() %}
cron-ensure-{{ crontab }}-absent:
  cron.absent:
    - identifier: {{ crontab }}
    {% for key, value in properties.items() %}
      {% if key == 'identifier' %}
        {% continue %}
      {% endif %}
    - {{ key }}: "{{ value }}"
    {% endfor %}
{% endfor %}
