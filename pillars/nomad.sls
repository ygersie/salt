nomad:
  config: |
    advertise {
        http = "127.0.0.1"
        rpc  = "127.0.0.1"
        serf = "127.0.0.1"
    }

    bind_addr  = "127.0.0.1"

    data_dir   = "/opt/nomad/data"
    datacenter = "lan"

    client {
        enabled        = true
        cni_path       = "/opt/cni/bin"
        cni_config_dir = "/opt/cni/config"
    }

    plugin "docker" {
        config {
            volumes {
                enabled = true
            }
        }
    }

    region = "home"

    # log_level = "DEBUG"

    server {
        bootstrap_expect = 1
        enabled          = true
    }

    telemetry {
        disable_hostname           = true
        prometheus_metrics         = true
        publish_allocation_metrics = true
        publish_node_metrics       = true
    }
