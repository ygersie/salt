{{ saltenv }}:
  '*':
    - files
    - repositories
    - crontabs
    - archive
    - consul
    - nomad
