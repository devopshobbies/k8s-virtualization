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
# defines the namespace where iguana Should be created
variable "iguana_namespace" {
  type = string
  default = "default"
}
#-------------------------------------------------------------------------------
# defines a name for iguana service
variable "iguana_name" {
  type = string
  default = "iguana"
}
#-------------------------------------------------------------------------------
# defines the node ip address
variable "iguana_node_ip" {
  type = string
  default = "172.18.0.4"
}
#-------------------------------------------------------------------------------
# defines the number of iguana reploicas
variable "iguana_replica" {
  type = string
  default = "1"
}
#-------------------------------------------------------------------------------
# defines image pull secret
variable "iguana_pull_secret" {
  type = string
  default = "regcred"
}
#-------------------------------------------------------------------------------
# defines iguana image address
variable "iguana_image_address" {
  type = string
  default = "imageAddress"
}
#-------------------------------------------------------------------------------
# defines iguana image tag
variable "iguana_image_tag" {
  type = string
  default = "imageTag"
}
#==============================================================================#
#                                                                              #
#                             Configmap Variable Group                         #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#Defines the app port for iguana
variable "iguana_app_port" {
  type = number
  default = 2000
}
#-------------------------------------------------------------------------------
#Defines redis host address
variable "iguana_redis_host" {
  type = string
  default = "redis-master"
}
#-------------------------------------------------------------------------------
#Defines redis port number
variable "iguana_redis_port" {
  type = number
  default = 6378
}
#-------------------------------------------------------------------------------
#Defines S3 public url
variable "iguana_fs_public_url" {
  type = string
  default = "bucket.dev.dipal.ru"
}
#-------------------------------------------------------------------------------
# Defines S3 bucket host
variable "iguana_fs_host" {
  type = string
  default = "minio"
}
#-------------------------------------------------------------------------------
# Defines S3 bucket name
variable "iguana_fs_bucket_name" {
  type = string
  default = "dipal-users-pro"
}
#-------------------------------------------------------------------------------
# Defines S3 port
variable "iguana_fs_bucket_port" {
  type = string
  default = "9001"
}
#-------------------------------------------------------------------------------
#Defines kafka host
variable "iguana_kafka_host" {
  type = string
  default = "kafka"
}
#-------------------------------------------------------------------------------
#Defines kafka port number
variable "iguana_kafka_port" {
  type = number
  default = 9092
}
#-------------------------------------------------------------------------------
#Defines kafka klient id
variable "iguana_kafka_client_id" {
  type = string
  default = "iguana"
}
#-------------------------------------------------------------------------------
#Defines kafka groupID
variable "iguana_kafka_group_id" {
  type = string
  default = "iguana"
}
#-------------------------------------------------------------------------------
#Defines mongo debug
variable "iguana_mongo_debug" {
  type = string
  default = "true"
}
#-------------------------------------------------------------------------------
#Defines db  address
variable "iguana_db_address" {
  type = string
  default = "dipal-mongodb-service"
}
#-------------------------------------------------------------------------------
#Defines db  port
variable "iguana_db_port" {
  type = string
  default = "27017"
}
#-------------------------------------------------------------------------------
#Defines db  username
variable "iguana_db_username" {
  type = string
  default = "root"
}
#-------------------------------------------------------------------------------
#Defines db  name
variable "iguana_db_name" {
  type = string
  default = "iguana"
}
#-------------------------------------------------------------------------------
#Defines db  password
variable "iguana_db_password" {
  type = string
  default = "PoI456ZxC"
}
#-------------------------------------------------------------------------------
#Defines db  debug
variable "iguana_db_debug" {
  type = string
  default = "false"
}

#==============================================================================#
#                                                                              #
#                             Secrets Variable Group                           #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#Defines iguana auth key (in keycloak)
variable "iguana_keycloak_auth_key" {
  type = string
  default = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAljPpshPcrypFRkhxMZraXgbNmB0q3XQkcCcrWy3L+C1J2YMprp9a5UOi/Evl59Key2hVbYO76y/TipodcsSzAA1OhHJm2PFacdN9yia/HoW8VJ4u7tm62cLTrbmiPsjjEUfsqShPdYby01549iLlfb+oXX2DfC9JkhekX6nCEO/slPZ7TKDs30Gwd5BlqaaKFgpN2BkMipvrTfMhiQNWtV8NG7ZcJ704JcscVzAhaeXRsA9S1TcHstTjUhW/bZyyhPwO5qzHNh9sIr0jc/IPy7QUHEGH834CTckw+70lhtiIrQxIFa1JBxyJzdrRi1LiWIC2FBnAHyfauUgddxIrRwIDAQAB"
}
#-------------------------------------------------------------------------------
#Defines redis password
variable "iguana_redis_password" {
  type = string
  default = "PoI456ZxC"
}
#-------------------------------------------------------------------------------
#Defines S3 access key
variable "iguana_S3_access_key" {
  type = string
  default = "admin"
}
#-------------------------------------------------------------------------------
#Defines S3 access key
variable "iguana_S3_secret" {
  type = string
  default = "XIdX48556C"
}

