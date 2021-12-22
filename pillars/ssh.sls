ssh:
  config:
    /etc/ssh/sshd_config: |
        Include /etc/ssh/sshd_config.d/*.conf
        PasswordAuthentication no
        ChallengeResponseAuthentication no
        UsePAM yes
        X11Forwarding yes
        PrintMotd no
        AcceptEnv LANG LC_*
        Subsystem	sftp	/usr/lib/openssh/sftp-server
        AuthorizedKeysFile .ssh/authorized_keys .ssh/authorized_keys2 /etc/ssh/authorized_keys/%u.pub

  authorized_keys:
    ygersie: ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII/29pIz0lfVU6kPCKoGCeIV8FOdiI/S4+2r3VdL+ZBk ygersie@myhost.local
