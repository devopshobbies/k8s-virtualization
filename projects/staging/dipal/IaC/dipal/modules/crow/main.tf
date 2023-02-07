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
#Deploys crow configmap
resource "kubernetes_config_map" "crow_configmap" {
  metadata {
    namespace = var.crow_namespace
    name = "${var.crow_name}-configmap"
    labels = {"app"= var.crow_name}
  }
  data = {
    "EXTERNAL_MONGO_BASE_URI"=  var.crow_external_mongodb_base_url
    "EXTERNAL_MONGO_PORT"=  var.crow_external_mongodb_port
    "EXTERNAL_MONGO_USERNAME"= var.crow_external_mongodb_username
    "EXTERNAL_MONGO_DB_NAME"= var.crow_external_mongodb_db_name
    "EXTERNAL_MONGO_DEBUG"= var.crow_external_mongodb_debug
    "DEFAULT_PLACE_ID"= var.crow_default_place_id
    "DEFAULT_UTILITES_DEVICES_SERVICE_ID"= var.crow_default_utilities_service_id
    "DEFAULT_INTERCOM_SERVICE_ID"= var.crow_default_intercom_service_id
    "DEFAULT_CAMERA_SERVICE_ID"= var.crow_default_camera_service_id
    "MONGO_BASE_URI" = var.crow_mongodb_base_url
    "MONGO_PORT"=var.crow_mongodb_port
    "MONGO_USERNAME" = var.crow_mongodb_username
    "MONGO_DB_NAME" = var.crow_mongodb_dbname
    "MONGO_DEBUG" = var.crow_mongodb_debug
    "REDIS_HOST" = var.crow_redis_host
    "VAULT_HOST" =var.crow_vault_host
    "VAULT_PORT" =var.crow_vault_port
    "REDIS_PORT" = var.crow_redis_port
    "KAFKA_HOST" = var.crow_kafka_host
    "KAFKA_PORT" = var.crow_kafka_port
    "KAFKA_CLIENT_ID" = var.crow_kafka_client_id
    "KAFKA_GROUP_ID" = var.crow_kafka_group_id
    "KEYCLOAK_BASE_URI" = var.crow_keycloak_base_url
    "KEYCLOAK_PORT" = var.crow_keycloak_port
    "KEYCLOAK_REALM" = var.crow_keycloak_realm
    "KEYCLOAK_GRANT_TYPE" = var.crow_keycloak_grant_type
    "NEXT_TRY_TIME" = var.crow_next_try_time
    "OTP_EXPIRATION_TIME" = var.crow_expiration_time
    "BILLING_BASE_URL" = var.crow_billing_base_url
    "TRUDESK_HOST" = var.crow_trudesk_host
    "TRUDESK_PORT" = var.crow_trudesk_port
    "TRUDESK_USERNAME" = var.crow_trudesk_username
    "TRUDESK_USER_ROLE_ID" =var.crow_trudesk_user_role_id
    "TRUDESK_DEFAULT_TICKET_TYPE" = var.crow_trudesk_default_ticket_type
    "TRUDESK_DEFAULT_TICKET_PRIORITY" =  var.crow_trudesk_default_ticket_priority
    NODE_ENV=var.crow_is_staging_or_prod
  }
}
#-------------------------------------------------------------------
# Deploys crow secret
resource "kubernetes_secret" "crow_secret" {
  metadata {
    namespace = var.crow_namespace
    name = "${var.crow_name}-secret"
    labels = {"app"= var.crow_name}
  }
  type = "Opaque"
  data = {
    "MONGO_PASSWORD" = var.crow_mongodb_password
    "REDIS_PASSWORD" =var.crow_redis_password
    "EXTERNAL_MONGO_PASSWORD"= var.crow_external_mongodb_password
    "VAULT_ROOT_TOKEN" = var.crow_vault_root
    "VAULT_TOKEN_PATH" = var.crow_vault_token_path
    "VAULT_KEYS_PATH" = var.crow_vault_keys_path
    "KEYCLOAK_CLIENT_ACCOUNT_ID" = var.crow_keycloak_client_account_id
    "KEYCLOAK_CLIENT_ID" = var.crow_keycloak_client_id
    "KEYCLOAK_LOCAL_CLIENT_ID" = var.crow_keycloak_local_client_id
    "KEYCLOAK_USERNAME" = var.crow_keycloak_username
    "KEYCLOAK_PASSWORD" = var.crow_keycloak_password
    "TRUDESK_PASSWORD" = var.crow_trudesk_password
    "SECURITY_KEY" =  var.crow_security_key
  }
}

#-------------------------------------------------------------------
#Deploys crow deployment
resource "kubernetes_deployment" "crow_deployment" {
  depends_on = [kubernetes_secret.crow_secret,kubernetes_config_map.crow_configmap]
  metadata {
    name = "${var.crow_name}-deployment"
    namespace = var.crow_namespace
    labels = {"app" = var.crow_name}
  }
  spec {
    replicas = var.crow_replica
    selector {match_labels = {"app" = var.crow_name}}
    template {
      metadata {
        labels = {"app"= var.crow_name}
      }
      spec {
        image_pull_secrets {
          name = var.crow_pull_secret
        }
        container {
          env {
            name = "EXTERNAL_MONGO_BASE_URI"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "EXTERNAL_MONGO_BASE_URI"
              }
            }
          }
          env {
            name = "EXTERNAL_MONGO_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "EXTERNAL_MONGO_PORT"
              }
            }
          }
          env {
            name = "EXTERNAL_MONGO_USERNAME"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "EXTERNAL_MONGO_USERNAME"
              }
            }
          }
          env {
            name = "EXTERNAL_MONGO_DB_NAME"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "EXTERNAL_MONGO_DB_NAME"
              }
            }
          }
          env {
            name = "EXTERNAL_MONGO_DEBUG"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "EXTERNAL_MONGO_DEBUG"
              }
            }
          }

          env {
            name = "DEFAULT_PLACE_ID"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "DEFAULT_PLACE_ID"
              }
            }
          }
          env {
            name = "DEFAULT_UTILITES_DEVICES_SERVICE_ID"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "DEFAULT_UTILITES_DEVICES_SERVICE_ID"
              }
            }
          }
          env {
            name = "DEFAULT_INTERCOM_SERVICE_ID"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "DEFAULT_INTERCOM_SERVICE_ID"
              }
            }
          }
          env {
            name = "DEFAULT_CAMERA_SERVICE_ID"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "DEFAULT_CAMERA_SERVICE_ID"
              }
            }
          }
          env {
            name = "MONGO_BASE_URI"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "MONGO_BASE_URI"
              }
            }
          }
          env {
            name = "MONGO_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "MONGO_PORT"
              }
            }
          }
          env {
            name = "MONGO_USERNAME"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "MONGO_USERNAME"
              }
            }
          }
          env {
            name = "MONGO_DB_NAME"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "MONGO_DB_NAME"
              }
            }
          }
          env {
            name = "MONGO_DEBUG"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "MONGO_DEBUG"
              }
            }
          }
          env {
            name = "REDIS_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "REDIS_HOST"
              }
            }
          }
          env {
            name = "VAULT_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "VAULT_HOST"
              }
            }
          }
          env {
            name = "VAULT_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "VAULT_PORT"
              }
            }
          }
          env {
            name = "REDIS_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "REDIS_PORT"
              }
            }
          }
          env {
            name = "KAFKA_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "KAFKA_HOST"
              }
            }
          }
          env {
            name = "KAFKA_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "KAFKA_PORT"
              }
            }
          }
          env {
            name = "KAFKA_CLIENT_ID"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "KAFKA_CLIENT_ID"
              }
            }
          }
          env {
            name = "KAFKA_GROUP_ID"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "KAFKA_GROUP_ID"
              }
            }
          }
          env {
            name = "KEYCLOAK_BASE_URI"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "KEYCLOAK_BASE_URI"
              }
            }
          }
          env {
            name = "KEYCLOAK_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "KEYCLOAK_PORT"
              }
            }
          }
          env {
            name = "KEYCLOAK_REALM"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "KEYCLOAK_REALM"
              }
            }
          }
          env {
            name = "KEYCLOAK_GRANT_TYPE"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "KEYCLOAK_GRANT_TYPE"
              }
            }
          }
          env {
            name = "NEXT_TRY_TIME"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "NEXT_TRY_TIME"
              }
            }
          }
          env {
            name = "OTP_EXPIRATION_TIME"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "OTP_EXPIRATION_TIME"
              }
            }
          }
          env {
            name = "BILLING_BASE_URL"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "BILLING_BASE_URL"
              }
            }
          }
          env {
            name = "TRUDESK_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "TRUDESK_HOST"
              }
            }
          }
          env {
            name = "TRUDESK_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "TRUDESK_PORT"
              }
            }
          }
          env {
            name = "TRUDESK_USERNAME"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "TRUDESK_USERNAME"
              }
            }
          }
          env {
            name = "TRUDESK_USER_ROLE_ID"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "TRUDESK_USER_ROLE_ID"
              }
            }
          }
          env {
            name = "TRUDESK_DEFAULT_TICKET_TYPE"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "TRUDESK_DEFAULT_TICKET_TYPE"
              }
            }
          }
          env {
            name = "TRUDESK_DEFAULT_TICKET_PRIORITY"
            value_from {
              config_map_key_ref {
                name = "${var.crow_name}-configmap"
                key = "TRUDESK_DEFAULT_TICKET_PRIORITY"
              }
            }
          }

          
          env {
            name = "MONGO_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "MONGO_PASSWORD"
              }
            }
          }
          env {
            name = "REDIS_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "REDIS_PASSWORD"
              }
            }
          }
          env {
            name = "EXTERNAL_MONGO_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "EXTERNAL_MONGO_PASSWORD"
              }
            }
          }
          env {
            name = "VAULT_ROOT_TOKEN"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "VAULT_ROOT_TOKEN"
              }
            }
          }
          env {
            name = "VAULT_TOKEN_PATH"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "VAULT_TOKEN_PATH"
              }
            }
          }
          env {
            name = "VAULT_KEYS_PATH"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "VAULT_KEYS_PATH"
              }
            }
          }
          env {
            name = "KEYCLOAK_CLIENT_ACCOUNT_ID"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "KEYCLOAK_CLIENT_ACCOUNT_ID"
              }
            }
          }
          env {
            name = "KEYCLOAK_CLIENT_ID"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "KEYCLOAK_CLIENT_ID"
              }
            }
          }
          env {
            name = "KEYCLOAK_LOCAL_CLIENT_ID"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "KEYCLOAK_LOCAL_CLIENT_ID"
              }
            }
          }
          env {
            name = "KEYCLOAK_USERNAME"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "KEYCLOAK_USERNAME"
              }
            }
          }
          env {
            name = "KEYCLOAK_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "KEYCLOAK_PASSWORD"
              }
            }
          }
          env {
            name = "TRUDESK_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "TRUDESK_PASSWORD"
              }
            }
          }
          env {
            name = "SECURITY_KEY"
            value_from {
              secret_key_ref {
                name = "${var.crow_name}-secret"
                key = "SECURITY_KEY"
              }
            }
          }


          image = "${var.crow_image_address}:${var.crow_image_tag}"
          name = var.crow_name
        }
      }
    }
  }
}