cni:
  source: https://github.com/containernetworking/plugins/releases/download/v1.0.1/cni-plugins-linux-amd64-v1.0.1.tgz
  source_hash: 5238fbb2767cbf6aae736ad97a7aa29167525dcd405196dfbc064672a730d3cf

  config:
    vlan50:
      cniVersion: 0.4.0
      name: vlan50
      plugins:
        - type: macvlan
          master: eno2.vlan50
          ipam:
            type: dhcp
