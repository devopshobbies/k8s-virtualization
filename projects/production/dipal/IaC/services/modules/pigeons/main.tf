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
#Deploys pigeons configmap
resource "kubernetes_config_map" "pigeons_configmap" {
  metadata {
    namespace = var.pigeons_namespace
    name = "${var.pigeons_name}-configmap"
    labels = {"app"= var.pigeons_name}
  }
  data = {
    "APP_PORT"= var.pigeons_app_port
    "REDIS_HOST"= var.pigeons_redis_host
    "REDIS_PORT"= var.pigeons_redis_port
    "KAFKA_HOST"= var.pigeons_kafka_host
    "KAFKA_PORT"= var.pigeons_kafka_port
    "KAFKA_CLIENT_ID"= var.pigeons_kafka_client_id
    "KAFKA_GROUP_ID"= var.pigeons_kafka_group_id
    "NODE_TLS_REJECT_UNAUTHORIZED"= var.pigeons_tls_reject
    "DB_IP"= var.pigeons_db_address
    "DB_PORT"= var.pigeons_db_port
    "MONGO_USERNAME"= var.pigeons_db_username
    "MONGO_DB_NAME"= var.pigeons_db_name

  }
}
#-------------------------------------------------------------------
# Deploys Pyrador secret
resource "kubernetes_secret" "pyrador_secret" {
  metadata {
    namespace = var.pigeons_namespace
    name = "${var.pigeons_name}-secret"
    labels = {"app"= var.pigeons_name}
  }
  type = "Opaque"
  data = {
    "REDIS_PASSWORD"= var.pigeons_redis_password,
    "EMAIL_FROM"= var.pigeons_email_from,
    "EMAIL_USER"= var.pigeons_email_user,
    "EMAIL_PASS"= var.pigeons_email_pass,
    "EMAIL_HOST"= var.pigeons_email_host,
    "EMAIL_PORT"= var.pigeons_email_port,
    "SMS_BASE_URL"= var.pigeons_sms_url,
    "SMS_PASS"= var.pigeons_sms_pass,
    "SMS_USER"= var.pigeons_sms_user,
    "SMS_SENDER"= var.pigeons_sms_sender,
    "FIREBASE_ACCOUNT_TYPE"= var.pigeons_firebase_account_type,
    "FIREBASE_ACCOUNT_PROJECT_ID"= var.pigeons_firebase_project_id,
    "FIREBASE_ACCOUNT_PRIVATE_KEY_ID"= var.pigeons_firebase_private_key_id,
    "FIREBASE_ACCOUNT_PRIVATE_KEY"= var.pigeons_firebase_private_key
    "FIREBASE_ACCOUNT_CLIENT_EMAIL"= var.pigeons_firebase_account_client_email,
    "FIREBASE_ACCOUNT_CLIENT_ID"= var.pigeons_firebase_account_client_id,
    "FIREBASE_ACCOUNT_AUTH_URI"= var.pigeons_firebase_account_auth_url,
    "FIREBASE_ACCOUNT_TOKEN_URI"= var.pigeons_firebase_account_token_uri,
    "FIREBASE_ACCOUNT_AUTH_PROVIDER_X509_CERT_ULL"= var.pigeons_firebase_account_auth_provider_x509_cert_url,
    "FIREBASE_ACCOUNT_CLIENT_X509_CERT_URL"= var.pigeons_firebase_account_auth_client_x509_cert_url
    "FIREBASE_DEFAULT_MESSAGE_TITLE"= var.pigeons_firebase_default_message_title,
    "FIREBASE_DEFAULT_MESSAGE_BODY"= var.pigeons_firebase_default_message_body,
    "FIREBASE_DEFAULT_MESSAGE_IMAGE_URL"= var.pigeons_firebase_default_message_image_uri
    "FIREBASE_REGISTRATION_TOKEN"= var.pigeons_firebase_registration_token
    "MONGO_PASSWORD"= var.pigeons_db_password
  }
}
#-------------------------------------------------------------------
#Deploys pigeons deployment
resource "kubernetes_deployment" "pigeons_deployment" {
  depends_on = [kubernetes_secret.pyrador_secret,kubernetes_config_map.pigeons_configmap]
  metadata {
    name = "${var.pigeons_name}-deployment"
    namespace = var.pigeons_namespace
    labels = {"app" = var.pigeons_name}
  }
  spec {
    replicas = var.pigeons_replica
    selector {match_labels = {"app" = var.pigeons_name}}
    template {
      metadata {
        labels = {"app"= var.pigeons_name}
      }
      spec {
        image_pull_secrets {
          name = var.pigeons_pull_secret
        }
        container {
          env {
            name = "REDIS_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "REDIS_HOST"
              }
            }
          }
          env {
            name = "REDIS_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "REDIS_PORT"
              }
            }
          }
          env {
            name = "KAFKA_HOST"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "KAFKA_HOST"
              }
            }
          }
          env {
            name = "KAFKA_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "KAFKA_PORT"
              }
            }
          }
          env {
            name = "KAFKA_CLIENT_ID"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "KAFKA_CLIENT_ID"
              }
            }
          }
          env {
            name = "NODE_TLS_REJECT_UNAUTHORIZED"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "NODE_TLS_REJECT_UNAUTHORIZED"
              }
            }
          }
          env {
            name = "KAFKA_GROUP_ID"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "KAFKA_GROUP_ID"
              }
            }
          }
          env {
            name = "DB_IP"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "DB_IP"
              }
            }
          }
          env {
            name = "DB_PORT"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "DB_PORT"
              }
            }
          }
          env {
            name = "MONGO_USERNAME"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "MONGO_USERNAME"
              }
            }
          }
          env {
            name = "MONGO_DB_NAME"
            value_from {
              config_map_key_ref {
                name = "${var.pigeons_name}-configmap"
                key = "MONGO_DB_NAME"
              }
            }
          }
          env {
            name = "REDIS_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "REDIS_PASSWORD"
              }
            }
          }
          env {
            name = "EMAIL_FROM"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "EMAIL_FROM"
              }
            }
          }
          env {
            name = "EMAIL_USER"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "EMAIL_USER"
              }
            }
          }
          env {
            name = "EMAIL_PASS"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "EMAIL_PASS"
              }
            }
          }
          env {
            name = "EMAIL_HOST"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "EMAIL_HOST"
              }
            }
          }
          env {
            name = "EMAIL_PORT"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "EMAIL_PORT"
              }
            }
          }
          env {
            name = "SMS_BASE_URL"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "SMS_BASE_URL"
              }
            }
          }
          env {
            name = "SMS_PASS"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "SMS_PASS"
              }
            }
          }
          env {
            name = "SMS_USER"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "SMS_USER"
              }
            }
          }
          env {
            name = "MONGO_PASSWORD"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "MONGO_PASSWORD"
              }
            }
          }
          env {
            name = "SMS_SENDER"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "SMS_SENDER"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_TYPE"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_TYPE"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_PROJECT_ID"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_PROJECT_ID"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_PRIVATE_KEY_ID"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_PRIVATE_KEY_ID"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_PRIVATE_KEY"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_PRIVATE_KEY"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_CLIENT_EMAIL"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_CLIENT_EMAIL"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_CLIENT_ID"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_CLIENT_ID"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_AUTH_URI"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_AUTH_URI"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_TOKEN_URI"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_TOKEN_URI"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_AUTH_PROVIDER_X509_CERT_ULL"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_AUTH_PROVIDER_X509_CERT_ULL"
              }
            }
          }
          env {
            name = "FIREBASE_ACCOUNT_CLIENT_X509_CERT_URL"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_ACCOUNT_CLIENT_X509_CERT_URL"
              }
            }
          }
          env {
            name = "FIREBASE_DEFAULT_MESSAGE_TITLE"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_DEFAULT_MESSAGE_TITLE"
              }
            }
          }
          env {
            name = "FIREBASE_DEFAULT_MESSAGE_BODY"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_DEFAULT_MESSAGE_BODY"
              }
            }
          }
          env {
            name = "FIREBASE_DEFAULT_MESSAGE_IMAGE_URL"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_DEFAULT_MESSAGE_IMAGE_URL"
              }
            }
          }
          env {
            name = "FIREBASE_REGISTRATION_TOKEN"
            value_from {
              secret_key_ref {
                name = "${var.pigeons_name}-secret"
                key = "FIREBASE_REGISTRATION_TOKEN"
              }
            }
          }
          image = "${var.pigeons_image_address}:${var.pigeons_image_tag}"
          name = var.pigeons_name
        }
      }
    }
  }
}
