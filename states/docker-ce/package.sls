docker-ce:
  pkg.installed:
    - version: {{ salt['pillar.get']('docker-ce:version') }}
