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
#-------------------------------------------------------------------
#Deploys Pyrador configmap
resource "kubernetes_config_map" "pyrador_configmap" {
  metadata {
    namespace = var.pyrador_namespace
    name = "${var.pyrador_name}-configmap"
    labels = {"app"= var.pyrador_name}
  }
  data = {
    "APP_PORT"= var.pyrador_app_port
    "REDIS_HOST"= var.pyrador_redis_host
    "REDIS_PORT"= var.pyrador_redis_port
    "KAFKA_HOST"= var.pyrador_kafka_host
    "KAFKA_PORT"= var.pyrador_kafka_port
    "KAFKA_CLIENT_ID"= var.pyrador_kafka_client_id
    "KAFKA_GROUP_ID"= var.pyrador_kafka_group_id
  }
}

#-------------------------------------------------------------------
# Deploys Pyrador secret
resource "kubernetes_secret" "pyrador_secret" {
  metadata {
    namespace = var.pyrador_namespace
    name = "${var.pyrador_name}-secret"
    labels = {"app"= var.pyrador_name}
  }
  type = "Opaque"
  data = {
    "AUTH_KEY" = var.pyrador_keycloak_auth_key
    "REDIS_PASSWORD"= var.pyrador_redis_password
  }
}
#-------------------------------------------------------------------
# Deploys Pyrador service
resource "kubernetes_service" "pyrador_service" {
  metadata {
    name = "${var.pyrador_name}-service"
    labels = {"app"= var.pyrador_name}
    namespace = var.pyrador_namespace
  }
  spec {
    port {
      name="http"
      port = var.pyrador_app_port
      target_port = var.pyrador_app_port
    }
    type = "ClusterIP"
    selector = {"app"= var.pyrador_name}
  }
}
#-------------------------------------------------------------------
#Deploys Pyrador deployment
resource "kubernetes_deployment" "pyrador_deployment" {
  depends_on = [kubernetes_secret.pyrador_secret,kubernetes_config_map.pyrador_configmap]
  metadata {
    name = "${var.pyrador_name}-deployment"
    namespace = var.pyrador_namespace
    labels = {"app" = var.pyrador_name}
  }
  spec {
    replicas = var.pyrador_replica
    selector {match_labels = {"app" = var.pyrador_name}}
    template {
      metadata {
        labels = {"app"= var.pyrador_name}
      }
      spec {
        image_pull_secrets {
          name = var.pyrador_pull_secret
        }
        container {
          env {
            name = "APP_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.pyrador_name}-configmap"
                key = "APP_PORT"
              }
            }
          }
          env {
            name = "REDIS_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.pyrador_name}-configmap"
                key = "REDIS_HOST"
              }
            }
          }
          env {
            name = "REDIS_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.pyrador_name}-configmap"
                key = "REDIS_PORT"
              }
            }
          }
          env {
            name = "KAFKA_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.pyrador_name}-configmap"
                key = "KAFKA_HOST"
              }
            }
          }
          env {
            name = "KAFKA_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.pyrador_name}-configmap"
                key = "KAFKA_PORT"
              }
            }
          }
          env {
            name = "KAFKA_CLIENT_ID"
            value_from {
              config_map_key_ref {
                name = "${var.pyrador_name}-configmap"
                key = "KAFKA_CLIENT_ID"
              }
            }
          }
          env {
            name = "KAFKA_GROUP_ID"
            value_from {
              config_map_key_ref {
                name = "${var.pyrador_name}-configmap"
                key = "KAFKA_GROUP_ID"
              }
            }
          }
          env {
            name = "AUTH_KEY"
            value_from {
              secret_key_ref {
                name = "${var.pyrador_name}-secret"
                key = "AUTH_KEY"
              }
            }
          }
          env {
            name = "REDIS_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.pyrador_name}-secret"
                key = "REDIS_PASSWORD"
              }
            }
          }
          image = "${var.pyrador_image_address}:${var.pyrador_image_tag}"
          name = var.pyrador_name
          port {
            container_port = var.pyrador_app_port
          }
        }
      }
    }
  }
}
