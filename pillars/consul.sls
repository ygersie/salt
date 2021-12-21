consul:
  config: |
    bind_addr                  = "{{ grains['ip4_interface']['enp0s3'] }}"
    bootstrap_expect           = 1
    data_dir                   = "/opt/consul"
    datacenter                 = "lan"
    enable_local_script_checks = true
    encrypt                    = "0Bj50J/dqDf0yjLqPD4aBHsCtdDZABFOFt1zgJp1N/I="
    retry_interval             = "1s"
    retry_join                 = [ "{{ grains['ip4_interface']['enp0s3'] }}" ]
    server                     = true
    ui_config {
        enabled = true
    }

  services:
    consul-ui: |
      service {
          name    = "consul-ui"
          address = "127.0.0.1"
          port    = 8500

          tags = [ "urlprefix-consul.local.test/" ]

          checks = [
              {
                  name     = "Health check for Consul UI"
                  http     = "http://localhost:8500/v1/status/leader"
                  interval = "5s"
                  timeout  = "2s"
              }
          ]
      }
