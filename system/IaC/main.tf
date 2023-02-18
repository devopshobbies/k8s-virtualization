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
#                                  harbor                                     #
#                                                                              #
#==============================================================================#
resource "kubernetes_persistent_volume" "harbor_postgresql_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.harbor_host_ssh_user
    private_key = file(var.harbor_host_ssh_key_address)
    agent       = true
    host        = var.harbor_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.harbor_host_sudo_password} | sudo -S mkdir -p ${var.harbor_host_disk_path}/postgress"]
  }
  metadata {
    name = "${var.harbor_helm_release_name}-postgress-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["system-master"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.harbor_helm_postgress_storage
    }


    persistent_volume_source {
      local {
        path = "${var.harbor_host_disk_path}/postgress"
      }
    }
  }
}
//-------------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_trivy_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.harbor_host_ssh_user
    private_key = file(var.harbor_host_ssh_key_address)
    agent       = true
    host        = var.harbor_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.harbor_host_sudo_password} | sudo -S mkdir -p ${var.harbor_host_disk_path}/trivy"]
  }
  metadata {
    name = "${var.harbor_helm_release_name}-trivy-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["system-master"]
          }
        }
      }
    }

    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.harbor_helm_trivy_storage
    }

    persistent_volume_source {
      local {
        path = "${var.harbor_host_disk_path}/trivy"
      }
    }
  }
}
//--------------------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_chart_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.harbor_host_ssh_user
    private_key = file(var.harbor_host_ssh_key_address)
    agent       = true
    host        = var.harbor_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.harbor_host_sudo_password} | sudo -S mkdir -p ${var.harbor_host_disk_path}/chart"]
  }
  metadata {
    name = "${var.harbor_helm_release_name}-chart-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["system-master"]
          }
        }
      }
    }

    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.harbor_helm_chart_storage
    }

    persistent_volume_source {
      local {
        path = "${var.harbor_host_disk_path}/chart"
      }
    }
  }
}
//--------------------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_jobservice_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.harbor_host_ssh_user
    private_key = file(var.harbor_host_ssh_key_address)
    agent       = true
    host        = var.harbor_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.harbor_host_sudo_password} | sudo -S mkdir -p ${var.harbor_host_disk_path}/jobservice"]
  }
  metadata {
    name = "${var.harbor_helm_release_name}-jobservice-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["system-master"]
          }
        }
      }
    }

    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.harbor_helm_jobservice_storage
    }

    persistent_volume_source {
      local {
        path = "${var.harbor_host_disk_path}/jobservice"
      }
    }
  }
}
//--------------------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_registry_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.harbor_host_ssh_user
    private_key = file(var.harbor_host_ssh_key_address)
    agent       = true
    host        = var.harbor_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.harbor_host_sudo_password} | sudo -S mkdir -p ${var.harbor_host_disk_path}/registry"]
  }
  metadata {
    name = "${var.harbor_helm_release_name}-registry-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["system-master"]
          }
        }
      }
    }

    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.harbor_helm_registry_storage
    }

    persistent_volume_source {
      local {
        path = "${var.harbor_host_disk_path}/registry"
      }
    }
  }
}
//--------------------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_redis_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.harbor_host_ssh_user
    private_key = file(var.harbor_host_ssh_key_address)
    agent       = true
    host        = var.harbor_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.harbor_host_sudo_password} | sudo -S mkdir -p ${var.harbor_host_disk_path}/redis"]
  }
  metadata {
    name = "${var.harbor_helm_release_name}-redis-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["system-master"]
          }
        }
      }
    }

    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.harbor_helm_redis_storage
    }

    persistent_volume_source {
      local {
        path = "${var.harbor_host_disk_path}/redis"
      }
    }
  }
}
//--------------------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_scandata_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.harbor_host_ssh_user
    private_key = file(var.harbor_host_ssh_key_address)
    agent       = true
    host        = var.harbor_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.harbor_host_sudo_password} | sudo -S mkdir -p ${var.harbor_host_disk_path}/scandata"]
  }
  metadata {
    name = "${var.harbor_helm_release_name}-scandata-persistent-volume"
  }

  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["system-master"]
          }
        }
      }
    }

    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.harbor_helm_scandata_storage
    }

    persistent_volume_source {
      local {
        path = "${var.harbor_host_disk_path}/scandata"
      }
    }
  }
}
#----------------------------------------------------------------------------------
# Deploys harbor and all of it's component with helmchart
resource "helm_release" "harbor" {
  name       = var.harbor_helm_release_name
  repository = var.harbor_helm_repo
  chart      = var.harbor_helm_chart_name
  namespace  = var.harbor_helm_release_namespace
  version    = var.harbor_helm_chart_version
  wait       = "false"
  values     = [file(var.harbor_helm_chart_values_file_path)]
  set {
    name  = "persistence.registry.size"
    value = var.harbor_helm_registry_storage
  }
  set {
    name  = "persistence.jobservice.size"
    value = var.harbor_helm_jobservice_storage
  }
  set {
    name  = "persistence.scanData.size"
    value = var.harbor_helm_scandata_storage
  }
  set {
    name  = "persistence.chartmuseum.size"
    value = var.harbor_helm_chart_storage
  }
  set {
    name  = "persistence.trivy.size"
    value = var.harbor_helm_trivy_storage
  }



}
#==============================================================================#
#                                                                              #
#                                keycloak                                    #
#                                                                              #
#==============================================================================#

resource "kubernetes_persistent_volume" "keycloak_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.keycloak_host_ssh_user
    private_key = file(var.keycloak_host_ssh_key_address)
    agent       = true
    host        = var.harbor_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.keycloak_host_sudo_password} | sudo -S mkdir -p ${var.keycloak_host_disk_path}/keycloak"]
  }
  metadata {
    name = "${var.keycloak_helm_release_name}-persistent-volume"
  }

  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["system-master"]
          }
        }
      }
    }

    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.keycloak_helm_storage
    }

    persistent_volume_source {
      local {
        path = "${var.keycloak_host_disk_path}/keycloak"
      }
    }
  }
}
//------------------------------------------------------------------------------
# Deploys keycloak and all of it's component with helmchart
resource "helm_release" "keycloak" {
  name       = var.keycloak_helm_release_name
  repository = var.keycloak_helm_repo
  chart      = var.keycloak_helm_chart_name
  namespace  = var.keycloak_helm_release_namespace
  version    = var.keycloak_helm_chart_version
  wait       = "false"
  values     = [file(var.keycloak_helm_chart_values_file_path)]
}
#==============================================================================#
#                                                                              #
#                                   Artifactory                                #
#                                                                              #
#==============================================================================#
#----------------------------------------------------------------------------------
# Deploys Grafana and all of it's component with helmchart
resource "helm_release" "openproject" {
  name       = var.openproject_helm_release_name
  repository = var.openproject_helm_repo
  chart      = var.openproject_helm_chart_name
  namespace  = var.openproject_helm_namespace
  version    = var.openproject_helm_chart_version
  wait       = "false"
  set {
    name  = "persistence.size"
    value = var.openproject_helm_storage
  }
  set{
    name = "nodeSelector.kubernetes\\.io/hostname"
    value = "system-master"
  }
  set {
    name  = "ingress.enabled"
    value = false
  }

}

