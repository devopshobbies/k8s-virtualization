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
# defines the namespace where goose Should be created
variable "goose_namespace" {
  type = string
  default = "default"
}
#-------------------------------------------------------------------------------
# defines a name for goose service
variable "goose_name" {
  type = string
  default = "goose"
}
#-------------------------------------------------------------------------------
# defines the number of goose reploicas
variable "goose_replica" {
  type = string
  default = "1"
}
#-------------------------------------------------------------------------------
# defines image pull secret
variable "goose_pull_secret" {
  type = string
  default = "regcred"
}
#-------------------------------------------------------------------------------
# defines goose image address
variable "goose_image_address" {
  type = string
  default = "imageAddress"
}
#-------------------------------------------------------------------------------
# defines goose image tag
variable "goose_image_tag" {
  type = string
  default = "imageTag"
}
#==============================================================================#
#                                                                              #
#                             Configmap Variable Group                         #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#Defines the app port for goose
variable "goose_app_port" {
  type = number
  default = 5000
}
#-------------------------------------------------------------------------------
#Defines redis host address
variable "goose_redis_host" {
  type = string
  default = "redis-master"
}
#-------------------------------------------------------------------------------
#Defines redis port number
variable "goose_redis_port" {
  type = number
  default = 6378
}
#-------------------------------------------------------------------------------
#Defines kafka host
variable "goose_kafka_host" {
  type = string
  default = "kafka"
}
#-------------------------------------------------------------------------------
#Defines kafka port number
variable "goose_kafka_port" {
  type = number
  default = 9092
}
#-------------------------------------------------------------------------------
#Defines kafka klient id
variable "goose_kafka_client_id" {
  type = string
  default = "goose-consumer"
}
#-------------------------------------------------------------------------------
#Defines kafka groupID
variable "goose_kafka_group_id" {
  type = string
  default = "goose-consumer"
}

#==============================================================================#
#                                                                              #
#                             Secrets Variable Group                           #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
#Defines redis password
variable "goose_redis_password" {
  type = string
  default = "PoI456ZxC"
}