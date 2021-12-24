unbound-packages:
  pkg.installed:
    - name: unbound
    - version: {{ salt['pillar.get']('unbound:version') }}
