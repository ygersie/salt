consul-package:
  pkg.installed:
    - version: {{ salt['pillar.get']('consul:version') }}
