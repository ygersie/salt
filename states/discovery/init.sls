discovery-interface:
  file.managed:
    - user: root
    - group: root
    - mode: '0640'
    - names:
      - /etc/systemd/network/100-discovery.netdev:
        - contents: |
                    [NetDev]
                    Name=discovery
                    Kind=dummy
      - /etc/systemd/network/100-discovery.network:
        - contents: |
                    [Match]
                    Name=discovery

                    [Network]
                    Address=169.254.1.1/32
  service.running:
    - name: systemd-networkd
    - watch:
      - file: /etc/systemd/network/100-discovery.netdev
      - file: /etc/systemd/network/100-discovery.network
