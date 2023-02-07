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
# defines the namespace where Pyrador Should be created
variable "pyrador_namespace" {
  type = string
  default = "default"
}
#-------------------------------------------------------------------------------
# defines the node ip address
variable "pyrador_node_ip" {
  type = string
  default = "172.18.0.3"
}
#-------------------------------------------------------------------------------
# defines a name for pyrador service
variable "pyrador_name" {
  type = string
  default = "pyrador"
}
#-------------------------------------------------------------------------------
# defines the number of Pyrador reploicas
variable "pyrador_replica" {
  type = string
  default = "1"
}
#-------------------------------------------------------------------------------
# defines image pull secret
variable "pyrador_pull_secret" {
  type = string
  default = "regcred"
}
#-------------------------------------------------------------------------------
# defines pyrador image address
variable "pyrador_image_address" {
  type = string
  default = "imageAddress"
}
#-------------------------------------------------------------------------------
# defines pyrador image tag
variable "pyrador_image_tag" {
  type = string
  default = "imageTag"
}
#==============================================================================#
#                                                                              #
#                             Configmap Variable Group                         #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#Defines the app port for Pyrador
variable "pyrador_app_port" {
  type = number
  default = 5000
}
#-------------------------------------------------------------------------------
#Defines redis host address
variable "pyrador_redis_host" {
  type = string
  default = "redis-master"
}
#-------------------------------------------------------------------------------
#Defines redis port number
variable "pyrador_redis_port" {
  type = number
  default = 6378
}
#-------------------------------------------------------------------------------
#Defines kafka host
variable "pyrador_kafka_host" {
  type = string
  default = "kafka"
}
#-------------------------------------------------------------------------------
#Defines kafka port number
variable "pyrador_kafka_port" {
  type = number
  default = 9092
}
#-------------------------------------------------------------------------------
#Defines kafka klient id
variable "pyrador_kafka_client_id" {
  type = string
  default = "pyrador"
}
#-------------------------------------------------------------------------------
#Defines kafka groupID
variable "pyrador_kafka_group_id" {
  type = string
  default = "pyrador"
}
#==============================================================================#
#                                                                              #
#                             Secrets Variable Group                           #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#Defines pyrador auth key (in keycloak)
variable "pyrador_keycloak_auth_key" {
  type = string
  default = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAljPpshPcrypFRkhxMZraXgbNmB0q3XQkcCcrWy3L+C1J2YMprp9a5UOi/Evl59Key2hVbYO76y/TipodcsSzAA1OhHJm2PFacdN9yia/HoW8VJ4u7tm62cLTrbmiPsjjEUfsqShPdYby01549iLlfb+oXX2DfC9JkhekX6nCEO/slPZ7TKDs30Gwd5BlqaaKFgpN2BkMipvrTfMhiQNWtV8NG7ZcJ704JcscVzAhaeXRsA9S1TcHstTjUhW/bZyyhPwO5qzHNh9sIr0jc/IPy7QUHEGH834CTckw+70lhtiIrQxIFa1JBxyJzdrRi1LiWIC2FBnAHyfauUgddxIrRwIDAQAB"
}
#-------------------------------------------------------------------------------
#Defines redis password
variable "pyrador_redis_password" {
  type = string
  default = "PoI456ZxC"
}


