# repositories
Repositories formula for Salt

# Pillar example
```sls
repositories:
  enabled:
    hashicorp:
      humanname: HashiCorp
      name: deb [arch=amd64] https://apt.releases.hashicorp.com {{ grains['oscodename'] }} main
      file: /etc/apt/sources.list.d/hashicorp.list
      key_url: https://apt.releases.hashicorp.com/gpg

  disabled:
    hashicorp:
      name: deb [arch=amd64] https://apt.releases.hashicorp.com {{ grains['oscodename'] }} main
      keyid: A3219F7B
```

All attributes, defined in both the enabled and disabled hash will be passed 1:1 to the salt.pkgrepo.(managed|absent) states.
