# docker-ce

```sls
docker-ce:
  version: 5:20.10.12~3-0~ubuntu-focal

  systemd: |
    [Service]
    Environment="YOUR=ENVVAR"

  config:
    log-driver: "json-file"
    log-opts:
      max-size: "100m"
      max-file: "2"

  group_members:
    - ygersie
```
