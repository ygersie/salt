docker-group-members:
  group.present:
    - name: docker
    - system: True
    - members: {{ salt['pillar.get']('docker-ce:group_members') }}
    - require:
      - pkg: docker-ce
