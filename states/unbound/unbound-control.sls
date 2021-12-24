/var/unbound:
  file.directory:
    - user: unbound
    - group: unbound
    - dir_mode: 0700
    - file_mode: 0600
    # we need the pkg installed to have the unbound user available
    - require:
      - pkg: unbound
