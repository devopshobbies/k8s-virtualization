#==============================================================================#
#                                                                              #
#                                 MIT License                                  #
#                                                                              #
#                       Copyright (c) 2023 DevopsHobbies                       #
#                                                                              #
# Permission is hereby granted, free of charge, to any person obtaining a copy #
#of this software and associated documentation files (the Software), to deal   #
# in the Software without restriction, including without limitation the rights #
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell   #
#    copies of the Software, and to permit persons to whom the Software is     #
#           furnished to do so, subject to the following conditions:           #
#                                                                              #
#The above copyright notice and this permission notice shall be included in all#
#               copies or substantial portions of the Software.                #
#                                                                              #
#  THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  #
#   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE  #
#    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER    #
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, #
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE #
#                                  SOFTWARE.                                   #
#                                                                              #
#==============================================================================#
#==============================================================================#
#                                                                              #
#                             System Server Group                              #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
# creates the name space for for system
resource "kubernetes_namespace" "system_namespace" {
  metadata {
    name = var.vm_namespace
  }
}
#-------------------------------------------------------------------------------
#create persistent volumes
resource "kubernetes_persistent_volume" "system_vm1_persistent_volume" {

  connection {
    type        = "ssh"
    user        = var.host_user
    private_key = file(var.host_ssh_key)
    agent       = "true"
    host        = var.host_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.ssh_sudo_password} | sudo -S mkdir -p ${var.vm_host_disk_path}/${var.vm_namespace}-${var.vm_name}"]
  }
  metadata {
    name = "${var.vm_name}-persistent-volume"

  }
  spec {
    claim_ref {
      name = "${var.vm_name}-${var.vm_disk_name}"
      namespace = var.vm_namespace
    }
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = [var.vm_host_node]
          }
        }
      }
    }
    access_modes = ["ReadWriteMany"]
    capacity = {
      storage = var.vm_disk_storage
    }
    persistent_volume_reclaim_policy = "Retain"

    persistent_volume_source {
      local {
        path = "${var.vm_host_disk_path}/${var.vm_namespace}-${var.vm_name}"
      }
    }
  }
}

#-------------------------------------------------------------------------------
#https://cloud-images.ubuntu.com/lunar/current/lunar-server-cloudimg-amd64-disk-kvm.img
resource "kubernetes_manifest" "virtual_machine_ubuntu" {


  manifest = {
    apiVersion = "kubevirt.io/v1"
    kind       = "VirtualMachine"
    metadata = {
      name              = var.vm_name
      namespace         = var.vm_namespace
    }
    spec = {

      dataVolumeTemplates = [
        {
          metadata = {
            creationTimestamp = null
            name              = "${var.vm_name}-${var.vm_disk_name}"
          }
          spec = {

            pvc = {
              selector = {
                matchLabels = {
                  "kubernetes.io/hostname" = var.vm_host_node
                }

              }

              accessModes = [
                "ReadWriteMany",
              ]
              resources = {
                requests = {
                  storage = var.vm_disk_storage
                }
              }
            }
            source = {
              http = {
                url = var.vm_os
              }
            }
          }
        },
      ]
      running = true
      template = {

        metadata = {
          creationTimestamp = null
          labels = {
            "kubevirt.io/vm" = "vm-datavolume"
          }
        }
        spec = {
          nodeSelector = {
            "kubernetes.io/hostname" = var.vm_host_node
          }


          domain = {
            cpu = {
              cores = var.vm_cpu_cores
            }
            devices = {
              disks = [
                {
                  disk = {
                    bus = "virtio"
                  }
                  name = "${var.vm_name}-${var.vm_disk_name}"
                },
                {
                  disk = {
                    bus = "virtio"
                  }
                  name = "cloudinit"
                },
              ]
            }
            machine = {
              type = "q35"
            }
            resources = {
              requests = {
                memory = var.vm_memory
              }
            }
          }
          terminationGracePeriodSeconds = 0
          volumes = [
            {
              cloudInitNoCloud = {
                userData = <<-EOT
                #cloud-config
                    user: ubuntu
                    password: ${var.ssh_sudo_password}
                    chpasswd: {expire: False}
                    ssh_authorized_keys:
                      - ${var.vm_ssh_key}
                EOT
              }
              name = "cloudinit"
            },
            {
              dataVolume = {
                name = "${var.vm_name}-${var.vm_disk_name}"
              }
              name = "${var.vm_name}-${var.vm_disk_name}"
            },
          ]
        }
      }
    }
  }
}