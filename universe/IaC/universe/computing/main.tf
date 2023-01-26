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

module "system_master_node"{
  source = "./modules/physical_vm"
  vm_namespace = "system"
  vm_name = "system-master"
  vm_os = "http://10.244.134.1:9000/public/lunar-server-cloudimg-amd64.img"
  vm_os_version = "22.4"
  vm_cpu_cores = 4
  vm_memory = "2Gi"
  vm_host_node = "moeid-ideapad-l340-17irh-gaming"
  vm_disk_storage = "50Gi"
  vm_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnKHjufDiMLojY6lKhtwh1jZCLChUq6HESUHfU0s4rANfTxdlBOhqGO0ZtWyRhta4gd/qet2+s6GF0c6US2lmoQ6GPOlC256lNb4HiM+/Ar46vgLlAnyEtUqXwILSctye69zaJ4vF82aaTLL8LxqEZMIdWbQj+afM4qHQuETDQZDjbZ//PPXpXqEUP8dnE8Ylgkj33iyCYQwRCuLq2g91jrtp6aGpUqhNDTwC1KL5mWv0kX+Sj6JXW3srLA8px3JNCNsY2DHSyDRqZdCDxX4+Q7ha8BogkcJ32ud3y3jUuzGEBrvEcjATisYMkd2G6hiCb2Lt+FFbYyqrtGIn+DU/3e736fqt5WPdEaBKTnCpuyhLe4mUTPVWPYQU0eoPgrrprHu9trXzZX7YQZiTRXveFc0gMs/+TKHS1QzyhnK9fMwJa20YrkbHDKzXkE56+wgOtAukNKP88bDpgYHCQxp1qACZOK+qz3053fI50s6nPf1Seh4LgB46IO0YR3NQLu+c= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
  vm_disk_name = "primary-disk"
  vm_host_disk_path = "/mnt/disk1/system/vm-pvs"
  host_address = "192.168.1.216"
  host_ssh_key= "/home/moeid/.ssh/local_rsa"
  host_user="moeid"
  ssh_sudo_password="Moied3dMoied3d"
}

module "system_worker_node"{
  source = "./modules/physical_vm"
  vm_namespace = "system"
  vm_name = "system-worker"
  vm_os = "http://10.244.134.1:9000/public/lunar-server-cloudimg-amd64.img"
  vm_os_version = "22.4"
  vm_cpu_cores = 4
  vm_memory = "2Gi"
  vm_host_node = "moeid-ideapad-l340-17irh-gaming"
  vm_disk_storage = "50Gi"
  vm_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnKHjufDiMLojY6lKhtwh1jZCLChUq6HESUHfU0s4rANfTxdlBOhqGO0ZtWyRhta4gd/qet2+s6GF0c6US2lmoQ6GPOlC256lNb4HiM+/Ar46vgLlAnyEtUqXwILSctye69zaJ4vF82aaTLL8LxqEZMIdWbQj+afM4qHQuETDQZDjbZ//PPXpXqEUP8dnE8Ylgkj33iyCYQwRCuLq2g91jrtp6aGpUqhNDTwC1KL5mWv0kX+Sj6JXW3srLA8px3JNCNsY2DHSyDRqZdCDxX4+Q7ha8BogkcJ32ud3y3jUuzGEBrvEcjATisYMkd2G6hiCb2Lt+FFbYyqrtGIn+DU/3e736fqt5WPdEaBKTnCpuyhLe4mUTPVWPYQU0eoPgrrprHu9trXzZX7YQZiTRXveFc0gMs/+TKHS1QzyhnK9fMwJa20YrkbHDKzXkE56+wgOtAukNKP88bDpgYHCQxp1qACZOK+qz3053fI50s6nPf1Seh4LgB46IO0YR3NQLu+c= moeid@moeid-IdeaPad-L340-17IRH-Gaming"
  vm_disk_name = "primary-disk"
  vm_host_disk_path = "/mnt/disk1/system/vm-pvs"
  host_address = "192.168.1.216"
  host_ssh_key= "/home/moeid/.ssh/local_rsa"
  host_user="moeid"
  ssh_sudo_password="Moied3dMoied3d"
}
#==============================================================================#
#                                                                              #
#                              Dipal Server Group                              #
#                                                                              #
#==============================================================================#

#==============================================================================#
#                                                                              #
#                             Skyfarm Server Group                             #
#                                                                              #
#==============================================================================#

#==============================================================================#
#                                                                              #
#                            Scipaper Server Group                             #
#                                                                              #
#==============================================================================#
