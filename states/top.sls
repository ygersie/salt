{{ saltenv }}:
  '*':
    - timezone
    - repositories
    - sudo
    - ssh
    - sysctl
    - discovery
    - users
    - files
    - packages
    - crontabs
    - archive
    - cni
    - docker-ce
    - consul
    - nomad
    - unbound
