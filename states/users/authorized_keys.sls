{% for user, properties in salt['pillar.get']('users:enabled', {}).items() %}
  {% for comment, auth_opts in properties.get('authorized_keys', {}).items() %}

ensure-authorized_key-{{ user }}-{{ comment }}-present:
  ssh_auth.present:
    - user: {{ user }}
    - comment: {{ comment }}
    {% for key, value in auth_opts.items() %}
    - {{ key }}: {{ value }}
    {% endfor %}

  {% endfor %}
{% endfor %}
