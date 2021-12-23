resolvconf: pkg.installed

unbound-packages:
  pkg.installed:
    - name: unbound
    - version: {{ salt['pillar.get']('unbound:version') }}
    - require:
      - pkg: resolvconf
