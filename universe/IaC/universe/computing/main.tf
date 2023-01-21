#==============================================================================================================================#
#                                                                                                                              #
#                                                      Dipal Server Group                                                      #
#                                                                                                                              #
#==============================================================================================================================#
resource "kubernetes_manifest" "ubuntu-terraform" {
  manifest = {
    apiVersion = "kubevirt.io/v1"
    kind = "VirtualMachine"
    metadata = {
      creationTimestamp = null
      name = "ubuntu"
      namespace = var.namespace
    }
    spec = {
      runStrategy = "Always"
      template = {
        metadata = {
          "creationTimestamp" = null
        }
        spec = {
          domain = {
            devices = {
              disks = [
                {
                  disk = {
                    bus = "virtio"
                  }
                  name = "containerdisk"
                },
                {
                  disk = {
                    bus = "virtio"
                  }
                  name = "cloudinit"
                },
              ]
              rng = {}
            }
            resources = {
              requests = {
                memory = "1Gi"
              }
            }
          }
          terminationGracePeriodSeconds = 180
          volumes = [
            {
              containerDisk = {
                image = "quay.io/containerdisks/ubuntu:22.04"
              }
              name = "containerdisk"
            },
            {
              cloudInitNoCloud = {
                userData = <<-EOT
                #cloud-config
                users:
                  - name: admin
                    sudo: ALL=(ALL) NOPASSWD:ALL
                    ssh_authorized_keys:
                      - ssh-rsa AAAA...
                EOT
              }
              name = "cloudinit"
            },
          ]
        }
      }
    }
  }
}
#==============================================================================================================================#
#                                                                                                                              #
#                                                     Skyfarm Server Group                                                     #
#                                                                                                                              #
#==============================================================================================================================#

#==============================================================================================================================#
#                                                                                                                              #
#                                                    Scipaper Server Group                                                     #
#                                                                                                                              #
#==============================================================================================================================#

#==============================================================================================================================#
#                                                                                                                              #
#                                                     System Server Group                                                      #
#                                                                                                                              #
#==============================================================================================================================#