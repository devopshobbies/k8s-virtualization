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
# Deploys Coturn and all of it's component with helmchart
resource "kubernetes_daemonset" "coturn_daemonset" {
  metadata {
    name = "coturn"
    namespace = "default"
    labels = {
        "app.kubernetes.io/name" = "coturn"
        "app.kubernetes.io/instance" = "coturn"
        "app.kubernetes.io/version" = "0.0.1"
      }
  }
  spec {
    selector {
      match_labels = {
        "app.kubernetes.io/name" = "coturn"
        "app.kubernetes.io/instance" = "coturn"
        "app.kubernetes.io/version" = "0.0.1"
      }
    }
    template {

      metadata {
        labels = {
          "app.kubernetes.io/name"     = "coturn"
          "app.kubernetes.io/instance" = "coturn"
          "app.kubernetes.io/version" = "0.0.1"
        }
      }
      spec {
        host_network = true
        container {
          name = "coturn"
          image = "coturn/coturn"
          image_pull_policy = "Always"
          port {
            name = "turn-port1"
            container_port = 3478
            host_port = 3478
            protocol = "UDP"
          }
          port {
            name = "turn-port2"
            container_port = 3478
            host_port = 3478
            protocol = "TCP"
          }
          args = ["-v"]
        }
      }
    }
  }
}
resource "kubernetes_service" "coturn_service" {
  metadata {
    name = "coturn"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name"     = "coturn"
      "app.kubernetes.io/instance" = "coturn"
      "app.kubernetes.io/version" = "0.0.1"
    }
  }
  spec {
    type = "ClusterIP"
    port {
      port = 3478
      target_port = "3478"
      protocol = "UDP"
      name = "turn-port1"
    }
    port {
      port = 3478
      target_port = "3478"
      protocol = "TCP"
      name = "turn-port2"
    }
    selector = {
      "app.kubernetes.io/name"     = "coturn"
      "app.kubernetes.io/instance" = "coturn"
      "app.kubernetes.io/version" = "0.0.1"
    }
  }
}