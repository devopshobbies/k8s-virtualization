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
#                             Persistent volumes                               #
#                                                                              #
#==============================================================================#
resource "kubernetes_persistent_volume" "harbor_postgresql_persistent_volume" {
  metadata {
    name = "harbor-postgresql-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "beta.kubernetes.io/os"
            operator = "In"
            values   = ["linux"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "8Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1/harbor/postgresql"
      }
    }
  }
}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_trivy_persistent_volume" {
  metadata {
    name = "harbor-trivy-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "beta.kubernetes.io/os"
            operator = "In"
            values   = ["linux"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "5Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1/harbor/trivy"
      }
    }
  }
}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_chart_persistent_volume" {
  metadata {
    name = "harbor-chart-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "beta.kubernetes.io/os"
            operator = "In"
            values   = ["linux"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "10Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1/harbor/charts"
      }
    }
  }
}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_jobservice_persistent_volume" {
  metadata {
    name = "harbor-jobservice-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "beta.kubernetes.io/os"
            operator = "In"
            values   = ["linux"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "1Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1/harbor/jobservice"
      }
    }
  }
}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_scandata_persistent_volume" {
  metadata {
    name = "harbor-scandata-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "beta.kubernetes.io/os"
            operator = "In"
            values   = ["linux"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "1Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1/harbor/scandata"
      }
    }
  }
}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_registry_persistent_volume" {
  metadata {
    name = "harbor-registry-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "beta.kubernetes.io/os"
            operator = "In"
            values   = ["linux"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "50Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1/harbor/registry"
      }
    }
  }
}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "harbor_redis_persistent_volume" {
  metadata {
    name = "harbor-redis-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "beta.kubernetes.io/os"
            operator = "In"
            values   = ["linux"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "8Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1/harbor/redis"
      }
    }
  }
}
#----------------------------------------------------------------------------------
# Deploys harbor with all componenets 
resource "helm_release" "harbor" {
  name       = "harbor"
  repository = "bitnami"
  chart      = "harbor"
  namespace  = "default"
  version    = "16.3.1"
  wait       = "false"
  values     = ["${file("harbor/values.yml")}"]
}
#----------------------------------------------------------------------------------
# Deploys Prometheus and all of it's component with helmchart
resource "helm_release" "prometheus" {
  name       = "kube-prometheus"
  repository = "bitnami"
  chart      = "kube-prometheus"
  namespace  = "default"
  version    = "8.3.2"
  wait       = "false"
  values     = ["${file("prometheus/values.yml")}"]
}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "grafana_persistent_volume" {
  metadata {
    name = "grafana-persistent-volume"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "beta.kubernetes.io/os"
            operator = "In"
            values   = ["linux"]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = "10Gi"
    }

    persistent_volume_source {
      local {
        path = "/mnt/disk1/grafana"
      }
    }
  }
}
#----------------------------------------------------------------------------------
# Deploys Grafana and all of it's component with helmchart
resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "bitnami"
  chart      = "grafana"
  namespace  = "default"
  version    = "8.2.22"
  wait       = "false"
  values     = ["${file("grafana/values.yml")}"]
}