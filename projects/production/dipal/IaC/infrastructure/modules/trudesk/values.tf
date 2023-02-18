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
variable "dipal_trudesk_namespace" {
  type = string
  default = "dipal"
}

variable "dipal_trudesk_name" {
  type = string
  default = "trudesk"
}
#--------------------------------------------------------------------------------
# Defines kafka node selection
variable "dipal_trudesk_mongodb_node" {
  type = string
  default = "projects-master"
}
#--------------------------------------------------------------------------------
# Defines the host machine user
variable "dipal_trudesk_mongodb_host_ssh_user" {
  type = string
  default = "ubuntu"
}
#--------------------------------------------------------------------------------
# defines the address of the host ssh-key file
variable "dipal_trudesk_mongodb_host_ssh_key_address" {
  type = string
  default = "/home/moeid/.ssh/vms_rsa"
}
#--------------------------------------------------------------------------------
# defines the host address
variable "dipal_trudesk_mongodb_host_ssh_address" {
  type = string
  default = "10.244.217.5"
}
#--------------------------------------------------------------------------------
# defines the host sudo password
variable "dipal_trudesk_mongodb_host_sudo_password" {
  type = string
  default = "PoI456ZxC"
}
#--------------------------------------------------------------------------------
# defines the host disk path
variable "dipal_trudesk_mongodb_host_disk_path" {
  type = string
  default = "/mnt"
}
variable "dipal_trudesk_mongodb_name" {
  type = string
  default = "trudesk-mongodb"
}
variable "dipal_trudesk_mongodb_username" {
  type = string
  default = "root"
}

variable "dipal_trudesk_mongodb_password" {
  type = string
  default = "PoI456ZxC"
}

variable "dipal_trudesk_mongodb_service_port" {
  type = string
  default = 27017
}

variable "dipal_trudesk_mongodb_pv1_size" {
  type = string
  default = "5Gi"
}

variable "dipal_trudesk_mongodb_pv2_size" {
  type = string
  default = "20Gi"
}

variable "dipal_trudesk_backup_size" {
  type = string
  default = "5Gi"
}

variable "dipal_trudesk_uploads_size" {
  type = string
  default = "20Gi"
}