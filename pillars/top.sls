{{ saltenv }}:
  '*':
    - repositories
    - ssh
    - files
    - packages
    - crontabs
    - archive
    - cni
    - docker-ce
    - consul
    - nomad
    - unbound
