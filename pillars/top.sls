{{ saltenv }}:
  '*':
    - files
    - repositories
    - crontabs
    - archive
    - cni
    - consul
    - nomad
