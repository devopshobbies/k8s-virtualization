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
#-------------------------------------------------------------------------------
# Defines the name of the pod-vm
variable "pod_vm_name" {
  type = string
  default = "pod-vm"
}
#-------------------------------------------------------------------------------
# Defines the namespace of the pod-vm
variable "pod_vm_namespace" {
  type = string
  default = "pod-vm"
}
#-------------------------------------------------------------------------------
# Defines the operating system of the pod-vm
variable "pod_vm_os" {
  type = string
  default = "ssh_ubuntu"
}
#-------------------------------------------------------------------------------
# Defines the version of the pod-vm
variable "pod_vm_os_version" {
  type = string
  default = "latest"
}
#-------------------------------------------------------------------------------
# Defines the registry of the pod-vm
variable "pod_vm_registry" {
  type = string
  default = "moeidheidari"
}
#-------------------------------------------------------------------------------
# Defines the memory request of the pod-vm
variable "pod_vm_memory_request" {
  type = string
  default = "4Gi"
}
#-------------------------------------------------------------------------------
# Defines the memory limit of the pod-vm
variable "pod_vm_memory_limit" {
  type = string
  default = "4Gi"
}
#-------------------------------------------------------------------------------
# Defines the cpu request of the pod-vm
variable "pod_vm_cpu_request" {
  type = string
  default = "4000m"
}
#-------------------------------------------------------------------------------
# Defines the cpu limit of the pod-vm
variable "pod_vm_cpu_limit" {
  type = string
  default = "4000m"
}
#-------------------------------------------------------------------------------
# Defines the replica count of the pod-vm
variable "pod_vm_replica" {
  type = number
  default = 1
}
#-------------------------------------------------------------------------------
# Defines the host of the pod-vm
variable "pod_vm_host" {
  type = string
  default = "moeid-ideapad-l340-17irh-gaming"
}
#-------------------------------------------------------------------------------
# Defines the storage request of the pod-vm
variable "pod_vm_storage_request" {
  type = string
  default = "4Gi"
}
#-------------------------------------------------------------------------------
# Defines the storage limit of the pod-vm
variable "pod_vm_storage_limit" {
  type = string
  default = "4Gi"
}






