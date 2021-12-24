unbound:
  config:
    /etc/unbound/unbound.conf: |
      # used by systemd unit to reload unbound
      remote-control:
          control-enable: yes
          control-interface: /var/unbound/unbound-control.sock

      server:
          cache-max-negative-ttl: 1
          cache-min-ttl: 1
          do-ip6: no
          do-not-query-localhost: no
          domain-insecure: consul
          incoming-num-tcp: 1024
          minimal-responses: no
          msg-cache-size: 16M
          num-threads: 1
          prefetch: yes
          serve-expired: no
          so-reuseport: yes
          local-zone: "10.in-addr.arpa." nodefault
          local-zone: "16.172.in-addr.arpa." nodefault
          local-zone: "17.172.in-addr.arpa." nodefault
          local-zone: "18.172.in-addr.arpa." nodefault
          local-zone: "19.172.in-addr.arpa." nodefault
          local-zone: "20.172.in-addr.arpa." nodefault
          local-zone: "21.172.in-addr.arpa." nodefault
          local-zone: "22.172.in-addr.arpa." nodefault
          local-zone: "23.172.in-addr.arpa." nodefault
          local-zone: "24.172.in-addr.arpa." nodefault
          local-zone: "25.172.in-addr.arpa." nodefault
          local-zone: "26.172.in-addr.arpa." nodefault
          local-zone: "27.172.in-addr.arpa." nodefault
          local-zone: "28.172.in-addr.arpa." nodefault
          local-zone: "29.172.in-addr.arpa." nodefault
          local-zone: "30.172.in-addr.arpa." nodefault
          local-zone: "31.172.in-addr.arpa." nodefault
          local-zone: "168.192.in-addr.arpa." nodefault

      forward-zone:
          name: "."
          forward-addr: 1.1.1.1
          forward-addr: 2606:4700:4700::1111

      stub-zone:
          name: consul
          stub-addr: 127.0.0.1@8600
