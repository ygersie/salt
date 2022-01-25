consul:
  version: 1.11.2

  env: |
    # env variables go here

  config: |
    {% raw -%}
    bind_addr        = "{{ GetDefaultInterfaces | attr \"address\" }}"
    bootstrap_expect = 1
    client_addr      = "127.0.0.1 169.254.1.1"

    connect {
        enabled = true
    }

    data_dir                   = "/opt/consul"
    datacenter                 = "lan"
    disable_update_check       = true
    enable_local_script_checks = true
    encrypt                    = "0Bj50J/dqDf0yjLqPD4aBHsCtdDZABFOFt1zgJp1N/I="

    ports {
        grpc = 8502
    }

    retry_interval = "1s"
    retry_join     = [ "{{ GetDefaultInterfaces | attr \"address\" }}" ]
    server         = true

    telemetry {
        disable_compat_1.9 = true
    }

    ui_config {
        enabled = true
    }
    {% endraw %}

  services:
    consul-ui: |
      service {
          name    = "consul-ui"
          address = "127.0.0.1"
          port    = 8500

          tags = [ "urlprefix-consul.salt.dev/" ]

          checks = [
              {
                  name     = "Health check for Consul UI"
                  http     = "http://localhost:8500/v1/status/leader"
                  interval = "5s"
                  timeout  = "2s"
              }
          ]
      }
