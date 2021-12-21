nomad-package:
  pkg.installed:
    - name: nomad
    - version: {{ salt['pillar.get']('nomad:version') }}
