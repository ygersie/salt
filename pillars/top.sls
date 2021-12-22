{{ saltenv }}:
  '*':
    - repositories
    - ssh
    - files
    - packages
    - crontabs
    - archive
    - cni
    - consul
    - nomad
