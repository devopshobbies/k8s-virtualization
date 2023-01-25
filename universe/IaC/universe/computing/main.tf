#==============================================================================#
#                                                                              #
#                                 MIT License                                  #
#                                                                              #
#                       Copyright (c) 2023 Skyfarm                             #
#                                                                              #
# Permission is hereby granted, free of charge, to any person obtaining a copy #
#of this software and associated documentation files (the Software), to deal #
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
    name = var.system_namespace
  }
}
#-------------------------------------------------------------------------------
#create persistent volumes
resource "kubernetes_persistent_volume" "system_vm1_persistent_volume" {
  metadata {
    name = "${var.system_vm_name}-persistent-volume"
    
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "beta.kubernetes.io/os"
            operator = "In"
            values   = ["linux"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteMany"]
    capacity = {
      storage = "100Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1/system/vm-pvs/pv1"
      }
    }
  }
}
#-------------------------------------------------------------------------------
#https://cloud-images.ubuntu.com/lunar/current/lunar-server-cloudimg-amd64-disk-kvm.img
resource "kubernetes_manifest" "virtualmachine_ubuntu" {
  manifest = {
    apiVersion = "kubevirt.io/v1"
    kind = "VirtualMachine"
    metadata = {
      creationTimestamp = null
      name = "ubuntu"
      namespace = var.system_namespace
    }
    spec = {
      dataVolumeTemplates = [
        {
          metadata = {
            creationTimestamp = null
            name = "datavolumevolume"
          }
          spec = {
            pvc = {
              accessModes = [
                "ReadWriteMany",
              ]
              resources = {
                requests = {
                  storage = "100Gi"
                }
              }
            }
            source = {
              http = {
                url = "http://10.244.134.23:9000/public/lunar-server-cloudimg-amd64.img"
              }
            }
          }
        },
      ]
      running = false
      template = {
        metadata = {
          creationTimestamp = null
          labels = {
            "kubevirt.io/vm" = "vm-datavolume"
          }
        }
        spec = {
          domain = {
            cpu = {
              cores = 2
            }
            devices = {
              disks = [
                {
                  disk = {
                    bus = "virtio"
                  }
                  name = "datavolumevolume"
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
                memory = "8Gi"
              }
            }
          }
          terminationGracePeriodSeconds = 0
          volumes = [
            {
              cloudInitNoCloud = {
                userData = <<-EOT
                #cloud-config
                    ssh_authorized_keys:
                      - ${var.system_vm_ssh}
                EOT
              }
              name = "cloudinit"
            },
            {
              dataVolume = {
                name = "datavolumevolume"
              }
              name = "datavolumevolume"
            },
          ]
        }
      }
    }
  }
}

#==============================================================================#
#                                                                              #
#                              Dipal Server Group                              #
#                                                                              #
#==============================================================================#

#==============================================================================#
#                                                                              #
#                             Skyfarm Server Group                             #
#                                                                              #
#==============================================================================#

#==============================================================================#
#                                                                              #
#                            Scipaper Server Group                             #
#                                                                              #
#==============================================================================#
