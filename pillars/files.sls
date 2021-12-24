files:
  enabled:
    /etc/profile.d/hashistack.sh:
      user: root
      group: root
      contents: |
        complete -C /usr/bin/consul consul
        complete -C /usr/bin/nomad nomad

    /usr/local/bin/pullgit:
      user: root
      group: root
      mode: 550
      contents: |
        #!/usr/bin/env bash

        # When we already have a file lock, exit
        lockfile='/var/lock/pullgit'

        if ! (set -o noclobber; echo $$ > "${lockfile}") 2>/dev/null; then
            oldpid="$(< ${lockfile})"
            if kill -0 "${oldpid}"; then
                echo "Lock failed, ${lockfile} already exists for pid ${oldpid} and it is still running" >&2
                exit 1
            fi
            echo $$ > "${lockfile}"
        fi
        trap 'rm -f "${lockfile}"; exit $?' INT TERM EXIT

        cd /srv/salt
        git clean -qfd
        git checkout -q main
        git reset -q --hard
        git pull -q
        git submodule -q foreach 'git reset -q --hard HEAD'
        git submodule init && git submodule update

  disabled: []
