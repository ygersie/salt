consul-package:
  pkg.installed:
    - name: consul
    - version: {{ salt['pillar.get']('consul:version') }}
