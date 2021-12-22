{% for user, properties in salt['pillar.get']('users:enabled', {}).items() %}
ensure-user-{{ user }}-present:
  user.present:
    - name: {{ user }}
    {% for key, value in properties.items() %}

    {# skip authorized_keys option passed in pillar #}
    {% if key == 'authorized_keys' %}
      {% continue %}
    {% endif %}

    - {{ key }}: {{ value }}
    {% endfor %}
{% endfor %}

{% for user in salt['pillar.get']('users:disabled', []) %}
ensure-user-{{ user }}-absent:
  user.absent:
    - name: {{ user }}
{% endfor %}
