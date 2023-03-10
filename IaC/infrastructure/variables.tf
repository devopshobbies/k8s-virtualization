#==============================================================================#
#                                                                              #
#                                 MIT License                                  #
#                                                                              #
#                       Copyright (c) 2023 DevopsHobbies                       #
#                                                                              #
# Permission is hereby granted, free of charge, to any person obtaining a copy #
#of this software and associated documentation files (the Software), to deal   #
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
# Defines the host machine user
variable "host_ssh_user" {
  type = string
  default = "moeid"
}
#--------------------------------------------------------------------------------
# defines the address of the host ssh-key file
variable "host_ssh_key_address" {
  type = string
  default = "/home/moeid/.ssh/id_rsa"
}
#--------------------------------------------------------------------------------
# defines the host address
variable "host_ssh_address" {
  type = string
  default = "192.168.1.216"
}
#--------------------------------------------------------------------------------
# defines the host sudo password
variable "host_sudo_password" {
  type = string
  default = "Moied3dMoied3d"
}
#--------------------------------------------------------------------------------
# defines the host disk path
variable "host_disk_path" {
  type = string
  default = "/mnt/disk1"
}
#==============================================================================#
#                                                                              #
#                             Prometheus group var                             #
#                                                                              #
#==============================================================================#
# Defines a release name for prometheus
variable "prometheus_helm_release_name"{
  type= string
  default = "prometheus"
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
#==============================================================================#
#                                                                              #
#                             Minio group var                                  #
#                                                                              #
#==============================================================================#
# Defines a release name for minio
variable "minio_helm_release_name"{
  type= string
  default = "minio"
}
#--------------------------------------------------------------------------------
# Defines the repository name for minio helm deploy
variable "minio_helm_repo" {
  type = string
  default = "bitnami"
}
#--------------------------------------------------------------------------------
# Defines the chart name for minio helm deploy
variable "minio_helm_chart_name" {
  type = string
  default = "minio"
}
#--------------------------------------------------------------------------------
# Defines the namespace name for minio helm deploy
variable "minio_helm_namespace" {
  type = string
  default = "default"
}
#--------------------------------------------------------------------------------
# Defines the chart version for minio helm deploy
variable "minio_helm_chart_version" {
  type = string
  default = "12.1.1"
}
#--------------------------------------------------------------------------------
# Defines the chart values file path for minio helm deploy
variable "minio_helm_chart_values_file_path" {
  type = string
  default = "minio-s3/values.yml"
}
#--------------------------------------------------------------------------------
# Defines the storage for minio persistence volume
variable "minio_helm_storage" {
  type = string
  default = "200Gi"
}
#==============================================================================#
#                                                                              #
#                             grafana group var                                  #
#                                                                              #
#==============================================================================#
# Defines a release name for grafana
variable "grafana_helm_release_name"{
  type= string
  default = "grafana"
}
#--------------------------------------------------------------------------------
# Defines the repository name for grafana helm deploy
variable "grafana_helm_repo" {
  type = string
  default = "bitnami"
}
#--------------------------------------------------------------------------------
# Defines the chart name for grafana helm deploy
variable "grafana_helm_chart_name" {
  type = string
  default = "grafana"
}
#--------------------------------------------------------------------------------
# Defines the namespace name for grafana helm deploy
variable "grafana_helm_namespace" {
  type = string
  default = "default"
}
#--------------------------------------------------------------------------------
# Defines the chart version for grafana helm deploy
variable "grafana_helm_chart_version" {
  type = string
  default = "8.2.22"
}
#--------------------------------------------------------------------------------
# Defines the chart values file path for grafana helm deploy
variable "grafana_helm_chart_values_file_path" {
  type = string
  default = "grafana/values.yml"
}
#--------------------------------------------------------------------------------
# Defines the storage for grafana persistence volume
variable "grafana_helm_storage" {
  type = string
  default = "10Gi"
}
#==============================================================================#
#                                                                              #
#                             ingress group var                                #
#                                                                              #
#==============================================================================#
# Defines a release name for ingress
variable "ingress_helm_release_name"{
  type= string
  default = "ingress"
}
#--------------------------------------------------------------------------------
# Defines the repository name for ingress helm deploy
variable "ingress_helm_repo" {
  type = string
  default = "bitnami"
}
#--------------------------------------------------------------------------------
# Defines the chart name for ingress helm deploy
variable "ingress_helm_chart_name" {
  type = string
  default = "nginx-ingress-controller"
}
#--------------------------------------------------------------------------------
# Defines the namespace name for ingress helm deploy
variable "ingress_helm_namespace" {
  type = string
  default = "default"
}
#--------------------------------------------------------------------------------
# Defines the chart version for ingress helm deploy
variable "ingress_helm_chart_version" {
  type = string
  default = "9.3.26"
}


