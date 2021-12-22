repositories:
  enabled:
    docker-ce:
      humanname: Docker
      name: deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ grains['oscodename'] }} stable
      file: /etc/apt/sources.list.d/docker.list
      key_url: https://download.docker.com/linux/ubuntu/gpg

    hashicorp:
      humanname: HashiCorp
      name: deb [arch=amd64] https://apt.releases.hashicorp.com {{ grains['oscodename'] }} main
      file: /etc/apt/sources.list.d/hashicorp.list
      key_url: https://apt.releases.hashicorp.com/gpg

  # disabled:
  #   hashicorp:
  #     name: deb [arch=amd64] https://apt.releases.hashicorp.com {{ grains['oscodename'] }} main
  #     keyid: A3219F7B
