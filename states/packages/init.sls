packages-pkg_installed:
  pkg.installed:
    - pkgs: {{ salt['pillar.get']('packages:installed', []) }}

packages-pkg_installed-sources:
  pkg.installed:
    - sources: {{ salt['pillar.get']('packages:sources', []) }}

packages-pkg_latest:
  pkg.latest:
    - pkgs: {{ salt['pillar.get']('packages:latest', []) }}

packages-pkg_removed:
  pkg.removed:
    - pkgs: {{ salt['pillar.get']('packages:removed', []) }}

packages-pkg_purged:
  pkg.purged:
    - pkgs: {{ salt['pillar.get']('packages:purged', []) }}
