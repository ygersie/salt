{{ saltenv }}:
  '*':
    - timezone
    - repositories
    - sudo
    - ssh
    - sysctl
    - discovery
    - files
    - packages
    - crontabs
    - archive
    - cni
    - docker-ce
    - consul
    - nomad
