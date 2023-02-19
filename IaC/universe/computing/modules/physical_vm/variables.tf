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
#==============================================================================#
#                                                                              #
#                             Variables Group                                  #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
# Defines the namespace where we want to create the vm inside
variable "vm_namespace" {
  type    = string
  default = "system"
}
#-------------------------------------------------------------------------------
# Defines the name of the vm
variable "vm_name" {
  type    = string
  default = "vm1"
}
#-------------------------------------------------------------------------------
# Defines the type of the Operating system
variable "vm_os" {
  type = string
  default = "http://10.244.134.41:9000/public/lunar-server-cloudimg-amd64.img"
}
#-------------------------------------------------------------------------------
# Defines the version of the Operating system
variable "vm_os_version" {
  type = string
  default = "22.4"
}
#-------------------------------------------------------------------------------
#Defines the number of VCPU cores to be dedicated to the VM
variable "vm_cpu_cores" {
  type = number
  default = 2
}
#-------------------------------------------------------------------------------
# Defines the amount of the memory to be dedicated to the vm
variable "vm_memory" {
  type = string
  default = "4Gi"
}
#-------------------------------------------------------------------------------
# Defines the storage size to be dedicate dto the VM
variable "vm_disk_storage" {
  type = string
  default = "50Gi"
}
#-------------------------------------------------------------------------------
# Defines disk name of the vm
variable "vm_disk_name" {
  type = string
  default = "primary-disk"
}
#-------------------------------------------------------------------------------
# Defines the ssh key for ssh login to the VM
variable "vm_ssh_key"{
  type = string
  default = "ssh..."
}
#-------------------------------------------------------------------------------
# Defines the nodes we want to create the VM on.
variable "vm_host_node" {
  type = string
  default = "skyfarm"
}
#-------------------------------------------------------------------------------
# Defines the root address of the disk volume you want to creat the Volume on
variable "vm_host_disk_path" {
  type = string
  default = "/mnt/disk1/system/vm-pvs"
}
#-------------------------------------------------------------------------------
# Defines host ssh address
variable "host_address" {
  type = string
  default = "192.168.89.4"
}
#-------------------------------------------------------------------------------
# Defines host ssh address
variable "host_ssh_key" {
  type = string
  default = "/home/moeid/.ssh/local_rsa"
}
#--------------------------------------------------------------------------------
# Defines the host ssh user
variable "host_user" {
  type = string
  default = "av"
}
#--------------------------------------------------------------------------------
# Defines the host sudo password
variable "ssh_sudo_password" {
  type = string
  default = "PoI456ZxC"
}