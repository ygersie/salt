ensure-timezone:
  timezone.system:
    - name: {{ salt['pillar.get']('timezone:name', 'Europe/Amsterdam') }}
    - utc: {{ salt['pillar.get']('timezone:utc', True) }}
