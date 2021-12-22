{{ saltenv }}:
  '*':
    - timezone
    - sudo
    - sysctl
    - discovery
    - files
    - repositories
    - packages
    - crontabs
    - archive
    - cni
    - consul
    - nomad
