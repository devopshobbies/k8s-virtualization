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
#Deploys Iguana configmap
resource "kubernetes_config_map" "pyrador_configmap" {
  metadata {
    namespace = var.iguana_namespace
    name = "${var.iguana_name}-configmap"
    labels = {"app"= var.iguana_name}
  }
  data = {
    "APP_PORT": var.iguana_app_port
    "REDIS_HOST": var.iguana_redis_host
    "REDIS_PORT": var.iguana_redis_password
    "KAFKA_HOST": var.iguana_kafka_host
    "KAFKA_PORT": var.iguana_kafka_port
    "KAFKA_CLIENT_ID": var.iguana_kafka_client_id
    "KAFKA_GROUP_ID": var.iguana_kafka_group_id
    "FS_PUBLIC_URL": var.iguana_fs_public_url
    "FS_HOST": var.iguana_fs_host
    "FS_BUCKET_NAME": var.iguana_fs_bucket_name
    "FS_PORT": var.iguana_fs_bucket_port
  }
}
#-------------------------------------------------------------------
# Deploys iguana secret
resource "kubernetes_secret" "iguana_secret" {
  metadata {
    namespace = var.iguana_namespace
    name = "${var.iguana_name}-secret"
    labels = {"app"= var.iguana_name}
  }
  type = "Opaque"
  data = {
    "AUTH_KEY" = var.iguana_keycloak_auth_key
    "REDIS_PASSOWRD"= var.iguana_redis_password
    "FS_ACCESS_KEY"= var.iguana_S3_access_key
    "FS_SECRET_KEY"= var.iguana_S3_secret
  }
}
#-------------------------------------------------------------------
# Deploys iguana service
resource "kubernetes_service" "iguana_service" {
  metadata {
    name = "${var.iguana_name}-service"
    labels = {"app"= var.iguana_name}
    namespace = var.iguana_namespace
  }
  spec {
    port {
      name:"http"
      port = var.iguana_app_port
      target_port = var.iguana_app_port
    }
    type = "ClusterIP"
    selector = {"app"= var.iguana_name}
  }
}
#-------------------------------------------------------------------
#Deploys iguana deployment
resource "kubernetes_deployment" "iguana_deployment" {
  metadata {
    name = "${var.iguana_name}-deployment"
    namespace = var.iguana_namespace
    labels = {"app" = var.iguana_name}
  }
  spec {
    replicas = var.iguana_replica
    selector {match_labels = {"app" = var.iguana_name}}
    template {
      metadata {
        labels = {"app"= var.iguana_name}
      }
      spec {
        image_pull_secrets {
          name = var.iguana_pull_secret
        }
        container {
          env {
            name = "APP_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "APP_PORT"
              }
            }
          }
          env {
            name = "REDIS_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "REDIS_HOST"
              }
            }
          }
          env {
            name = "REDIS_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "REDIS_PORT"
              }
            }
          }
          env {
            name = "KAFKA_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "KAFKA_HOST"
              }
            }
          }
          env {
            name = "KAFKA_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "KAFKA_PORT"
              }
            }
          }
          env {
            name = "KAFKA_CLIENT_ID"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "KAFKA_CLIENT_ID"
              }
            }
          }
          env {
            name = "KAFKA_GROUP_ID"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "KAFKA_GROUP_ID"
              }
            }
          }
          env {
            name = "FS_PUBLIC_URL"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "FS_PUBLIC_URL"
              }
            }
          }
          env {
            name = "FS_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "FS_HOST"
              }
            }
          }
          env {
            name = "FS_BUCKET_NAME"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "FS_BUCKET_NAME"
              }
            }
          }
          env {
            name = "FS_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.iguana_name}-configmap"
                key = "FS_PORT"
              }
            }
          }
          env {
            name = "AUTH_KEY"
            value_from {
              secret_key_ref {
                name = "${var.iguana_name}-secret"
                key = "AUTH_KEY"
              }
            }
          }
          env {
            name = "REDIS_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.iguana_name}-secret"
                key = "REDIS_PASSWORD"
              }
            }
          }
          env {
            name = "FS_ACCESS_KEY"
            value_from {
              secret_key_ref {
                name = "${var.iguana_name}-secret"
                key = "FS_ACCESS_KEY"
              }
            }
          }
          env {
            name = "FS_SECRET_KEY"
            value_from {
              secret_key_ref {
                name = "${var.iguana_name}-secret"
                key = "FS_SECRET_KEY"
              }
            }
          }
          image = "${var.iguana_image_address}:${var.iguana_image_tag}"
          name = var.iguana_name
          port {
            container_port = var.iguana_app_port
          }
        }
      }
    }
  }
}