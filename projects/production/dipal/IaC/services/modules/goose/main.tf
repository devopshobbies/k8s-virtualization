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
#Deploys goose configmap
resource "kubernetes_config_map" "goose_configmap" {
  metadata {
    namespace = var.goose_namespace
    name = "${var.goose_name}-configmap"
    labels = {"app"= var.goose_name}
  }
  data = {
    "APP_PORT"= var.goose_app_port
    "REDIS_HOST"= var.goose_redis_host
    "REDIS_PORT"= var.goose_redis_port
    "KAFKA_HOST"= var.goose_kafka_host
    "KAFKA_PORT"= var.goose_kafka_port
    "KAFKA_CLIENT_ID"= var.goose_kafka_client_id
    "KAFKA_GROUP_ID"= var.goose_kafka_group_id
    "MQTT_HOST"= var.goose_mqtt_address
    "MQTT_PORT"= var.goose_mqtt_port
  }
}
#-------------------------------------------------------------------
# Deploys goose secret
resource "kubernetes_secret" "goose_secret" {
  metadata {
    namespace = var.goose_namespace
    name = "${var.goose_name}-secret"
    labels = {"app"= var.goose_name}
  }
  type = "Opaque"
  data = {
    "REDIS_PASSWORD"= var.goose_redis_password
  }
}
#-------------------------------------------------------------------
# Deploys goose service
resource "kubernetes_service" "goose_service" {
  metadata {
    name = "${var.goose_name}-service"
    labels = {"app"= var.goose_name}
    namespace = var.goose_namespace
  }
  spec {
    port {
      name="http"
      port = var.goose_app_port
      target_port = var.goose_app_port
    }
    type = "ClusterIP"
    selector = {"app"= var.goose_name}
  }
}
#-------------------------------------------------------------------
#Deploys goose deployment
resource "kubernetes_deployment" "goose_deployment" {
  depends_on = [kubernetes_secret.goose_secret,kubernetes_config_map.goose_configmap]
  metadata {
    name = "${var.goose_name}-deployment"
    namespace = var.goose_namespace
    labels = {"app" = var.goose_name}
  }
  spec {
    replicas = var.goose_replica
    selector {match_labels = {"app" = var.goose_name}}
    template {
      metadata {
        labels = {"app"= var.goose_name}
      }
      spec {
        image_pull_secrets {
          name = var.goose_pull_secret
        }
        container {
          env {
            name = "APP_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.goose_name}-configmap"
                key = "APP_PORT"
              }
            }
          }
          env {
            name = "REDIS_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.goose_name}-configmap"
                key = "REDIS_HOST"
              }
            }
          }
          env {
            name = "REDIS_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.goose_name}-configmap"
                key = "REDIS_PORT"
              }
            }
          }
          env {
            name = "MQTT_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.goose_name}-configmap"
                key = "MQTT_HOST"
              }
            }
          }
          env {
            name = "MQTT_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.goose_name}-configmap"
                key = "MQTT_PORT"
              }
            }
          }
          env {
            name = "KAFKA_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.goose_name}-configmap"
                key = "KAFKA_HOST"
              }
            }
          }
          env {
            name = "KAFKA_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.goose_name}-configmap"
                key = "KAFKA_PORT"
              }
            }
          }
          env {
            name = "KAFKA_CLIENT_ID"
            value_from {
              config_map_key_ref {
                name = "${var.goose_name}-configmap"
                key = "KAFKA_CLIENT_ID"
              }
            }
          }
          env {
            name = "KAFKA_GROUP_ID"
            value_from {
              config_map_key_ref {
                name = "${var.goose_name}-configmap"
                key = "KAFKA_GROUP_ID"
              }
            }
          }
          env {
            name = "REDIS_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.goose_name}-secret"
                key = "REDIS_PASSWORD"
              }
            }
          }
          image = "${var.goose_image_address}:${var.goose_image_tag}"
          name = var.goose_name
          port {
            container_port = var.goose_app_port
          }
        }
      }
    }
  }
}
