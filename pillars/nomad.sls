nomad:
  config: |
    advertise {
        http = "127.0.0.1"
        rpc  = "127.0.0.1"
        serf = "127.0.0.1"
    }

    bind_addr   = "127.0.0.1"

    client {
        enabled        = true
        cni_path       = "/opt/cni/bin"
        cni_config_dir = "/opt/cni/config"
    }

    data_dir   = "/opt/nomad/data"
    datacenter = "lan"

    # log_level = "DEBUG"

    plugin "docker" {
        config {
            volumes {
                enabled = true
            }
        }
    }

    region = "home"

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
