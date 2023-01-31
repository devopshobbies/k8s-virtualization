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
#==============================================================================#
#                                                                              #
#                             Jenkins Group                                    #
#                                                                              #
#==============================================================================#
# Defines the host machine user
variable "jenkins_host_ssh_user" {
  type = string
  default = "ubuntu"
}
#--------------------------------------------------------------------------------
# defines the address of the host ssh-key file
variable "jenkins_host_ssh_key_address" {
  type = string
  default = "/home/moeid/.ssh/vms_rsa"
}
#--------------------------------------------------------------------------------
# defines the host address
variable "jenkins_host_ssh_address" {
  type = string
  default = "10.244.217.4"
}
#--------------------------------------------------------------------------------
# defines the host sudo password
variable "jenkins_host_sudo_password" {
  type = string
  default = "PoI456ZxC"
}
#--------------------------------------------------------------------------------
# defines the host disk path
variable "jenkins_host_disk_path" {
  type = string
  default = "/mnt"
}
# defines the namespace where we want to deploy jenkins
variable "jenkins_helm_release_namespace" {
  type = string
  default = "default"
}
variable "jenkins_helm_release_name" {
  type = string
  default = "cicd-jenkins"
}
#--------------------------------------------------------------------------------
# Defines the repository name for jenkins helm deploy
variable "jenkins_helm_repo" {
  type = string
  default = "bitnami"
}
#--------------------------------------------------------------------------------
# Defines the chart name for jenkins helm deploy
variable "jenkins_helm_chart_name" {
  type = string
  default = "jenkins"
}
#--------------------------------------------------------------------------------
# Defines the chart version for prometheus helm deploy
variable "jenkins_helm_chart_version" {
  type = string
  default = "11.0.13"
}
#--------------------------------------------------------------------------------
# Defines the chart values file path for jenkins helm deploy
variable "jenkins_helm_chart_values_file_path" {
  type = string
  default = "jenkins/values.yml"
}
#--------------------------------------------------------------------------------
# Defines the storage for jenkins persistence volume
variable "jenkins_helm_storage" {
  type = string
  default = "60Gi"
}
#==============================================================================#
#                                                                              #
#                             Gitea Group                                      #
#                                                                              #
#==============================================================================#
# Defines the host machine user
variable "gitea_host_ssh_user" {
  type = string
  default = "ubuntu"
}
#--------------------------------------------------------------------------------
# defines the address of the host ssh-key file
variable "gitea_host_ssh_key_address" {
  type = string
  default = "/home/moeid/.ssh/vms_rsa"
}
#--------------------------------------------------------------------------------
# defines the host address
variable "gitea_host_ssh_address" {
  type = string
  default = "10.244.90.164"
}
#--------------------------------------------------------------------------------
# defines the host sudo password
variable "gitea_host_sudo_password" {
  type = string
  default = "PoI456ZxC"
}
#--------------------------------------------------------------------------------
# defines the host disk path
variable "gitea_host_disk_path" {
  type = string
  default = "/bitnami"
}
# defines the namespace where we want to deploy jenkins
variable "gitea_helm_release_namespace" {
  type = string
  default = "default"
}
variable "gitea_helm_release_name" {
  type = string
  default = "cicd-gitea"
}
#--------------------------------------------------------------------------------
# Defines the repository name for gitea helm deploy
variable "gitea_helm_repo" {
  type = string
  default = "bitnami"
}
#--------------------------------------------------------------------------------
# Defines the chart name for gitea helm deploy
variable "gitea_helm_chart_name" {
  type = string
  default = "gitea"
}
#--------------------------------------------------------------------------------
# Defines the chart version for prometheus helm deploy
variable "gitea_helm_chart_version" {
  type = string
  default = "0.1.8"
}
#--------------------------------------------------------------------------------
# Defines the chart values file path for gitea helm deploy
variable "gitea_helm_chart_values_file_path" {
  type = string
  default = "gitea/values.yml"
}
#--------------------------------------------------------------------------------
# Defines the storage for gitea persistence volume
variable "gitea_helm_storage" {
  type = string
  default = "50Gi"
}
#--------------------------------------------------------------------------------
# Defines the storage for gitea postgresql persistence volume
variable "gitea_postgresql_helm_storage" {
  type = string
  default = "8Gi"
}