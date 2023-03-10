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
#                                Prometheus                                    #
#                                                                              #
#==============================================================================#
# Deploys Prometheus and all of it's component with helmchart
resource "helm_release" "prometheus" {
  name       = var.prometheus_helm_release_name
  repository = var.prometheus_helm_repo
  chart      = var.prometheus_helm_chart_name
  namespace  = var.prometheus_helm_namespace
  version    = var.prometheus_helm_chart_version
  wait       = "false"
  values     = [file(var.prometheus_helm_chart_values_file_path)]
}
#==============================================================================#
#                                                                              #
#                                  Grafana                                     #
#                                                                              #
#==============================================================================#
resource "kubernetes_persistent_volume" "grafana_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.host_ssh_user
    private_key = file(var.host_ssh_key_address)
    agent       = "true"
    host        = var.host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.host_sudo_password} | sudo -S mkdir -p ${var.host_disk_path}/default-${var.grafana_helm_release_name}"]
  }
  metadata {
    name = "${var.grafana_helm_release_name}-persistent-volume"
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
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.grafana_helm_storage
    }

    persistent_volume_source {
      local {
        path = "${var.host_disk_path}/default-${var.grafana_helm_release_name}"
      }
    }
  }
}
#----------------------------------------------------------------------------------
# Deploys Grafana and all of it's component with helmchart
resource "helm_release" "grafana" {
  name       = var.grafana_helm_release_name
  repository = var.grafana_helm_repo
  chart      = var.grafana_helm_chart_name
  namespace  = var.grafana_helm_namespace
  version    = var.grafana_helm_chart_version
  wait       = "false"
  values     = [file(var.grafana_helm_chart_values_file_path)]
  set {
    name  = "persistence.size"
    value = var.grafana_helm_storage
  }

}
#==============================================================================#
#                                                                              #
#                                   Minio                                      #
#                                                                              #
#==============================================================================#

resource "kubernetes_persistent_volume" "minio_persistent_volume" {
  connection {
    type        = "ssh"
    user        = var.host_ssh_user
    private_key = file(var.host_ssh_key_address)
    agent       = "true"
    host        = var.host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.host_sudo_password} | sudo -S mkdir -p ${var.host_disk_path}/default-${var.minio_helm_release_name}"]
  }
  metadata {
    name = "${var.minio_helm_release_name}-persistent-volume"
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
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.minio_helm_storage
    }

    persistent_volume_source {
      local {
        path = "${var.host_disk_path}/default-${var.minio_helm_release_name}"
      }
    }
  }
}
#----------------------------------------------------------------------------------
# Deploys Grafana and all of it's component with helmchart
resource "helm_release" "minio" {
  name       = var.minio_helm_release_name
  repository = var.minio_helm_repo
  chart      = var.minio_helm_chart_name
  namespace  = var.minio_helm_namespace
  version    = var.minio_helm_chart_version
  wait       = "false"
  values     = [file(var.minio_helm_chart_values_file_path)]
  set {
    name  = "persistence.size"
    value = var.minio_helm_storage
  }
}
#----------------------------------------------------------------------------------
# Deploys Nginx-ingress-controller and all of it's component with helmchart
resource "helm_release" "ingress_nginx_controller" {
  name       = var.ingress_helm_release_name
  repository = var.ingress_helm_repo
  chart      = var.ingress_helm_chart_name
  namespace  = var.ingress_helm_namespace
  version    = var.ingress_helm_chart_version
  wait       = "false"
}

#------------------------------------------------------------------------------------------------------
# Deploys cert issuer
resource "helm_release" "cluster_issuer" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  namespace  = "default"
  version    = "1.5.3"
  wait       = "false"
}
#-------------------------------------------------------------------------------------------------------
resource "kubernetes_manifest" "cluster_issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name              = "letsencrypt"
    }
    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email="admin@dipal.ru"
        privateKeySecretRef = {
          name="letsencrypt"
        }
        solvers=[
          {
            http01={
              ingress={
                class="nginx"
              }
            }
          }
        ]
      }
    }

  }


}
