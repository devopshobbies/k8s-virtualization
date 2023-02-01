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
#==============================================================================#
#                                                                              #
#                             harbor Group                                    #
#                                                                              #
#==============================================================================#
# Defines the host machine user
variable "harbor_host_ssh_user" {
  type = string
  default = "ubuntu"
}
#--------------------------------------------------------------------------------
# defines the address of the host ssh-key file
variable "harbor_host_ssh_key_address" {
  type = string
  default = "/home/moeid/.ssh/vms_rsa"
}
#--------------------------------------------------------------------------------
# defines the host address
variable "harbor_host_ssh_address" {
  type = string
  default = "10.244.217.7"
}
#--------------------------------------------------------------------------------
# defines the host sudo password
variable "harbor_host_sudo_password" {
  type = string
  default = "PoI456ZxC"
}
#--------------------------------------------------------------------------------
# defines the host disk path
variable "harbor_host_disk_path" {
  type = string
  default = "/mnt"
}
# defines the namespace where we want to deploy harbor
variable "harbor_helm_release_namespace" {
  type = string
  default = "default"
}
variable "harbor_helm_release_name" {
  type = string
  default = "system-harbor"
}
#--------------------------------------------------------------------------------
# Defines the repository name for harbor helm deploy
variable "harbor_helm_repo" {
  type = string
  default = "bitnami"
}
#--------------------------------------------------------------------------------
# Defines the chart name for harbor helm deploy
variable "harbor_helm_chart_name" {
  type = string
  default = "harbor"
}
#--------------------------------------------------------------------------------
# Defines the chart version for prometheus helm deploy
variable "harbor_helm_chart_version" {
  type = string
  default = "16.3.1"
}
#--------------------------------------------------------------------------------
# Defines the chart values file path for harbor helm deploy
variable "harbor_helm_chart_values_file_path" {
  type = string
  default = "harbor/values.yml"
}
#--------------------------------------------------------------------------------
# Defines the storage for harbor postgress persistence volume
variable "harbor_helm_postgress_storage" {
  type = string
  default = "8Gi"
}
#--------------------------------------------------------------------------------
# Defines the storage for harbor trivy persistence volume
variable "harbor_helm_trivy_storage" {
  type = string
  default = "5Gi"
}
#--------------------------------------------------------------------------------
# Defines the storage for harbor chart persistence volume
variable "harbor_helm_chart_storage" {
  type = string
  default = "10Gi"
}
#--------------------------------------------------------------------------------
# Defines the storage for harbor jobservice persistence volume
variable "harbor_helm_jobservice_storage" {
  type = string
  default = "1Gi"
}
#--------------------------------------------------------------------------------
# Defines the storage for harbor jobservice persistence volume
variable "harbor_helm_scandata_storage" {
  type = string
  default = "1Gi"
}
#--------------------------------------------------------------------------------
# Defines the storage for harbor jobservice persistence volume
variable "harbor_helm_registry_storage" {
  type = string
  default = "50Gi"
}
#--------------------------------------------------------------------------------
# Defines the storage for harbor redis persistence volume
variable "harbor_helm_redis_storage" {
  type = string
  default = "8Gi"
}
#==============================================================================#
#                                                                              #
#                             Prometheus group var                             #
#                                                                              #
#==============================================================================#
# Defines a release name for prometheus
variable "prometheus_helm_release_name"{
  type= string
  default = "system-prometheus"
}
#--------------------------------------------------------------------------------
# Defines the repository name for prometheus helm deploy
variable "prometheus_helm_repo" {
  type = string
  default = "bitnami"
}
#--------------------------------------------------------------------------------
# Defines the chart name for prometheus helm deploy
variable "prometheus_helm_chart_name" {
  type = string
  default = "kube-prometheus"
}
#--------------------------------------------------------------------------------
# Defines the namespace name for prometheus helm deploy
variable "prometheus_helm_namespace" {
  type = string
  default = "default"
}
#--------------------------------------------------------------------------------
# Defines the chart version for prometheus helm deploy
variable "prometheus_helm_chart_version" {
  type = string
  default = "8.3.2"
}
#--------------------------------------------------------------------------------
# Defines the chart values file path for prometheus helm deploy
variable "prometheus_helm_chart_values_file_path" {
  type = string
  default = "prometheus/values.yml"
}