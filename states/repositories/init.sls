{% set repositories = salt['pillar.get']('repositories', {}) %}

{% for repo, properties in repositories.get('enabled', {}).items() %}
repo-ensure-{{ repo }}-present:
  pkgrepo.managed:
    {% for key, value in properties.items() %}
    - {{ key }}: {{ value }}
    {% endfor %}
{% endfor %}

{% for repo, properties in repositories.get('disabled', {}).items() %}
repo-ensure-{{ repo }}-absent:
  pkgrepo.absent:
    {% for key, value in properties.items() %}
    - {{ key }}: {{ value }}
    {% endfor %}
{% endfor %}
