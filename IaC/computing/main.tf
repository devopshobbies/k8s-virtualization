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
#                             System Server Group                              #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
# Provisions the master node in System namespace
module "system_master_node"{
  source = "modules/physical_vm"
  vm_namespace = var.system_namespace
  vm_name = "${var.system_namespace}-${var.system_vm_1_name}"
  vm_os = var.system_vm_1_cloud_image_address
  vm_os_version = var.system_vm_1_cloud_image_version
  vm_cpu_cores = var.system_vm_1_VCPU_NUMBER
  vm_memory = var.system_vm_1_memory_capacity
  vm_host_node = var.system_vm_1_host_name
  vm_disk_storage = var.system_vm_1_storage_size
  vm_ssh_key = var.system_vm_1_ssh_key
  vm_disk_name = var.system_vm_1_disk_name
  vm_host_disk_path = var.system_vm_1_host_disk_root_path
  host_address = var.system_vm_1_host_ip_address
  host_ssh_key= var.system_vm_1_host_ssh_key_address
  host_user= var.system_vm_1_host_ssh_user_name
  ssh_sudo_password= var.system_vm_1_host_ssh_sudo_password
}


###==============================================================================#
###                                                                              #
###                            Pod-vm Server Group                               #
###                                                                              #
###==============================================================================#
module "pod_vm" {
  source = "modules/container-vm"
  pod_vm_name = var.pod_vm_1_name
  pod_vm_namespace = var.pod_vm_1_namespace
  pod_vm_os = var.pod_vm_1_os
  pod_vm_os_version = var.pod_vm_1_os_version
  pod_vm_registry = var.pod_vm_1_os_registry
  pod_vm_memory_request = var.pod_vm_1_os_memory_request
  pod_vm_cpu_request = var.pod_vm_1_os_cpu_request
  pod_vm_storage_request = var.pod_vm_1_os_storage_request
  pod_vm_memory_limit = var.pod_vm_1_os_memory_limit
  pod_vm_cpu_limit = var.pod_vm_1_os_cpu_limit
  pod_vm_storage_limit = var.pod_vm_1_os_storage_limit
  pod_vm_replica = var.pod_vm_1_replica
  pod_vm_host = var.pod_vm_1_host_name
}
