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
# creates the name space for for system
resource "kubernetes_namespace" "vm_pod_namespace" {
  metadata {
    name = var.pod_vm_namespace
  }
}
#-------------------------------------------------------------------------------
# Deploys a pod-vm
resource "kubernetes_deployment" "vm_pod" {
    metadata  {
      labels = {
        app = "${var.pod_vm_namespace}-${var.pod_vm_name}"
      }
      namespace = var.pod_vm_namespace
      name = "${var.pod_vm_namespace}-${var.pod_vm_name}"
    }
    spec  {
      replicas = var.pod_vm_replica
      selector  {
        match_labels = {
          app = "${var.pod_vm_namespace}-${var.pod_vm_name}"
        }
      }
      template  {
        metadata  {
          labels = {
            app = "${var.pod_vm_namespace}-${var.pod_vm_name}"
          }
        }
        spec  {

          container {
            image = "${var.pod_vm_registry}/${var.pod_vm_os}_ssh:${var.pod_vm_os_version}"
            name = "${var.pod_vm_namespace}-${var.pod_vm_name}"
            port{
                container_port = 22
              }
            resources {
              limits  = {
                cpu = var.pod_vm_cpu_limit
                memory = var.pod_vm_memory_limit
                ephemeral-storage = var.pod_vm_storage_limit
              }
              requests = {
                cpu = var.pod_vm_cpu_request
                memory = var.pod_vm_memory_request
                ephemeral-storage = var.pod_vm_storage_request
              }
            }
          }
          dns_config  {
            nameservers = [
              "8.8.8.8",
            ]
          }
          dns_policy = "None"
          node_selector = {
            "kubernetes.io/hostname" = var.pod_vm_host
          }
        }
      }
    }
}
#-------------------------------------------------------------------------------
# Deploys a pod-vm service
resource "kubernetes_service" "pod_vm_service" {
  depends_on = [kubernetes_deployment.vm_pod]
  metadata {
    name = "${var.pod_vm_namespace}-${var.pod_vm_name}-service"
    namespace = var.pod_vm_namespace
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = "${var.pod_vm_namespace}-${var.pod_vm_name}"
    }
    external_ips = ["192.168.89.4"]
    port {
      protocol = "TCP"
      port = "22"
      target_port = "22"
    }
  }
}
