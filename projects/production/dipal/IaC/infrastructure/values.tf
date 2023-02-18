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
#--------------------------------------------------------------------------------
# Dfines dipal project namespace
variable "dipal_namespace" {
  type = string
  default = "dipal"
}
#==============================================================================#
#                                                                              #
#                             Dipal Group                                      #
#                                                                              #
#==============================================================================#
#--------------------------------------------------------------------------------
# Defines redis node selection
variable "dipal_redis_node" {
  type = string
  default = "projects-master"
}
#--------------------------------------------------------------------------------
# Defines the host machine user
variable "dipal_redis_host_ssh_user" {
  type = string
  default = "ubuntu"
}
#--------------------------------------------------------------------------------
# defines the address of the host ssh-key file
variable "dipal_redis_host_ssh_key_address" {
  type = string
  default = "/home/moeid/.ssh/vms_rsa"
}
#--------------------------------------------------------------------------------
# defines the host address
variable "dipal_redis_host_ssh_address" {
  type = string
  default = "10.244.217.5"
}
#--------------------------------------------------------------------------------
# defines the host sudo password
variable "dipal_redis_host_sudo_password" {
  type = string
  default = "PoI456ZxC"
}
#--------------------------------------------------------------------------------
# defines the host disk path
variable "dipal_redis_host_disk_path" {
  type = string
  default = "/mnt"
}
variable "dipal_redis_helm_release_name" {
  type = string
  default = "dipal-redis"
}

variable "dipal_redis_helm_repository" {
  type = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "dipal_redis_helm_chart_name" {
  type = string
  default = "redis"
}

variable "dipal_redis_helm_namespace" {
  type = string
  default = "dipal"
}

variable "dipal_redis_helm_master_storage" {
  type = string
  default = "8Gi"
}

variable "dipal_redis_helm_replicas_storage" {
  type = string
  default = "8Gi"
}

#==============================================================================#
#                                                                              #
#                            Dipal mqtt Group                                  #
#                                                                              #
#==============================================================================#
#--------------------------------------------------------------------------------
# Defines mqtt node selection
variable "dipal_mqtt_node" {
  type = string
  default = "projects-master"
}
#--------------------------------------------------------------------------------
# Defines the host machine user
variable "dipal_mqtt_host_ssh_user" {
  type = string
  default = "ubuntu"
}
#--------------------------------------------------------------------------------
# defines the address of the host ssh-key file
variable "dipal_mqtt_host_ssh_key_address" {
  type = string
  default = "/home/moeid/.ssh/vms_rsa"
}
#--------------------------------------------------------------------------------
# defines the host address
variable "dipal_mqtt_host_ssh_address" {
  type = string
  default = "10.244.217.5"
}
#--------------------------------------------------------------------------------
# defines the host sudo password
variable "dipal_mqtt_host_sudo_password" {
  type = string
  default = "PoI456ZxC"
}
#--------------------------------------------------------------------------------
# defines the host disk path
variable "dipal_mqtt_host_disk_path" {
  type = string
  default = "/mnt"
}
variable "dipal_mqtt_helm_release_name" {
  type = string
  default = "dipal-mqtt"
}

variable "dipal_mqtt_helm_repository" {
  type = string
  default = "https://k8s-at-home.com/charts/"
}

variable "dipal_mqtt_helm_chart_name" {
  type = string
  default = "mosquitto"
}

variable "dipal_mqtt_helm_namespace" {
  type = string
  default = "dipal"
}
#==============================================================================#
#                                                                              #
#                             Dipal Kafka Group                                #
#                                                                              #
#==============================================================================#
#--------------------------------------------------------------------------------
# Defines kafka node selection
variable "dipal_kafka_node" {
  type = string
  default = "projects-master"
}
#--------------------------------------------------------------------------------
# Defines the host machine user
variable "dipal_kafka_host_ssh_user" {
  type = string
  default = "ubuntu"
}
#--------------------------------------------------------------------------------
# defines the address of the host ssh-key file
variable "dipal_kafka_host_ssh_key_address" {
  type = string
  default = "/home/moeid/.ssh/vms_rsa"
}
#--------------------------------------------------------------------------------
# defines the host address
variable "dipal_kafka_host_ssh_address" {
  type = string
  default = "10.244.217.5"
}
#--------------------------------------------------------------------------------
# defines the host sudo password
variable "dipal_kafka_host_sudo_password" {
  type = string
  default = "PoI456ZxC"
}
#--------------------------------------------------------------------------------
# defines the host disk path
variable "dipal_kafka_host_disk_path" {
  type = string
  default = "/mnt"
}
variable "dipal_kafka_helm_release_name" {
  type = string
  default = "dipal-kafka"
}

variable "dipal_kafka_helm_repository" {
  type = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "dipal_kafka_helm_chart_name" {
  type = string
  default = "kafka"
}

variable "dipal_kafka_helm_namespace" {
  type = string
  default = "dipal"
}
variable "dipal_kafka_helm_storage" {
  type = string
  default = "8Gi"
}
#==============================================================================#
#                                                                              #
#                             Dipal mongodb Group                              #
#                                                                              #
#==============================================================================#
#--------------------------------------------------------------------------------
# Defines kafka node selection
variable "dipal_mongodb_node" {
  type = string
  default = "projects-master"
}
#--------------------------------------------------------------------------------
# Defines the host machine user
variable "dipal_mongodb_host_ssh_user" {
  type = string
  default = "ubuntu"
}
#--------------------------------------------------------------------------------
# defines the address of the host ssh-key file
variable "dipal_mongodb_host_ssh_key_address" {
  type = string
  default = "/home/moeid/.ssh/vms_rsa"
}
#--------------------------------------------------------------------------------
# defines the host address
variable "dipal_mongodb_host_ssh_address" {
  type = string
  default = "10.244.217.5"
}
#--------------------------------------------------------------------------------
# defines the host sudo password
variable "dipal_mongodb_host_sudo_password" {
  type = string
  default = "PoI456ZxC"
}
#--------------------------------------------------------------------------------
# defines the host disk path
variable "dipal_mongodb_host_disk_path" {
  type = string
  default = "/mnt"
}
variable "dipal_mongodb_name" {
  type = string
  default = "dipalmongodb"
}
variable "dipal_mongodb_username" {
  type = string
  default = "root"
}

variable "dipal_mongodb_password" {
  type = string
  default = "PoI456ZxC"
}

variable "dipal_mongodb_service_port" {
  type = string
  default = 27017
}

variable "dipal_mongodb_pv1_size" {
  type = string
  default = "5Gi"
}

variable "dipal_mongodb_pv2_size" {
  type = string
  default = "10Gi"
}
#==============================================================================#
#                                                                              #
#                             Dipal trudesk Group                              #
#                                                                              #
#==============================================================================#

#==============================================================================#
#                                                                              #
#                             Docker registry Group                            #
#                                                                              #
#==============================================================================#
#--------------------------------------------------------------------------------
# defines docker registry address and credentials
variable "docker-username" {
  type = string
  default= "skyfarm"
}
variable "docker-password" {
  type = string
  default= "PoI456ZxC"
}
variable "docker-server" {
  type = string
  default= "10.244.217.7:32488"
}
