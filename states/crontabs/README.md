README.md
# crontabs
Crontabs formula for Salt

# Pillar example
```sls
crontabs:
  enabled:
    docker_clean_images:
      name: docker image prune --all --force
      user: root
      minute: 17
      hour: 2
    docker_clean_containers:
      name: docker system prune --force
      user: root
      minute: 17
      hour: 4
  disabled: {}
```

All attributes, except the name which will be the identifier, defined in the enabled hash will be passed 1:1 to the salt.states.cron state.
