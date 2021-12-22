openssh-pkgs:
  pkg.installed:
    - version: {{ salt['pillar.get']('ssh:version') }}
    - names:
      - openssh-client
      - openssh-server
      - openssh-sftp-server
