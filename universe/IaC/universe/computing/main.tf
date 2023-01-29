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
#                             System Server Group                              #
#                                                                              #
#==============================================================================#
#-------------------------------------------------------------------------------
# Provisions the master node in System namespace
module "system_master_node"{
  source = "./modules/physical_vm"
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
# Provisions the worker node 1 in System namespace
module "system_worker_node_1"{
  source = "./modules/physical_vm"
  vm_namespace = var.system_namespace
  vm_name = "${var.system_namespace}-${var.system_vm_2_name}"
  vm_os = var.system_vm_2_cloud_image_address
  vm_os_version = var.system_vm_2_cloud_image_version
  vm_cpu_cores = var.system_vm_2_VCPU_NUMBER
  vm_memory = var.system_vm_2_memory_capacity
  vm_host_node = var.system_vm_2_host_name
  vm_disk_storage = var.system_vm_2_storage_size
  vm_ssh_key = var.system_vm_2_ssh_key
  vm_disk_name = var.system_vm_2_disk_name
  vm_host_disk_path = var.system_vm_2_host_disk_root_path
  host_address = var.system_vm_2_host_ip_address
  host_ssh_key= var.system_vm_2_host_ssh_key_address
  host_user= var.system_vm_2_host_ssh_user_name
  ssh_sudo_password= var.system_vm_2_host_ssh_sudo_password
}
# Provisions the worker node 2 in System namespace
module "system_worker_node_2"{
  source = "./modules/physical_vm"
  vm_namespace = var.system_namespace
  vm_name = "${var.system_namespace}-${var.system_vm_3_name}"
  vm_os = var.system_vm_3_cloud_image_address
  vm_os_version = var.system_vm_3_cloud_image_version
  vm_cpu_cores = var.system_vm_3_VCPU_NUMBER
  vm_memory = var.system_vm_3_memory_capacity
  vm_host_node = var.system_vm_3_host_name
  vm_disk_storage = var.system_vm_3_storage_size
  vm_ssh_key = var.system_vm_3_ssh_key
  vm_disk_name = var.system_vm_3_disk_name
  vm_host_disk_path = var.system_vm_3_host_disk_root_path
  host_address = var.system_vm_3_host_ip_address
  host_ssh_key= var.system_vm_3_host_ssh_key_address
  host_user= var.system_vm_3_host_ssh_user_name
  ssh_sudo_password= var.system_vm_3_host_ssh_sudo_password
}
#==============================================================================#
#                                                                              #
#                              Projects Server Group                           #
#                                                                              #
#==============================================================================#
#Provisions the master node  in projects namespace
module "projects_master_node"{
  source = "./modules/physical_vm"
  vm_namespace = var.projects_namespace
  vm_name = "${var.projects_namespace}-${var.projects_vm_1_name}"
  vm_os = var.projects_vm_1_cloud_image_address
  vm_os_version = var.projects_vm_1_cloud_image_version
  vm_cpu_cores = var.projects_vm_1_VCPU_NUMBER
  vm_memory = var.projects_vm_1_memory_capacity
  vm_host_node = var.projects_vm_1_host_name
  vm_disk_storage = var.projects_vm_1_storage_size
  vm_ssh_key = var.projects_vm_1_ssh_key
  vm_disk_name = var.projects_vm_1_disk_name
  vm_host_disk_path = var.projects_vm_1_host_disk_root_path
  host_address = var.projects_vm_1_host_ip_address
  host_ssh_key= var.projects_vm_1_host_ssh_key_address
  host_user= var.projects_vm_1_host_ssh_user_name
  ssh_sudo_password= var.projects_vm_1_host_ssh_sudo_password
}
# Provisions the worker node 1 in projects namespace
module "projects_worker_node_1"{
  source = "./modules/physical_vm"
  vm_namespace = var.projects_namespace
  vm_name = "${var.projects_namespace}-${var.projects_vm_2_name}"
  vm_os = var.projects_vm_2_cloud_image_address
  vm_os_version = var.projects_vm_2_cloud_image_version
  vm_cpu_cores = var.projects_vm_2_VCPU_NUMBER
  vm_memory = var.projects_vm_2_memory_capacity
  vm_host_node = var.projects_vm_2_host_name
  vm_disk_storage = var.projects_vm_2_storage_size
  vm_ssh_key = var.projects_vm_2_ssh_key
  vm_disk_name = var.projects_vm_2_disk_name
  vm_host_disk_path = var.projects_vm_2_host_disk_root_path
  host_address = var.projects_vm_2_host_ip_address
  host_ssh_key= var.projects_vm_2_host_ssh_key_address
  host_user= var.projects_vm_2_host_ssh_user_name
  ssh_sudo_password= var.projects_vm_2_host_ssh_sudo_password
}
# Provisions the worker node 2 in projects namespace
module "projects_worker_node_2"{
  source = "./modules/physical_vm"
  vm_namespace = var.projects_namespace
  vm_name = "${var.projects_namespace}-${var.projects_vm_3_name}"
  vm_os = var.projects_vm_3_cloud_image_address
  vm_os_version = var.projects_vm_3_cloud_image_version
  vm_cpu_cores = var.projects_vm_3_VCPU_NUMBER
  vm_memory = var.projects_vm_3_memory_capacity
  vm_host_node = var.projects_vm_3_host_name
  vm_disk_storage = var.projects_vm_3_storage_size
  vm_ssh_key = var.projects_vm_3_ssh_key
  vm_disk_name = var.projects_vm_3_disk_name
  vm_host_disk_path = var.projects_vm_3_host_disk_root_path
  host_address = var.projects_vm_3_host_ip_address
  host_ssh_key= var.projects_vm_3_host_ssh_key_address
  host_user= var.projects_vm_3_host_ssh_user_name
  ssh_sudo_password= var.projects_vm_3_host_ssh_sudo_password
}

# Provisions the worker node 3 in projects namespace
module "projects_worker_node_3"{
  source = "./modules/physical_vm"
  vm_namespace = var.projects_namespace
  vm_name = "${var.projects_namespace}-${var.projects_vm_4_name}"
  vm_os = var.projects_vm_4_cloud_image_address
  vm_os_version = var.projects_vm_4_cloud_image_version
  vm_cpu_cores = var.projects_vm_4_VCPU_NUMBER
  vm_memory = var.projects_vm_4_memory_capacity
  vm_host_node = var.projects_vm_4_host_name
  vm_disk_storage = var.projects_vm_4_storage_size
  vm_ssh_key = var.projects_vm_4_ssh_key
  vm_disk_name = var.projects_vm_4_disk_name
  vm_host_disk_path = var.projects_vm_4_host_disk_root_path
  host_address = var.projects_vm_4_host_ip_address
  host_ssh_key= var.projects_vm_4_host_ssh_key_address
  host_user= var.projects_vm_4_host_ssh_user_name
  ssh_sudo_password= var.projects_vm_4_host_ssh_sudo_password
}
##==============================================================================#
##                                                                              #
##                             Code Server Group                                #
##                                                                              #
##==============================================================================#
module "code_master_node"{
  source = "./modules/physical_vm"
  vm_namespace = var.code_namespace
  vm_name = "${var.code_namespace}-${var.code_vm_1_name}"
  vm_os = var.code_vm_1_cloud_image_address
  vm_os_version = var.code_vm_1_cloud_image_version
  vm_cpu_cores = var.code_vm_1_VCPU_NUMBER
  vm_memory = var.code_vm_1_memory_capacity
  vm_host_node = var.code_vm_1_host_name
  vm_disk_storage = var.code_vm_1_storage_size
  vm_ssh_key = var.code_vm_1_ssh_key
  vm_disk_name = var.code_vm_1_disk_name
  vm_host_disk_path = var.code_vm_1_host_disk_root_path
  host_address = var.code_vm_1_host_ip_address
  host_ssh_key= var.code_vm_1_host_ssh_key_address
  host_user= var.code_vm_1_host_ssh_user_name
  ssh_sudo_password= var.code_vm_1_host_ssh_sudo_password
}
# Provisions the worker node 1 in code namespace
module "code_worker_node_1"{
  source = "./modules/physical_vm"
  vm_namespace = var.code_namespace
  vm_name = "${var.code_namespace}-${var.code_vm_2_name}"
  vm_os = var.code_vm_2_cloud_image_address
  vm_os_version = var.code_vm_2_cloud_image_version
  vm_cpu_cores = var.code_vm_2_VCPU_NUMBER
  vm_memory = var.code_vm_2_memory_capacity
  vm_host_node = var.code_vm_2_host_name
  vm_disk_storage = var.code_vm_2_storage_size
  vm_ssh_key = var.code_vm_2_ssh_key
  vm_disk_name = var.code_vm_2_disk_name
  vm_host_disk_path = var.code_vm_2_host_disk_root_path
  host_address = var.code_vm_2_host_ip_address
  host_ssh_key= var.code_vm_2_host_ssh_key_address
  host_user= var.code_vm_2_host_ssh_user_name
  ssh_sudo_password= var.code_vm_2_host_ssh_sudo_password
}
#Provisions the worker node 2 in code namespace
module "code_worker_node_2"{
  source = "./modules/physical_vm"
  vm_namespace = var.code_namespace
  vm_name = "${var.code_namespace}-${var.code_vm_3_name}"
  vm_os = var.code_vm_3_cloud_image_address
  vm_os_version = var.code_vm_3_cloud_image_version
  vm_cpu_cores = var.code_vm_3_VCPU_NUMBER
  vm_memory = var.code_vm_3_memory_capacity
  vm_host_node = var.code_vm_3_host_name
  vm_disk_storage = var.code_vm_3_storage_size
  vm_ssh_key = var.code_vm_3_ssh_key
  vm_disk_name = var.code_vm_3_disk_name
  vm_host_disk_path = var.code_vm_3_host_disk_root_path
  host_address = var.code_vm_3_host_ip_address
  host_ssh_key= var.code_vm_3_host_ssh_key_address
  host_user= var.code_vm_3_host_ssh_user_name
  ssh_sudo_password= var.code_vm_3_host_ssh_sudo_password
}
###==============================================================================#
###                                                                              #
###                            Pod-vm Server Group                               #
###                                                                              #
###==============================================================================#
module "pod_vm" {
  source = "./modules/container-vm"
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
