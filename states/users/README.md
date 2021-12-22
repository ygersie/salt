# users
Salt formula to manage (local) users and groups

By default the groups state will be included **before** the users state to be able to create primary groups separately.

## Pillar example
```sls
users:
  enabled:
    jdoe:
      shell: /bin/bash
      home: /home/jdoe
      uid: 2021
      gid: jdoe
      authorized_keys:
        jdoe@nomail.com:
          enc: ssh-ed25519
          name: AAAAC3NzaC1lZDI1NTE5AAAAIJJlnyNOJKZcuc+1WjjtR3HD///ctFRMwCNWH3r5rJuP
          options:
            - command="/usr/local/bin/dosomething.sh"
            - no-port-forwarding
            - no-X11-forwarding
            - no-pty

  disabled: []

groups:
  enabled:
    jdoe:
      gid: 2021
      system: False

  disabled: []
```

**NOTE**: Disabling a user will **not** purge the home directory contents and can not be passed as a property!

All attributes defined in the users:enabled and groups:enabled hashes will be passed 1:1 to the salt.user.present, salt.group.present and ssh_auth.present state respectively.
