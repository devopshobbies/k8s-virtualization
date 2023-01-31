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
#                                  Jenkins                                     #
#                                                                              #
#==============================================================================#
resource "kubernetes_persistent_volume" "jenkins_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.jenkins_host_ssh_user
    private_key = file(var.jenkins_host_ssh_key_address)
    agent       = true
    host        = var.jenkins_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.jenkins_host_sudo_password} | sudo -S mkdir -p ${var.jenkins_host_disk_path}"]
  }
  metadata {
    name = "${var.jenkins_helm_release_name}-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["cicd-master"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.jenkins_helm_storage
    }

    persistent_volume_source {
      local {
        path = var.jenkins_host_disk_path
      }
    }
  }
}
#----------------------------------------------------------------------------------
# Deploys Jenkins and all of it's component with helmchart
resource "helm_release" "jenkins" {
  name       = var.jenkins_helm_release_name
  repository = var.jenkins_helm_repo
  chart      = var.jenkins_helm_chart_name
  namespace  = var.jenkins_helm_release_namespace
  version    = var.jenkins_helm_chart_version
  wait       = "false"
  values     = [file(var.jenkins_helm_chart_values_file_path)]
  set {
    name  = "persistence.size"
    value = var.jenkins_helm_storage
  }

}

#==============================================================================#
#                                                                              #
#                                  Gitea                                       #
#                                                                              #
#==============================================================================#
resource "kubernetes_persistent_volume" "gitea_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.gitea_host_ssh_user
    private_key = file(var.gitea_host_ssh_key_address)
    agent       = true
    host        = var.gitea_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.gitea_host_sudo_password} | sudo -S mkdir -p /bitnami/gitea"]
  }
  metadata {
    name = "${var.gitea_helm_release_name}-persistent-volume"
  }
  spec {

    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["cicd-worker1"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.gitea_helm_storage
    }

    persistent_volume_source {
      local {
        path = "/bitnami/gitea"
      }
    }
  }
}
resource "kubernetes_persistent_volume" "postgresql_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.gitea_host_ssh_user
    private_key = file(var.gitea_host_ssh_key_address)
    agent       = true
    host        = var.gitea_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.gitea_host_sudo_password} | sudo -S mkdir -p ${var.gitea_host_disk_path}/default-${var.gitea_helm_release_name}/postgress"]
  }
  metadata {
    name = "${var.gitea_helm_release_name}-postgresql-persistent-volume"
  }
  spec {

    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = ["cicd-worker1"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.gitea_postgresql_helm_storage
    }

    persistent_volume_source {
      local {
        path = "${var.gitea_host_disk_path}/default-${var.gitea_helm_release_name}/postgress"
      }
    }
  }
}
## Deploys Jenkins and all of it's component with helmchart
#resource "helm_release" "gitea" {
#  name       = var.gitea_helm_release_name
#  repository = var.gitea_helm_repo
#  chart      = var.gitea_helm_chart_name
#  namespace  = var.gitea_helm_release_namespace
#  version    = var.gitea_helm_chart_version
#  wait       = "false"
#  values     = [file(var.gitea_helm_chart_values_file_path)]
#  set {
#    name  = "persistence.size"
#    value = var.gitea_helm_storage
#  }


#}