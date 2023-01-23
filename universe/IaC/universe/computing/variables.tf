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
#                             Variables Group                                  #
#                                                                              #
#==============================================================================#
# defines the namespace we want to use to provision the computing machine
variable "system_namespace" {
  type    = string
  default = "system"
}
#-------------------------------------------------------------------------------
#defines the name for the computing machine
variable "system_vm_name"{
    type = string
    default = "system-vm2"
}
#-------------------------------------------------------------------------------
#defines the os type we want to provision the computing machine based on
variable "system_vm_os" {
  type = string
  default ="ubuntu"
}
#-------------------------------------------------------------------------------
# defines the address of the os container in the repository
variable "system_vm_container" {
  type = string
  default = "quay.io/containerdisks/ubuntu"
}
#-------------------------------------------------------------------------------
# defines version of the container image
variable "system_vm_container_version" {
  type = string
  default = "22.04"
}
#-------------------------------------------------------------------------------
# defines the number of CPUs we want to dedicate to the computing machine
variable "system_vm_cpus" {
    type = number
    default=1  
}
#-------------------------------------------------------------------------------
#defines the memory capacity we want to dedicate to the computing machine
variable "system_vm_memory" {
  type = string
  default = "1Gi"
}
#-------------------------------------------------------------------------------
#defines the computing machine type (container and vm)
# container is just the application layer and uses the core of the host
# vm is a virtual machine with a fully isolated environment and clones the core of the host
variable "system_vm_type"{
    type = map
    default = {
        container = "container"
        vm  = "vm"
    }
}
#-------------------------------------------------------------------------------
# defines the name of the disk we want to attach to the vm
variable "system_vm_disk_name" {
  type = string
  default = "containerdisk"
}
#-------------------------------------------------------------------------------
# defines the disk data bus of the disk
variable "system_vm_disk_bus" {
  type = string
  default = "virtio"
}
#-------------------------------------------------------------------------------
# defines the size of the disk
variable "system_vm_disk_size" {
  type = number
  default = 10
}
#-------------------------------------------------------------------------------
# defines the use generated ssh key we want to use for ssh login to the vm
variable "system_vm_ssh" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnKHjufDiMLojY6lKhtwh1jZCLChUq6HESUHfU0s4rANfTxdlBOhqGO0ZtWyRhta4gd/qet2+s6GF0c6US2lmoQ6GPOlC256lNb4HiM+/Ar46vgLlAnyEtUqXwILSctye69zaJ4vF82aaTLL8LxqEZMIdWbQj+afM4qHQuETDQZDjbZ//PPXpXqEUP8dnE8Ylgkj33iyCYQwRCuLq2g91jrtp6aGpUqhNDTwC1KL5mWv0kX+Sj6JXW3srLA8px3JNCNsY2DHSyDRqZdCDxX4+Q7ha8BogkcJ32ud3y3jUuzGEBrvEcjATisYMkd2G6hiCb2Lt+FFbYyqrtGIn+DU/3e736fqt5WPdEaBKTnCpuyhLe4mUTPVWPYQU0eoPgrrprHu9trXzZX7YQZiTRXveFc0gMs/+TKHS1QzyhnK9fMwJa20YrkbHDKzXkE56+wgOtAukNKP88bDpgYHCQxp1qACZOK+qz3053fI50s6nPf1Seh4LgB46IO0YR3NQLu+c= moeid@moeid-IdeaPad-L340-17IRH-Gaming" 
}
