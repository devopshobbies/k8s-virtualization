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
#----------------------------------------------------------------------------------
# Deploys dipal website
resource "kubernetes_deployment" "dipal_website_deployment" {
  metadata {
    name = var.dipal_website_name
    namespace = var.dipal_website_namespace
    labels = {
      "app" = var.dipal_website_name
    }
  }
  spec {
    selector {match_labels = {"app" = var.dipal_website_name}}
    template {
      metadata {
        labels = {"app"= var.dipal_website_name}
      }
      spec {
        image_pull_secrets {
          name = "regcred"
        }
        container {

          name = "dipal"
          image = "${var.dipal_website_image_address}:${var.dipal_website_image_tag}"
          port {
            container_port = var.dipal_website_container_port
          }
        }
      }
    }
  }
}
#------------------------------------------------------------------------------------------------------
# Deploys dipal website service
resource "kubernetes_service" "dipal_website_service" {
  metadata {
    name = "${var.dipal_website_name}-service"
    namespace = var.dipal_website_namespace
    labels = {"app"= var.dipal_website_name}
  }

  spec {
    port {
      name="http"
      port = var.dipal_website_service_port
      target_port = var.dipal_website_container_port
    }
    type = "ClusterIP"
    selector = {"app"= var.dipal_website_name}
  }

}
#------------------------------------------------------------------------------------------------------
# Deploys dipal website ingress
resource "kubernetes_ingress_v1" "dipal_website_ingress" {
  metadata {
    name = "${var.dipal_website_namespace}-${var.dipal_website_name}-ingress"
    namespace = var.dipal_website_namespace
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      host = "dipal.ru"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "${var.dipal_website_name}-service"
              port {
                number = var.dipal_website_service_port
              }
            }
          }
        }
      }
    }
  }
}