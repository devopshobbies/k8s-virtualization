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
#                                 Infrastructure                               #
#                                                                              #
#==============================================================================#
#----------------------------------------------------------------------------------
# Deploys redis and all of it's component with helmchart
resource "helm_release" "redis" {
  name       = "redis"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  namespace  = "default"
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
# Deploys kafka and all of it's component with helmchart
resource "helm_release" "kafka" {
  name       = "kafka"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kafka"
  namespace  = "default"
  wait       = "false"
}
#----------------------------------------------------------------------------------
# Deploys kafka and all of it's component with helmchart
resource "helm_release" "mqtt" {
  name       = "mqtt"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "rabbitmq"
  namespace  = "default"
  wait       = "false"
}
#----------------------------------------------------------------------------------
# Deploys redis and all of it's component with helmchart
#-------------------------------------------------------------------------------------
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
        "io.kompose.service" = "dipal-mongodb"
      }
      "name" = "dipal-mongodb"
      "namespace" = "default"
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "io.kompose.service" = "dipal-mongodb"
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
            "io.kompose.service" = "dipal-mongodb"
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
              "name" = "dipal-mongodb"
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
      "namespace" = "default"
    }
    "spec" = {
      "ports" = [
        {
          "name" = "27017"
          "port" = 27017
          "targetPort" = 27017
        },
      ]
      "selector" = {
        "io.kompose.service" = "dipal-mongodb"
      }
    }

  }
}
#-------------------------------------------------------------------------------------
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
      "namespace" = "default"
    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
          "storage" = "10Gi"
        }
      }
    }

  }
}
#-------------------------------------------------------------------------------------
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
      "namespace" = "default"
    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
          "storage" = "5Gi"
        }
      }
    }

  }
}
#-------------------------------------------------------------------------------
# Deploys tudesk service
module "dipal_trudesk" {
  source = "../infrastructure/modules/trudesk"
}
