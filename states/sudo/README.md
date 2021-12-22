# sudo

Example pillar:

```sls
sudo:
  version: 1.8.31-1ubuntu1.2

  config:
    /etc/sudoers: |
        Your /etc/sudoers contents here, which will fully overwrite the existing one

    /etc/sudoers.d/example: |
        # Allow consul user restart foobar
        consul ALL=NOPASSWD: /usr/sbin/service foobar restart
```
