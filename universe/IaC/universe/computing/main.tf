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
    storage_class_name = "local"
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "100Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk2"
      }
    }
  }
}
resource "kubernetes_persistent_volume" "system_vm1_persistent_volume_2" {
  metadata {
    name = "${var.system_vm_name}-persistent-volume-2"
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
    storage_class_name = "local"
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "100Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1"
      }
    }
  }
}
# resource "kubernetes_persistent_volume" "system_vm1_persistent_volume2" {
#   metadata {
#     name = "${var.system_vm_name}-persistent-volume-2"
#   }
#   spec {
#     node_affinity {
#       required {
#         node_selector_term {
#           match_expressions {
#             key      = "beta.kubernetes.io/os"
#             operator = "In"
#             values   = ["linux"]
#           }
#         }
#       }
#     }
#     storage_class_name = "local"
#     access_modes       = ["ReadWriteOnce"]
#     capacity = {
#       storage = "200Gi"
#     }

#     persistent_volume_source {
#       local {
#         path = "/mnt/disk1"
#       }
#     }
#   }
# }
#-------------------------------------------------------------------------------
#Create persistent volume claim
# resource "kubernetes_persistent_volume_claim" "system_vm1_persistent_volume_claim" {
#   depends_on = [
#     kubernetes_persistent_volume.system_vm1_persistent_volume
#   ]

#   metadata {
#     name      = "${var.system_vm_name}-persistent-volume-claim"
#     namespace = var.system_namespace

#   }

#   spec {

#     access_modes = ["ReadWriteMany"]
#     #storage_class_name = "local-path"
#     resources {
#       requests = {
#         storage = "10Gi"
#       }
#     }
#   }
# }
#-------------------------------------------------------------------------------
#https://cloud-images.ubuntu.com/lunar/current/lunar-server-cloudimg-amd64-disk-kvm.img


# Creates virtual machine 1
# resource "kubernetes_manifest" "ubuntu_terraform" {
#   manifest = {
#     apiVersion = "kubevirt.io/v1"
#     kind       = "VirtualMachine"
#     metadata = {
#       creationTimestamp = null
#       name              = var.system_vm_name
#       namespace         = var.system_namespace
#     }
#     spec = {
#       runStrategy = "Always"
#       template = {
#         metadata = {
#           "creationTimestamp" = null
#         }
#         spec = {
#           domain = {
#             devices = {
#               disks = [
#                 # {
#                 #   disk = {
#                 #     bus = "virtio"
#                 #   }
#                 #   name = "mounted-disk"
#                 #  },
#                 {
#                   disk = {
#                     bus = "virtio"
                    
#                   }
#                   name = "containerdisk"
#                 },
#                 {
#                   disk = {
#                     bus = "virtio"
#                   }
#                   name = "cloudinit"
#                 }
                
#               ]
#               rng = {}
#             }
#             resources = {
#               requests = {
#                 memory = var.system_vm_memory
#               }
#             }
#           }
#           terminationGracePeriodSeconds = 180
#           volumes = [
#             {
#               containerDisk = {
#                 image = "quay.io/containerdisks/ubuntu:22.04"
                

#               }
#               name = "containerdisk"
#             },
#             {
#               cloudInitNoCloud = {
#                 userData = <<-EOT
#                 #cloud-config
#                     ssh_authorized_keys:
#                       - ${var.system_vm_ssh}
#                 EOT
#               }
#               name = "cloudinit"
#             },
#             {
#               name = "mounted-disk"
#               persistentVolumeClaim = {
#                 claimName = kubernetes_persistent_volume_claim.system_vm1_persistent_volume_claim.metadata[0].name
#               }
#             }
#           ]
#         }
#       }
#     }
#   }
# }
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
