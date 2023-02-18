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
#                                 Docker registry                              #
#                                                                              #
#==============================================================================#
#==============================================================================#
#                                                                              #
#                                 Infrastructure                               #
#                                                                              #
#==============================================================================#
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "redis_persistent_volume_master" {
  connection {
    type        = "ssh"
    user        = var.dipal_redis_host_ssh_user
    private_key = file(var.dipal_redis_host_ssh_key_address)
    agent       = true
    host        = var.dipal_redis_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.dipal_redis_host_sudo_password} | sudo -S mkdir -p ${var.dipal_redis_host_disk_path}/redis-master"]
  }
  metadata {
    name = "${var.dipal_redis_helm_release_name}-persistent-volume-master"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = [var.dipal_redis_node]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.dipal_redis_helm_master_storage
    }

    persistent_volume_source {
      local {
        path = "${var.dipal_redis_host_disk_path}/redis-master"
      }
    }
  }
}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "redis_persistent_volume_replica" {
  connection {
    type        = "ssh"
    user        = var.dipal_redis_host_ssh_user
    private_key = file(var.dipal_redis_host_ssh_key_address)
    agent       = true
    host        = var.dipal_redis_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.dipal_redis_host_sudo_password} | sudo -S mkdir -p ${var.dipal_redis_host_disk_path}/redis-replica"]
  }
  metadata {
    name = "${var.dipal_redis_helm_release_name}-persistent-volume-replica"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = [var.dipal_redis_node]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.dipal_redis_helm_master_storage
    }

    persistent_volume_source {
      local {
        path = "${var.dipal_redis_host_disk_path}/redis-replica"
      }
    }
  }
}
#----------------------------------------------------------------------------------
resource "helm_release" "redis" {
  name       = var.dipal_redis_helm_release_name
  repository = var.dipal_redis_helm_repository
  chart      = var.dipal_redis_helm_chart_name
  namespace  = var.dipal_namespace
  wait       = "false"
  set {
    name  = "master.containerPorts.redis"
    value = "6378"
  }
  set {
    name  = "master.service.ports.redis"
    value = "6378"
  }
  set {
    name  = "replica.containerPorts.redis"
    value = "6378"
  }
  set {
    name  = "replica.replicaCount"
    value = "1"
  }
  set {
    name  = "auth.password"
    value = "PoI456ZxC"
  }

}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "kafka_persistent_volume_replica" {
  connection {
    type        = "ssh"
    user        = var.dipal_kafka_host_ssh_user
    private_key = file(var.dipal_kafka_host_ssh_key_address)
    agent       = true
    host        = var.dipal_kafka_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.dipal_kafka_host_sudo_password} | sudo -S mkdir -p ${var.dipal_kafka_host_disk_path}/kafka"]
  }
  metadata {
    name = "${var.dipal_kafka_helm_release_name}-persistent-volume-kafka"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = [var.dipal_redis_node]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.dipal_kafka_helm_storage
    }

    persistent_volume_source {
      local {
        path = "${var.dipal_kafka_host_disk_path}/kafka"
      }
    }
  }
}
#----------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "zookeeper_persistent_volume_replica" {
  connection {
    type        = "ssh"
    user        = var.dipal_kafka_host_ssh_user
    private_key = file(var.dipal_kafka_host_ssh_key_address)
    agent       = true
    host        = var.dipal_kafka_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.dipal_kafka_host_sudo_password} | sudo -S mkdir -p ${var.dipal_kafka_host_disk_path}/zookeeper"]
  }
  metadata {
    name = "${var.dipal_kafka_helm_release_name}-persistent-volume-zookeeper"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = [var.dipal_kafka_node]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.dipal_kafka_helm_storage
    }

    persistent_volume_source {
      local {
        path = "${var.dipal_kafka_host_disk_path}/zookeeper"
      }
    }
  }
}
resource "helm_release" "kafka" {
  name       = var.dipal_kafka_helm_release_name
  repository = var.dipal_kafka_helm_repository
  chart      = var.dipal_kafka_helm_chart_name
  namespace  = var.dipal_namespace
  wait       = "false"
}
##----------------------------------------------------------------------------------
resource "helm_release" "mqtt" {
  name       = var.dipal_mqtt_helm_release_name
  repository = var.dipal_mqtt_helm_repository
  chart      = var.dipal_mqtt_helm_chart_name
  namespace  = var.dipal_namespace
  wait       = "false"
}
##-------------------------------------------------------------------------------
resource "kubernetes_persistent_volume" "dipal_mongodb_persistent_volume_1" {
  connection {
    type        = "ssh"
    user        = var.dipal_mongodb_host_ssh_user
    private_key = file(var.dipal_mongodb_host_ssh_key_address)
    agent       = true
    host        = var.dipal_mongodb_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.dipal_mongodb_host_sudo_password} | sudo -S mkdir -p ${var.dipal_mongodb_host_disk_path}/dipal-mongodb-pv1"]
  }
  metadata {
    name = "${var.dipal_mongodb_name}-persistent-volume-mongodb-pv1"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = [var.dipal_mongodb_node]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.dipal_mongodb_pv1_size
    }

    persistent_volume_source {
      local {
        path = "${var.dipal_mongodb_host_disk_path}/dipal-mongodb-pv1"
      }
    }
  }
}
resource "kubernetes_persistent_volume" "dipal_mongodb_persistent_volume_2" {
  connection {
    type        = "ssh"
    user        = var.dipal_mongodb_host_ssh_user
    private_key = file(var.dipal_mongodb_host_ssh_key_address)
    agent       = true
    host        = var.dipal_mongodb_host_ssh_address
  }
  provisioner "remote-exec" {
    inline = ["echo ${var.dipal_mongodb_host_sudo_password} | sudo -S mkdir -p ${var.dipal_mongodb_host_disk_path}/dipal-mongodb-pv2"]
  }
  metadata {
    name = "${var.dipal_mongodb_name}-persistent-volume-mongodb-pv2"
  }
  spec {
    node_affinity {
      required {
        node_selector_term {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = [var.dipal_mongodb_node]
          }
        }
      }
    }
    access_modes       = ["ReadWriteOnce"]
    capacity = {
      storage = var.dipal_mongodb_pv2_size
    }

    persistent_volume_source {
      local {
        path = "${var.dipal_mongodb_host_disk_path}/dipal-mongodb-pv2"
      }
    }
  }
}
##-------------------------------------------------------------------------------
resource "kubernetes_manifest" "deployment_mongo" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = var.dipal_mongodb_name
      }
      "name" = var.dipal_mongodb_name
      "namespace" = var.dipal_namespace
    }
    "spec" = {

      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "io.kompose.service" = var.dipal_mongodb_name
          "kubernetes.io/hostname" = var.dipal_mongodb_node
        }
      }
      "strategy" = {
        "type" = "Recreate"
      }
      "template" = {
        "metadata" = {
          "annotations" = {
            "kompose.cmd" = "kompose convert"
            "kompose.version" = "1.26.1 (a9d05d509)"
          }
          "creationTimestamp" = null
          "labels" = {
            "io.kompose.service" = var.dipal_mongodb_name
            "kubernetes.io/hostname" = var.dipal_mongodb_node
          }
        }
        "spec" = {
          "containers" = [
            {

              "image" = "mongo:4.4.6"
              "livenessProbe" = {
                "initialDelaySeconds" = 15
                "periodSeconds" = 20
                "tcpSocket" = {
                  "port" = 27017
                }
              }
              "name" = var.dipal_mongodb_name
              "ports" = [
                {
                  "containerPort" = 27017
                },
              ]
              "readinessProbe" = {
                "initialDelaySeconds" = 5
                "periodSeconds" = 10
                "tcpSocket" = {
                  "port" = 27017
                }
              }

              "env" = [
                {
                  "name" = "MONGO_INITDB_ROOT_PASSWORD"
                  "value" = var.dipal_mongodb_password
                },
                {
                  "name" = "MONGO_INITDB_ROOT_USERNAME"
                  "value" = var.dipal_mongodb_username
                }
                ]
              "resources" = {}
              "volumeMounts" = [
                {
                  "mountPath" = "/var/lib/mongo"
                  "name" = "dipal-mongodb-pvc"
                },
                {
                  "mountPath" = "/data/db"
                  "name" = "dipal-mongodb-pvc1"
                },
              ]
            },
          ]
          "restartPolicy" = "Always"
          "volumes" = [
            {
              "name" = "dipal-mongodb-pvc"
              "persistentVolumeClaim" = {
                "claimName" = "dipal-mongodb-claim"
              }
            },
            {
              "name" = "dipal-mongodb-pvc1"
              "persistentVolumeClaim" = {
                "claimName" = "dipal-mongodb-claim1"
              }
            },
          ]
        }
      }
    }

  }
}
#-------------------------------------------------------------------------------
resource "kubernetes_manifest" "service_mongo" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "annotations" = {
        "kompose.cmd" = "kompose convert"
        "kompose.version" = "1.26.1 (a9d05d509)"
      }
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "dipal-mongodb"
      }
      "name" = "dipal-mongodb-service"
      "namespace" = var.dipal_namespace
    }
    "spec" = {
      "ports" = [
        {
          "name" = var.dipal_mongodb_service_port
          "port" = var.dipal_mongodb_service_port
          "targetPort" = var.dipal_mongodb_service_port
        },
      ]
      "selector" = {
        "io.kompose.service" = var.dipal_mongodb_name
      }
    }

  }
}
#-------------------------------------------------------------------------------
resource "kubernetes_manifest" "persistentvolumeclaim_mongo1" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "PersistentVolumeClaim"
    "metadata" = {
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "dipal-mongodb-claim"
      }
      "name" = "dipal-mongodb-claim"
      "namespace" = var.dipal_namespace
    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
          "storage" = var.dipal_mongodb_pv2_size
        }
      }
    }

  }
}
#-------------------------------------------------------------------------------
resource "kubernetes_manifest" "persistentvolumeclaim_mongo" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "PersistentVolumeClaim"
    "metadata" = {
      "creationTimestamp" = null
      "labels" = {
        "io.kompose.service" = "dipal-mongodb-claim1"
      }
      "name" = "dipal-mongodb-claim1"
      "namespace" = var.dipal_namespace
    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
          "storage" =  var.dipal_mongodb_pv1_size
        }
      }
    }

  }
}
##-------------------------------------------------------------------------------
module "dipal_trudesk" {
  source = "../infrastructure/modules/trudesk"
}
