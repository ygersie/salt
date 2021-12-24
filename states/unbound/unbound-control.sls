/var/run/unbound:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 0700
    - file_mode: 0600
