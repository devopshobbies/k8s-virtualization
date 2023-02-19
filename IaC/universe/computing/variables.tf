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
#                             System server Group                              #
#                                                                              #
#==============================================================================#
#--------------------------------VM1 (Master) ----------------------------------
# defines the namespace we want to use to provision the computing machine
variable "system_namespace" {
  type    = string
  default = "system"
}
#--------------------------------
# defines the name of the computing machine
variable "system_vm_1_name" {
  type    = string
  default = "master"
}
#--------------------------------
# defines the address of the cloud image
variable "system_vm_1_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "system_vm_1_cloud_image_version" {
  type    = string
  default = "22.4"


}
#--------------------------------
# defines the VCPU cores of the VM
variable "system_vm_1_VCPU_NUMBER" {
  type    = number
  default = 12
}
#--------------------------------
# defines the memory capacity of the VM
variable "system_vm_1_memory_capacity" {
  type    = string
  default = "12Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "system_vm_1_storage_size" {
  type    = string
  default = "100Gi"
}
#--------------------------------
# defines the disk name
variable "system_vm_1_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "system_vm_1_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/system/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "system_vm_1_host_name" {
  type    = string
  default = "skyfarm"
}
#--------------------------------
# defines the SSH key of the VM
variable "system_vm_1_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "system_vm_1_host_ip_address" {
  type    = string
  default = "192.168.89.4"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "system_vm_1_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "system_vm_1_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "system_vm_1_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#--------------------------------VM2 (Worker) ----------------------------------
# defines the name of the computing machine
variable "system_vm_2_name" {
  type    = string
  default = "worker1"
}
#--------------------------------
# defines the address of the cloud image
variable "system_vm_2_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "system_vm_2_cloud_image_version" {
  type    = string
  default = "22.4"
}
#--------------------------------
# defines the VCPU cores of the VM
variable "system_vm_2_VCPU_NUMBER" {
  type    = number
  default = 4
}
#--------------------------------
# defines the memory capacity of the VM
variable "system_vm_2_memory_capacity" {
  type    = string
  default = "8Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "system_vm_2_storage_size" {
  type    = string
  default = "50Gi"
}
#--------------------------------
# defines the disk name
variable "system_vm_2_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "system_vm_2_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/system/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "system_vm_2_host_name" {
  type    = string
  default = "dev"
}
#--------------------------------
# defines the SSH key of the VM
variable "system_vm_2_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "system_vm_2_host_ip_address" {
  type    = string
  default = "192.168.89.2"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "system_vm_2_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "system_vm_2_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "system_vm_2_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#--------------------------------VM3 (Worker) ----------------------------------
# defines the name of the computing machine
variable "system_vm_3_name" {
  type    = string
  default = "worker2"
}
#--------------------------------
# defines the address of the cloud image
variable "system_vm_3_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "system_vm_3_cloud_image_version" {
  type    = string
  default = "22.4"
}
#--------------------------------
# defines the VCPU cores of the VM
variable "system_vm_3_VCPU_NUMBER" {
  type    = number
  default = 4
}
#--------------------------------
# defines the memory capacity of the VM
variable "system_vm_3_memory_capacity" {
  type    = string
  default = "8Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "system_vm_3_storage_size" {
  type    = string
  default = "50Gi"
}
#--------------------------------
# defines the disk name
variable "system_vm_3_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "system_vm_3_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/system/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "system_vm_3_host_name" {
  type    = string
  default = "dev"
}
#--------------------------------
# defines the SSH key of the VM
variable "system_vm_3_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "system_vm_3_host_ip_address" {
  type    = string
  default = "192.168.89.2"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "system_vm_3_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "system_vm_3_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "system_vm_3_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#==============================================================================#
#                                                                              #
#                              Projects Server Group                           #
#                                                                              #
#==============================================================================##
#--------------------------------VM1 (Master) ----------------------------------
# defines the namespace we want to use to provision the computing machine
variable "projects_namespace" {
  type    = string
  default = "projects"
}
#--------------------------------
# defines the name of the computing machine
variable "projects_vm_1_name" {
  type    = string
  default = "master"
}
#--------------------------------
# defines the address of the cloud image
variable "projects_vm_1_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "projects_vm_1_cloud_image_version" {
  type    = string
  default = "22.4"
}
#--------------------------------
# defines the VCPU cores of the VM
variable "projects_vm_1_VCPU_NUMBER" {
  type    = number
  default = 10
}
#--------------------------------
# defines the memory capacity of the VM
variable "projects_vm_1_memory_capacity" {
  type    = string
  default = "8Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "projects_vm_1_storage_size" {
  type    = string
  default = "100Gi"
}
#--------------------------------
# defines the disk name
variable "projects_vm_1_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "projects_vm_1_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/projects/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "projects_vm_1_host_name" {
  type    = string
  default = "skyfarm"
}
#--------------------------------
# defines the SSH key of the VM
variable "projects_vm_1_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "projects_vm_1_host_ip_address" {
  type    = string
  default = "192.168.89.4"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "projects_vm_1_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "projects_vm_1_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "projects_vm_1_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#--------------------------------VM2 (Worker) ----------------------------------
# defines the name of the computing machine
variable "projects_vm_2_name" {
  type    = string
  default = "worker1"
}
#--------------------------------
# defines the address of the cloud image
variable "projects_vm_2_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "projects_vm_2_cloud_image_version" {
  type    = string
  default = "22.4"
}
#--------------------------------
# defines the VCPU cores of the VM
variable "projects_vm_2_VCPU_NUMBER" {
  type    = number
  default = 4
}
#--------------------------------
# defines the memory capacity of the VM
variable "projects_vm_2_memory_capacity" {
  type    = string
  default = "8Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "projects_vm_2_storage_size" {
  type    = string
  default = "50Gi"
}
#--------------------------------
# defines the disk name
variable "projects_vm_2_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "projects_vm_2_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/projects/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "projects_vm_2_host_name" {
  type    = string
  default = "dev"
}
#--------------------------------
# defines the SSH key of the VM
variable "projects_vm_2_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "projects_vm_2_host_ip_address" {
  type    = string
  default = "192.168.89.2"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "projects_vm_2_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "projects_vm_2_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "projects_vm_2_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#--------------------------------VM3 (Worker) ----------------------------------
# defines the name of the computing machine
variable "projects_vm_3_name" {
  type    = string
  default = "worker2"
}
#--------------------------------
# defines the address of the cloud image
variable "projects_vm_3_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "projects_vm_3_cloud_image_version" {
  type    = string
  default = "22.4"
}
#--------------------------------
# defines the VCPU cores of the VM
variable "projects_vm_3_VCPU_NUMBER" {
  type    = number
  default = 4
}
#--------------------------------
# defines the memory capacity of the VM
variable "projects_vm_3_memory_capacity" {
  type    = string
  default = "8Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "projects_vm_3_storage_size" {
  type    = string
  default = "50Gi"
}
#--------------------------------
# defines the disk name
variable "projects_vm_3_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "projects_vm_3_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/projects/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "projects_vm_3_host_name" {
  type    = string
  default = "dev"
}
#--------------------------------
# defines the SSH key of the VM
variable "projects_vm_3_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "projects_vm_3_host_ip_address" {
  type    = string
  default = "192.168.89.2"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "projects_vm_3_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "projects_vm_3_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "projects_vm_3_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#--------------------------------VM3 (Worker) ----------------------------------
# defines the name of the computing machine
variable "projects_vm_4_name" {
  type    = string
  default = "worker3"
}
#--------------------------------
# defines the address of the cloud image
variable "projects_vm_4_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "projects_vm_4_cloud_image_version" {
  type    = string
  default = "22.4"
}
#--------------------------------
# defines the VCPU cores of the VM
variable "projects_vm_4_VCPU_NUMBER" {
  type    = number
  default = 4
}
#--------------------------------
# defines the memory capacity of the VM
variable "projects_vm_4_memory_capacity" {
  type    = string
  default = "8Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "projects_vm_4_storage_size" {
  type    = string
  default = "50Gi"
}
#--------------------------------
# defines the disk name
variable "projects_vm_4_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "projects_vm_4_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/projects/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "projects_vm_4_host_name" {
  type    = string
  default = "dev"
}
#--------------------------------
# defines the SSH key of the VM
variable "projects_vm_4_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "projects_vm_4_host_ip_address" {
  type    = string
  default = "192.168.89.2"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "projects_vm_4_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "projects_vm_4_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "projects_vm_4_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#==============================================================================#
#                                                                              #
#                             cicd Server Group                               #
#                                                                              #
#==============================================================================#
#--------------------------------VM1 (Master) ----------------------------------
# defines the namespace we want to use to provision the computing machine
variable "cicd_namespace" {
  type    = string
  default = "cicd"
}
#--------------------------------
# defines the name of the computing machine
variable "cicd_vm_1_name" {
  type    = string
  default = "master"
}
#--------------------------------
# defines the address of the cloud image
variable "cicd_vm_1_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "cicd_vm_1_cloud_image_version" {
  type    = string
  default = "22.4"
}
#--------------------------------
# defines the VCPU cores of the VM
variable "cicd_vm_1_VCPU_NUMBER" {
  type    = number
  default = 12
}
#--------------------------------
# defines the memory capacity of the VM
variable "cicd_vm_1_memory_capacity" {
  type    = string
  default = "12Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "cicd_vm_1_storage_size" {
  type    = string
  default = "100Gi"
}
#--------------------------------
# defines the disk name
variable "cicd_vm_1_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "cicd_vm_1_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/cicd/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "cicd_vm_1_host_name" {
  type    = string
  default = "skyfarm"
}
#--------------------------------
# defines the SSH key of the VM
variable "cicd_vm_1_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "cicd_vm_1_host_ip_address" {
  type    = string
  default = "192.168.89.4"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "cicd_vm_1_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "cicd_vm_1_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "cicd_vm_1_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#--------------------------------VM2 (Worker) ----------------------------------
# defines the name of the computing machine
variable "cicd_vm_2_name" {
  type    = string
  default = "worker1"
}
#--------------------------------
# defines the address of the cloud image
variable "cicd_vm_2_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "cicd_vm_2_cloud_image_version" {
  type    = string
  default = "22.4"
}
#--------------------------------
# defines the VCPU cores of the VM
variable "cicd_vm_2_VCPU_NUMBER" {
  type    = number
  default = 4
}
#--------------------------------
# defines the memory capacity of the VM
variable "cicd_vm_2_memory_capacity" {
  type    = string
  default = "8Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "cicd_vm_2_storage_size" {
  type    = string
  default = "50Gi"
}
#--------------------------------
# defines the disk name
variable "cicd_vm_2_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "cicd_vm_2_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/cicd/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "cicd_vm_2_host_name" {
  type    = string
  default = "dev"
}
#--------------------------------
# defines the SSH key of the VM
variable "cicd_vm_2_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "cicd_vm_2_host_ip_address" {
  type    = string
  default = "192.168.89.2"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "cicd_vm_2_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "cicd_vm_2_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "cicd_vm_2_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#--------------------------------VM3 (Worker) ----------------------------------
# defines the name of the computing machine
variable "cicd_vm_3_name" {
  type    = string
  default = "worker2"
}
#--------------------------------
# defines the address of the cloud image
variable "cicd_vm_3_cloud_image_address" {
  type    = string
  default = "http://10.244.217.44:9000/public/focal-server-cloudimg-amd64.img"
}
#--------------------------------
# defines the version of the cloud image
variable "cicd_vm_3_cloud_image_version" {
  type    = string
  default = "22.4"
}
#--------------------------------
# defines the VCPU cores of the VM
variable "cicd_vm_3_VCPU_NUMBER" {
  type    = number
  default = 4
}
#--------------------------------
# defines the memory capacity of the VM
variable "cicd_vm_3_memory_capacity" {
  type    = string
  default = "8Gi"
}
#--------------------------------
# defines the disk storage of the VM
variable "cicd_vm_3_storage_size" {
  type    = string
  default = "50Gi"
}
#--------------------------------
# defines the disk name
variable "cicd_vm_3_disk_name" {
  type    = string
  default = "primary-disk"
}
#--------------------------------
# defines the host disk root path
variable "cicd_vm_3_host_disk_root_path" {
  type    = string
  default = "/mnt/disk1/cicd/vm-pvs"
}
#--------------------------------
# defines the HOST name the vm should be created on
variable "cicd_vm_3_host_name" {
  type    = string
  default = "dev"
}
#--------------------------------
# defines the SSH key of the VM
variable "cicd_vm_3_ssh_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCjb7V327TTuP/A4aHOoqTi5/QIcnDBjBEvaeDiQwYoc7a5RmqT7YPtSpBQFGlkTPCxaL2uGPRbde5L7oMYfLTVT/8tzw1RdHT7h+rr2yAmcMy4op5crNBAsH9ov1nk5hh+xfVCrOVslpcUijS4YNuwAaPXg8w0u4yum03PpEgsYIvlvOIFdLYuIS10vCnZFi3R5d3eh4qujtp/W9p7BOkBwuGw78no07nNdsL34afdpyXD9gACtCJBpxFqbQr7S+LlQPbDX6WuFarPYgbT5VUnAf0n8uOBvm4nFHM/GpCFSKL04xanoy/RX6FtJfa+qV33EYH/HRNMDv6sjpvx0FUBs6s8vR//cI/MJIbOK9PgTKu40TKvHH3GnfocmZJhEO5AujM+7aOHOIvNRLpvBvfpmmZmRbHOI+ML6cQBIOsrokSIwkdhEZI/3mdT2Yw0mZ8yLxvCqpYTxT+rN9MYK1lAbf99BXvrbGqfvmKidi2JrgRyXf/bZDy9a+UkZ6X+ztE= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
}
#--------------------------------
# defines the HOST IP address the vm should be created on
variable "cicd_vm_3_host_ip_address" {
  type    = string
  default = "192.168.89.2"
}
#--------------------------------
# defines the HOST ssh key address that the vm should be created on
variable "cicd_vm_3_host_ssh_key_address" {
  type    = string
  default = "/home/moeid/.ssh/nonprotected_skyfarm_rsa"
}
#--------------------------------
# defines the HOST ssh username that the vm should be created on
variable "cicd_vm_3_host_ssh_user_name" {
  type    = string
  default = "av"
}
#--------------------------------
# defines the HOST ssh sudo password that the vm should be created on
variable "cicd_vm_3_host_ssh_sudo_password" {
  type    = string
  default = "PoI456ZxC"
}
#==============================================================================#
#                                                                              #
#                            Pod-vm Server Group                               #
#                                                                              #
#==============================================================================#
# defines the namespaces where the vm should be created on
variable "pod_vm_1_namespace" {
  type    = string
  default = "pod-vm"
}
#--------------------------------
# defines the name of the pod-vm
variable "pod_vm_1_name" {
  type    = string
  default = "vm1"
}
#--------------------------------
# defines the OS of the pod-vm
variable "pod_vm_1_os" {
  type    = string
  default = "ubuntu"
}
#--------------------------------
# defines the OS version of the pod-vm
variable "pod_vm_1_os_version" {
  type    = string
  default = "latest"
}
#--------------------------------
# defines the OS image registry of the pod-vm
variable "pod_vm_1_os_registry" {
  type    = string
  default = "moeidheidari"
}
#--------------------------------
# defines the memory request of the pod-vm
variable "pod_vm_1_os_memory_request" {
  type    = string
  default = "4Gi"
}
#--------------------------------
# defines the memory limit of the pod-vm
variable "pod_vm_1_os_memory_limit" {
  type    = string
  default = "4Gi"
}
#--------------------------------
# defines the cpu request of the pod-vm
variable "pod_vm_1_os_cpu_request" {
  type    = string
  default = "1000m"
}
#--------------------------------
# defines the cpu limit of the pod-vm
variable "pod_vm_1_os_cpu_limit" {
  type    = string
  default = "1000m"
}
#--------------------------------
# defines the storage request of the pod-vm
variable "pod_vm_1_os_storage_request" {
  type    = string
  default = "4Gi"
}
#--------------------------------
# defines the storage limit of the pod-vm
variable "pod_vm_1_os_storage_limit" {
  type    = string
  default = "4Gi"
}
#--------------------------------
# defines the replica number of the pod-vm
variable "pod_vm_1_replica" {
  type    = number
  default = 1
}
#--------------------------------
# defines the host name where the pod-vm should be deployed on
variable "pod_vm_1_host_name" {
  type    = string
  default = "skyfarm"
}