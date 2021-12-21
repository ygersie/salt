{{ saltenv }}:
  '*':
    - files
    - repositories
    - packages
    - crontabs
    - archive
    - cni
    - consul
    - nomad
