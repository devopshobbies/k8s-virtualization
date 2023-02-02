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
# defines the namespace where crow Should be created
variable "crow_namespace" {
  type = string
  default = "default"
}
#-------------------------------------------------------------------------------
# defines a name for crow service
variable "crow_name" {
  type = string
  default = "crow"
}
#-------------------------------------------------------------------------------
# defines the number of crow reploicas
variable "crow_replica" {
  type = string
  default = "1"
}
#-------------------------------------------------------------------------------
# defines image pull secret
variable "crow_pull_secret" {
  type = string
  default = "regcred"
}
#-------------------------------------------------------------------------------
# defines crow image address
variable "crow_image_address" {
  type = string
  default = "imageAddress"
}
#-------------------------------------------------------------------------------
# defines crow image tag
variable "crow_image_tag" {
  type = string
  default = "imageTag"
}
#==============================================================================#
#                                                                              #
#                             Configmap Variable Group                         #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#Defines external mongodb base url
variable "crow_external_mongodb_base_url" {
  type = string
  default = "mongodb"
}
#-------------------------------------------------------------------------------
#Defines external mongodb port
variable "crow_external_mongodb_port" {
  type = string
  default = "27017"
}
#-------------------------------------------------------------------------------
#Defines external mongodb username
variable "crow_external_mongodb_username" {
  type = string
  default = "root"
}
#-------------------------------------------------------------------------------
#Defines external mongodb db name
variable "crow_external_mongodb_db_name" {
  type = string
  default = "external_db"
}
#-------------------------------------------------------------------------------
#Defines external mongodb debug
variable "crow_external_mongodb_debug" {
  type = string
  default = "false"
}
#-------------------------------------------------------------------------------
#Defines default place id
variable "crow_default_place_id" {
  type = string
  default = "631749ea24fb4fc46bbe08e6"
}
#-------------------------------------------------------------------------------
#Defines default utilities servie id
variable "crow_default_utilities_service_id" {
  type = string
  default = "631749ee24fb4f3828be08f0"
}
#-------------------------------------------------------------------------------
#Defines default intercom service id
variable "crow_default_intercom_service_id" {
  type = string
  default = "631749ee24fb4f6c11be08f4"
}
#-------------------------------------------------------------------------------
#Defines default camera service id
variable "crow_default_camera_service_id" {
  type = string
  default = "631749ee24fb4f8c9ebe08f6"
}
#-------------------------------------------------------------------------------
#Defines mongodb base url
variable "crow_mongodb_base_url" {
  type = string
  default = "mongodb"
}
#-------------------------------------------------------------------------------
#Defines mongodb port
variable "crow_mongodb_port" {
  type = string
  default = "27017"
}
#-------------------------------------------------------------------------------
#Defines mongodb username
variable "crow_mongodb_username" {
  type = string
  default = "root"
}
#-------------------------------------------------------------------------------
#Defines mongodb dbname
variable "crow_mongodb_dbname" {
  type = string
  default = "comfortech"
}
#-------------------------------------------------------------------------------
#Defines mongodb debug
variable "crow_mongodb_debug" {
  type = string
  default = "true"
}
#-------------------------------------------------------------------------------
#Defines redis host
variable "crow_redis_host" {
  type = string
  default = "redis-master"
}
#-------------------------------------------------------------------------------
#Defines vault host
variable "crow_vault_host" {
  type = string
  default = "vault"
}
#-------------------------------------------------------------------------------
#Defines vault port
variable "crow_vault_port" {
  type = string
  default = "8200"
}
#-------------------------------------------------------------------------------
#Defines redis port
variable "crow_redis_port" {
  type = string
  default = "6378"
}
#-------------------------------------------------------------------------------
#Defines kafka host
variable "crow_kafka_host" {
  type = string
  default = "kafka"
}
#-------------------------------------------------------------------------------
#Defines kafka port
variable "crow_kafka_port" {
  type = string
  default = "9092"
}
#-------------------------------------------------------------------------------
#Defines kafka client id
variable "crow_kafka_client_id" {
  type = string
  default = "comfortech-dataland"
}
#-------------------------------------------------------------------------------
#Defines kafka group id
variable "crow_kafka_group_id" {
  type = string
  default = "comfortech-dataland"
}
#-------------------------------------------------------------------------------
#Defines keycloak base url
variable "crow_keycloak_base_url" {
  type = string
  default = "http://keycloak"
}
#-------------------------------------------------------------------------------
#Defines keycloak port
variable "crow_keycloak_port" {
  type = string
  default = "8080"
}
#-------------------------------------------------------------------------------
#Defines keycloak relam
variable "crow_keycloak_realm" {
  type = string
  default = "comfortech_staging"
}
#-------------------------------------------------------------------------------
#Defines keycloak grant type
variable "crow_keycloak_grant_type" {
  type = string
  default = "password"
}
#-------------------------------------------------------------------------------
#Defines next try time
variable "crow_next_try_time" {
  type = string
  default = "60000"
}
#-------------------------------------------------------------------------------
#Defines otp expiration time
variable "crow_expiration_time" {
  type = string
  default = "60000"
}
#-------------------------------------------------------------------------------
#Defines billing base url
variable "crow_billing_base_url" {
  type = string
  default = "https://api.uut-telecom.ru/api/v1.0"
}
#-------------------------------------------------------------------------------
#Defines trudesk host
variable "crow_trudesk_host" {
  type = string
  default = "trudesk"
}
#-------------------------------------------------------------------------------
#Defines trudesk port
variable "crow_trudesk_port" {
  type = string
  default = "8118"
}
#-------------------------------------------------------------------------------
#Defines trudesk port
variable "crow_trudesk_username" {
  type = string
  default = "admin"
}
#-------------------------------------------------------------------------------
#Defines trudesk user role id
variable "crow_trudesk_user_role_id" {
  type = string
  default = "63973275983167ba4b2b405a"
}
#-------------------------------------------------------------------------------
#Defines trudesk default ticket type
variable "crow_trudesk_default_ticket_type" {
  type = string
  default = "63973275983167ba4b2b4054"
}
#-------------------------------------------------------------------------------
#Defines trudesk default ticket priority
variable "crow_trudesk_default_ticket_priority" {
  type = string
  default = "6397327ec5a5299a427550f1"
}
#==============================================================================#
#                                                                              #
#                             Secrets Variable Group                           #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#-------------------------------------------------------------------------------
#Defines mongodb password
variable "crow_mongodb_password" {
  type = string
  default = "PoI456ZxC"
}
#-------------------------------------------------------------------------------
#Defines external mongodb password
variable "crow_external_mongodb_password" {
  type = string
  default = "PoI456ZxC"
}
#-------------------------------------------------------------------------------
#Defines redis password
variable "crow_redis_password" {
  type = string
  default = "PoI456ZxC"
}
#-------------------------------------------------------------------------------
#Defines vault root token
variable "crow_vault_root" {
  type = string
  default = "bm90aGluZw=="
}
#-------------------------------------------------------------------------------
#Defines vault token path
variable "crow_vault_token_path" {
  type = string
  default = "dmF1bHQvZGF0YS92YXVsdF9yb290X3Rva2VuLmtleQ=="
}
#-------------------------------------------------------------------------------
#Defines vault keys path
variable "crow_vault_keys_path" {
  type = string
  default = "dmF1bHQvZGF0YS9zZWFsaW5nX2tleXMua2V5"
}
#-------------------------------------------------------------------------------
#Defines keycloak client account id
variable "crow_keycloak_client_account_id" {
  type = string
  default = "0d68a12c-7e3e-4995-8604-bc7eb3327fd4"
}
#-------------------------------------------------------------------------------
#Defines keycloak client id
variable "crow_keycloak_client_id" {
  type = string
  default = "admin-cli"
}
#-------------------------------------------------------------------------------
#Defines keycloak local client id
variable "crow_keycloak_local_client_id" {
  type = string
  default = "comfortech"
}
#-------------------------------------------------------------------------------
#Defines keycloak username
variable "crow_keycloak_username" {
  type = string
  default = "admin"
}
#-------------------------------------------------------------------------------
#Defines keycloak password
variable "crow_keycloak_password" {
  type = string
  default = "PoI456ZxC"
}
#-------------------------------------------------------------------------------
#Defines trudesk password
variable "crow_trudesk_password" {
  type = string
  default = "PoI456ZxC"
}
#-------------------------------------------------------------------------------
#Defines security key
variable "crow_security_key" {
  type = string
  default = "971ebba1602e952acd7a549ca3826e41"
}

