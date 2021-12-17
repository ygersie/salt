files:
  enabled:
    /tmp/example.hcl:
      contents: |
        job "example" {
            datacenters = ["zone1"]

            vault {
                policies    = [ "nomad-readonly-lp" ]
                change_mode = "noop"
                env         = "false"
            }

            update {
                max_parallel     = 1
                min_healthy_time = "5s"
                healthy_deadline = "10s"
            }

            group "example" {
                count = 1

                network {
                    mode = "bridge"
                    port "test-port" {}
                }

                service {
                    name = "test-service"
                    port = "test-port"

                    check {
                        type     = "script"
                        task     = "test"
                        command  = "/bin/sh"
                        args     = ["-c", "echo OK"]
                        interval = "5s"
                        timeout  = "1s"
                    }
                }

                task "example" {
                    driver = "docker"
                    config {
                        image   = "alpine"
                        command = "/bin/sh"
                        args    = ["-c", "tail -f /dev/null"]
                    }

                    env {
                        GOOGLE_APPLICATION_CREDENTIALS = "/secrets/gcp_credentials.json"
                        PTR_RECORD                     = "{{ salt['helpers.ptr_record']('10.12.14.50') }}"
                    }

                    template {
                        left_delimiter  = "<%"
                        right_delimiter = "%>"

                        destination = "secrets/gcp_credentials.json"
                        perms       = "400"
                        data        = <<EOF
        <% with secret "secret/nomad/lp/gcp" -%>
        <% .Data.application_credentials_json %>
        <%- end %>
        EOF
                    }

                    resources {
                        cpu    = 100
                        memory = 64
                    }
                }
            }
        }
